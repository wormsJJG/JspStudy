package VO;

public class GetMemberVO {
	private String classDate;
	private String className;
	private String teacherName;
	private String memberCode;
	private String memberName;
	private String classArea;
	private String price;

	public String getClassDate() {
		return classDate;
	}

	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getClassArea() {
		return classArea;
	}

	public void setClassArea(String classArea) {
		this.classArea = classArea;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "GetMemberVO [classDate=" + classDate + ", className=" + className + ", teacherName=" + teacherName
				+ ", memberCode=" + memberCode + ", memberName=" + memberName + ", classArea=" + classArea + ", price="
				+ price + "]";
	}

}
