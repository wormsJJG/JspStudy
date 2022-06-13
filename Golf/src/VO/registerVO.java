package VO;

public class registerVO {
	private String member_code;
	private String member_name;
	private String indate;
	private String address;
	private String grade;
	
	public String getMember_code() {
		return member_code;
	}
	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "registerVO [member_code=" + member_code + ", member_name=" + member_name + ", indate=" + indate
				+ ", address=" + address + ", grade=" + grade + "]";
	}
}
