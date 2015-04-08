/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.cms.controller;

import com.church.bean.Admin;
import com.church.bean.Contact;
import com.church.dao.ContactDao;
import com.church.utils.StringUtils;
import java.util.ArrayList;
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
public class ContactController implements Controller {

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
        ContactDao dao = new ContactDao();
        String action = StringUtils.getStringFormat(request.getParameter("action"));
        if (action.equalsIgnoreCase("delete")) {
            int id = StringUtils.getIntFormat(request.getParameter("id"));
            int result = dao.deleteContact(id);
            if (result == 0) {
                error = "Can not delete!!";
            } else {
                error = "Deleted!!";
            }
        }
        
        if (action.equalsIgnoreCase("updateStatus")) {
            int id = StringUtils.getIntFormat(request.getParameter("id"));
            int status = StringUtils.getIntFormat(request.getParameter("status"));
            int result = dao.updateContact(id,status);
            if (result == 0) {
                error = "Can not update status!!";
            }
        }

        List<Contact> list = dao.getContactList();
        int total = 0;
        if (list != null && list.size() > 0) {
            total = list.size();
        }
        mv.addObject("total", total);
        mv.addObject("list", list);
        mv.addObject("error", error);
        return mv;
    }
}
