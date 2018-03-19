package cn.zjyc.together.entity;


public class Employee {
    private Integer emp_id;

    private String emp_name;

    private String gender;

    private String email;

    private Integer d_id;
    
    private Department department;
    
    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Employee [emp_id=" + emp_id + ", emp_name=" + emp_name
				+ ", gender=" + gender + ", email=" + email + ", d_id=" + d_id
				+  ", department="+ department +"]";
	}

	public Employee() {
		super();
	}




	public Employee(Integer emp_id, String emp_name, String gender, String email, Integer d_id, Department department) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.gender = gender;
		this.email = email;
		this.d_id = d_id;
		this.department = department;
	}

	public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmpId(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmpName(String emp_name) {
        this.emp_name = emp_name == null ? null : emp_name.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getd_id() {
        return d_id;
    }

    public void setdId(Integer d_id) {
        this.d_id = d_id;
    }
}