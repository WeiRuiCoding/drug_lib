package configs

import (
	"flag"
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"sync"
	"time"
)

type RedisConf struct {
	Host string
	Pass string
	Db   int
}

type MysqlConf struct {
	Dsn    string `yaml:"dsn"`    // 用户权益中心db
	JgjDsn string `yaml:"jgjDsn"` // jgj业务主库
}

type LogConf struct {
	Level  string //debug,info
	Format string //json,line
	Path   string
}

type KafkaConf struct {
	BootstrapServers string `yaml:"bootstrapServers"`
	SecurityProtocol string `yaml:"securityProtocol"`
	SslCaLocation    string `yaml:"sslCaLocation"`
	SaslMechanism    string `yaml:"saslMechanism"`
	SaslUsername     string `yaml:"saslUsername"`
	SaslPassword     string `yaml:"saslPassword"`
}

type GrpcClientConf struct {
	NotifyAddr string `yaml:"notifyAddr"` // notify 服务
}

type GlobalConf struct {
	Name                    string         //app name 用于trace等使用
	HttpPort                int            `yaml:"httpPort"`
	InnerPrivateKey         string         `yaml:"innerPrivateKey"` //内部api请求的key
	OuterPrivateKey         string         `yaml:"outerPrivateKey"` //外部api请求的签名key
	Mysql                   MysqlConf      `yaml:"mysql"`
	Redis                   RedisConf      `yaml:"redis"`
	RedisPHP                RedisConf      `yaml:"redisPHP"`
	Kafka                   KafkaConf      `yaml:"kafka"`
	AlertUrl                string         `yaml:"alertUrl"`
	Mode                    string         `yaml:"mode"` //gin mode: [debug,release,test]
	Log                     LogConf        `yaml:"log"`
	IsOpenUserBeanBinLog    bool           `yaml:"is_open_user_bean_bin_log"`   // 是否开启用户binlog同步
	IsOpenUserBeanIncrement bool           `yaml:"is_open_user_bean_increment"` // 是否开启用户开工豆增量处理
	IsOpenReverseSync       bool           `yaml:"is_open_reverse_sync"`        // 是否开启新数据写老表，反向同步
	GrpcClient              GrpcClientConf `yaml:"grpcClient"`
}

func Set(c *GlobalConf) {
	conf = c
}

var configFile = flag.String("f", "default.yaml", "the config file")

func initConf(conf interface{}) {
	flag.Parse()
	content, err := ioutil.ReadFile(*configFile)
	if err != nil {
		panic(err)
	}

	if yaml.Unmarshal(content, conf) != nil {
		panic(err)
	}
}

var conf *GlobalConf
var lock sync.RWMutex

func init() {
	conf = &GlobalConf{}
	initConf(conf)
	setToGlobal(conf)

	// 定时更新配置
	go func() {
		ticker := time.NewTicker(3 * time.Minute)
		defer ticker.Stop()
		for {
			select {
			case <-ticker.C:
				initConf(conf)
				setToGlobal(conf)
			}
		}
	}()
}

func setToGlobal(conf *GlobalConf) {
	lock.Lock()
	defer lock.Unlock()
	/*if conf.Mode == "" {
		conf.Mode = gin.DebugMode
	}*/
	//gin.SetMode(conf.Mode)
	Set(conf)
}

func Get() *GlobalConf {
	lock.RLock()
	defer lock.RUnlock()
	if conf == nil {
		panic("nil global config")
	}

	return conf
}
