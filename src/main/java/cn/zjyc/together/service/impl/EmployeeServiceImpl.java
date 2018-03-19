
package cn.zjyc.together.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zjyc.together.dao.EmployeeMapper;
import cn.zjyc.together.entity.Employee;
import cn.zjyc.together.service.EmployeeService;


/**
 * 
 */
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	EmployeeMapper employeeMapper;
	@Override
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		List<Employee> list = employeeMapper.selectAll();
		return list;
	}
	public void saveEmp(Employee emp) {
		employeeMapper.insert(emp);
	}
}

