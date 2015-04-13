/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.cms.controller;

import com.church.bean.Admin;
import com.church.bean.Newsandevent;
import com.church.dao.NewsDao;
import com.church.utils.StringUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import java.util.List;

public class NewsController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        if (session == null) {
            response.sendRedirect("login.htm");
            return null;
        }
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            response.sendRedirect("login.htm");
            return null;
        }
        String error = "";

        NewsDao dao = new NewsDao();
        String action = StringUtils.getStringFormat(request.getParameter("action"));
        String tittle = "", description = "", publishtime = "";
        if (action.equalsIgnoreCase("insert")) {
            tittle = StringUtils.getStringFormat(request.getParameter("titlenews"));
            description = StringUtils.getStringFormat(request.getParameter("contentnews"));
            publishtime = StringUtils.getStringFormat(request.getParameter("newspublishedtime"));
            int status = StringUtils.getIntFormat(request.getParameter("newsstatus"));
            Newsandevent newevent = new Newsandevent();
            newevent.setTitle(tittle);
            newevent.setDescription(description);
            newevent.setPublished_time(publishtime);
            newevent.setStatus(status);
            int result = dao.insertNewsandevent(newevent);
            if (result == 0) {
                error = "Can not insert!!";
            } else {
                error = "Insert successfully!!";
            }
        }
        
        if (action.equalsIgnoreCase("update")) {
            int id = StringUtils.getIntFormat(request.getParameter("id"));
            tittle = StringUtils.getStringFormat(request.getParameter("titlenews"));
            description = StringUtils.getStringFormat(request.getParameter("contentnews"));
            publishtime = StringUtils.getStringFormat(request.getParameter("newspublishedtime"));
            int status = StringUtils.getIntFormat(request.getParameter("newsstatus"));
            Newsandevent newevent = new Newsandevent();
            newevent.setId(id);
            newevent.setTitle(tittle);
            newevent.setDescription(description);
            newevent.setPublished_time(publishtime);
            newevent.setStatus(status);
            int result = dao.updateNewsandevent(newevent);
            if (result == 0) {
                error = "Can not update!!";
            } else {
                error = "Update successfully!!";
            }
        }
        
        if (action.equalsIgnoreCase("updateStatus")) {
            int id = StringUtils.getIntFormat(request.getParameter("id"));
            int status = StringUtils.getIntFormat(request.getParameter("status"));
            int result = dao.updateStatus(id,status);
            if (result == 0) {
                error = "Can not update status!!";
            }
        }
        
        List<Newsandevent> list = dao.getNewsandeventList();
        int total = 0;
        if (list != null && list.size() > 0) {
            total = list.size();
        }
        mv.addObject("total", total);
        mv.addObject("list", list);
        mv.addObject("error", error);
        mv.addObject("tittle", tittle);
        mv.addObject("description", description);
        return mv;
    }
}
