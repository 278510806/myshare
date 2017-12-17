package cn.shch.myshare.controllers;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.shch.common.MyDateTimeCommon;
import cn.shch.common.Unit;
import cn.shch.myshare.domain.FileDataCustom;
import cn.shch.myshare.service.FileDataService;

@Controller
public class FileDataController {
	// separator
	public static final String DIRECTORY_SEPARATOR = System.getProperty("file.separator");

	private Logger logger = LoggerFactory.getLogger(FileDataController.class);
	@Autowired
	private FileDataService service;

	/**
	 * 初次打开主页时，选择查询页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/notifications")
	public ModelAndView displayNotifications() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notifications");
		return mav;
	}

	/**
	 * 根据参数显示不同类型文件列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/fileKinds")
	public ModelAndView findKinds(@RequestParam("kind") String kind, HttpServletRequest request) throws Exception {
		ServletContext servletContext = request.getServletContext();
		@SuppressWarnings("unchecked")
		Map<String, String> attribute = (Map<String, String>) servletContext.getAttribute("myshare.filetypes");
		if (attribute != null) {
			String suffixes = null;
			if (kind != null) {
				switch (kind) {
				// 文档类型
				case "documents":
					suffixes = attribute.get("document.suffix");
					break;
				case "word":
					suffixes = attribute.get("document.word.suffix");
					break;
				case "excel":
					suffixes = attribute.get("document.excel.suffix");
					break;
				case "pdf":
					suffixes = attribute.get("document.pdf.suffix");
					break;
				case "ppt":
					suffixes = attribute.get("document.ppt.suffix");
					break;
				case "documentOther":
					suffixes = attribute.get("document.other.suffix");
					break;
				// 多媒体类型
				case "video":
					suffixes = attribute.get("media.video.suffix");
					break;
				case "audio":
					suffixes = attribute.get("media.audio.suffix");
					break;
				case "picture":
					suffixes = attribute.get("media.picture.suffix");
					break;
				// 压缩包类型
				case "archive":
					suffixes = attribute.get("archive.suffix");
					break;
				case "rar":
					suffixes = attribute.get("archive.rar.suffix");
					break;
				case "zip":
					suffixes = attribute.get("archive.zip.suffix");
					break;
				case "gz":
					suffixes = attribute.get("archive.gz.suffix");
					break;
				case "7z":
					suffixes = attribute.get("archive.7z.suffix");
					break;
				case "jar":
					suffixes = attribute.get("archive.jar.suffix");
					break;
				case "tar":
					suffixes = attribute.get("archive.tar.suffix");
					break;
				// 可安装的
				case "install":
					suffixes = attribute.get("install.suffix");
					break;
				}
			}
			String[] split = suffixes.split(",");
			List<FileDataCustom> list = service.findFilesByType(split);
			// logger.debug("list::::::::" + list);
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			if (kind.equals("picture")) {
				mav.addObject("kind", "picture");
			}
			mav.setViewName("table");
			return mav;
		}
		return null;
	}

	@RequestMapping("/findByTime")
	public ModelAndView findByTime(@RequestParam("scope") String scope) throws Exception {
		if (scope != null) {
			Date currDate = new Date();
			List<FileDataCustom> list = null;
			switch (scope) {
			case "week":
				Date firstDateOfWeek = MyDateTimeCommon.ObtainFirstDayBySpecificDate(currDate, Unit.UNIT_OF_WEEK);
				list = service.findByTimeScope(firstDateOfWeek.getTime(), currDate.getTime());
				break;
			case "month":
				Date firstDateOfMonth = MyDateTimeCommon.ObtainFirstDayBySpecificDate(currDate, Unit.UNIT_OF_MONTH);
				list = service.findByTimeScope(firstDateOfMonth.getTime(), currDate.getTime());
				break;
			case "threeMonth":
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.MONTH, -3);
				Date firstDateOfThreeMonthAgo = MyDateTimeCommon.ObtainFirstDayBySpecificDate(cal.getTime(),
						Unit.UNIT_OF_MONTH);
				list = service.findByTimeScope(firstDateOfThreeMonthAgo.getTime(), currDate.getTime());
				break;
			default:
				break;
			}
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("table");
			return mav;
		}

		return null;
	}

	/**
	 * 实现文件下载
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("download")
	public String download(@RequestParam("id") String strId, HttpServletResponse response) throws Exception {
		logger.debug("id:::::::::::::::::::::" + strId);
		if (strId != null) {
			Integer id = Integer.parseInt(strId);
			// 根据id查询要下载的文件
			FileDataCustom fileDataCustom = service.findFileById(id);
			String name = fileDataCustom.getFileName();
			String path = fileDataCustom.getFilePath();
			// 获取文件在当前系统的路径
			String filePath = path + DIRECTORY_SEPARATOR + name;
			filePath = filePath.replace("\\", "/");
			File file = new File(filePath);
			logger.debug(
					"file::::::::::::::::::::::::" + file.getAbsolutePath() + "       file.exists:" + file.exists());
			// Path path2 = file.toPath();
			if (file.exists()) {
				name = URLEncoder.encode(name, "utf-8");
				response.setHeader("content-disposition", "attachment;filename=" + name);
				BufferedInputStream bis = null;
				try {
					bis = new BufferedInputStream(new FileInputStream(file));
					ServletOutputStream os = response.getOutputStream();
					int len = 0;
					byte[] b = new byte[1024];
					while ((len = bis.read(b)) != -1) {
						os.write(b, 0, len);
					}
				} catch (Exception e) {
					logger.debug("下载出错！！！" + e.getMessage());
				} finally {
					bis.close();
				}
			} else {
				return "error_nosuchfile";
			}
		}
		return null;
	}

	@RequestMapping("/dispPic")
	public void dispPic(@RequestParam("id") int id, HttpServletResponse response) throws Exception {
		// 根据id查询要下载的文件
		FileDataCustom fileDataCustom = service.findFileById(id);
		String name = fileDataCustom.getFileName();
		String path = fileDataCustom.getFilePath();
		// 获取文件在当前系统的路径
		String filePath = path + DIRECTORY_SEPARATOR + name;
		filePath = filePath.replace("\\", "/");
		File file = new File(filePath);
		logger.debug(
				"file::::::::::::::::::::::::" + file.getAbsolutePath() + "       file.exists:" + file.exists());
		if (file.exists()) {
			name = URLEncoder.encode(name, "utf-8");
			response.setContentLengthLong(file.length());
			response.setContentType("text/image");
			BufferedInputStream bis = null;
			try {
				bis = new BufferedInputStream(new FileInputStream(file));
				ServletOutputStream os = response.getOutputStream();
				int len = 0;
				byte[] b = new byte[1024];
				while ((len = bis.read(b)) != -1) {
					os.write(b, 0, len);
				}
			} catch (Exception e) {
				logger.debug("显示图片出错！！！" + e.getMessage());
			} finally {
				bis.close();
			}
		}
	}

	@RequestMapping("findDirectoryImageIds")
	public @ResponseBody List<FileDataCustom> findDirectoryImageIds(@RequestParam String path,HttpServletRequest request)throws Exception{
		ServletContext servletContext = request.getServletContext();
		@SuppressWarnings("unchecked")
		Map<String, String> attribute = (Map<String, String>) servletContext.getAttribute("myshare.filetypes");
		String suffixes = attribute.get("media.picture.suffix");
		String[] split = suffixes.split(",");
		List<FileDataCustom> findFilesInSpecificFolder = service.findFilesInSpecificFolder(path, split);
		return findFilesInSpecificFolder;
	}
	
	public FileDataService getService() {
		return service;
	}

	public void setService(FileDataService service) {
		this.service = service;
	}
}
