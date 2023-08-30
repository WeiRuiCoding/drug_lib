package conn

import (
	"runtime"
	"sync"
	"time"

	"userrightscenter/common/jlog"
	"userrightscenter/configs"

	"go.uber.org/zap"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var sqlConn *gorm.DB
var mysqlSync = sync.Mutex{}

func GetDb() *gorm.DB {
	mysqlSync.Lock()
	defer mysqlSync.Unlock()
	if sqlConn == nil {
		gconf := configs.Get()
		if gconf.Mysql.Dsn == "" {
			panic("empty mysql dsn")
		}
		db, err := gorm.Open(mysql.Open(gconf.Mysql.Dsn), &gorm.Config{})
		if err != nil {
			jlog.Error("mysql open err", zap.Error(err), zap.String("dsn", gconf.Mysql.Dsn))
			return nil
		}
		if gconf.Log.Level == "debug" {
			db = db.Debug() // 调试
		}
		sqlDb, dbErr := db.DB()
		if dbErr != nil {
			jlog.Error("mysql db err", zap.Error(dbErr))
			return nil
		}
		sqlDb.SetMaxIdleConns(runtime.NumCPU())
		sqlDb.SetMaxOpenConns(runtime.NumCPU() * 8)
		sqlDb.SetConnMaxLifetime(time.Hour * 24)
		sqlConn = db
	}
	return sqlConn
}

var jgjSqlConn *gorm.DB
var jgjMysqlSync = sync.Mutex{}

func GetJgjDb() *gorm.DB {
	jgjMysqlSync.Lock()
	defer jgjMysqlSync.Unlock()
	if jgjSqlConn == nil {
		gconf := configs.Get()
		if gconf.Mysql.JgjDsn == "" {
			panic("empty mysql Jgj dsn")
		}
		db, err := gorm.Open(mysql.Open(gconf.Mysql.JgjDsn), &gorm.Config{})
		if err != nil {
			jlog.Error("mysql open err", zap.Error(err), zap.String("dsn", gconf.Mysql.JgjDsn))
			return nil
		}
		if gconf.Log.Level == "debug" {
			db = db.Debug() // 调试
		}
		sqlDb, dbErr := db.DB()
		if dbErr != nil {
			jlog.Error("mysql db err", zap.Error(dbErr))
			return nil
		}
		sqlDb.SetMaxIdleConns(runtime.NumCPU())
		sqlDb.SetMaxOpenConns(runtime.NumCPU() * 8)
		sqlDb.SetConnMaxLifetime(time.Hour * 24)
		jgjSqlConn = db
	}
	return jgjSqlConn
}
