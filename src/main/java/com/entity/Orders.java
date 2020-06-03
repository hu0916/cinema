package com.entity;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class Orders {
    private Integer id;
    private String order_id;//UUID
    private String order_product;//订单物品 一大串
    private String order_number;//订单数量 总共有几个物品
    private Double order_price;//订单总价
    private Integer order_status;//订单状态 0待支付 1已支付 2等待处理 3取消 4关闭 5完成 6用户删除
    private String movie_name;//电影名
    private Timestamp create_time;//创建时间
    private String hall_type;//2D 3D厅
    private Integer user_id;
    private String create_date;//创建日期
    private Integer plan_id;
    private Timestamp start_time;
    private Timestamp end_time;
}
