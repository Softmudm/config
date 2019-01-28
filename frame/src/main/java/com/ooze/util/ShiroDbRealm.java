package com.ooze.util;

import java.util.Map;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.ooze.model.User;
//import com.ooze.service.RoleService;
import com.ooze.service.UserService;

/**
 * @description：shiro权限认证
 */
public class ShiroDbRealm extends AuthorizingRealm {
    private static final Logger LOGGER = LogManager.getLogger(ShiroDbRealm.class);

    @Autowired
	private UserService userService;
//    @Autowired 
    //private RoleService roleService;
//    @Autowired
//    private MenuService menuService;
    
    public ShiroDbRealm(CacheManager cacheManager,CredentialsMatcher matcher) {
        super(cacheManager,matcher);
    }
    
    /**
     * Shiro登录认证(原理：用户提交 用户名和密码  --- shiro 封装令牌 ---- realm 通过用户名将密码查询返回 ---- shiro 自动去比较查询出密码和用户输入密码是否一致---- 进行登陆控制 )
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        LOGGER.info("Shiro开始登录认证");
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.getUserByAccount(token.getUsername());
        // 账号不存在
        if (user == null) {
            return null;
        }
        // 账号未启用
       /* if (user.getStatus() == 1) {
            return null;
        }*/
//     // 读取用户角色
//        Map<String, Set<String>> resourceMap = roleService.selectResourceMapByUserId(user.getUserId());
    //    ShiroUser shiroUser = new ShiroUser(user.getUserId().longValue(), user.getEmployeeId(), user.getUserName(), null);
//        shiroUser.setRoles(resourceMap.get("roles"));
//        Set<String> roles = new HashSet<>();
//        roles.add("0");
//        shiroUser.setRoles(roles);
        // 认证缓存信息
        return new SimpleAuthenticationInfo(user, user.getPassword().toCharArray(), getName());
    }

    /**
     * Shiro权限认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();
        int userId = userService.getUserIdByUserName(username);
        int roleId = userService.getRoleIdByUserId(userId);
        // 读取用户的url和角色
        /*Map<String, Set<String>> resourceMap = roleService.selectResourceMapByUserId(shiroUser.getId().intValue());
        Set<String> urls = resourceMap.get("urls");
        Set<String> roles = resourceMap.get("roles");
        roles.add("0");*/
//        String[] ids = roles.toArray(new String[roles.size()]);
//        Integer[] roleIds = new Integer[ids.length];
//        for(int i = 0; i < roleIds.length; i++)
//        	roleIds[i] = Integer.parseInt(ids[i]);
//        List<Menu> mList = menuService.getMenuListByRoleIds(roleIds,null);
      //  shiroUser.setRoles(roles);
//        shiroUser.setMenuSet(new HashSet<>(mList));
      //  shiroUser.setUrlSet(urls);
        
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(userService.findRoles(userId));
        info.setStringPermissions(userService.findPermissions(roleId));
        
        return info;
    }

    /**
     * 清除用户缓存
     * @param userId
     */
    public void removeUserCache(User user){
    	Subject subject = SecurityUtils.getSubject();
    	String realmName = subject.getPrincipals().getRealmNames().iterator().next(); 
        SimplePrincipalCollection principals = new SimplePrincipalCollection(user.getAccount(),realmName); 
        subject.runAs(principals); 
        getAuthorizationCache().remove(subject.getPrincipals()); 
        subject.releaseRunAs();
        principals.add(user, super.getName());
        super.clearCachedAuthorizationInfo(principals);
        super.clearCachedAuthenticationInfo(principals);
        super.clearCache(principals);
    }

    /**
     * 清除所有用户授权信息缓存.
     */
    /*public void clearAllCachedAuthorizationInfo() {
        Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
        if (cache != null) {
            for (Object key : cache.keys()) {
                cache.remove(key);
            }
        }
    }*/
}
