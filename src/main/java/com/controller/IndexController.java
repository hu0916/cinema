package com.controller;

import com.entity.IndexPhotos;
import com.entity.Movie;
import com.service.IndexPhotosService;
import com.service.MovieService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private IndexPhotosService indexPhotosService;
    @Autowired
    private MovieService movieService;

    @RequestMapping("/setindex")
    public String toSetIndex(HttpSession session) {
        List<Integer> types = new ArrayList<>();
        types.add(1);
        types.add(2);
        types.add(3);//把123分 数组查询出来
        List<IndexPhotos> indexPhotos = indexPhotosService.selectAll(types);
        IndexPhotos indexPhoto = indexPhotosService.selectByType(4);
        session.setAttribute("indexphoto", indexPhoto);
        session.setAttribute("photos",indexPhotos);
        return "indexControl";
    }

    @RequestMapping("/removeIndexphoto")
    @ResponseBody
    public String removeStuff(@RequestParam("id") int id) {
        int row = indexPhotosService.deleteIndexPhoto(id);
        if (row > 0) {
            return "success";
        }else {
            return "error";
        }
    }

    @RequestMapping("/insertIndex.do")
    public String doInsert(int stype, int id,HttpServletResponse response) throws IOException {
        Movie movie = movieService.findById(id);
        IndexPhotos indexPhotos = new IndexPhotos();
        indexPhotos.setMovie_id(movie.getMovie_id());
        indexPhotos.setSrc(movie.getMovie_src());
        indexPhotos.setName(movie.getMovie_name());
        indexPhotos.setStars(movie.getMovie_stars());
        SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy");
        int year= Integer.parseInt(myDateFormat.format(movie.getMovie_time()));
        indexPhotos.setYear(year);
        indexPhotos.setType(stype);//插入到不同的状态的地方
        movie.setMovie_status(stype);//库中电影状态改变
        int row = indexPhotosService.insert(indexPhotos);
        movieService.updateMovie(movie);
        if (row > 0) {
            return "insertIndex";
        } else {
            System.out.println("error");
            return "error";
        }
    }


    @RequestMapping("/load")
    public String loading(HttpSession session) {
        List<Integer> types = new ArrayList<>();
        types.add(1);
        types.add(2);
        types.add(3);//把123分 数组查询出来
        List<IndexPhotos> indexPhotos = indexPhotosService.selectAll(types);
        IndexPhotos indexPhoto = indexPhotosService.selectByType(4);
        session.setAttribute("indexphoto", indexPhoto);
        session.setAttribute("photos",indexPhotos);
        return "index";
    }

    @RequestMapping(value = "/updateold",method = RequestMethod.POST)
    public String update(IndexPhotos indexPhotos) {
        indexPhotosService.updateold(indexPhotos);
        return "redirect:/setindex";
    }
}
