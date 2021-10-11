package com.mabo.dao;

import org.springframework.dao.DataAccessException;

import java.util.Map;

public class AdminDao extends BaseDao{
    /**
     * @Author mabo
     * @Description   删除老师分配的班级
     */
    public boolean deleteTeacherClass(String id,String classId){
        String sql = propertyUtil.get("sql/admin.properties", "deleteTeacherClass");
        int update = 0;
        try {
            update = jdbcTemplate.update(sql, id, classId);
        } catch (DataAccessException e) {
            e.printStackTrace();
            log.error(sql+"执行失败");
        }
        if (update>0){
            return true;
        }
        return  false;
    }

    /**
     * @Author mabo
     * @Description   给老师分配班级
     */
    public boolean setTeacherClassesInfo(String id,String classId){
        String sql = propertyUtil.get("sql/admin.properties", "setTeacherClassesInfo");
        int update = 0;
        try {
            update = jdbcTemplate.update(sql, classId, id);
        } catch (DataAccessException e) {
            e.printStackTrace();
            log.error(sql+"执行失败");
        }
        if (update>0){
            return true;
        }
        return  false;
    }
}
