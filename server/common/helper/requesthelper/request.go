package requesthelper

import (
	"bytes"
	"context"
	"io/ioutil"
	"net/http"
	"strconv"
	"time"

	"jz/common/util/crypt"
	"jz/globalconf"
)

func InnerRequest(ctx context.Context, action, url string, bodyByte []byte) ([]byte, error) {
	client := &http.Client{
		Timeout: 5 * time.Second,
	}

	body := bytes.NewBuffer(bodyByte)

	req, err := http.NewRequest(action, url, body)
	if err != nil {
		return []byte{}, err
	}
	timeStr := strconv.Itoa(int(time.Now().Unix()))
	req.Header.Add("timestamp", timeStr)
	req.Header.Add("sign", crypt.HmacSha1(globalconf.Get().InnerPrivateKey, timeStr))

	req.Header.Add("Content-Type", "application/json;charset=utf-8")

	//发起请求
	resp, err := client.Do(req)
	if err != nil {
		return []byte{}, err
	}

	defer resp.Body.Close()

	//读取响应
	result, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return []byte{}, err
	}

	return result, nil
}
