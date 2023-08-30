package drug

import (
	"codeup.aliyun.com/616ff38165b9775dd591fcc9/golib/timeutil"
	"fmt"
	"go.uber.org/zap"
	"server/common/conn"
	"server/common/jlog"
	"server/configs"
	"server/internal/sql/drug/model"
	"strings"
	"time"
)

const sqlHeaderStr string = "INSERT INTO `urc_user_bean` (`uid`, `free_num`, `buy_num`, `freeze_num`, `create_time`, `update_time`) VALUES"
const sqlStr string = "(%d, %d, %d, %d, '%s', '%s')"

func GetUserBeanByUid(uid int32) model.UrcUserBean {
	if uid < 1 {
		return model.UrcUserBean{}
	}

	var data model.UrcUserBean
	var findData []model.UrcUserBean
	err := conn.GetDb().Where("uid", uid).Limit(1).Find(&findData).Error
	if err != nil {
		jlog.Error("getUserBeanByUid err", zap.Error(err))
	}

	if len(findData) == 1 {
		data = findData[0]
	}

	return data
}

func BatchAddUserBeanData(data []model.UrcUserBean) {
	if len(data) < 1 {
		return
	}

	total := len(data)
	var s strings.Builder
	for i, datum := range data {
		s.WriteString(fmt.Sprintf(sqlStr, datum.Uid, datum.FreeNum, datum.BuyNum, datum.FreezeNum, time.Now().Format(timeutil.DateFullTime), time.Now().Format(timeutil.DateFullTime)))
		if i == total-1 {
			s.WriteString(";")
		} else {
			s.WriteString(",")
		}
	}
	sqlContent := s.String()
	if len(sqlContent) > 0 {
		err := conn.GetDb().Exec(sqlHeaderStr + sqlContent).Error
		if err != nil {
			jlog.SendMarkdown(jlog.MarkdownData{
				Title: "usr迁移用户开工豆sql出错啦!!!",
				MapData: map[string]string{
					"err": err.Error(),
				},
			}, configs.Get().AlertUrl)

			jlog.Error("BatchAddUserBeanData err", zap.Error(err))
		}
	}
	//err := conn.GetDb().CreateInBatches(&data, 100).Error
}

func DelUserBeanByUid(uid int) {
	err := conn.GetDb().Where("uid", uid).Delete(&model.UrcUserBean{}).Error
	if err != nil {
		jlog.Error("DelUserBeanByUid err", zap.Error(err))
	}
}
