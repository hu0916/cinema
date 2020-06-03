package com.entity;

import lombok.Data;

import java.sql.Timestamp;
@Data
public class Movie {
    private Integer movie_id;
    private String movie_name;//名称
    private String movie_introduce;//简介
    private Timestamp movie_time;//上映时间
    private Integer movie_type;//体裁 1喜剧 2文艺片 3动作片 4动画片
    private Double movie_price;//价格
    private Integer movie_stars;//电影评分
    private String movie_src;//电影海报
    private Integer movie_showtime;//放映时间
    private Integer movie_status;//电影状态1上映中 2待上映 3下映（库中）
}
