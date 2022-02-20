package com.gwk.pojo;

public class LabSoftware {

    private String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    private String software_name;

    private String category;

    private String edition;

    private float space;

    public String getSoftware_name() {
        return software_name;
    }

    public void setSoftware_name(String software_name) {
        this.software_name = software_name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public float getSpace() {
        return space;
    }

    public void setSpace(float space) {
        this.space = space;
    }

    public LabSoftware() {
    }

    public LabSoftware(String address, String software_name, String category, String edition, float space) {
        this.address = address;
        this.software_name = software_name;
        this.category = category;
        this.edition = edition;
        this.space = space;
    }

    @Override
    public String toString() {
        return "LabSoftware{" +
                "address='" + address + '\'' +
                ", software_name='" + software_name + '\'' +
                ", category='" + category + '\'' +
                ", edition='" + edition + '\'' +
                ", space=" + space +
                '}';
    }
}
