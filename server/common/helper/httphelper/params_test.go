package httphelper

import "testing"

func TestStrToIntArr(t *testing.T) {
	arr, err := StrToIntArr("")
	if err != nil {
		t.Error("转换出错")
	}
	if len(arr) != 0 {
		t.Error("长度不对", arr)
	}

	arr2, err2 := StrToIntArr("1")
	if err2 != nil {
		t.Error("转换出错")
	}
	if arr2[0] != 1 {
		t.Error("长度不对", arr2)
	}

	arr3, err3 := StrToIntArr("1,2")
	if err3 != nil {
		t.Error("转换出错")
	}
	if arr3[0] != 1 || arr3[1] != 2 {
		t.Error("长度不对", arr3)
	}
}

func TestStrToArr(t *testing.T) {

	if arr := StrToArr(""); len(arr) != 0 {
		t.Error("长度不对", arr)
	}

	if arr2 := StrToArr("1"); arr2[0] != "1" {
		t.Error("长度不对", arr2)
	}

	if arr3 := StrToArr("1,2"); arr3[0] != "1" || arr3[1] != "2" {
		t.Error("长度不对", arr3)
	}
}
