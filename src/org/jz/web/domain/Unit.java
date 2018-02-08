package org.jz.web.domain;

import java.io.Serializable;

public class Unit implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 8552841064157927751L;
    private String unitNr;
    private String name;
    private char unitClass;
    private String code;
    private String parent;
    private String tellerPrefix;
    private char type;
    private String description;

    public String getUnitNr() {
        return unitNr;
    }

    public void setUnitNr(String unitNr) {
        this.unitNr = unitNr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public char getUnitClass() {
        return unitClass;
    }

    public void setUnitClass(char unitClass) {
        this.unitClass = unitClass;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public String getTellerPrefix() {
        return tellerPrefix;
    }

    public void setTellerPrefix(String tellerPrefix) {
        this.tellerPrefix = tellerPrefix;
    }

    public char getType() {
        return type;
    }

    public void setType(char type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
