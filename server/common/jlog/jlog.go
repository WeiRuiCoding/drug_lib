package jlog

import (
	"context"
	"os"
	"sync"

	"userrightscenter/configs"

	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"gopkg.in/natefinch/lumberjack.v2"
)

var (
	_initOnce sync.Once
	log       *zap.Logger
)

func getConf() *configs.LogConf {
	return &configs.Get().Log
}

// 初始化日志配置
func newEncoderConfig() zapcore.EncoderConfig {
	return zapcore.EncoderConfig{
		TimeKey:        "timestamp",
		LevelKey:       "level",
		NameKey:        "logger",
		CallerKey:      "caller",
		FunctionKey:    zapcore.OmitKey,
		MessageKey:     "content",
		StacktraceKey:  "stacktrace",
		LineEnding:     zapcore.DefaultLineEnding,
		EncodeLevel:    zapcore.LowercaseLevelEncoder,
		EncodeTime:     zapcore.ISO8601TimeEncoder,
		EncodeDuration: zapcore.SecondsDurationEncoder,
		EncodeCaller:   zapcore.ShortCallerEncoder,
	}
}

func getLogLevel() zapcore.LevelEnabler {
	switch getConf().Level {
	case "debug":
		return zap.DebugLevel
	case "info":
		return zap.InfoLevel
	case "warn":
		return zap.WarnLevel
	case "error":
		return zap.ErrorLevel
	default:
		return zap.InfoLevel
	}
}

var out = zapcore.AddSync(os.Stdout)
var fileOut zapcore.WriteSyncer

func getLogWriter() zapcore.WriteSyncer {
	if fileOut != nil {
		return fileOut
	}
	lumberJackLogger := &lumberjack.Logger{
		Filename:   getConf().Path,
		MaxSize:    10,
		MaxBackups: 5,
		MaxAge:     3,
		Compress:   false,
	}
	fileOut = zapcore.AddSync(lumberJackLogger)
	return fileOut
}

func NewLog(ctxs ...context.Context) *zap.Logger {
	if getConf() == nil {
		panic("nil config")
	}
	encoderConf := newEncoderConfig()
	var encoder zapcore.Encoder
	if getConf().Format == "json" {
		encoder = zapcore.NewJSONEncoder(encoderConf)
	} else {
		encoder = zapcore.NewConsoleEncoder(encoderConf)
	}

	if getConf().Path != "" {
		out = getLogWriter()
	}

	core := zapcore.NewCore(
		encoder,
		zapcore.NewMultiWriteSyncer(out), // 打印到控制台或文件
		getLogLevel(),
	)

	// 开启文件及行号
	development := zap.Development()

	options := []zap.Option{
		zap.AddCaller(),                   //行号
		zap.AddStacktrace(zap.ErrorLevel), // error级别日志，打印堆栈
		development,
		zap.ErrorOutput(out),
	}
	if len(ctxs) == 0 {
		options = append(options, zap.AddCallerSkip(1))
	}
	logger := zap.New(core, options...)

	if len(ctxs) == 0 {
		return logger
	}
	tid, sid := GetTraceId(ctxs[0])
	return logger.With(zap.String("trace", tid), zap.String("span", sid))
}

func getLog() *zap.Logger {
	_initOnce.Do(func() {
		log = NewLog()
	})
	return log
}

func getSugar() *zap.SugaredLogger {
	return getLog().Sugar()
}

func Errorf(template string, args ...interface{}) {
	getSugar().Errorf(template, args...)
}

func Infof(template string, args ...interface{}) {
	getSugar().Infof(template, args...)
}

func Debugf(template string, args ...interface{}) {
	getSugar().Debugf(template, args...)
}

func Error(msg string, fields ...zap.Field) {
	getLog().Error(msg, fields...)
}

func Warn(msg string, fields ...zap.Field) {
	getLog().Warn(msg, fields...)
}

func Info(msg string, fields ...zap.Field) {
	getLog().Info(msg, fields...)
}

func Debug(msg string, fields ...zap.Field) {
	getLog().Debug(msg, fields...)
}
