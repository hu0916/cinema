package com.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.entity.Movie;
import com.dao.MovieMapper;
import com.service.MovieService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MovieServiceImpl implements MovieService{

    @Resource
    private MovieMapper movieMapper;

    @Override
    public int insert(Movie movie){
        return movieMapper.insert(movie);
    }

    @Override
    public int insertSelective(Movie movie){
        return movieMapper.insertSelective(movie);
    }

    @Override
    public int insertList(List<Movie> movies){
        return movieMapper.insertList(movies);
    }

    @Override
    public int updateByPrimaryKeySelective(Movie movie){
        return movieMapper.updateByPrimaryKeySelective(movie);
    }

    @Override
    public List<Movie> findAll(int start, int finish) {
        return movieMapper.findAll(start,finish);
    }

    @Override
    public int findTotal() {
        return movieMapper.findTotal();
    }

    @Override
    public Movie findById(int id) {
        return movieMapper.findById(id);
    }

    @Override
    public int updateMovie(Movie movie) {
        return movieMapper.updateMovie(movie);
    }

    @Override
    public int deleteMovie(int id) {
        return movieMapper.deleteMovie(id);
    }

    @Override
    public List<Movie> searchMovieByName(String search_name, int status) {
        return movieMapper.searchMovieByName(search_name,status);
    }

    @Override
    public int countShowMovie() {
        return movieMapper.countShowMovie();
    }

    @Override
    public List<Movie> findMovieBystatus() {
        return movieMapper.findMovieBystatus();
    }

    @Override
    public List<Movie> findMovieByMovie_type(int movie_type) {
        return movieMapper.findMovieByMovie_type(movie_type);
    }
}
