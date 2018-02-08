package org.jz.web.services;

import java.util.List;

import org.jz.web.dao.SysfunctionDao;
import org.jz.web.domain.SysFunction;
import org.jz.web.domain.TellerFunc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SysfunctionService {

  @Autowired
  private SysfunctionDao sysfunctionDao;

  @Transactional
  public void addSysfunction(SysFunction function, TellerFunc tf) {
    sysfunctionDao.addSysfunction(function);
    sysfunctionDao.addTellerFunc(tf);
  }

  public List<SysFunction> findFunctionByTellerId(String id) {
    return sysfunctionDao.findFunctionByTellerId(id);
  }
}
