package jlog

import (
	"bytes"
	"codeup.aliyun.com/616ff38165b9775dd591fcc9/golib/timeutil"
	"encoding/json"
	"io/ioutil"
	"net/http"
	"time"
	"userrightscenter/configs"

	"go.uber.org/zap"
)

type MarkdownData struct {
	Title   string
	MapData map[string]string
}

type alertData struct {
	Msgtype  string             `json:"msgtype"`
	Markdown *alertMarkdownData `json:"markdown"`
}

type alertMarkdownData struct {
	Content string `json:"content"`
}

// SendMarkdown 通用发送企业微信markdown消息
func SendMarkdown(testData MarkdownData, url string) {
	go func() {
		if len(url) < 1 {
			return
		}

		gconf := configs.Get()

		// 组装数据
		var data = new(alertData)
		data.Msgtype = "markdown"
		var markdownData = new(alertMarkdownData)
		content := ""
		content += "<font color=\"info\">" + testData.Title + "</font> \n"
		if len(testData.MapData) > 0 {
			testData.MapData["环境"] = gconf.Mode
			testData.MapData["时间"] = time.Now().Format(timeutil.DateFullTime)
			for k, v := range testData.MapData {
				content += ">" + k + " : " + "<font color=\"comment\">" + v + "</font>\n"
			}
		}
		markdownData.Content = content
		data.Markdown = markdownData
		jsonStr, err := json.Marshal(data)
		if err != nil {
			return
		}

		req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonStr))
		if err != nil {
			return
		}
		req.Header.Set("Content-Type", "application/json")
		client := &http.Client{}
		resp, err := client.Do(req)
		if err != nil {
			return
		}
		result, err := ioutil.ReadAll(resp.Body)
		log.Info("Alert resp info", zap.Any("resp", string(result)))
		defer resp.Body.Close()
	}()
}
