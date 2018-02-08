package org.jz.web.controller.yywh.xtsz;

import java.util.List;

import org.jz.web.domain.SysFunction;
import org.jz.web.domain.Teller;
import org.jz.web.pojo.AddFunctionCommand;
import org.jz.web.services.SysfunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MenuFunctionManagerController {

  @Autowired
  private SysfunctionService sysfunctionService;

  @Autowired
  private Teller loginTeller; // bean for get teller id.

  @RequestMapping("m7341/W7341_01")
  public String addMenuFunction01() {
    return "m7341/W7341_01";
  }

  @RequestMapping(value = "m7341/W7341_02", method = RequestMethod.POST)
  public String addMenuFunction02(AddFunctionCommand cmd,
      final RedirectAttributes redirectAttributes) {
    SysFunction function = new SysFunction();
    function.setId(cmd.getId());
    function.setName(cmd.getName());
    function.setType("M");
    function.setDescription(cmd.getDescription());
    function.setMemo(cmd.getMemo());
    function.setParentId("0");
    function.setRelation(cmd.getName());
    function.setAvailable("1");
    function.setLayer("0");
    function.setFilePath("");
    String type = "" + cmd.getType().charAt(0);
    if (type.equals("1")) {
      sysfunctionService.addSysfunction(function, null);
      return "m7341/W7341_02";
    } else {
      redirectAttributes.addFlashAttribute("function", function);
      return "forward:/m7341/W7341_03/";
    }
  }

  @RequestMapping(value = "m7341/W7341_03", method = RequestMethod.POST)
  public String addMenuFunction03(
      @ModelAttribute("function") SysFunction function, ModelMap model) {
    List<SysFunction> parentFuncs = sysfunctionService
        .findFunctionByTellerId(loginTeller.getId());
    model.addAttribute("function", function);
    model.addAttribute("parentSelect", parentFuncs);
    return "m7341/W7341_03";
  }
}
