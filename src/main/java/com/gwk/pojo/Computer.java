package com.gwk.pojo;

public class Computer {

    private String graphics;

    private String cpu;

    private int mem;

    private int diskspace;

    private String model;

    public String getGraphics() {
        return graphics;
    }

    public void setGraphics(String graphics) {
        this.graphics = graphics;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public int getMem() {
        return mem;
    }

    public void setMem(int mem) {
        this.mem = mem;
    }

    public int getDiskspace() {
        return diskspace;
    }

    public void setDiskspace(int diskspace) {
        this.diskspace = diskspace;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Computer() {
    }

    public Computer(String graphics, String cpu, int mem, int diskspace, String model) {
        this.graphics = graphics;
        this.cpu = cpu;
        this.mem = mem;
        this.diskspace = diskspace;
        this.model = model;
    }

    @Override
    public String toString() {
        return "Computer{" +
                "graphics='" + graphics + '\'' +
                ", cpu='" + cpu + '\'' +
                ", mem=" + mem +
                ", diskspace=" + diskspace +
                ", model='" + model + '\'' +
                '}';
    }
}
