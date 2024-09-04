package vcare.mvc.beans;

import java.sql.Date;

public class BookingBean {
	private int booking_id;
	private int service_person_id;
	private Date booking_date;
	private String booking_description;
	private String contact_number;
	private String service_address;
	private String booking_status;
	private String preferred_time_slot;
	private int user_id;

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public int getService_person_id() {
		return service_person_id;
	}

	public void setService_person_id(int service_person_id) {
		this.service_person_id = service_person_id;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}

	public String getBooking_description() {
		return booking_description;
	}

	public void setBooking_description(String booking_description) {
		this.booking_description = booking_description;
	}

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	public String getService_address() {
		return service_address;
	}

	public void setService_address(String service_address) {
		this.service_address = service_address;
	}

	public String getBooking_status() {
		return booking_status;
	}

	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}

	public String getPreferred_time_slot() {
		return preferred_time_slot;
	}

	public void setPreferred_time_slot(String preferred_time_slot) {
		this.preferred_time_slot = preferred_time_slot;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}
