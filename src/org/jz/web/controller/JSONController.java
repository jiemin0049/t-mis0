package org.jz.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/kfc/brands")
public class JSONController {

    @RequestMapping(value = "{name}", method = RequestMethod.GET)
    public @ResponseBody
    Shop getShopInJSON(@PathVariable String name) {

        Shop shop = new Shop();
        shop.setName(name);
        shop.setStaffName(new String[] { "mkyong1", "mkyong2" });

        return shop;

    }

    static class Shop {
        private String name;
        private String[] staffName;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String[] getStaffName() {
            return staffName;
        }

        public void setStaffName(String[] staffName) {
            this.staffName = staffName;
        }
    }

}
