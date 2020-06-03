package com.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import com.entity.DisplayPlan;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface DisplayPlanMapper {
    int insert(@Param("displayPlan") DisplayPlan displayPlan);

    int insertSelective(@Param("displayPlan") DisplayPlan displayPlan);

    int insertList(@Param("displayPlans") List<DisplayPlan> displayPlans);

    int updateByPrimaryKeySelective(@Param("displayPlan") DisplayPlan displayPlan);

    @Select("select * from display_plan")
    List<DisplayPlan> findAllPlans();

    @Update("update display_plan set seat=#{seats} where plan_id=#{plan_id}  ")
    int updateSeats(@Param("seats") String seats,@Param("plan_id")int plan_id);

    @Select("select count(1) from display_plan")
    int countDisplayPlan();

    List<DisplayPlan> findAllPlan(@Param("start") int start,@Param("finish") int finish);

    @Select("select * from display_plan where play_time=#{date} and plan_status='1'")
    List<DisplayPlan> findPlanByDate(@Param("date")String date);

    @Update("update display_plan set plan_status=#{plan_status}  where plan_id=#{plan_id} ")
    int updatePlanStatus(@Param("plan_id")int plan_id,@Param("plan_status")int plan_status);

    @Select("select * from display_plan where plan_id=#{plan_id} ")
    DisplayPlan findPlanById(@Param("plan_id")int plan_id);

    @Select("select * from display_plan where movie_id=#{movie_id} and plan_status='1' and #{date}<=play_time ")
    List<DisplayPlan> findPlanByMovie_id(@Param("movie_id") int movie_id,@Param("date") String date);

    @Select("select seat from display_plan where plan_id=#{plan_id} ")
    String getSeats(@Param("plan_id") int plan_id);
}
