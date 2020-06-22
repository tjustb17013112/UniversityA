package cn.itcast.service;

import cn.itcast.domain.Patient;
import cn.itcast.domain.User;

import java.util.List;

/**
 * @author shkstart
 * @create 2020/5/11-14:55
 * 用户管理的业务接口
 */
public interface UserService {
    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> findAll();
    public User login(User user);


    /**
     *
     * @param user
     */
    public void addUser(User user);

    /**
     * 根据id删除
     * @param id
     */
    public void deleteUser(String id);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public User findUserById(String id);

    public void updateUser(User user);

    public void delSelectedUser(String[] ids);
}
