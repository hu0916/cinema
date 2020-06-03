package com.service;
import	java.sql.Timestamp;

import com.dao.DisplayPlanMapper;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.entity.Orders;
import com.dao.OrdersMapper;
import com.service.OrdersService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService{

    @Resource
    private OrdersMapper ordersMapper;

    @Resource
    private DisplayPlanMapper displayPlanMapper;

    @Override
    public int insert(Orders orders){
        return ordersMapper.insert(orders);
    }

    @Override
    public int insertSelective(Orders orders){
        return ordersMapper.insertSelective(orders);
    }

    @Override
    public int insertList(List<Orders> orderss){
        return ordersMapper.insertList(orderss);
    }

    @Override
    public int updateByPrimaryKeySelective(Orders orders){
        return ordersMapper.updateByPrimaryKeySelective(orders);
    }

    public int orderAction(Orders orders, String seats, int display_id) throws Exception {
        int row = insert(orders);
        if (row > 0) {
            int row2=displayPlanMapper.updateSeats(seats, display_id);
            if (row2>0) {
                return row2;
            } else throw new Error("插入异常！抛出");
        }else {
            throw new Error ("插入异常！抛出");
        }
    }

    @Override
    public List<Orders> findOrderByUser_id(int userid) {
        return ordersMapper.findOrderByUser_id(userid);
    }

    @Override
    public int countOrders() {
        return ordersMapper.countOrders();
    }

    @Override
    public Double countTotal() {
        String today = new Timestamp(System.currentTimeMillis()).toString().substring(0, 10);
        List<Double> prices = ordersMapper.countTotal(today);
        double sum=0;
        for (Double price : prices) {
            sum += price;
        }
        return sum;
    }

    @Override
    public int userDel(int id) {
        return ordersMapper.userDel(id);
    }

    @Override
    public List<Orders> findAllOrders(int start, int finish) {
        return ordersMapper.findAllOrders(start,finish);
    }

    @Override
    public Orders findOrderById(String order_id) {
        return ordersMapper.findOrderById(order_id);
    }

    @Override
    public int updateOrder(int id, int type) {
        return ordersMapper.updateOrder(id,type);
    }

    @Override
    public int adminDelorder(int id) {
        return ordersMapper.adminDelorder(id);
    }
}
