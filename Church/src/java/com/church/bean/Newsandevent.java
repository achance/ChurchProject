/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.church.bean;

import java.util.List;

/**
 *
 * @author Binh
 */
public class Newsandevent {

    private int id;
    private String title;
    private String description;
    private String minidesc;
    private String published_time;
    private String created_time;
    private String updated_time;
    private int status;
    private String month;
    private String day;
    private List<Newsandevent> itemList;

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public List<Newsandevent> getItemList() {
        return itemList;
    }

    public void setItemList(List<Newsandevent> itemList) {
        this.itemList = itemList;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMinidesc() {
        return minidesc;
    }

    public void setMinidesc(String minidesc) {
        this.minidesc = minidesc;
    }

    public String getCreated_time() {
        return created_time;
    }

    public void setCreated_time(String created_time) {
        this.created_time = created_time;
    }

    public String getUpdated_time() {
        return updated_time;
    }

    public void setUpdated_time(String updated_time) {
        this.updated_time = updated_time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublished_time() {
        return published_time;
    }

    public void setPublished_time(String published_time) {
        this.published_time = published_time;
    }

}
