package com.codingstudy.b2c.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.codingstudy.b2c.dao.ResourceDao;
import com.codingstudy.b2c.entity.Resource;
import com.codingstudy.b2c.service.ResourceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * (Resource)表服务实现类
 * 该类由EasyCode工具生成
 * @author 小明哥
 * @since 2020-03-15 22:49:39
 */
@Service("resourceService")
public class ResourceServiceImpl extends ServiceImpl<ResourceDao, Resource> implements ResourceService {


    private Logger log   = LoggerFactory.getLogger (this.getClass ());

    /**
     *
     * @param ids
     * @return
     */
    public List<Resource> getListByIds(String ids){

        List<Resource> list = new ArrayList<>();

        if(StringUtils.isNotEmpty(ids)) {

            String[] idList = ids.split (",");

            LambdaQueryWrapper<Resource> queryWrapper = new QueryWrapper().lambda ();

            queryWrapper.in (StringUtils.isNotEmpty (ids), Resource::getId, Arrays.asList(idList));

            list = this.list (queryWrapper);

        }

        //log.info ("service list==>" + list.toString ());

        return list;

    }
}