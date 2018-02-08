package org.jz.web.controller.yywh.xtsz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TellerManagerController {
  @RequestMapping("m7321/add_test")
  public String addTest() {
    return "m7321/add_test";
  }
}
