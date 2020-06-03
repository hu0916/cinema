package com.controller;

import com.dao.IndexPhotosMapper;
import com.entity.DisplayPlan;
import com.entity.IndexPhotos;
import com.entity.Movie;
import com.service.DisplayPlanService;
import com.service.MovieService;
import com.sun.deploy.net.HttpResponse;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@SessionAttributes("pageTimes")
@Controller
public class MovieController {
    @Autowired
    private MovieService movieService;

    @Autowired
    private IndexPhotosMapper indexPhotosMapper;

    @Autowired
    private DisplayPlanService displayPlanService;

    @RequestMapping("/setmovie")
    public String toMovie(String page, Model model) {
        int pageSize = 20;//每页显示20条
        int movieSize = movieService.findTotal();
        model.addAttribute("movieSize", movieSize);
        int pageTimes;
        if (movieSize % pageSize == 0) {
            pageTimes = movieSize / pageSize;
        } else {
            pageTimes = movieSize / pageSize + 1;
        }
        ;

        model.addAttribute("pageTimes", pageTimes);
        if (null == page) {
            page = "1";
        }
        int start = (Integer.parseInt(page) - 1) * pageSize;
        List<Movie> movies = movieService.findAll(start, pageSize);
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("movies", movies);
        return "movieControl";
    }

    @RequestMapping("/moviechange")
    public String getChange(int id, HttpSession session) {
        Movie getMovie = movieService.findById(id);
        session.setAttribute("getMovie", getMovie);
        return "movieChange";
    }

    @RequestMapping(value = "/change.do", method = RequestMethod.POST)
    public String upload(Movie movie, @RequestParam(value = "upload", required = false) MultipartFile uploadFiles, HttpServletRequest request) {
        System.out.println(movie);
        if (!uploadFiles.isEmpty()) {
            String idPicPath = null;
            System.out.println("begin attaching...");
            //获取保存文件的绝对路径
            String path = request.getSession().getServletContext().getRealPath("/static" + File.separator + "images");
            System.out.println("2.1 uploadFile path ===>" + path);
            //获取上传文件的文件名
            String oldFileName = uploadFiles.getOriginalFilename();//原文件名
            System.out.println("2.2 uploadFile oldFileName ===>" + oldFileName);
            //获取文件名后缀
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件名后缀
            System.out.println("2.3 uploadFile prefix ===>" + prefix);
            //设置文件大小的变量，KB是单位 20M
            int filesize = 20000000;
            System.out.println("2.4 uploadFile filesize ===>" + uploadFiles.getSize());
            if (uploadFiles.getSize() > filesize) {
                request.setAttribute("uploadFileError", "* 上传大小不得超过20MB");
                System.out.println("* 上传大小不得超过20MB");
                return "moviechange";
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")
                    || prefix.equalsIgnoreCase("pneg")) {
                //上传格式正确，重命名文件
                String fileName = System.currentTimeMillis() + ".jpg";
                System.out.println("2.5 new fileName===>" + uploadFiles.getName());
                //新建这么一个文件，File API
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    //上传
                    uploadFiles.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("uploadFileError", "* 上传失败！ ");
                    System.out.println("* 上传失败！ ");
                    return "moviechange";
                }
                idPicPath = "/static/images/" + fileName;
            } else {
                request.setAttribute("uploadFileError", "* 上传格式错误！");
                System.out.println("* 上传格式错误！");
                return "moviechange";
            }
            movie.setMovie_src(idPicPath);
            System.out.println("photo.idPicPath: " + movie.getMovie_src());
            int i = movieService.updateMovie(movie);
            request.getSession().removeAttribute("getMovie");
            IndexPhotos indexPhotos = new IndexPhotos();
            indexPhotos.setMovie_id(movie.getMovie_id());
            indexPhotos.setSrc(movie.getMovie_src());
            indexPhotos.setName(movie.getMovie_name());
            indexPhotos.setStars(movie.getMovie_stars());
            SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy");
            int year= Integer.parseInt(myDateFormat.format(movie.getMovie_time()));
            indexPhotos.setYear(year);
            indexPhotos.setType(movie.getMovie_status());//插入到不同的状态的地方
            int j=indexPhotosMapper.updateIndexPhoto(indexPhotos);
            System.out.println("update index_photos");
            if (i > 0) {
                return "redirect:/setmovie";
            } else return "moviechange";
        } else {
            movie.setMovie_src(null);
            int row = movieService.updateMovie(movie);
            request.getSession().removeAttribute("getMovie");
            IndexPhotos indexPhotos = new IndexPhotos();
            indexPhotos.setMovie_id(movie.getMovie_id());
            indexPhotos.setSrc(null);
            indexPhotos.setName(movie.getMovie_name());
            indexPhotos.setStars(movie.getMovie_stars());
            SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy");
            int year= Integer.parseInt(myDateFormat.format(movie.getMovie_time()));
            indexPhotos.setYear(year);
            indexPhotos.setType(movie.getMovie_status());//插入到不同的状态的地方
            int j=indexPhotosMapper.updateIndexPhoto(indexPhotos);
            if (row > 0) {
                System.out.println("update successfully");
                return "redirect:/setmovie";
            } else {
                System.out.println("fail!!!!!!!!!");
                return "moviechange";
            }
        }
    }

    @RequestMapping("/delete.do")
    public String doDelete(int id, HttpServletResponse response) throws IOException {
        int row = movieService.deleteMovie(id);//设置外键delete 会消除indexphoto表
        if (row > 0) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script language=\"javascript\">alert('删除成功！');");
            return "redirect:/setmovie";
        } else return "/delete.do";
    }

    @RequestMapping("/insertmovie")
    public String toInsert() {
        return "movieInsert";
    }

    @RequestMapping(value = "/insertmovie.do",method = RequestMethod.POST)
    public String doINsert(Movie movie,@RequestParam(value = "upload", required = true) MultipartFile uploadFiles, HttpServletRequest request) {
            String idPicPath = null;
            System.out.println("begin attaching...");
            //获取保存文件的绝对路径
            String path = request.getSession().getServletContext().getRealPath("/static" + File.separator + "images");
            System.out.println("2.1 uploadFile path ===>" + path);
            //获取上传文件的文件名
            String oldFileName = uploadFiles.getOriginalFilename();//原文件名
            System.out.println("2.2 uploadFile oldFileName ===>" + oldFileName);
            //获取文件名后缀
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件名后缀
            System.out.println("2.3 uploadFile prefix ===>" + prefix);
            //设置文件大小的变量，KB是单位 20M
            int filesize = 20000000;
            System.out.println("2.4 uploadFile filesize ===>" + uploadFiles.getSize());
            if (uploadFiles.getSize() > filesize) {
                request.setAttribute("uploadFileError", "* 上传大小不得超过20MB");
                System.out.println("* 上传大小不得超过20MB");
                return "moviechange";
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")
                    || prefix.equalsIgnoreCase("pneg")) {
                //上传格式正确，重命名文件
                String fileName = System.currentTimeMillis() + ".jpg";
                System.out.println("2.5 new fileName===>" + uploadFiles.getName());
                //新建这么一个文件，File API
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    //上传
                    uploadFiles.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("uploadFileError", "* 上传失败！ ");
                    System.out.println("* 上传失败！ ");
                    return "movieInsert";
                }
                idPicPath = "/static/images/" + fileName;
            } else {
                request.setAttribute("uploadFileError", "* 上传格式错误！");
                System.out.println("* 上传格式错误！");
                return "movieInsert";
            }
            movie.setMovie_src(idPicPath);
            System.out.println("photo.idPicPath: " + movie.getMovie_src());
            int i = movieService.insert(movie);
            if (i > 0) {
                return "redirect:/setmovie";
            } else return "movieInsert";
        }

    @ResponseBody
    @RequestMapping("/searchmovie.do")
    public List<Movie> doSearch(String search_name, int stype) {
        List<Movie> movieList = movieService.searchMovieByName(search_name, stype);
            return movieList;
    }

    @RequestMapping("/single")
    public String doSingle(int id,HttpSession session) {
        Movie movie = movieService.findById(id);
        session.setAttribute("single",movie);
        String date=new Timestamp(System.currentTimeMillis()).toString().substring(0,10);
        List<DisplayPlan> singleplan = displayPlanService.findPlanByMovie_id(id,date);
        session.setAttribute("singleplan",singleplan);
        return "single";
    }



}

