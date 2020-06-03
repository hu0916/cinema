package com.controller;

import com.entity.User;
import com.service.MovieService;
import com.service.OrdersService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private OrdersService ordersService;

    @RequestMapping("/bglogin")
    public String toBackgroundLogin() {
        return "backgroundLogin";
    }

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    @ResponseBody
    public String loginCheck(@RequestBody User user, HttpSession session) {
        String username=user.getUsername();
        User user1 = userService.getUserByUsername(username);
        if (user1 != null) {
            if (user1.getStatus() == 0) {
                return "banned";
            } if (user.getStatus()==1&&user1.getStatus() < 0) {//普通用户和管理员登录共用一个方法 所以为了区分在post的时候管理员发的status为1
                return "nopermission";
            }
            if (user.getStatus() == 2 && user1.getStatus() > 0) {
                return "nopermission";
            }
            if (user1.getPassword().equals(user.getPassword())) {
                session.setAttribute("user",user1);
                return "success";
            } else return "false";
        } else return "false";
    }

    @RequestMapping("/center")
    public String toCenter(HttpSession session) {
        int countUser = userService.countUser();
        System.out.println(countUser);
        session.setAttribute("count",countUser);

        int countMovie = movieService.countShowMovie();
        System.out.println(countMovie);
        session.setAttribute("countMovie", countMovie);
        double countPrice = ordersService.countTotal();
        session.setAttribute("countPrice", countPrice);
        int countOrder = ordersService.countOrders();
        session.setAttribute("countOrder", countOrder);
        return "adminCenter";
    }

    @RequestMapping("/adminQuit")
    public String quit(HttpServletRequest request) {
        HttpSession session=request.getSession();
        if (session != null) {
            session.invalidate();
        }
        return "backgroundLogin";
    }

    @RequestMapping("/quit")
    public String normalQuit(HttpServletRequest request) {
        HttpSession session=request.getSession();
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/load";
    }


    @ResponseBody
    @RequestMapping("/register.do")
    public String register(@RequestBody User user) {
        User user1 = userService.getUserByUsername(user.getUsername());
        if (user1 == null) {
            int row = userService.insert(user);
            if (row > 0) {
                return "success";
            }else return "error";
        }else return "unavailable";
    }

    @ResponseBody
    @RequestMapping("/checkuser")
    public String check(String username) {
        User user = userService.getUserByUsername(username);
        if (user != null) {
            return "exist";
        }
        return "available";
    }
}
