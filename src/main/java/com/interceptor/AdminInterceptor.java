package com.interceptor;

import com.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor implements HandlerInterceptor {
    private static String[] banned = {"/center", "/setindex", "/removeIndexphoto", "/insertIndex.do", "/updateold", "/insertmovie", "/searchmovie.do", "/delete.do",
            "/change.do","/moviechange","/setmovie","/setplan","/newplan","/getprice","/verify","/planInsert","/seats","/getseat","/deleteplan","/changeplan",
            "/updateplan.do","/user","/getuser","/userControl","/reset","/ban","/unban","/deladmin","/adminins",
    };

    @Override

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        boolean flag = false;
        if (user != null) {
            if (user.getStatus() > 0) {
                flag = true;//获得权限
            }
        }
        String servletPath = request.getServletPath();
        for (String s : banned) {
            if (s.contains(servletPath)) {
                if (flag) {//有权限
                    return true;//访问通过
                } else {
                    request.setAttribute("alert", "没有管理员权限");
                    request.getSession().invalidate();
                    request.getRequestDispatcher("/bglogin").forward(request, response);
                    return false;
                }
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
