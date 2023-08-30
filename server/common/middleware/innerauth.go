package middleware

import (
	"codeup.aliyun.com/616ff38165b9775dd591fcc9/golib/crypt"
	"context"
	"github.com/cloudwego/hertz/pkg/app"
	"math"
	"net/http"
	"server/common/jtype"
	"strconv"
	"time"
)

func InnerAuth(key string) app.HandlerFunc {
	return func(ctx context.Context, c *app.RequestContext) {
		timeSecondStr := c.GetHeader("timestamp")
		sign := c.GetHeader("sign")
		timeSecond, err := strconv.Atoi(string(timeSecondStr))
		if err != nil {
			c.AbortWithStatusJSON(http.StatusUnauthorized, jtype.M{"error": "timestamp invalid"})
			return
		}
		if math.Abs(float64(time.Now().Unix())-float64(timeSecond)) > 300 {
			c.AbortWithStatusJSON(http.StatusUnauthorized, jtype.M{"error": "timestamp out"})
			return
		}
		if crypt.HmacSha1(key, string(timeSecondStr)) != string(sign) {
			c.AbortWithStatusJSON(http.StatusUnauthorized, jtype.M{"error": "sign invalid"})
			return
		}
		c.Next(ctx)
	}
}
