package org.jz.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jz.web.domain.Teller;
import org.jz.web.domain.TellerMenu;
import org.jz.web.domain.Unit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

@Repository
public class TellerDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int getmatchCount(String id, String password) {
        String sqlStr = "SELECT count(*) FROM teller "
                + " WHERE id = :id and password=:pwd";
        String sqlStr2 = "SELECT count(*) FROM teller "
                + " WHERE id =? and password=?";

        Map<String, String> bind = new HashMap<String, String>();
        bind.put("id", "userName");
        bind.put("password", password);
        SqlParameterSource args = new MapSqlParameterSource()
                .addValue("id", id).addValue("password", password);
        // It doesn't work, why ????????
        // Integer ii = jdbcTemplate.queryForObject(sqlStr2, Integer.class,
        // args);

        Integer ii = jdbcTemplate.queryForInt(sqlStr2, id, password);
        return ii.intValue();
    }

    public Teller findTellerById(final String id) {
        String sqlStr = "SELECT id, unitnr, status FROM teller WHERE id=?";
        final Teller teller = new Teller();
        jdbcTemplate.query(sqlStr, new Object[] { id },
                new RowCallbackHandler() {

                    @Override
                    public void processRow(ResultSet rs) throws SQLException {
                        teller.setId(id);
                        teller.setUnitNr(rs.getString("unitnr"));
                        teller.setStatus(rs.getString("status").charAt(0));
                    }
                });
        return teller;
    }

    public Unit findUnitByTellerId(final String id) {
        // String sqlStr =
        // "SELECT unitno, unitname, unitclass, unitcode, unitparent, unittellerprefix, unittype, unitdescription "
        // +
        // " FROM units, teller WHERE teller.unitnr=units.unitno and teller.id = ?";
        String sqlStr = "SELECT unitno, unitname, unitclass, unitcode, unitparent, unittellerprefix, unittype, unitdescription "
                + " FROM units JOIN teller ON teller.unitnr=units.unitno and teller.id = ?";

        final Unit unit = new Unit();
        jdbcTemplate.query(sqlStr, new Object[] { id },
                new RowCallbackHandler() {

                    @Override
                    public void processRow(ResultSet rs) throws SQLException {
                        unit.setUnitNr(rs.getString("unitno"));
                        unit.setName(rs.getString("unitname"));
                        unit.setUnitClass(rs.getString("unitclass").charAt(0));
                        unit.setCode(rs.getString("unitcode"));
                        unit.setParent(rs.getString("unitparent"));
                        unit.setTellerPrefix(rs.getString("unittellerprefix"));
                        unit.setType(rs.getString("unittype").charAt(0));
                        unit.setDescription(rs.getString("unitdescription"));
                    }
                });
        return unit;
    }

    public List<TellerMenu> findFunctionById(String tellerId) {
        String sqlStr = "select a.funcid, a.oplimit, a.funcposition, b.name, b.parentid, b.relation, b.available, b.type,"
                + "b.layer, b.filepath, b.display from tellerfunc as a join sysfunction as b on b.id = a.funcid and a.tellerid = ?";
        final List<TellerMenu> menu = new ArrayList<TellerMenu>();
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sqlStr,  new Object[] { tellerId });
        for (Map row : rows) {
            TellerMenu m = new TellerMenu();
            m.setFuncId((String)row.get("funcid"));
            m.setOpLimit((String)row.get("oplimit"));
            m.setFuncPosition((String)row.get("funcposition"));
            m.setName((String)row.get("name"));
            m.setParentId((String)row.get("parentid"));
            m.setRelation((String)row.get("relation"));
            m.setAvailable((String)row.get("available"));
            m.setType((String)row.get("type"));
            m.setLayer((String)row.get("layer"));
            m.setFilePath((String)row.get("filepath"));
            m.setDisplay((String)row.get("display"));
           
            menu.add(m);
        }
    return menu;
  }
}
