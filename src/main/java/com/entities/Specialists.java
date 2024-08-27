package com.entities;

public class Specialists {
	
	private int id;
	
	private String specialistName;

	public Specialists() {
	
	}

	public Specialists(int id, String specialistName) {
		this.id = id;
		this.specialistName = specialistName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	@Override
	public String toString() {
		return "Specialists [id=" + id + ", specialistName=" + specialistName + "]";
	}
	
}
