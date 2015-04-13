/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.church.controller;

import com.church.bean.Newsandevent;
import com.church.dao.NewsDao;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class NewsController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        request.setCharacterEncoding("UTF-8");
        mv.addObject("active", "news");
        NewsDao dao = new NewsDao();
        List<Newsandevent> monthList = dao.getTop4MonthList();
        List<Newsandevent> list = new ArrayList<Newsandevent>();
        for(Newsandevent newsandevent : monthList) {
            newsandevent.setItemList(dao.getNewsandeventListbyPublishTime(newsandevent.getPublished_time()));
            list.add(newsandevent);
        }
        Newsandevent newsandevent = dao.getLastestNewsandevent();
        mv.addObject("newsandevent", newsandevent);
        mv.addObject("total", list.size());
        mv.addObject("list", list);
        return mv;
    }
}

