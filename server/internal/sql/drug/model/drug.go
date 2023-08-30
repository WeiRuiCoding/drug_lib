package model

import (
	"time"
)

// 用户开工豆表
type UrcUserBean struct {
	Id         int32     `gorm:"column:id;type:int(10);primary_key;AUTO_INCREMENT;comment:主键id" json:"id"`
	Uid        int32     `gorm:"column:uid;type:int(10);default:0;comment:uid;NOT NULL" json:"uid"`
	FreeNum    int32     `gorm:"column:free_num;type:int(11);default:0;comment:当前用户有效的免费开工豆数量;NOT NULL" json:"free_num"`
	BuyNum     int32     `gorm:"column:buy_num;type:int(11);default:0;comment:当前用户所有购买的开工豆数量;NOT NULL" json:"buy_num"`
	FreezeNum  int32     `gorm:"column:freeze_num;type:int(11);default:0;comment:冻结数量;NOT NULL" json:"freeze_num"`
	CreateTime time.Time `gorm:"column:create_time;type:timestamp;default:CURRENT_TIMESTAMP;NOT NULL" json:"create_time"`
	UpdateTime time.Time `gorm:"column:update_time;type:timestamp;default:CURRENT_TIMESTAMP;NOT NULL" json:"update_time"`
}

func (m *UrcUserBean) TableName() string {
	return "urc_user_bean"
}
