package org.jz.web.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@DynamicUpdate
@Table(name = "teller")
public class Teller implements Serializable {
  private static final long serialVersionUID = -7042317855805744048L;
  @Id
  @Column(length=4)
  private String id;
  private String unitNr;
  private char status;
  private String startDate;
  private String password;
  private String unlockPassword;
  private String name;
  private String dept;
  private char type;
  private String station;
  private double cashLimit;
  private double transLmit;
  private String superior;
  private String creator;
  private String createDate;
  private String sessionId;
  private String description;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getUnitNr() {
    return unitNr;
  }

  public void setUnitNr(String unitNr) {
    this.unitNr = unitNr;
  }

  public char getStatus() {
    return status;
  }

  public void setStatus(char status) {
    this.status = status;
  }

  public String getStartDate() {
    return startDate;
  }

  public void setStartDate(String startDate) {
    this.startDate = startDate;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getUnlockPassword() {
    return unlockPassword;
  }

  public void setUnlockPassword(String unlockPassword) {
    this.unlockPassword = unlockPassword;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDept() {
    return dept;
  }

  public void setDept(String dept) {
    this.dept = dept;
  }

  public char getType() {
    return type;
  }

  public void setType(char type) {
    this.type = type;
  }

  public String getStation() {
    return station;
  }

  public void setStation(String station) {
    this.station = station;
  }

  public double getCashLimit() {
    return cashLimit;
  }

  public void setCashLimit(double cashLimit) {
    this.cashLimit = cashLimit;
  }

  public double getTransLmit() {
    return transLmit;
  }

  public void setTransLmit(double transLmit) {
    this.transLmit = transLmit;
  }

  public String getSuperior() {
    return superior;
  }

  public void setSuperior(String superior) {
    this.superior = superior;
  }

  public String getCreator() {
    return creator;
  }

  public void setCreator(String creator) {
    this.creator = creator;
  }

  public String getCreateDate() {
    return createDate;
  }

  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }

  public String getSessionId() {
    return sessionId;
  }

  public void setSessionId(String sessionId) {
    this.sessionId = sessionId;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }
  
  public String toString() {
    return "id = " + id + ", " + super.toString();
    
  }
}
