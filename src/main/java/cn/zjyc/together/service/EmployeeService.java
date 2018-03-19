package cn.zjyc.together.service;


import java.util.List;

import org.springframework.stereotype.Service;

import cn.zjyc.together.entity.Employee;



@Service
public interface EmployeeService {
	/*
	 * 得到所有员工数据
	 */
	List<Employee> getAll();

	void saveEmp(Employee emp);
}
