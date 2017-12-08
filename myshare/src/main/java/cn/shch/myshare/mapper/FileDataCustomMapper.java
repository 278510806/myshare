package cn.shch.myshare.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.shch.myshare.domain.FileDataCustom;
import cn.shch.myshare.vo.FileDataCustomVo;

public interface FileDataCustomMapper {
	/**
	 * 根据指定文件名后缀，返回对应类型的文件列表
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<FileDataCustom> findFilesByType(String...type)throws Exception;
//	public List<FileDataCustom> findMedias()throws Exception;
//	public List<FileDataCustom> findPictures()throws Exception;
//	public List<FileDataCustom> findVideos()throws Exception;
//	public List<FileDataCustom> findAutios()throws Exception;
//	public List<FileDataCustom> findArchives()throws Exception;
	public List<FileDataCustom> findFilesInSpecificFolder(String folderName)throws Exception;
	/**
	 * 返回指定日期范围内创建或修改或更新或访问过的文件列表
	 * @param begin
	 * @param end
	 * @return
	 * @throws Exception
	 */
	public List<FileDataCustom> findByTimeScope(@Param("begin")long begin,@Param("end")long end)throws Exception;
	public List<FileDataCustom> findAllByOptions(FileDataCustomVo vo)throws Exception;
	public FileDataCustom findFileById(int id)throws Exception;
}
