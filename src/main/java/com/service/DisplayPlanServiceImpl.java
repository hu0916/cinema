package com.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import com.entity.DisplayPlan;
import com.dao.DisplayPlanMapper;
import com.service.DisplayPlanService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DisplayPlanServiceImpl implements DisplayPlanService{

    @Resource
    private DisplayPlanMapper displayPlanMapper;

    @Override
    public int insert(DisplayPlan displayPlan){
        return displayPlanMapper.insert(displayPlan);
    }

    @Override
    public int insertSelective(DisplayPlan displayPlan){
        return displayPlanMapper.insertSelective(displayPlan);
    }

    @Override
    public int insertList(List<DisplayPlan> displayPlans){
        return displayPlanMapper.insertList(displayPlans);
    }

    @Override
    public int updateByPrimaryKeySelective(DisplayPlan displayPlan){
        return displayPlanMapper.updateByPrimaryKeySelective(displayPlan);
    }

    @Override
    public List<DisplayPlan> findAllPlans() {
        return displayPlanMapper.findAllPlans();
    }

    @Override
    public int updateSeats(String seats, int plan_id) {
        return displayPlanMapper.updateSeats(seats,plan_id);
    }

    @Override
    public int countDisplayPlan() {
        return displayPlanMapper.countDisplayPlan();
    }

    @Override
    public List<DisplayPlan> findAllPlan(int start, int finish) {
        return displayPlanMapper.findAllPlan(start,finish);
    }

    @Override
    public List<DisplayPlan> findPlanByDate(String date) {
        return displayPlanMapper.findPlanByDate(date);
    }

    @Override
    public int updatePlanStatus(int plan_id,int plan_status) {
        return displayPlanMapper.updatePlanStatus(plan_id,plan_status);
    }

    @Override
    public DisplayPlan findPlanById(int plan_id) {
        return displayPlanMapper.findPlanById(plan_id);
    }

    @Override
    public List<DisplayPlan> findPlanByMovie_id(int movie_id,String date) {
        return displayPlanMapper.findPlanByMovie_id(movie_id,date);
    }

    @Override
    public String getSeats(int plan_id) {
        return displayPlanMapper.getSeats(plan_id);
    }
}
