package com.controller;

import com.entity.Orders;
import com.entity.User;
import com.service.DisplayPlanService;
import com.service.OrdersService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyCenterController {
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private UserService userService;
    @Autowired
    private DisplayPlanService displayPlanService;

    @RequestMapping("/mycenter")
    public String tocenter(int method,HttpSession session) {
        User user= (User) session.getAttribute("user");
        List<Orders> myorder = ordersService.findOrderByUser_id(user.getUid());
        System.out.println(myorder);
        session.setAttribute("myorder", myorder);
        session.setAttribute("method",method);
        return "mycenter";
    }

    @RequestMapping("/updateuser")
    public String doupdate(User user,HttpSession session) {
        User user1= (User) session.getAttribute("user");
        user.setStatus(user1.getStatus());
        user.setUsername(user1.getUsername());
        user.setPassword(user1.getPassword());
        int row = userService.updateByPrimaryKeySelective(user);
        if (row > 0) {
            session.setAttribute("user",user);
            session.setAttribute("alert", "成功更新！");
            return "redirect:mycenter?method=1";
        } else return "error";
    }

}
