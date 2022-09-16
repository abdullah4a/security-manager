package com.proally.securitymanager.security;

import com.proally.securitymanager.domain.WebUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: itinsync-waqas
 * Date: 5/1/21
 * Time: 11:12 PM
 * To change this template use File | Settings | File Templates.
 */
public class AuthUserInfo implements UserDetails {
    private final List<String> userRoles;
    private final Long webId;
//    private final Long clientId;
//    private final Long branchId;
    private final String name;
    private final String userName;
    private final String password;
    private final Boolean admin;

//    private final Long customerId;

    public AuthUserInfo(WebUser webUser, List<String> userRoles, boolean admin) {
        this.userRoles = userRoles;
        this.admin = admin;
        this.webId = webUser.getWebId();
        this.userName = webUser.getEmail();
        this.name = webUser.getFirstName() + " " + webUser.getLastName();
        this.password = webUser.getPassword();
//        this.clientId = webUser.getClient().getWebId();
//        this.branchId = webUser.getBranch().getWebId();
//        this.customerId = webUser.getCustomer() != null ? webUser.getCustomer().getWebId() : null;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        var roles = StringUtils.collectionToCommaDelimitedString(userRoles);
        return AuthorityUtils.commaSeparatedStringToAuthorityList(roles);
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.userName;
    }

    public boolean isAdmin() {
        return admin;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

//    public Long getCustomerId() {
//        return customerId;
//    }

    public List<String> getUserRoles() {
        return userRoles;
    }

    public Long getWebId() {
        return webId;
    }

//    public Long getClientId() {
//        return clientId;
//    }
//
//    public Long getBranchId() {
//        return branchId;
//    }

    public String getName() {
        return name;
    }
}
