package org.jz.web.services;

import java.util.List;

import org.jz.web.dao.TellerDao;
import org.jz.web.domain.Teller;
import org.jz.web.domain.TellerMenu;
import org.jz.web.domain.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TellerService {

    @Autowired
    private TellerDao tellerDao;

    public boolean hasMatchTeller(String id, String password) {
        int matchCount = tellerDao.getmatchCount(id, password);
        return matchCount > 0;
    }

    public Teller findTellerById(String id) {
        if (id.equals("")) {
            id = "aa";
        }

        return tellerDao.findTellerById(id);
    }

    public Unit findUnitByTellerId(String id) {
        return tellerDao.findUnitByTellerId(id);
    }

    public List<TellerMenu> findFunctionById(String tellerId) {
        return tellerDao.findFunctionById(tellerId);
    }
}