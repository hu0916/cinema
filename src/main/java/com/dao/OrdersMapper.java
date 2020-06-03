package com.dao;

import org.apache.ibatis.annotations.*;

import java.util.List;
import com.entity.Orders;

@Mapper
public interface OrdersMapper {
    int insert(@Param("orders") Orders orders);

    int insertSelective(@Param("orders") Orders orders);

    int insertList(@Param("orderss") List<Orders> orderss);

    int updateByPrimaryKeySelective(@Param("orders") Orders orders);

    @Select("select o.*,d.start_time,d.end_time from orders o left join display_plan d on o.plan_id=d.plan_id where o.user_id=#{user_id} ")
    List<Orders> findOrderByUser_id(@Param("user_id") int userid);

    @Select("select count(1) from orders")
    int countOrders();

    @Select("select order_price from orders where create_date=#{today} ")
    List<Double> countTotal(@Param("today") String date);

    @Delete("update orders set order_status=6 where id=#{id} ")
    int userDel(@Param("id") int id);

    @Select("select o.*,d.start_time,d.end_time from orders o left join display_plan d on o.plan_id=d.plan_id limit #{start} ,#{finish} ")
    List<Orders> findAllOrders(@Param("start") int start,@Param("finish") int finish);

    @Select("select o.*,d.start_time,d.end_time from orders o left join display_plan d on o.plan_id=d.plan_id where o.order_id=#{order_id} ")
    Orders findOrderById(@Param("order_id") String order_id);

    @Update("update orders set order_status=#{type}  where id=#{id} ")
    int updateOrder(@Param("id") int id, @Param("type") int type);

    @Delete("delete from orders where id=#{id} ")
    int adminDelorder(@Param("id") int id);
}
