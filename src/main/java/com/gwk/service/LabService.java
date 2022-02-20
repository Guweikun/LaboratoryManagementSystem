package com.gwk.service;

import com.gwk.mapper.LabMapper;
import com.gwk.pojo.Lab;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LabService {

    @Autowired
    private LabMapper labMapper;

    public List<Lab> LabList(){
        return labMapper.selectAllLab();
    }

    public int insertLab(Lab lab){
        return labMapper.insertLab(lab);
    }

    public void deleteLab(String address){
        labMapper.deleteLab(address);
    }

    public void updateLab(Lab lab){
        labMapper.updateLab(lab);
    }
}
