package com.itwillbs.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	public ActionForward execute(HttpServletRequest request,
			                     HttpServletResponse response) throws Exception;	

}
