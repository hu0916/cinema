package com.controller;

import com.entity.DisplayPlan;
import com.entity.Movie;
import com.service.DisplayPlanService;
import com.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@SessionAttributes("pageTimes")
@Controller
public class PlayingPlanController {
    @Autowired
    private MovieService movieService;
    @Autowired
    private DisplayPlanService displayPlanService;

    @RequestMapping("/setplan")
    public String doSetplan(Model model,String page) {
        int pageSize = 20;//每页显示20条
        int planSize = displayPlanService.countDisplayPlan();
        model.addAttribute("planSize", planSize);
        int pageTimes;
        if (planSize % pageSize == 0) {
            pageTimes = planSize / pageSize;
        } else {
            pageTimes = planSize / pageSize + 1;
        }
        ;

        model.addAttribute("pageTimes", pageTimes);
        if (null == page) {
            page = "1";
        }
        int start = (Integer.parseInt(page) - 1) * pageSize;
        List<DisplayPlan> plans = displayPlanService.findAllPlan(start, pageSize);
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("plans", plans);
        return "setPlayPlan";
    }

    @RequestMapping("/newplan")
    public String newplan(HttpSession session) {
        List<Movie> displays = movieService.findMovieBystatus();
        session.setAttribute("displays", displays);
        return "setNewPlan";
    }

    @ResponseBody
    @RequestMapping("/getprice")
    public List<String> getPriceTime(int id) {
        Movie movie = movieService.findById(id);
        Double price = movie.getMovie_price();
        Integer show_time = movie.getMovie_showtime();
        List<String> data = new ArrayList<>();
        data.add(price.toString());
        data.add(show_time.toString());
        return data;
    }

    @ResponseBody
    @RequestMapping(value = "/verify",method = RequestMethod.POST)
    public List<String> verifyTime(@RequestBody Map<String,String> date ) throws ParseException {
//        for (String key : date.keySet()) {
//            System.out.println(key+"---------value:"+date.get(key));
//        }
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//HH24小时制 hh12小时制
        Date strStart_time = formatter.parse(date.get("start_time"));
        Timestamp start_time = new Timestamp(strStart_time.getTime());
        int show_time = Integer.parseInt(date.get("show_time"));
        List<String> result = new ArrayList<> ();
        long last_time = start_time.getTime() + show_time*60*1000;
        Timestamp lasttime = new Timestamp(last_time);
        List<DisplayPlan> displayPlans = displayPlanService.findAllPlans();
        for (DisplayPlan displayPlan : displayPlans) {
            if (start_time.compareTo(displayPlan.getStart_time())>0&&start_time.compareTo(displayPlan.getEnd_time())<0) {
                result.add("false");
                return result;
            } else if (lasttime.compareTo(displayPlan.getStart_time())>0&&lasttime.compareTo(displayPlan.getEnd_time())<0) {
                result.add("false");
                return result;
            }
        }
        result.add("true");
        result.add(lasttime.toString());
        result.add(start_time.toString().substring(0, 10));
        System.out.println(result);
        return result;
    }

    @RequestMapping("/planInsert")
    public String doInsert(DisplayPlan displayPlan) {
        displayPlanService.insert(displayPlan);
        int id = displayPlan.getPlan_id();
        return "redirect:/seats?plan_id="+id;
    }

    @RequestMapping("/seats")
    public String doSetSeats(int plan_id,HttpSession session) {
        session.setAttribute("plan_id", plan_id);
        if (session.getAttribute("seatError") != null) {
            session.removeAttribute("seatError");
        }
        return "setSeats";
    }

    @ResponseBody
    @RequestMapping("/getseat")
    public String doGet(String seats,HttpSession session) {
        System.out.println(seats);
        if (session.getAttribute("seatError") != null) {
            session.removeAttribute("seatError");
        }
        seats = seats.replace(" ", "");
        int plan_id = (int) session.getAttribute("plan_id");
        int row = displayPlanService.updateSeats(seats, plan_id);
        if (row > 0) {
            return "success";
        } else{
            session.setAttribute("seatError","有错误发生了，操作失败");
            return "error";
        }

    }

    @RequestMapping("/deleteplan")
    public String doDelete(int plan_id) {
        int row = displayPlanService.updatePlanStatus(plan_id, 3);
        if (row > 0) {
            return "cancelsuccess";
        }else return "error";
    }

    @RequestMapping("/changeplan")
    public String doChange(int plan_id,HttpSession session) {
        DisplayPlan displayPlan = displayPlanService.findPlanById(plan_id);
        int show_time = movieService.findById(displayPlan.getMovie_id()).getMovie_showtime();
        session.setAttribute("show_time",show_time);
        session.setAttribute("display",displayPlan);
        return "ChangePlan";
    }

    @RequestMapping("/updateplan.do")
    public String doUpdate(DisplayPlan plan) {
        int row = displayPlanService.updateByPrimaryKeySelective(plan);
        if (row > 0) {
            return "redirect:/setplan";
        }else {
            return "error";
        }

    }
}
