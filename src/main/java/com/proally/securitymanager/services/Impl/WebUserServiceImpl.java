package com.proally.securitymanager.services.Impl;

import com.proally.securitymanager.domain.WebUser;
import com.proally.securitymanager.models.WebUserModel;
import com.proally.securitymanager.repositories.WebUserRepository;
import com.proally.securitymanager.security.AuthUserInfo;
import com.proally.securitymanager.services.WebUserService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.Collection;

import static com.proally.securitymanager.specifications.WebUserSpecifications.withStatusActive;

@Service
@RequiredArgsConstructor
public class WebUserServiceImpl implements WebUserService {

    @NonNull
    private final WebUserRepository webUserRepository;

    @Override
    public Page<WebUserModel> getAllUsers(AuthUserInfo userInfo, Boolean active, Pageable pageable) {
        Specification<WebUser> webUserSpecification = Specification.where(withStatusActive(true));
        return webUserRepository.findAll(webUserSpecification, pageable).map(WebUserModel::new);
    }

    @Override
    public WebUserModel signup(WebUserModel webUserModel) {
        var webUser = new WebUser();
        webUser.setFirstName(webUserModel.getFirstName());
        webUser.setLastName(webUserModel.getLastName());
        webUser.setEmail(webUserModel.getEmail());
        webUser.setPassword("$2a$10$CkQY8PpSb2tvPHnAnXb3ju00RZec4ivvrfSilQLywJFs2PYqWqAu6");
        webUser.setActive(true);
        webUser.setPhoneNumber(webUserModel.getPhoneNumber());
        webUser.setStatus(WebUser.STATUS_ACTIVE);
        return new WebUserModel(webUserRepository.save(webUser));
    }

}
