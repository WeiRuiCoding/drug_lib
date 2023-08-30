package conn

import (
	"sync"
	"time"
	"userrightscenter/configs"

	goredis "github.com/go-redis/redis"
)

var (
	redisTDConn map[int]*goredis.Client
	redisLock   = sync.RWMutex{}
)

func init() {
	redisTDConn = make(map[int]*goredis.Client)
}

func GetRedisDB(dbs ...int) *goredis.Client {
	db := 0
	if len(dbs) == 1 {
		db = dbs[0]
	}

	redisLock.RLock()
	if rs, ok := redisTDConn[db]; ok {
		redisLock.RUnlock()
		return rs
	}
	redisLock.RUnlock()
	redisLock.Lock()
	gconf := configs.Get()
	rs := goredis.NewClient(&goredis.Options{
		Addr:        gconf.Redis.Host,
		Password:    gconf.Redis.Pass,
		DB:          db,
		ReadTimeout: 1 * time.Second,
	})
	redisTDConn[db] = rs
	redisLock.Unlock()
	return rs
}
