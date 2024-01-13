package com.ch.ebusiness.controller.before;

import com.ch.ebusiness.service.before.FocusService;
import com.ch.ebusiness.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/focus")
public class FocusController extends BeforeBaseController{
    @Autowired
    private FocusService focusService;
    @RequestMapping("/deleteFocus")
    public String deleteFocus(HttpSession session, Integer gid) {
        return focusService.deleteFocus(session, gid);
    }
    @RequestMapping("/selectFocus")
    public String selectFocus(Model model, HttpSession session) {
        return focusService.selectFocus(model, session);
    }
}
