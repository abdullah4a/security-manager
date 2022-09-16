package com.proally.securitymanager.security;

import com.proally.securitymanager.domain.WebUser;
import com.proally.securitymanager.repositories.WebUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;

/**
 * Created by IntelliJ IDEA.
 * User: itinsync-waqas
 * Date: 5/1/21
 * Time: 11:05 PM
 * To change this template use File | Settings | File Templates.
 */
@Transactional(readOnly = true)
public class UserAuthenticationService implements UserDetailsService {

    @Autowired
    private WebUserRepository userRepository;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByEmailIgnoreCaseAndStatus(username, WebUser.STATUS_ACTIVE)
                .map(webUser -> {
                    if (webUser.isActive()) {
                        return new AuthUserInfo(webUser, Collections.emptyList(), true);
                    } else {
                        throw new UsernameNotFoundException("User with username: " + username + " is inactive. Please contact administrator.");
                    }

                })
                .orElseThrow(() -> new UsernameNotFoundException("No user present with username: " + username));
    }
}
