package com.gwk.pojo;

public class Lab {
    private String lab_name;

    private String address;

    private String model;

    private String manager_num;

    private int quantity;

    public Lab() {
    }

    public Lab(String lab_name, String address, String model, String manager_num, int quantity) {
        this.lab_name = lab_name;
        this.address = address;
        this.model = model;
        this.manager_num = manager_num;
        this.quantity = quantity;
    }

    public String getLab_name() {
        return lab_name;
    }

    public void setLab_name(String lab_name) {
        this.lab_name = lab_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getManager_num() {
        return manager_num;
    }

    public void setManager_num(String manager_num) {
        this.manager_num = manager_num;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Lab{" +
                "lab_name='" + lab_name + '\'' +
                ", address='" + address + '\'' +
                ", model='" + model + '\'' +
                ", manager_num='" + manager_num + '\'' +
                ", quantity=" + quantity +
                '}';
    }
}
