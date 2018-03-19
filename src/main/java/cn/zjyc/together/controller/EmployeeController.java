package cn.zjyc.together.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.zjyc.together.entity.Employee;
import cn.zjyc.together.service.EmployeeService;
import cn.zjyc.together.util.Msg;


/**
 * 处理员工CRUD请求
 * 
 * @author lfy
 * 
 */
@Controller
public class EmployeeController {
	

	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(Employee emp) {
		
		System.out.println(emp);
		//employeeService.saveEmp(emp);
		return	Msg.success();
	
	}
	
	
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getemps(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		//pageinfo包装查询结果emps
		PageInfo page = new PageInfo(emps,5);
		
		return Msg.success().add("pageInfo", page);
	}
	
	
	//@RequestMapping("/emps")
	public String getEmp(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model) {
		/*
		 * PageHelper
		 * 传入页面和要显示的页数
		 */
		
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		//pageinfo包装查询结果emps
		PageInfo page = new PageInfo(emps,5);
		
		model.addAttribute("pageInfo", page);
		
		return "list";
	}

}

