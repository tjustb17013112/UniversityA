package cn.itcast.dao.impl;

import cn.itcast.dao.UserDao;
import cn.itcast.domain.User;
import cn.itcast.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.*;

/**
 * @author shkstart
 * @create 2020/5/11-15:00
 */
public class UserDaoImpl implements UserDao {
    char passwordss;

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());//

    @Override
    public List<User> findAll() {
        //使用JDBC操作数据库...
        //1.定义sql
        String sql = "select * from user";
        List<User> users = template.query(sql, new BeanPropertyRowMapper<>(User.class));

        return users;
    }

    @Override//通过用户名和密码去数据库查找用户是否存在，如果存在返回用户对象
    public User findUserByUsernameAndPassword(String username, String password) {
        try {
            String sql = "select * from user where username = ? and password = ?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 生成密码
     * @param length
     * @return
     */
    public static String generatePassword (int length) {
        // 最终生成的密码
        String password = "";
        Random random = new Random();
        for (int i = 0; i < length; i ++) {
            // 随机生成0或1，用来确定是当前使用数字还是字母 (0则输出数字，1则输出字母)
            int charOrNum = random.nextInt(2);
            if (charOrNum == 1) {
                // 随机生成0或1，用来判断是大写字母还是小写字母 (0则输出小写字母，1则输出大写字母)
                int temp = random.nextInt(2) == 1 ? 65 : 97;
                password += (char) (random.nextInt(26) + temp);
            } else {
                // 生成随机数字
                password += random.nextInt(10);
            }
        }
        return password;
    }


    @Override
    public void add(User user) {

        //1.定义sql
        String sql = "insert into user values(null,?,?,?,?,?)";
        //2.执行sql
        Random random = new Random();
        passwordss += (char) (random.nextInt(26));
        template.update(sql, user.getName(), user.getDoctoraddress(), user.getDept(),user.getName(),generatePassword(5));
    }

    @Override
    public void delete(int id) {
        //1.定义sql
        String sql = "delete from user where id = ? ";
        //2.执行sql
        template.update(sql,id);
    }

    @Override
    public User findById(int i) {
        //1.定义sql
        String sql = "select * from user where id = ?";
        //2.执行sql
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), i);
        return user;
    }

    @Override
    public void update(User user) {
        //定义sql
        String sql = "update user set name = ? ,doctoraddress = ? ,dept=? where id = ?";
        //执行sql
        template.update(sql, user.getName(), user.getDoctoraddress(), user.getDept(),user.getId());
    }


}
