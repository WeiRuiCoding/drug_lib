package httphelper

import (
	"jz/common/jerror"
	"jz/common/jlog"
	"jz/common/jtype"
	"net/http"

	"go.uber.org/zap"

	"github.com/gin-gonic/gin"
)

type ResData struct {
	Code   int         `json:"code"`
	MSG    string      `json:"msg"`
	Result interface{} `json:"result"`
}

func HandResp(c *gin.Context, res interface{}, err error) {
	if err == nil {
		c.JSON(http.StatusOK, ResData{
			Code:   0,
			MSG:    "success",
			Result: res,
		})
		c.Abort()
		return
	}
	//自定义错误
	if jerr, ok := err.(*jerror.ProError); ok {
		c.JSON(jerr.GetHttpStatus(), ResData{
			Code: jerr.GetCode(),
			MSG:  err.Error(),
		})
		c.Abort()
		return
	}
	//标准错误
	if c.Writer.Status() == 200 {
		c.AbortWithStatusJSON(500, err)
	} else {
		c.JSON(c.Writer.Status(), jtype.M{"error": err.Error()})
		c.Abort()
	}
	jlog.Warn("resp error", zap.Error(err))
	return
}
