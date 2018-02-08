package org.jz.web.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ConvertMap {
  public static void main(String[] args) {
    List list1 = new ArrayList();
    list1.add("list1");
    List list2 = new ArrayList();
    list2.add("list2");
    List list_A = new ArrayList();
    list_A.add("list_A");
    List list_B = new ArrayList();
    list_B.add("list_B");
    List list_C = new ArrayList();
    list_C.add("list_C");

    Map inputMap = new HashMap();

    Map llMap = new HashMap();
    llMap.put("airbag", list1);
    llMap.put("dme", list2);
    inputMap.put("fg1", llMap);

    Map llMap2 = new HashMap();
    llMap2.put("airbag", list_A);
    llMap2.put("dme", list_B);
    llMap2.put("gateway", list_C);

    inputMap.put("fg2", llMap2);

    convert(inputMap);
    "a".toString();
  }

  static Map outputMap = new HashMap();

  /*
   * inputMap: Map<functionGroup, Map<logicalLinkName, List<item>>> outputMap:
   * Map<logicalLinkName, Map<functionGroup, List<item>>>
   */
  static Map convert(Map inputMap) {
    for (Object o : inputMap.entrySet()) {
      Map.Entry entry = (Map.Entry) o;
      String functionGroup = (String) entry.getKey();
      Map logicalLinkMap = (Map) entry.getValue();
      for (Object oo : logicalLinkMap.entrySet()) {
        Map.Entry ent = (Map.Entry) oo;
        String llName = (String) ent.getKey();
        List items = (List) ent.getValue();
        mergeMap(llName, functionGroup, items);
      }

    }
    return null;
  }

  static void mergeMap(String llName, String functionGroup, List items) {
    if (outputMap.size() == 0) {
      Map newmap = new HashMap();
      newmap.put(functionGroup, items);
      outputMap.put(llName, newmap);
      return;
    }
      Set keySet = (Set) outputMap.keySet();
      if (!keySet.contains(llName)) {
        Map newmap = new HashMap();
        newmap.put(functionGroup, items);
        outputMap.put(llName, newmap);
      } else {
        Map mm = (Map)outputMap.get(llName);
        mm.put(functionGroup, items);
      
    }
  }
}
