package com.service;

import java.util.List;
import com.entity.Movie;
import org.apache.ibatis.annotations.Param;

public interface MovieService{

    int insert(Movie movie);

    int insertSelective(Movie movie);

    int insertList(List<Movie> movies);

    int updateByPrimaryKeySelective(Movie movie);

    List<Movie> findAll(int start,int finish);

    int findTotal();

    Movie findById(int id);

    int updateMovie(Movie movie);

    int deleteMovie(int id);

    List<Movie> searchMovieByName(String search_name,int status);

    int countShowMovie();

    List<Movie> findMovieBystatus();

    List<Movie> findMovieByMovie_type(int movie_type);

}
