package com.controller;

import com.entity.Movie;
import com.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexRequestController {
    @Autowired
    private MovieService movieService;

    @RequestMapping("/type")
    public String queryType(int movie_type, HttpSession session) {
        if (session.getAttribute("result") != null) {
            session.removeAttribute("result");
        }
        List<Movie> type = movieService.findMovieByMovie_type(movie_type);
        session.setAttribute("result", type);
        return "query";
    }

    @RequestMapping("/query")
    public String query(String movie_name,HttpSession session) {
        if (session.getAttribute("result") != null) {
            session.removeAttribute("result");
        }
        List<Movie> movieByName = movieService.searchMovieByName(movie_name, -1);
        session.setAttribute("result", movieByName);
        return "query";
    }
}
