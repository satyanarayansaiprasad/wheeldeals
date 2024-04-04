package com.example.wheeldeals;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class vwd {
    @Autowired
    JdbcTemplate jdbc;

    // vendor

    @GetMapping("/vindex")
    public static String vindex() {
        return "vendor/vindex";
    }

    @GetMapping("/vabout")
    public static String vabout() {
        return "vendor/vabout";
    }

    @GetMapping("/vviewt")
    public static String vviewt() {
        return "vendor/viewtenders";
    }

    @GetMapping("/bidt")
    public static String bidt() {
        return "vendor/bidtender";
    }

    @GetMapping("/bidh")
    public static String bidh() {
        return "vendor/bidhistory";
    }

    @GetMapping("/bids")
    public static String bids() {
        return "vendor/bidstatus";
    }

    @GetMapping("/Account")
    public String avendor(Model mod,HttpSession session,HttpServletRequest request ){
        String user_id=(String)request.getSession().getAttribute("user_id");
        String sql="select * from vendor where vendor_id='"+user_id+"'";
        List<Map<String,Object>>vendor=jdbc.queryForList(sql);
        mod.addAttribute("vendordetails",vendor);
        // System.out.println(user_id);
        return "vendor/Account";

    }
}
