package org.jz.web.domain;

import java.io.Serializable;

public class TellerMenu implements Serializable {

    private static final long serialVersionUID = 6161718602257493886L;

    public String funcId; // 功能号
    public String opLimit;
    public String funcPosition;
    public String name; // 功能标签
    public String parentId; // 父菜单功能号,“0“为根菜单项
    public String relation; // 关联首页面或程序
    public String available; // 有效性
    public String type; // 类型
    public String layer; // 菜单层次
    public String filePath; // 独有文件存放路径
    public String display; // 是否已显示

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

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
