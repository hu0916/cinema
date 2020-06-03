package com.controller;

import com.entity.DisplayPlan;
import com.service.DisplayPlanService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Component
public class DisplayTask {
    private Logger log = LoggerFactory.getLogger("com.controller");
    @Autowired
    private DisplayPlanService displayPlanService;

    //每10分钟执行一次 查询是否有超过end time的电影
    @Scheduled(cron = "0 */10 * * * ?")
    public void task() {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(currentTime);
        List<DisplayPlan> displayPlanList = displayPlanService.findPlanByDate(dateString);
        for (DisplayPlan displayPlan : displayPlanList) {
            if (timestamp.compareTo(displayPlan.getEnd_time()) > 0) {
                displayPlanService.updatePlanStatus(displayPlan.getPlan_id(),2);
                System.out.println("displayPlan.getPlan_id()+\"--电影名--\"+displayPlan.getMovie_name()+\"--状态变更--2已放映\"");
                log.info(displayPlan.getPlan_id()+"--电影名--"+displayPlan.getMovie_name()+"--状态变更--2已放映");
            }
        }
    }


}
