/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.controller;

import com.church.bean.Contact;
import com.church.dao.ContactDao;
import com.church.utils.StringUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        mv.addObject("active", "contact");
        String a = request.getParameter("a");
        String action = StringUtils.getStringFormat(request.getParameter("a"));
        String name = StringUtils.getStringFormat(request.getParameter("yourname"));
        String email = StringUtils.getStringFormat(request.getParameter("youremail"));
        String web = StringUtils.getStringFormat(request.getParameter("yourweb"));
        String mess = StringUtils.getStringFormat(request.getParameter("yourmess"));
        String error = "";
        if (action.equalsIgnoreCase("submit")) {

            Contact contact = new Contact();
            contact.setName(name);
            contact.setEmail(email);
            contact.setWeb(web);
            contact.setMessage(mess);
            ContactDao dao = new ContactDao();
            if (dao.insertContact(contact) > 0) {
                error = "Success";
            } else {
                error = "Fail";
            }

        }
        mv.addObject("error", error);
        return mv;
    }
//    var name = $("#name").val(), email = $("#email").val(), web = $("#web").val(), mess = $("#mess").val();
}
