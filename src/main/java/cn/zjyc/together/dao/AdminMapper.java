package cn.zjyc.together.dao;

import org.apache.ibatis.annotations.Param;

import cn.zjyc.together.entity.Admin;

public interface AdminMapper {
	
	Admin selectByAdmin(@Param("Admin")Admin admin);

}
