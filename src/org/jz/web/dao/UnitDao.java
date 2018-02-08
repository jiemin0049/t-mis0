package org.jz.web.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.jz.web.domain.Unit;
import org.jz.web.pojo.AddUnitCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

@Repository
public class UnitDao {

  @Autowired
  private JdbcTemplate jdbcTemplate;

  public List<Unit> getUnit(String unitNr, String unitName) {
    String sqlStr = "SELECT unitno,unitname,unitclass,unitcode, unitparent,unittellerprefix,unittype,unitdescription FROM "
        + "units WHERE unitno LIKE ? or unitname LIKE ? ORDER BY unitno";
    final List<Unit> units = new ArrayList<Unit>();
    jdbcTemplate.query(sqlStr, new Object[] { "%" + unitNr + "%",
        "%" + unitName + "%" }, new RowCallbackHandler() {

      @Override
      public void processRow(ResultSet rs) throws SQLException {
        Unit u = new Unit();
        u.setUnitNr(rs.getString("unitno"));
        u.setName(rs.getString("unitname"));
        u.setUnitClass(rs.getString("unitclass").charAt(0));
        u.setCode(rs.getString("unitcode"));
        u.setParent(rs.getString("unitparent"));
        u.setTellerPrefix(rs.getString("unittellerprefix"));
        u.setType(rs.getString("unittype").charAt(0));
        u.setDescription(rs.getString("unitdescription"));
        units.add(u);
      }
    });

    return units;
  }

  public Unit getUnit(String unitNr) {
    String sqlStr = "SELECT unitno,unitname,unitclass,unitcode, unitparent,unittellerprefix,unittype,unitdescription FROM "
        + "units WHERE unitno= ?";
    final Unit unit = new Unit();
    jdbcTemplate.query(sqlStr, new Object[] { unitNr },
        new RowCallbackHandler() {
          @Override
          public void processRow(ResultSet rs) throws SQLException {
            if (rs != null) {
              unit.setUnitNr(rs.getString("unitno"));
              unit.setName(rs.getString("unitname"));
              unit.setUnitClass(rs.getString("unitclass").charAt(0));
              unit.setCode(rs.getString("unitcode"));
              unit.setParent(rs.getString("unitparent"));
              unit.setTellerPrefix(rs.getString("unittellerprefix"));
              unit.setType(rs.getString("unittype").charAt(0));
              unit.setDescription(rs.getString("unitdescription"));
            }
          }
        });

    return unit;
  }

  public int hasMatchClazz(String clazz) {
    String sSql = "SELECT COUNT(*) FROM unit WHERE unitclass =?";
    Integer i = jdbcTemplate.queryForInt(sSql, clazz);
    return i.intValue();
  }

  public boolean update(final AddUnitCommand unit) {
    String sSql = "UPDATE units SET (unitname, unitclass, unitparent,unittellerprefix,unittype,unitdescription) = (?, ?, ?, ?, ?, ?) WHERE unitno = ?";

    Object[] params = { unit.getName(), unit.getClazz(), unit.getParent(),
        unit.getTellerpre(), unit.getType(), unit.getDescription(),
        unit.getNo() };
    int[] types = { Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
        Types.VARCHAR, Types.VARCHAR, Types.VARCHAR };
    int row = jdbcTemplate.update(sSql, params);
    return row == 1;
  }

  public boolean add(final List<AddUnitCommand> units) {
    String sSql = "INSERT INTO units (unitno, unitname, unitclass, unitcode, unittellerprefix, unitparent, unittype, unitdescription)"
        + " VALUES(?,?,?,0,?,?,?,?)";

    int[] ii = jdbcTemplate.batchUpdate(sSql,
        new BatchPreparedStatementSetter() {

          @Override
          public int getBatchSize() {
            return units.size();
          }

          @Override
          public void setValues(PreparedStatement ps, int i)
              throws SQLException {
            AddUnitCommand unit = units.get(i);
            ps.setString(1, unit.getNo());
            ps.setString(2, unit.getName());
            ps.setString(3, "" + unit.getClazz());
            ps.setString(4, unit.getTellerpre());
            ps.setString(5, unit.getParent());
            ps.setString(6, "" + unit.getType());
            ps.setString(7, unit.getDescription());
          }
        });

    return units.size() == ii.length;
  }

  public int[] hasTellerOrSubUnit(String unitNr) {
    String sqlStr = "(SELECT COUNT(*) FROM teller WHERE unitnr = ?) UNION ALL (SELECT COUNT(*) FROM units WHERE unitparent = ?)";
    final List<Integer> integers = new ArrayList<Integer>();
    jdbcTemplate.query(sqlStr, new Object[] { unitNr, unitNr },
        new RowCallbackHandler() {
          @Override
          public void processRow(ResultSet rs) throws SQLException {
            if (rs != null) {
              integers.add(rs.getInt("count"));

            }
          }
        });
    
    int[] union = new int[integers.size()];
    for (int i = 0; i < union.length; i++) {
      union[i] = integers.get(i).intValue();
    }
    return union;
  }
  
  public boolean remove(String unitNr) {
    String sqlStr ="DELETE FROM units WHERE unitno = ?";
    int i = jdbcTemplate.update(sqlStr, unitNr);
    return true;
  }

}
