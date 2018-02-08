package org.jz.web.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "sysfunction")
public class SysFunction {
  @Id
  @Column(name = "id")
  public String id; // 功能号
  public String name; // 功能标签
  public String parentId; // 父菜单功能号,“0“为根菜单项
  public String description; // 功能描述
  public String relation; // 关联首页面或程序
  public String available; // 有效性
  public String type; // 类型
  @Transient
  public String funSpot; // 本字段在tellfun中,菜单位置(1-末端 0-非末端)
  public String layer; // 菜单层次
  public String filePath; // 独有文件存放路径
  public String expand; // 是否已展开
  public String display; // 是否已显示
  public String memo; // 备注

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getParentId() {
    return parentId;
  }

  public void setParentId(String parentId) {
    this.parentId = parentId;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getRelation() {
    return relation;
  }

  public void setRelation(String relation) {
    this.relation = relation;
  }

  public String getAvailable() {
    return available;
  }

  public void setAvailable(String available) {
    this.available = available;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getFunSpot() {
    return funSpot;
  }

  public void setFunSpot(String funSpot) {
    this.funSpot = funSpot;
  }

  public String getLayer() {
    return layer;
  }

  public void setLayer(String layer) {
    this.layer = layer;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public String getExpand() {
    return expand;
  }

  public void setExpand(String expand) {
    this.expand = expand;
  }

  public String getDisplay() {
    return display;
  }

  public void setDisplay(String display) {
    this.display = display;
  }

  public String getMemo() {
    return memo;
  }

  public void setMemo(String memo) {
    this.memo = memo;
  }

}
