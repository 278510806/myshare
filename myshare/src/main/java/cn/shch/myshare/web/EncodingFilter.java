package cn.shch.myshare.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/**
 * Servlet Filter implementation class EncodingFilter
 */

public class EncodingFilter implements Filter {
	private FilterConfig fConfig;
    public EncodingFilter() {
    }
	public void init(FilterConfig fConfig) throws ServletException {
		this.fConfig=fConfig;
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String encoding = fConfig.getInitParameter("encoding");
		if(encoding==null)
			encoding="utf-8";
		request.setCharacterEncoding(encoding);
		response.setContentType("text/html;charset="+encoding);
		chain.doFilter(request, response);
	}
	public void destroy() {
	}
}
