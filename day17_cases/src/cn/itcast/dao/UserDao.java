package cn.itcast.dao;

import cn.itcast.domain.User;

import java.util.List;
import java.util.Map;

/**
 * 用户操作的DAO
 * @author shkstart
 * @create 2020/5/11-14:58
 */
public interface UserDao {
    public List<User> findAll();
    User findUserByUsernameAndPassword(String username, String password);
    void add(User user);
    void delete(int id);

    User findById(int i);

    void update(User user);
}
