package cn.zjyc.together.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zjyc.together.service.DepartmentService;
import cn.zjyc.together.util.Msg;

/**
 * 处理和部门有关的请求
 * @author lfy
 *
 */
@Controller
public class DepartmentController {
	@Autowired
	DepartmentService departmentservice;

	@RequestMapping("/depts")
	@ResponseBody
	public Msg getdepts() {
		return Msg.success().add("dept", departmentservice.getDepts());
	}
}
