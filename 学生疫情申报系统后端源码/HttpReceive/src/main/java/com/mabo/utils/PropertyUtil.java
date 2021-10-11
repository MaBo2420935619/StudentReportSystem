package com.mabo.utils;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * @Author mabo
 * @Description   用于读取配置文件的工具类
 */

public class PropertyUtil {
    private  static LogUtil log=new LogUtil();
    //设置配置文件的基本路径
    private static String path ="properties/";
    /**
 * @Author mabo
 * @Description   获取配置文件对象
 */
    public Properties getProperties(String propertiesName) {
        Properties props = new Properties();
        Resource resource = new ClassPathResource(path+propertiesName);
        if(resource!=null){
            try {
                InputStream is = resource.getInputStream();
                BufferedReader bf = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                props.load(bf);
            } catch (Exception e) {
                e.printStackTrace();
                log.error(propertiesName+"配置文件读取失败");
            }
        }
        else log.error(propertiesName+"配置文件不存在");
        return  props;
    }

    /**
     * @Author mabo
     * @Description   指定配置文件名,和key，获取value
     */
    public String get(String propertyFileName,String key){
        PropertyUtil propertyUtil=new PropertyUtil();
        Properties properties = propertyUtil.getProperties(propertyFileName);
        String value=null;
        value =  properties.getProperty(key);
        if (value==null){
            log.error("配置文件"+propertyFileName+"获取-------:"+key+"失败");
        }
//        else log.info("配置文件"+propertyFileName+"获取--------:"+key+"成功");
        return  value;
    }
}
