package cn.itcast.web.servlet;

import cn.itcast.dao.PatientDao;
import cn.itcast.dao.impl.PatientDaoImpl;
import cn.itcast.domain.Patient;
import cn.itcast.service.PatientService;
import cn.itcast.service.impl.PatientServiceImpl;
import cn.itcast.domain.ResultInfo;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/registServlet")
public class RegistUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1.获取数据
        Map<String, String[]> map = request.getParameterMap();

        //2.封装对象
        Patient patient = new Patient();
        try {
            BeanUtils.populate(patient,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //3.调用service完成注册
        PatientService service = new PatientServiceImpl();
        boolean flag = service.registpatient(patient);
        ResultInfo info = new ResultInfo();
        //4.响应结果
        if(flag){
//            注册成功
            info.setFlag(true);
//            跳转页面
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else{
            //注册失败
            info.setFlag(false);
            info.setErrorMsg("注册失败!");
//            request.getRequestDispatcher("/registPatient.jsp").forward(request,response);
        }
//
//        //将info对象序列化为json
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString(info);

        //将json数据写回客户端
        //设置content-type
//        response.setContentType("application/json;charset=utf-8");
//        response.getWriter().write(json);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
