package cn.itcast.service.impl;

import cn.itcast.dao.PatientDao;
import cn.itcast.dao.impl.PatientDaoImpl;
import cn.itcast.domain.Patient;
import cn.itcast.service.PatientService;

/**
 * @author shkstart
 * @create 2020/6/15-0:45
 */
public class PatientServiceImpl implements PatientService {
    private PatientDao patients=  new PatientDaoImpl();

    @Override
    public boolean registpatient(Patient patient) {
        return patients.save(patient);
    }

}
