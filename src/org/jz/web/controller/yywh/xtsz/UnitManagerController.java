package org.jz.web.controller.yywh.xtsz;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jz.web.domain.Unit;
import org.jz.web.pojo.AddUnitCommand;
import org.jz.web.services.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UnitManagerController {

  @Autowired
  private UnitService unitService;

  @RequestMapping("m7311/W7311_01")
  public String searchUnit01() {
    return "m7311/W7311_01";
  }

  @RequestMapping(value = "m7311/W7311_02", method = RequestMethod.POST)
  public ModelAndView searchUnit02(@RequestParam("QUNITNO") String unitNr,
      @RequestParam("QUNITNAME") String unitName) {
    return getUnits(unitNr, unitName, "m7311/W7311_02");
  }

  private ModelAndView getUnits(String unitNr, String unitName, String viewName) {
    List<Unit> unitList = unitService.getUnit(unitNr, unitName);
    ModelAndView mav = new ModelAndView(viewName);
    mav.addObject("unitList", unitList);
    return mav;
  }

  @RequestMapping("m7312/W7312_01")
  public String addUnit01() {
    return "m7312/W7312_01";
  }

  @RequestMapping(value = "m7312/W7312_02", method = RequestMethod.POST)
  public ModelAndView addUnit02(AddUnitCommand addUnitCmd) {
    String unitClass = "" + addUnitCmd.getClazz().charAt(0);
    addUnitCmd.setClazz(unitClass);
    String parent = addUnitCmd.getParent();
    if (unitClass.trim().equals("5")) {
      if (unitService.hasMatchClazz("5")) {
        // TODO: error, only one unit class should be 5 in database
      } else {
        parent = "000000000";
      }
    }

    // check whether parent exist and parent class is higher than this unit.
    Unit unit = unitService.getUnit(parent);
    char uClass = unit.getUnitClass();
    if (uClass != '\u0000') {
      if (Integer.parseInt(unitClass.trim()) < Character
          .getNumericValue(uClass)) {
        addUnitCmd.setType("" + addUnitCmd.getType().charAt(0));
        unitService.add(Arrays.asList(addUnitCmd));
      } else {
        // TODO: error mesage, parent unit class < this unit class
      }
    } else {
      // TODO: error message, parent unit not found
    }

    ModelAndView mav = new ModelAndView("m7312/W7312_02");
    mav.addObject("unitno", addUnitCmd.getNo());
    return mav;
  }

  @RequestMapping("m7313/W7313_01")
  public String modifyUnit01() {
    return "m7313/W7313_01";
  }

  @RequestMapping(value = "m7313/W7313_02", method = RequestMethod.POST)
  public ModelAndView modifyUnit02(@RequestParam("MDUNITNO") String unitNr,
      @RequestParam("MDUNITNAME") String unitName, HttpServletRequest request) {
    ModelAndView mav = getUnits(unitNr, unitName, "m7313/W7313_02");
    request.getSession().setAttribute("unitList",
        mav.getModelMap().get("unitList"));
    return mav;
  }

  @RequestMapping(value = "m7313/W7313_03", method = RequestMethod.POST)
  public ModelAndView modifyUnit03(HttpServletRequest request,
      @RequestParam("MDUNITNO") String unitNr) {
    Object o = request.getSession().getAttribute("unitList");
    List<Unit> units = (List<Unit>) o;
    for (Unit unit : units) {
      if (unit.getUnitNr().trim().equals(unitNr.trim())) {
        ModelAndView mav = new ModelAndView("m7313/W7313_03");
        mav.addObject("unit", unit);
        return mav;
      }
    }
    return new ModelAndView();
  }

  @RequestMapping(value = "m7313/W7313_04", method = RequestMethod.POST)
  public ModelAndView modifyUnit04(AddUnitCommand addUnitCmd) {
    boolean error = false;
    String errorMessage = "";
    String unitClass = "" + addUnitCmd.getClazz().charAt(0);
    if (unitClass.trim().equals("5")) {
      if (unitService.hasMatchClazz("5")) {
        error = true;
        errorMessage = "only one unit class should be 5 in database";
      }
    }

    String parent = addUnitCmd.getParent();
    if (!error) {
      Unit parentUnit = unitService.getUnit(parent);
      char uClass = parentUnit.getUnitClass();
      if (uClass != '\u0000') {
        if (Integer.parseInt(unitClass.trim()) < Character
            .getNumericValue(uClass)) {
          addUnitCmd.setType("" + addUnitCmd.getType().charAt(0));
          unitService.update(addUnitCmd);
        } else {
          error = true;
          // TODO: error mesage, parent unit class < this unit class
        }
      } else {
        error = true;
        // TODO: error message, parent unit not found
      }
    }

    ModelAndView mav = new ModelAndView("m7313/W7313_04");
    mav.addObject("unitno", addUnitCmd.getNo());
    return mav;
  }

  @RequestMapping("m7314/W7314_01")
  public String removeUnit01() {
    return "m7314/W7314_01";
  }

  @RequestMapping(value = "m7314/W7314_02", method = RequestMethod.POST)
  public ModelAndView removeUnit02(@RequestParam("CUNITNO") String unitNr,
      @RequestParam("CUNITNAME") String unitName, HttpServletRequest request) {
    ModelAndView mav = getUnits(unitNr, unitName, "m7314/W7314_02");
    request.getSession().setAttribute("unitList",
        mav.getModelMap().get("unitList"));
    return mav;
  }

  @RequestMapping(value = "m7314/W7314_03", method = RequestMethod.POST)
  public ModelAndView removeUnit03(@RequestParam("CUNITNO") String unitNr) {
    ModelAndView mav = new ModelAndView("m7314/W7314_03");
    boolean has = unitService.hasTellerOrSubUnit(unitNr);
    if (has) {
      mav.addObject("unitNr", unitNr + " has tellers or subunit, can not be removed.");
    } else {
      unitService.remove(unitNr);
      mav.addObject("unitNr", unitNr);
    }
    return mav;
  }
}
