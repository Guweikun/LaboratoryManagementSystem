package com.gwk.service;

import com.gwk.mapper.LabMapper;
import com.gwk.mapper.LabSoftwareMapper;
import com.gwk.pojo.Lab;
import com.gwk.pojo.LabSoftware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LabSoftwareService {

    @Autowired
    private LabSoftwareMapper labSoftwareMapper;

    public List<LabSoftware> labSoftwareList(String address){
        return labSoftwareMapper.selectAllLabSoftware(address);
    }

    public int insertLab(LabSoftware labSoftware){
        return labSoftwareMapper.insertLabSoftware(labSoftware);
    }

    public void deleteLab(LabSoftware labSoftware){
        labSoftwareMapper.deleteLabSoftware(labSoftware);
    }

    public void updateLab(LabSoftware labSoftware){
        labSoftwareMapper.updateLabSoftware(labSoftware);
    }
}
