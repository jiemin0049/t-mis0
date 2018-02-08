package org.jz.web.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.jz.web.domain.TellerMenu;
import org.jz.web.services.TellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private TellerService tellerService;

    //
    // private static final String MENU_URL = "/menu.html";
    //
    // @RequestMapping(value = MENU_URL, method = RequestMethod.GET)
    // // @RequestMapping(value = MENU_URL, headers = "Accept=application/json")
    // // @RequestMapping(value="/{id}", method = RequestMethod.GET, )
    // public @ResponseBody
    // Teller menu() {
    // Teller teller = tellerService.findTellerById("Aoot");
    // return teller;
    // }

    @RequestMapping(value = "{tellerId}", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView getTellerMenu(@PathVariable String tellerId, Model model,
            HttpServletResponse response) throws UnsupportedEncodingException {

        List<TellerMenu> tellerMenu = tellerService.findFunctionById(tellerId);
        List<JSTreeMenu> jstreeMenu = convertMenu(tellerMenu);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("menu");
        // mav.addObject("tellerMenu", tellerMenu);
        // System.out.println(new
        // String(tellerMenu.get(0).getName().getBytes("ISO-8859-1"),
        // "gb2312"));//你好
        final ByteArrayOutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();
        try {
            mapper.writeValue(out, jstreeMenu);
        } catch (IOException e) {
            e.printStackTrace();
        }
        final byte[] data = out.toByteArray();
        mav.addObject("tellerMenu", new String(data, "utf-8"));
        return mav;
        // response.setContentType("application/json");
        // return tellerMenu;
        // return new String(data, "utf-8");
    }

    /**
     * convert tellerMenu to jsTree form.
     */
    private List<JSTreeMenu> convertMenu(List<TellerMenu> menuList) {
        List<JSTreeMenu> treeList = new ArrayList<JSTreeMenu>();
        for (TellerMenu tellerMenu : menuList) {
            JSTreeMenu treeMenu = new JSTreeMenu();
            treeMenu.setId(tellerMenu.getFuncId().trim());
            treeMenu.setText(tellerMenu.getName().trim());
            String pId = tellerMenu.getParentId();
            if (pId.trim().equals("0")) {
                treeMenu.setParent("#");
            } else {
                treeMenu.setParent(pId.trim());
            }
            treeMenu.setUrl(tellerMenu.getRelation().trim());
            treeList.add(treeMenu);
        }
        return treeList;
    }

    class JSTreeMenu {
        private String id;
        private String parent;
        private String text;
        private String url;

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getParent() {
            return parent;
        }

        public void setParent(String parent) {
            this.parent = parent;
        }

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

    }
}
