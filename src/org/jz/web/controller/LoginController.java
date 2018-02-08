package org.jz.web.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.jz.web.domain.Teller;
import org.jz.web.domain.Unit;
import org.jz.web.pojo.TellerLoginCommand;
import org.jz.web.services.TellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

  @Autowired
  private TellerService tellerService;

  @Autowired
  private Teller loginTeller;

  @RequestMapping("/index.html")
  public String loginPage() {
    return "login2";
  }

  @RequestMapping("loginCheck2.html")
  public ModelAndView loginCheck(HttpServletRequest request,
      TellerLoginCommand tellerCommand) {
    boolean isValidUser = tellerService.hasMatchTeller(tellerCommand.getId(),
        tellerCommand.getPassword());
    if (!isValidUser) {
      return new ModelAndView("login", "error", "user or password error");
    } else {
      Teller teller = tellerService.findTellerById(tellerCommand.getId());
      request.getSession().setAttribute("teller", teller);
      loginTeller.setId(teller.getId());
      return new ModelAndView("main2");
    }
  }

  @RequestMapping("/top.html")
  public ModelAndView top(HttpServletRequest request) {
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
    Calendar cal = Calendar.getInstance();
    ModelAndView mav = new ModelAndView();
    mav.setViewName("top");
    mav.addObject("date", dateFormat.format(cal.getTime()));
    Teller teller = (Teller) request.getSession().getAttribute("teller");
    Unit unit = tellerService.findUnitByTellerId(teller.getId());
    mav.addObject("unitName", unit.getName());
    return mav;
  }

  @RequestMapping("/bottom.html")
  public String bottom() {
    return "bottom";
  }

  @RequestMapping("/menu.html")
  public String menu(HttpServletRequest request) {
    Teller teller = (Teller) request.getSession().getAttribute("teller");
    return "forward:/menu/" + teller.getId();
  }

  @RequestMapping("/welcome.html")
  public String welcome() {
    return "welcome";
  }
}
