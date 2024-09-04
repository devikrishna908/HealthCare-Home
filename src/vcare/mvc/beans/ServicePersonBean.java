package vcare.mvc.beans;

public class ServicePersonBean {
	int service_person_id;
	int service_id;
	int person_id;
	String qualification;

	public int getService_person_id() {
		return service_person_id;
	}

	public void setService_person_id(int service_person_id) {
		this.service_person_id = service_person_id;
	}

	public int getService_id() {
		return service_id;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public int getPerson_id() {
		return person_id;
	}

	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

}
