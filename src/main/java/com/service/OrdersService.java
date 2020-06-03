package com.service;

import java.util.List;
import com.entity.Orders;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;


public interface OrdersService{

    int insert(Orders orders);

    int insertSelective(Orders orders);

    int insertList(List<Orders> orderss);

    int updateByPrimaryKeySelective(Orders orders);

    public int orderAction(Orders orders, String seats, int display_id) throws Exception;

    List<Orders> findOrderByUser_id(int userid);

    int countOrders();

    Double countTotal();

    int userDel(int id);

    List<Orders> findAllOrders(int start,int finish);

    Orders findOrderById( String order_id);

    int updateOrder(int id,int type);

    int adminDelorder(int id);


}
