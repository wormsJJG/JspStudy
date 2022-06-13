package VO;

public class getTeacherInfoVO {
	private String classCode;
	private String teacherName;
	private String className;
	private String price;
	private int intPrice;
	
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getIntPrice() {
		return intPrice;
	}
	public void setIntPrice(int intPrice) {
		this.intPrice = intPrice;
	}
	@Override
	public String toString() {
		return "getTeacherInfoVO [classCode=" + classCode + ", teacherName=" + teacherName + ", className=" + className
				+ ", intPrice=" + intPrice + "]";
	}
	
	
}
