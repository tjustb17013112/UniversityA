package cn.itcast.dao.impl;

import cn.itcast.dao.PatientDao;
import cn.itcast.domain.Patient;
import cn.itcast.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * @author shkstart
 * @create 2020/6/15-0:29
 */
public class PatientDaoImpl implements PatientDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public boolean save(Patient patient) {
        //1.定义sql
        String sql = "insert into patient values(?,?,?,?,?)";
        //2.执行sql

        template.update(sql,
                patient.getName(),
                patient.getPassword(),
                patient.getSex(),
                patient.getBirthday(),
                patient.getAddress()
        );
        return true;
    }
}
