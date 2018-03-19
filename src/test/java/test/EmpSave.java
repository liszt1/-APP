package test;

import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import cn.zjyc.together.dao.AdminMapper;
import cn.zjyc.together.dao.DepartmentMapper;
import cn.zjyc.together.dao.EmployeeMapper;
import cn.zjyc.together.entity.Admin;
import cn.zjyc.together.entity.Department;
import cn.zjyc.together.entity.Employee;
import cn.zjyc.together.service.DepartmentService;
import cn.zjyc.together.service.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
//模拟请求注解
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})
public class EmpSave {
	
	WebApplicationContext context;
	//MockMvc 模拟虚假请求
	MockMvc mockMvc;

	@Autowired
	EmployeeMapper employeemapper;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	DepartmentService departmentService;
	@Autowired
	DepartmentMapper dpartmentMapper;
	@Autowired
	AdminMapper AdminMapper;
	
	/*
	 * 加入测试数据
	 */
	@Test
	public void save() {
		for(int i = 0; i<100;i++) {
		Random ran = new Random();
		char[] A_z = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

        int sub = ran.nextInt(A_z.length);
        
		Integer a = (ran.nextInt(10)*100);
				
		Employee employee = new Employee();
		employee.setdId(ran.nextInt(4)+1);
		employee.setEmail(a.toString());
		employee.setEmpName(""+A_z[sub]);
		employee.setGender("女");
		employeemapper.insert(employee);
		}
		
		System.out.println("循环结束");
	}
	
	
	
	
	@Test
	public void controller() {
		List<Employee> emps = employeeService.getAll();
	for(Employee emp : emps) {
		System.out.println("测试1："+emp);
		break;
	}
	
		List<Department> depts = dpartmentMapper.select();
	for(Department depte : depts) {
		System.out.println("测试2："+depte);
		break;
	}
	
	
	}
	
	@Test
	public void selectdept() {
		
		System.out.println(dpartmentMapper.selecta());
		List<Department> list1 = dpartmentMapper.select();
		for(Department depte2 : list1) {
			System.out.println(depte2);
		}
//		List<Department> dept = departmentService.getDepts();
//		for(Department depte2 : dept) {
//			System.out.println(depte2);
//		}
	}
	@Test
	public void selectAdmin() {
//		Admin admin = new Admin();
//		admin.setAdmin_name("root");
//		admin.setAdmin_pwd("root");
//		System.out.println(AdminMapper.selectByAdmin(admin));
		
		Employee employee = new Employee();
		employee.setEmpName("hellp");
		employee.setEmail("99");
		employee.setGender("女");
		employee.setdId(2);
		employeemapper.insert(employee);
	}
	
	

		
	/*
	 * 测试模拟请求
	 */
//	@Before
//	public void initMockMvc() {
//		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
//	}
	@Test
	public void testPageHelp() throws Exception {
		//模拟请求，并拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		MockHttpServletRequest request = result.getRequest();
		PageInfo attribute = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码："+attribute.getPageNum());
		System.out.println("总页码："+attribute.getPages());
		System.out.println("总记录数："+attribute.getTotal());
		
		int[] nums = attribute.getNavigatepageNums();
		for(int i : nums) {
		System.out.println("连续显示页码：  "+attribute.getPages());
		}
		List<Employee> list = attribute.getList();
		for(Employee i : list)
		{
			System.out.println("员工id：" + i.getEmp_id());
		}
	}
	
	
}
