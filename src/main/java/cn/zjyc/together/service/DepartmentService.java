package cn.zjyc.together.service;


import java.util.List;

import org.springframework.stereotype.Service;

import cn.zjyc.together.entity.Department;


@Service
public interface DepartmentService {
	/*
	 * 返回所有部门信息
	 */
	
	List<Department> getDepts();
	

}
