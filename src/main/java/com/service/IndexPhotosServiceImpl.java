package com.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.entity.IndexPhotos;
import com.dao.IndexPhotosMapper;
import com.service.IndexPhotosService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class IndexPhotosServiceImpl implements IndexPhotosService{

    @Resource
    private IndexPhotosMapper indexPhotosMapper;

    @Override
    public int insert(IndexPhotos indexPhotos){
        return indexPhotosMapper.insert(indexPhotos);
    }


    @Override
    public int insertList(List<IndexPhotos> indexPhotoss){
        return indexPhotosMapper.insertList(indexPhotoss);
    }


    @Override
    public List<IndexPhotos> selectAll(List<Integer> types) {
        return indexPhotosMapper.selectAll(types);
    }

    @Override
    public IndexPhotos selectByType(int type) {
        return indexPhotosMapper.selectByType(type);
    }

    @Override
    public int deleteIndexPhoto(int id) {
        return indexPhotosMapper.deleteIndexPhoto(id);
    }

    @Override
    public int updateIndexPhoto(IndexPhotos indexPhoto) {
        return indexPhotosMapper.updateIndexPhoto(indexPhoto);
    }

    @Override
    public int updateold(IndexPhotos indexPhotos) {
        return indexPhotosMapper.updateold(indexPhotos);
    }
}
