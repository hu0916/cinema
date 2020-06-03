package com.service;

import java.util.List;
import com.entity.IndexPhotos;

public interface IndexPhotosService{

    int insert(IndexPhotos indexPhotos);

    int insertList(List<IndexPhotos> indexPhotoss);

    List<IndexPhotos> selectAll(List<Integer> types);

    IndexPhotos selectByType(int type);

    int deleteIndexPhoto(int id);

    int updateIndexPhoto(IndexPhotos indexPhoto);

    int updateold(IndexPhotos indexPhotos);

}
