<%@page import="board.BoardVO"%>
<%@page import="board.CalendarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	
	if(no == null || title == null || content == null){
		response.sendRedirect("calendar.jsp");
		return;
	}
	if(no.isEmpty() || title.isEmpty() || content.isEmpty()){
		response.sendRedirect("calendar.jsp");
		return;
	}
	
	int noNum = Integer.parseInt(no);
	
	CalendarDAO dao = new CalendarDAO();
	BoardVO vo = new BoardVO();
	vo.setNo(noNum);
	vo.setTitle(title);
	vo.setContent(content);
	vo.setStartTime(start);
	vo.setEndTime(end);
	
	dao.modify(vo);
	
	response.sendRedirect("page.jsp?no="+no);
	
%>