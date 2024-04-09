package com.example.wheeldeals;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
public class wd {
    @Autowired
    JdbcTemplate jdbc;

    @PostMapping("/signin")
    public String signin(Model m, HttpSession session, @RequestParam("userid") String user_id,
            @RequestParam("password") String password, @RequestParam("role") String role) {

        if (role.equals("admin")) {

            if (user_id.equals("Admin") && password.equals("Admin123")) {
                session.setAttribute("user_id", "Admin");
                return "admin/aindex";
            } else {
                return "signin";
            }
        } else if (role.equals("vendor")) {
            ArrayList<String> ali = new ArrayList<String>();
            try {
                List<String> li = jdbc.query(
                        "select vendor_id, password, vname from vendor where vendor_id='" + user_id + "' and password='"
                                + password + "' ",
                        new RowMapper<String>() {
                            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                                ali.add(rs.getString(1)); // vendor_id
                                ali.add(rs.getString(2)); // password
                                ali.add(rs.getString(3)); // vname
                                return "";
                            }
                        });

                session.setAttribute("user_id", ali.get(0));
                session.setAttribute("password", ali.get(1));

                if (ali.get(0).equals(user_id) && ali.get(1).equals(password)) {
                    m.addAttribute("userid", ali.get(0));
                    m.addAttribute("vname", ali.get(2));
                    return "vendor/vindex";
                } else {
                    m.addAttribute("sms", "Invalid username or password");
                    return "signin";
                }
            } catch (Exception e) {
                // Handle any unexpected errors
                m.addAttribute("sms", "Invalid username or password");
                return "signin";
            }
        } else {
            return "signin";
        }

    }

    @PostMapping("/signup")
    public String signup_save(Model m, @RequestParam("userid") String userid, @RequestParam("password") String password,
            @RequestParam("fullName") String fullName, @RequestParam("number") String number,
            @RequestParam("email") String email, @RequestParam("company") String company,
            @RequestParam("address") String address, @RequestParam("f") MultipartFile f) throws IOException {
        try {
            String sql = "insert into vendor values (?, ?, ?, ?, ?, ?, ?, ?)";
            jdbc.update(sql, userid, password, fullName, number, email, company, address, f.getBytes());
            m.addAttribute("sms", "Registration success");
            return "signup";
        } catch (Exception e) {
            m.addAttribute("sms", "An error occurred during registration. Please try again.");
            return "signup";
        }
    }

    @PostMapping("/contact")
    public String contact(Model m, @RequestParam("name") String name, @RequestParam("email") String email,
            @RequestParam("subject") String subject, @RequestParam("message") String message) {
        try {
            jdbc.update("INSERT INTO contact_information(iname, iemail, isubject, imessage) VALUES('" + name + "','"
                    + email + "','" + subject + "','" + message + "')");
            m.addAttribute("sms", "Your query sent successfully");
            return "contact";
        } catch (Exception e) {
            // Handle any other exceptions that may occur during signup
            m.addAttribute("sms", "An error occurred during registration. Please try again.");
            return "contact";
        }
    }

    @GetMapping("/")
    public String index(Model mod) {
        String sql = "select questions, answers from faq";
        List<Map<String, Object>> faq = jdbc.queryForList(sql);
        mod.addAttribute("faqdetails", faq);
        return "index";
    }

    @GetMapping("/about")
    public static String about() {
        return "about";
    }

    @GetMapping("/tender")
    public static String tender() {
        return "tender";
    }

    @GetMapping("/contact")
    public static String contact() {
        return "contact";
    }

    @GetMapping("/faq")
    public String homeFaq(Model mod) {
        String sql = "select questions, answers from faq";
        List<Map<String, Object>> faq = jdbc.queryForList(sql);
        mod.addAttribute("faqdetails", faq);
        return "faq";
    }

    // @GetMapping("/faq")
    // public static String faq() {
    // return "faq";
    // }

    @GetMapping("/signin")
    public static String signin() {
        return "signin";
    }

    @GetMapping("/signup")
    public static String signup() {
        return "signup";
    }

    @GetMapping("/tac")
    public static String tac() {
        return "tac";
    }

    @GetMapping("/pp")
    public static String pp() {
        return "pp";
    }

}
