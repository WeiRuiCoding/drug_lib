package ginhelper

import (
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/gin-gonic/gin"
)

func errorWriter() io.Writer {
	if gin.IsDebugging() {
		return os.Stderr
	}
	pipeReader, pipeWriter := io.Pipe()
	go PipeRead(pipeReader)
	return pipeWriter
}
func PipeRead(reader *io.PipeReader) {
	buf := make([]byte, 256)
	for {
		n, err := reader.Read(buf)
		if err != nil {
			fmt.Println(err)
			return
		}
		str := strings.ReplaceAll(string(buf[:n]), "\n", "\\n")
		str = strings.ReplaceAll(str, "\r", "\\r")
		if strings.Contains(str, "NOP") {
			str += "\n"
		}
		os.Stdout.WriteString(str)
	}
}

func Recovery() gin.HandlerFunc {
	return gin.RecoveryWithWriter(errorWriter())
}
