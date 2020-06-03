package com.interceptor;

import com.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    private static String[] banned = {"/mycenter","/delorder"};
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        boolean flag = false;
        if (user != null) {
            if (user.getStatus() == -1) {
                flag = true;
            }
        }
        String servletPath = request.getServletPath();
        for (String s : banned) {
            if (s.contains(servletPath)) {
                if (flag) {
                    return true;
                }
                if (user == null) {
                    request.setAttribute("alert", "请先登录");
                    request.getRequestDispatcher("/load").forward(request, response);
                    return false;
                }
                if (user.getStatus() > 0) {//管理员权限就转发
                    request.getSession().invalidate();
                    request.setAttribute("alert", "使用普通用户登录");
                    request.getRequestDispatcher("/load").forward(request, response);
                    return false;
                }
                if (user.getStatus() != -1) {
                    request.setAttribute("alert", "用户状态错误");
                    request.getRequestDispatcher("/load").forward(request, response);
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
