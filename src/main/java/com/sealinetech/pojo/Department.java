package com.sealinetech.pojo;

public class Department extends SealinePojo {
    private String departmentName;

    private String note;

    public Department() {
    }

    public Department(String departmentName, String note) {
        this.departmentName = departmentName;
        this.note = note;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}