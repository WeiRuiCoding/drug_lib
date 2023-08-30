package httphelper

import (
	"jz/common/util"
	"strings"

	"github.com/gin-gonic/gin"
)

func Bind(c *gin.Context, params interface{}) error {
	return c.Bind(params)
}

func StrToIntArr(value string) ([]int, error) {
	if value == "" {
		return []int{}, nil
	}
	arr := strings.Split(value, ",")
	if len(arr) == 0 {
		return []int{}, nil
	}
	return util.StrArrToIntArr(arr)
}

func StrToArr(value string) []string {
	if value == "" {
		return []string{}
	}
	if strings.Index(value, ",") >= 0 {
		arr := strings.Split(value, ",")
		return arr
	}

	return []string{value}
}
