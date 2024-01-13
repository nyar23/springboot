package com.ch.ebusiness.service.before;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface FocusService {
    public String selectFocus(Model model, HttpSession session);
    public String deleteFocus(HttpSession session, Integer gid);
}
