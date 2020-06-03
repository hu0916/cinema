package com.controller;


import com.alibaba.fastjson.JSONObject;
import com.entity.Orders;
import com.entity.User;
import com.service.DisplayPlanService;
import com.service.OrdersService;
import com.utils.OrderNumberUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@SessionAttributes("pageTimes")
@Controller
public class OrderController {
    private Logger log = LoggerFactory.getLogger("com.controller");
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private DisplayPlanService displayPlanService;

    @ResponseBody
    @RequestMapping("/order.do")
    public String doAction(HttpSession session,@RequestBody JSONObject json) throws Exception {
        //验证登录状态+座位是否变动
        User user= (User) session.getAttribute("user");
        if (user == null) {
            return "usernull";
        }
        int display_id = json.getInteger("display_id");
        String nowSeat = displayPlanService.getSeats(display_id);
        String seats = json.getString("seats");
        String seats2=seats.substring(1, seats.length() - 1).replace(" ","");//把json送来的[]删掉[]
        String verifySeats = json.getString("verifymap");
        if (!nowSeat.equals(verifySeats)) {
            return "changed";
        }else {
            Map<String, String> map = json.getObject("order", Map.class);
            Orders order = new Orders();
            order.setOrder_product(map.get("order_product"));
            order.setOrder_number(map.get("order_number"));
            order.setOrder_price(Double.valueOf(map.get("order_price")));
            order.setMovie_name(map.get("movie_name"));
            order.setHall_type(map.get("hall_type"));
            order.setOrder_id(OrderNumberUtil.getInstance().get());
            order.setUser_id(user.getUid());
            order.setOrder_status(1);
            order.setPlan_id(json.getInteger("display_id"));
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            order.setCreate_time(timestamp);
            order.setCreate_date(timestamp.toString().substring(0, 10));
            int row = ordersService.orderAction(order,seats2, display_id);
            System.out.println("-------------" + row + "-----------");
            if (row > 0) {
                return "success";
                }
            else {
            log.info("更新座位表失败，启动事务管理回滚--" + order + "--id--" + display_id);
                return "error";
        }
            }


    }

    @RequestMapping("/delorder")
    public String doDEL(int id,HttpSession session) {
        int row = ordersService.userDel(id);
        if (row > 0) {
            session.setAttribute("alert","删除成功！");
            return "redirect:mycenter?method=2";
        } else return "error";
    }

    @RequestMapping("/orderControl")
    public String Ordercontrol(String page, Model model) {
        int pageSize = 20;//每页显示20条
        int orderSize = ordersService.countOrders();
        model.addAttribute("orderSize", orderSize);
        int pageTimes;
        if (orderSize % pageSize == 0) {
            pageTimes = orderSize / pageSize;
        } else {
            pageTimes = orderSize / pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);
        if (null == page) {
            page = "1";
        }
        int start = (Integer.parseInt(page) - 1) * pageSize;
        List<Orders> orders = ordersService.findAllOrders(start, pageSize);
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("orders", orders);
        return "orderControl";
    }

    @RequestMapping("/orderchange")
    public String orderchange(int id, int type,HttpSession session) {
        int row = ordersService.updateOrder(id, type);
        if (row > 0) {
            session.setAttribute("alert","变更成功");
            return "redirect:/orderControl";
        }
        return "error";
    }

    @RequestMapping("/delorder.do")
    public String delorder(int id,HttpSession session) {
        int row=ordersService.adminDelorder(id);
        if (row > 0) {
            session.setAttribute("alert", "删除成功");
            return "redirect:/orderControl";
        }else return "error";
    }

    @RequestMapping("/queryorder")
    public String queryOrder(String order_id,HttpSession session) {
        Orders order=ordersService.findOrderById(order_id);
        List<Orders> orders = new ArrayList<>();
        if (order!=null) orders.add(order);
        if (orders.size() > 0) {
            session.setAttribute("orders",orders);
            return "redirect:/ordercontrol";
        }
        session.setAttribute("alert","没有找到该订单");
        session.setAttribute("orders",null);
        return "redirect:/ordercontrol";
    }

    @RequestMapping("/ordercontrol")
    public String ordercontrol(String page, Model model) {
        int pageSize = 20;//每页显示20条
        int orderSize = ordersService.countOrders();
        model.addAttribute("orderSize", orderSize);
        int pageTimes;
        if (orderSize % pageSize == 0) {
            pageTimes = orderSize / pageSize;
        } else {
            pageTimes = orderSize / pageSize + 1;
        }
        model.addAttribute("pageTimes", pageTimes);
        if (null == page) {
            page = "1";
        }
        int start = (Integer.parseInt(page) - 1) * pageSize;
        model.addAttribute("currentPage", Integer.parseInt(page));
        return "orderControl";
    }
}
