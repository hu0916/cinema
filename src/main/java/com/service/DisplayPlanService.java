package com.service;

import java.util.Date;
import java.util.List;
import com.entity.DisplayPlan;
import org.apache.ibatis.annotations.Param;

public interface DisplayPlanService{

    int insert(DisplayPlan displayPlan);

    int insertSelective(DisplayPlan displayPlan);

    int insertList(List<DisplayPlan> displayPlans);

    int updateByPrimaryKeySelective(DisplayPlan displayPlan);

    List<DisplayPlan> findAllPlans();

    int updateSeats(String seats,int plan_id);

    int countDisplayPlan();

    List<DisplayPlan> findAllPlan(int start,int finish);

    List<DisplayPlan> findPlanByDate(String date);

    int updatePlanStatus(int plan_id,int plan_status);

    DisplayPlan findPlanById(int plan_id);

    List<DisplayPlan> findPlanByMovie_id(int movie_id,String date);

    String getSeats(int plan_id);
}
