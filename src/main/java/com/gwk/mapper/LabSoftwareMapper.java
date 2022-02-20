package com.gwk.mapper;

import com.gwk.pojo.Lab;
import com.gwk.pojo.LabSoftware;

import java.util.List;

public interface LabSoftwareMapper {
    List<LabSoftware> selectAllLabSoftware(String address);

    int insertLabSoftware(LabSoftware labSoftware);

    void deleteLabSoftware(LabSoftware labSoftware);

    void updateLabSoftware(LabSoftware labSoftware);
}
