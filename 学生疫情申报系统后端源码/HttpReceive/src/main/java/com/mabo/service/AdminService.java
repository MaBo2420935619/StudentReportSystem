package com.mabo.service;

import com.alibaba.fastjson.JSONObject;
import com.mabo.dao.AdminDao;
import com.mabo.utils.StringUtil;

import java.util.Map;

public class AdminService extends BaseService{
    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    /**
     * @Author mabo
     * @Description   删除老师分配的班级
     */
    public boolean deleteTeacherClass(Map map){
        jedisSharkUtil.del("getTeacherClassesInfo");
        String id = StringUtil.getMapValueString(map, "id");
        String classId = StringUtil.getMapValueString(map, "classId");
        if (!id.equals("")&&!classId.equals("")){
            return adminDao.deleteTeacherClass(id, classId);
        }
       return  false;
    }

    /**
     * @Author mabo
     * @Description   给老师分配班级
     */
    public boolean setTeacherClassesInfo(Map map){
        jedisSharkUtil.del("getTeacherClassesInfo");
        String id = StringUtil.getMapValueString(map, "id");
        String classId = StringUtil.getMapValueString(map, "classId");
        if (!id.equals("")&&!classId.equals("")){
            return adminDao.setTeacherClassesInfo(id, classId);
        }
        return  false;
    }
}
