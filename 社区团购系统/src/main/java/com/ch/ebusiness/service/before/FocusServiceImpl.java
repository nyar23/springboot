package com.ch.ebusiness.service.before;

import com.ch.ebusiness.repository.before.CartRepository;
import com.ch.ebusiness.repository.before.FocusRepository;
import com.ch.ebusiness.repository.before.IndexRepository;
import com.ch.ebusiness.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
public class FocusServiceImpl implements FocusService{
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private IndexRepository indexRepository;
    @Autowired
    private FocusRepository focusRepository;
    @Override
    public String selectFocus(Model model, HttpSession session) {
        model.addAttribute("advertisementGoods", indexRepository.selectAdvertisementGoods());
        //导航栏商品类型
        model.addAttribute("goodsType", indexRepository.selectGoodsType());
        model.addAttribute("myFocus", cartRepository.myFocus(MyUtil.getUser(session).getId()));
        return "user/myFocus";
    }


    @Override
    public String deleteFocus(HttpSession session, Integer gid) {
        Integer uid = MyUtil.getUser(session).getId();
        focusRepository.deleteAfocus(uid,gid);
        return "redirect:/focus/selectFocus";
    }
}
