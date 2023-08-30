package loghelper

import (
	"jz/common/jlog"
	"jz/globalconf"

	"github.com/gin-gonic/gin"
)

func OnStartAlert() {
	if gin.Mode() != gin.ReleaseMode {
		return
	}
	jlog.Alert(globalconf.Get().Name+"服务启动", "")
}
