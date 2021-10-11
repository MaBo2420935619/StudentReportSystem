package com.mabo.manager;

import com.mabo.utils.JedisSharkUtil;
import org.springframework.jdbc.core.JdbcTemplate;

public class BaseManager {
    public JedisSharkUtil jedisSharkUtil;
    public JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void setJedisSharkUtil(JedisSharkUtil jedisSharkUtil) {
        this.jedisSharkUtil = jedisSharkUtil;
    }
}
