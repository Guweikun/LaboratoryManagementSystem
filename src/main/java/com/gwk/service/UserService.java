package com.gwk.service;

import com.gwk.mapper.LabMapper;
import com.gwk.mapper.UserMapper;
import com.gwk.pojo.Lab;
import com.gwk.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public List<User> UserList(){
        return userMapper.selectAllUser();
    }

    public int insertUser(User user){
        return userMapper.insertUser(user);
    }

    public void deleteUser(String account){
        userMapper.deleteUser(account);
    }

    public void updateUser(User user){
        userMapper.updateUser(user);
    }

    public User selectUser(User user){
        return userMapper.selectUser(user);
    }
}
