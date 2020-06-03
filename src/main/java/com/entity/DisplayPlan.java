package com.entity;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class DisplayPlan {
    private Integer plan_id;//id
    private Integer movie_id;//对应电影id
    private Timestamp start_time;//开始时间
    private Timestamp end_time;//结束时间
    private Date play_time;//反映的日期
    private String hall_place;//几号展映厅
    private String hall_type;//展映厅类型 3d 2d
    private Integer plan_status;//放映状态 1未放映 2已放映 3取消
    private Double movie_price;//电影价格
    private String movie_name;//电影名
    private String seat;//座位
}
