package cn.shch.myshare.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import cn.shch.myshare.domain.FileDataCustom;
import cn.shch.myshare.mapper.FileDataCustomMapper;
import cn.shch.myshare.service.FileDataService;
import cn.shch.myshare.vo.FileDataCustomVo;

public class FileDataServiceImpl implements FileDataService{
	@Autowired
	private FileDataCustomMapper fileDataCustomMapper;
	@Override
	public List<FileDataCustom> findFilesByType(String... type) throws Exception {
		return fileDataCustomMapper.findFilesByType(type);
	}

	@Override
	public List<FileDataCustom> findFilesInSpecificFolder(String folderName) throws Exception {
		return null;
	}

	@Override
	public List<FileDataCustom> findByTimeScope(long begin,long end) throws Exception {
		return fileDataCustomMapper.findByTimeScope(begin, end);
	}

	@Override
	public List<FileDataCustom> findAllByOptions(FileDataCustomVo vo) throws Exception {
		return fileDataCustomMapper.findAllByOptions(vo);
	}

	public FileDataCustomMapper getFileDataCustomMapper() {
		return fileDataCustomMapper;
	}

	public void setFileDataCustomMapper(FileDataCustomMapper fileDataCustomMapper) {
		this.fileDataCustomMapper = fileDataCustomMapper;
	}

	@Override
	public FileDataCustom findFileById(int id) throws Exception {
		return fileDataCustomMapper.findFileById(id);
	}

}
