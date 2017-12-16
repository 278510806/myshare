package cn.shch.myshare.service;

import java.util.List;
import java.util.Map;

import cn.shch.myshare.domain.FileDataCustom;
import cn.shch.myshare.vo.FileDataCustomVo;

public interface FileDataService {
	public List<FileDataCustom> findFilesByType(String...type)throws Exception;
	public List<FileDataCustom> findFilesInSpecificFolder(String folderName,String... options)throws Exception;
	public List<FileDataCustom> findByTimeScope(long begin,long end)throws Exception;
	public List<FileDataCustom> findAllByOptions(FileDataCustomVo vo)throws Exception;
	public FileDataCustom findFileById(int id)throws Exception;
}
