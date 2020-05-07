package com.ischoolbar.programmer.entity.admin;

import org.springframework.stereotype.Component;

/**
 * 楼层实体类
 * @author Administrator
 *
 */
@Component
public class Floor {
	private Long id;//楼层id
	private String name;//楼层名称
	private String remark;//楼层备注
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
