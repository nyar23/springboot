package com.ch.ebusiness.repository.before;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface FocusRepository {
    public int deleteAfocus(@Param("uid") Integer uid, @Param("gid") Integer gid);
    public List<Map<String,Object>> selectFocus(Integer uid);
}
