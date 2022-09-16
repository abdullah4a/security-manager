package com.proally.securitymanager.services;

import com.proally.securitymanager.models.WebUserModel;
import com.proally.securitymanager.security.AuthUserInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import java.util.Collection;

public interface WebUserService {
    WebUserModel signup(WebUserModel webUser);

    Page<WebUserModel> getAllUsers(AuthUserInfo userInfo, Boolean active, Pageable pageable);
}
