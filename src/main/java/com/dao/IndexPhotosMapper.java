package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.entity.IndexPhotos;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface IndexPhotosMapper {
    int insert(@Param("indexPhotos") IndexPhotos indexPhotos);

    int insertList(@Param("indexPhotoss") List<IndexPhotos> indexPhotoss);

    List<IndexPhotos> selectAll(@Param("types") List<Integer> types);

    IndexPhotos selectByType(@Param("type") int type);

    int deleteIndexPhoto(@Param("id") int id);

    int updateIndexPhoto(@Param("IndexPhotos") IndexPhotos indexPhoto);

    @Update("update index_photos set name=#{IndexPhotos.name},story_line=#{IndexPhotos.story_line},release_time=#{IndexPhotos.release_time},genre=#{IndexPhotos.genre},stars=#{IndexPhotos.stars}  where id=30")
    int updateold(@Param("IndexPhotos")IndexPhotos indexPhotos);
}
