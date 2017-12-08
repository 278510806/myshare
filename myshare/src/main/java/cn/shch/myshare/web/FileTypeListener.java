package cn.shch.myshare.web;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class FileTypeListener
 *
 */
@WebListener
public class FileTypeListener implements ServletContextListener {

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  { 
    	InputStream is = FileTypeListener.class.getClassLoader().getResourceAsStream("filetype.properties");
    	Properties prop=new Properties();
    	try {
			prop.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
    	Set<Object> set = prop.keySet();
    	Map<String,String> fileTypeMap=new HashMap<>();
    	for(Iterator<Object> it=set.iterator();it.hasNext();) {
    		String key=it.next().toString();
    		fileTypeMap.put(key, prop.getProperty(key));
    	}
    	event.getServletContext().setAttribute("myshare.filetypes", fileTypeMap);
    }
	
    public void contextDestroyed(ServletContextEvent event)  { 
    }


	
}
