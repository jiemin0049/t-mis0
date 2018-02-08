package org.jz.web.services;

import java.util.List;

import org.jz.web.dao.UnitDao;
import org.jz.web.domain.Unit;
import org.jz.web.pojo.AddUnitCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UnitService {
  @Autowired
  private UnitDao unitDao;

  public List<Unit> getUnit(String unitNr, String unitName) {
    return unitDao.getUnit(unitNr, unitName);
  }

  public Unit getUnit(String unitNr) {
    return unitDao.getUnit(unitNr);
  }

  public boolean hasMatchClazz(String clazz) {
    int matchCount = unitDao.hasMatchClazz(clazz);
    return matchCount > 0;
  }

  public boolean add(List<AddUnitCommand> units) {
    return unitDao.add(units);
  }
  
  public boolean update(AddUnitCommand unit) {
    return unitDao.update(unit);
  }
  
  public boolean hasTellerOrSubUnit(String unitNr) {
    int[] union =  unitDao.hasTellerOrSubUnit(unitNr);
    return (union[0] != 0 || union[1] != 0);
  }
  
  public boolean remove(String unitNr) {
    return unitDao.remove(unitNr);
  }
}
