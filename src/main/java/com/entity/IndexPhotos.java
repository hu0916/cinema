package com.entity;

import lombok.Data;

@Data
public class IndexPhotos {
    private Integer id;
    private String src;//图片地址
    private Integer year;//年份
    private Integer type;//1热映中 即将上映 老片推荐 特别推荐
    private Integer movie_id;//对应电影id
    private Integer stars;//星级
    private String name;
    private String story_line;
    private String release_time;
    private String genre;

}
