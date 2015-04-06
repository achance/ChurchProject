/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.cms.controller;

import com.church.bean.Admin;
import com.church.dao.AdminDao;
import com.church.utils.StringUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Binh
 */
public class LoginController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        request.setCharacterEncoding("UTF-8");
        String action = StringUtils.getStringFormat(request.getParameter("action"));
        String error = "";
        String username = "",password = "";
        if (action.equalsIgnoreCase("login")) {
            username = StringUtils.getStringFormat(request.getParameter("login"));
            password = StringUtils.getStringFormat(request.getParameter("password"));
            if (StringUtils.isNotNullorEmpty(username) && StringUtils.isNotNullorEmpty(password)) {
                Admin admin = new AdminDao().login(username, StringUtils.md5Hash(password));
                if (admin != null) {
                    HttpSession httpSession = request.getSession(true);
                    httpSession.setAttribute("admin", admin);
                    response.sendRedirect("index.htm");
                } else {
                    error = "Incorrect username or password!!";
                }
            } else {
                error = "Please enter username and password!!";
            }
        }
        mv.addObject("username", username);
        mv.addObject("password", password);
        mv.addObject("error", error);
        return mv;
    }
}
