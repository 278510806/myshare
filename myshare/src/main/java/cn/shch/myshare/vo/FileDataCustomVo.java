package cn.shch.myshare.vo;

import cn.shch.myshare.domain.FileDataCustom;

public class FileDataCustomVo extends FileDataCustom{
	private TimeScope timeScope;

	public TimeScope getTimeScope() {
		return timeScope;
	}

	public void setTimeScope(TimeScope timeScope) {
		this.timeScope = timeScope;
	}
}
