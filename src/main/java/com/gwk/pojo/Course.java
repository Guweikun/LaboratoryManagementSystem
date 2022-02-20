package com.gwk.pojo;

public class Course {

    private String course_name;

    private String college;

    private String teacher;

    private int hours;

    private int people_num;

    private String classroom;

    private int college_num;

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getPeople_num() {
        return people_num;
    }

    public void setPeople_num(int people_num) {
        this.people_num = people_num;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public Course() {
    }

    public Course(String course_name, String college, String teacher, int hours, int people_num, String classroom, int college_num) {
        this.course_name = course_name;
        this.college = college;
        this.teacher = teacher;
        this.hours = hours;
        this.people_num = people_num;
        this.classroom = classroom;
        this.college_num = college_num;
    }

    @Override
    public String toString() {
        return "course{" +
                "course_name='" + course_name + '\'' +
                ", college='" + college + '\'' +
                ", teacher='" + teacher + '\'' +
                ", hours=" + hours +
                ", people_num=" + people_num +
                ", classroom='" + classroom + '\'' +
                '}';
    }
}
