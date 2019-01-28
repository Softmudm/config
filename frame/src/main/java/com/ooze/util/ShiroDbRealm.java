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
 * @description��shiroȨ����֤
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
     * Shiro��¼��֤(ԭ���û��ύ �û���������  --- shiro ��װ���� ---- realm ͨ���û����������ѯ���� ---- shiro �Զ�ȥ�Ƚϲ�ѯ��������û����������Ƿ�һ��---- ���е�½���� )
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        LOGGER.info("Shiro��ʼ��¼��֤");
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.getUserByAccount(token.getUsername());
        // �˺Ų�����
        if (user == null) {
            return null;
        }
        // �˺�δ����
       /* if (user.getStatus() == 1) {
            return null;
        }*/
//     // ��ȡ�û���ɫ
//        Map<String, Set<String>> resourceMap = roleService.selectResourceMapByUserId(user.getUserId());
    //    ShiroUser shiroUser = new ShiroUser(user.getUserId().longValue(), user.getEmployeeId(), user.getUserName(), null);
//        shiroUser.setRoles(resourceMap.get("roles"));
//        Set<String> roles = new HashSet<>();
//        roles.add("0");
//        shiroUser.setRoles(roles);
        // ��֤������Ϣ
        return new SimpleAuthenticationInfo(user, user.getPassword().toCharArray(), getName());
    }

    /**
     * ShiroȨ����֤
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();
        int userId = userService.getUserIdByUserName(username);
        int roleId = userService.getRoleIdByUserId(userId);
        // ��ȡ�û���url�ͽ�ɫ
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
     * ����û�����
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
     * ��������û���Ȩ��Ϣ����.
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
