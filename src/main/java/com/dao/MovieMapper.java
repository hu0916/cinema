package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.entity.Movie;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MovieMapper {
    int insert(@Param("movie") Movie movie);

    int insertSelective(@Param("movie") Movie movie);

    int insertList(@Param("movies") List<Movie> movies);

    int updateByPrimaryKeySelective(@Param("movie") Movie movie);

    List<Movie> findAll(@Param("start") int start,@Param("finish") int finish);

    int findTotal();

    Movie findById(@Param("id") int id);

    int updateMovie(@Param("movie") Movie movie);

    int deleteMovie(@Param("id") int id);

    List<Movie> searchMovieByName(@Param("movie_name") String search_name,@Param("movie_status")int status);

    @Select("select count(1) from movie where movie_status=1")
    int countShowMovie();

    @Select("select * from movie where movie_status=1")
    List<Movie> findMovieBystatus();

    @Select("select * from movie where movie_type=#{movie_type} ")
    List<Movie> findMovieByMovie_type(@Param("movie_type") int movie_type);
}
