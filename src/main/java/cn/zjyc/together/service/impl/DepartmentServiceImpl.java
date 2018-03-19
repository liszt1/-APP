package cn.zjyc.together.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zjyc.together.dao.DepartmentMapper;
import cn.zjyc.together.entity.Department;
import cn.zjyc.together.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl  implements DepartmentService{

	@Autowired
	DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> getDepts() {
		
		List<Department> list = departmentMapper.select();
		
		return list;
	}

}
