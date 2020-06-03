package com.controller;

import com.dao.UserMapper;
import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@SessionAttributes("pageTimes")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /*埋坑 bug1：管理员和普通用户同一个表会导致count数据不对  bug2下一页的链接不对*/
    @RequestMapping("/user")
    public String getUser(int method,String page, Model model,HttpSession session) {
        int pageSize = 20;//每页显示20条
        int userSize = userService.countUser();
        int status;
        int min;
        if (method == 1) {
            status = 1;
            min = -2;
        } else{
            status = 2;
            min = 0;
        }
        model.addAttribute("userSize", userSize);
        int pageTimes;
        if (userSize % pageSize == 0) {
            pageTimes = userSize / pageSize;
        } else {
            pageTimes = userSize / pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);
        if (null == page) {
            page = "1";
        }
        int start = (Integer.parseInt(page) - 1) * pageSize;
        List<User> users = userService.findAllUser(start, pageSize,status,min);
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("users", users);
        session.setAttribute("method",method);
        return "userControl";
    }

    @RequestMapping("/getuser")
    public String doGet(String username,HttpSession session) {
        List<User> users = new ArrayList<>();
        User user = userService.getUserByUsername(username);
        users.add(user);
        session.setAttribute("users", users);
        session.setAttribute("method", 1);
        return "redirect:/userControl";
    }

    @RequestMapping("/userControl")
    public String doReload(String pageTimes) {
        return "userControl";
    }

    @RequestMapping("/reset")
    public String doReset(String username,HttpSession session) {
        int row = userService.resetPassword(username);
        int method = (int) session.getAttribute("method");
        if (method != 1 && method!=2) {
            return "error";
        }
        if (row > 0) {
            session.setAttribute("alert","重设为111111成功");
            return "userControl";
        }else return "error";
    }

    @RequestMapping("/ban")
    public String doBanned(String username, HttpSession session) {
        int row = userService.banUser(username,0);
        if (row > 0) {
            session.setAttribute("alert","成功封禁--"+username);
            return "redirect:/getuser?username="+username;
        } else return "error";
    }

    @RequestMapping("/unban")
    public String doRecorver(String username, HttpSession session) {
        int row = userService.banUser(username,-1);
        if (row > 0) {
            session.setAttribute("alert","成功解封--"+username);
            return "redirect:/getuser?username="+username;
        } else return "error";
    }

    @RequestMapping("/deladmin")
    public String doDel(int uid,HttpSession session) {
        int num = userService.countAdmin();
        if (num > 1) {
            int row=userService.delAdmin(uid);
            if (row > 0) {
                session.setAttribute("alert", "删除成功");
                return "redirect:/user?method=2";
            } else return "error";
        }
        session.setAttribute("alert","管理员账号不能少于1个");
        return "redirect:/user?method=2";
    }

    @RequestMapping("/adminins")
    public String doInsert(User user,HttpSession session) {
        System.out.println(user);
        User user1=userService.getUserByUsername(user.getUsername());
        if (user1 != null) {
            session.setAttribute("alert", "已存在该用户名");
            return "redirect:user?method=2";
        } else {
            int row = userService.adminInsert(user);
            if (row > 0) {
                session.setAttribute("alert", "新增成功");
                return "redirect:user?method=2";
            }
        }
        return "error";
    }
}
