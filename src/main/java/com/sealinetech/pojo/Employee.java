package com.sealinetech.pojo;

import javax.validation.constraints.Pattern;

public class Employee extends SealinePojo {
    private String name;

    @Pattern(regexp="^[a-zA-Z0-9_-]{6,16}$",message="编号非法")
    private String no;

    private String note;

    private Integer departmentId;

    private Department department;

    public Employee() {
    }

    public Employee(String name, String no, String note, Integer departmentId) {
        this.name = name;
        this.no = no;
        this.note = note;
        this.departmentId = departmentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}