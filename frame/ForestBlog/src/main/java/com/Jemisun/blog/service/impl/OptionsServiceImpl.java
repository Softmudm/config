package com.Jemisun.blog.service.impl;

import com.Jemisun.blog.dao.OptionsMapper;
import com.Jemisun.blog.entity.Options;
import com.Jemisun.blog.service.OptionsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

/**
 *
 * @author 言曌
 * @date 2017/9/7
 */
public class OptionsServiceImpl implements OptionsService {


    @Autowired(required = false)
    private OptionsMapper optionsMapper;

    @Override
    @Cacheable(value = "default", key = "'options'")
    public Options getOptions() {
        return optionsMapper.getOptions();
    }

    @Override
    public void insertOptions(Options options) {
        optionsMapper.insert(options);
    }

    @Override
    @CacheEvict(value = "default", key = "'options'")
    public void updateOptions(Options options) {
        optionsMapper.update(options);
    }
}
