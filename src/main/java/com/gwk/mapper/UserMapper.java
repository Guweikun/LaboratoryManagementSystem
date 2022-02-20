package com.gwk.mapper;

import com.gwk.pojo.Lab;
import com.gwk.pojo.User;

import java.util.List;

public interface UserMapper {

    List<User> selectAllUser();

    int insertUser(User user);

    void deleteUser(String account);

    void updateUser(User user);

    User selectUser(User user);
}
