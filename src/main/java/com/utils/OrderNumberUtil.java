package com.utils;

public class OrderNumberUtil {
    private static OrderNumber idWorker = new OrderNumber(0, 0);

    public static OrderNumberUtil getInstance() {
        return new OrderNumberUtil();
    }

    public String get() {
        return String.valueOf(idWorker.nextId());
    }

}
