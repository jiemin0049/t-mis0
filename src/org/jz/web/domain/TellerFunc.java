package org.jz.web.domain;

public class TellerFunc {
  public String tellerId;
  public String funcId;
  public String opLimit;
  public String funcPosition;
  public String funcDescription;
  public String memo;

  public String getTellerId() {
    return tellerId;
  }

  public void setTellerId(String tellerId) {
    this.tellerId = tellerId;
  }

  public String getFuncId() {
    return funcId;
  }

  public void setFuncId(String funcId) {
    this.funcId = funcId;
  }

  public String getOpLimit() {
    return opLimit;
  }

  public void setOpLimit(String opLimit) {
    this.opLimit = opLimit;
  }

  public String getFuncPosition() {
    return funcPosition;
  }

  public void setFuncPosition(String funcPosition) {
    this.funcPosition = funcPosition;
  }

  public String getFuncDescription() {
    return funcDescription;
  }

  public void setFuncDescription(String funcDescription) {
    this.funcDescription = funcDescription;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }
}
