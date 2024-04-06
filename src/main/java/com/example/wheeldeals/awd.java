package com.example.wheeldeals;

import java.util.List;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class awd {

    // Admin

    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/aindex")
    public static String aindex() {
        return "admin/aindex";
    }
    @PostMapping("/removevendor")
    public String removevendor(@RequestParam("vendor_id") String vendor_id, Model m, @RequestParam("btn") String btn) {
        String sql = "delete from vendor where vendor_id = ?";
            jdbc.update(sql, vendor_id);
        return avendor(m);
    }

    @GetMapping("/avendor")
    public String avendor(Model mod) {
        String sql = "select * from vendor";
        List<Map<String, Object>> vendor = jdbc.queryForList(sql);
        mod.addAttribute("vendordetails", vendor);
        mod.addAttribute("imgdata", vendor.get(0).get("photo"));
        return "admin/vendor";
    }

    @GetMapping("/viewt")
    public static String viewt() {
        return "admin/viewtender";
    }

    @GetMapping("/createt")
    public static String createt() {
        return "admin/createtender";
    }

    @GetMapping("/viewtb")
    public static String viewtb() {
        return "admin/viewtenderbids";
    }

    @GetMapping("/acceptb")
    public static String acceptb() {
        return "admin/acceptbid";
    }

    @GetMapping("/viewat")
    public static String viewat() {
        return "admin/viewassigntenders";
    }

    @GetMapping("/notice")
    public static String notice() {
        return "admin/notice";
    }

    @PostMapping("/faqs")
    public String contact(Model m, @RequestParam("question") String que, @RequestParam("answer") String ans) {
        try {
            jdbc.execute("INSERT INTO faq(questions, answers) VALUES('" + que + "','" + ans + "')");
            m.addAttribute("sms", "Faq added successfully");
            return faqs(m);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // Handle any other exceptions that may occur during 
            m.addAttribute("sms", "An error occurred. Please try again.");
            return "admin/afaq";

        }

    }

    @GetMapping("/faqs")
    public String faqs(Model mf) {
        String sql = "select * from faq";
        List<Map<String, Object>> faq = jdbc.queryForList(sql);
        mf.addAttribute("faq", faq);

        return "admin/afaq";
    }

    @PostMapping("/updatefaq")
    public String updatefaq(@RequestParam("id") String id, @RequestParam("question") String question, @RequestParam("answer") String answer, Model m){
        String sql = "update faq set questions = ?, answers = ? where id = ?";
        jdbc.update(sql, question, answer, id);
        return faqs(m);
    }

    @PostMapping("/managefaq")
    public String faqs(@RequestParam("id") String id, Model mf, @RequestParam("btn") String btn) {
        if(btn.equalsIgnoreCase("Delete")){
            String sql = "delete from faq where id = ?";
            jdbc.update(sql, id);
            return faqs(mf);
        }
        String sql = "select * from faq where id = '"+id+"'";
        List<Map<String, Object>> faqs = jdbc.queryForList(sql);
        mf.addAttribute("faqs", faqs);

        return "admin/editfaq";
    }
    
    @PostMapping("/logout")
    public String adminLogout(HttpSession session) {
        return logout(session); 
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "/signin";
    }

}
