package com.alinautumn.web_lab2;

public class Shot {
    private double x;
    private double y;
    private double r;
    private String time;
    private long scriptTime;
    private boolean status;

    public Shot(double x, double y, double r, String time, long scriptTime, boolean status){
        this.x = x;
        this.y = y;
        this.r = r;
        this.time = time;
        this.scriptTime = scriptTime;
        this.status = status;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public boolean getStatus() {
        return status;
    }

    public String getTime() {
        return time;
    }

    public long getScriptTime() {
        return scriptTime;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        this.r = r;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setScriptTime(long scriptTime) {
        this.scriptTime = scriptTime;
    }
}
