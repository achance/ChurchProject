/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.cms.controller;

import com.church.bean.Admin;
import com.church.bean.Admin;
import com.church.dao.AdminDao;
import com.church.utils.StringUtils;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Binh
 */
public class AdminController implements Controller {

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
        AdminDao dao = new AdminDao();
        String action = StringUtils.getStringFormat(request.getParameter("action"));
        String username = "", password = "";
        if (action.equalsIgnoreCase("insert")) {
            username = StringUtils.getStringFormat(request.getParameter("username"));
            password = StringUtils.getStringFormat(request.getParameter("password"));
            int result = dao.insertAdmin(username, StringUtils.md5Hash(password));
            if (result == 0) {
                error = "Can not insert!!";
            } else {
                error = "Insert successfully!!";
            }
        }
        if (action.equalsIgnoreCase("update")) {
            int id = StringUtils.getIntFormat(request.getParameter("id"));
            username = StringUtils.getStringFormat(request.getParameter("username"));
            password = StringUtils.getStringFormat(request.getParameter("password"));
            int result = dao.updateAdmin(id, username, password);
            if (result == 0) {
                error = "Can not update!!";
            } else {
                error = "Update successfully!!";
            }
        }

        List<Admin> list = dao.getAdminList();
        int total = 0;
        if (list != null && list.size() > 0) {
            total = list.size();
        }
        mv.addObject("total", total);
        mv.addObject("list", list);
        mv.addObject("error", error);
        mv.addObject("username", username);
        mv.addObject("password", password);
        return mv;
    }
}
