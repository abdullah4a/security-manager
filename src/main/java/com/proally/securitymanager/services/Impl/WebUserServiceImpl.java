package com.proally.securitymanager.services.Impl;

import com.proally.securitymanager.domain.WebUser;
import com.proally.securitymanager.exception.ResourceNotFoundException;
import com.proally.securitymanager.models.PermissionModel;
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
import java.util.stream.Collectors;

import static com.proally.securitymanager.common.Constants.RECORD_DOES_NOT_EXIST_FOR_ID;
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

    @Override
    public WebUserModel getUserDetails(AuthUserInfo user) {
        return webUserRepository.findByWebIdAndActiveAndStatus(user.getWebId(), true, WebUser.STATUS_ACTIVE).map(webUser1 -> {
            WebUserModel webUserModel = new WebUserModel();
            webUserModel.setDescription(webUser1.getFirstName() + " " + webUser1.getLastName());
            webUserModel.setEmail(webUser1.getEmail());
            webUserModel.setWebId(webUser1.getWebId());
            webUserModel.setFirstName(webUser1.getFirstName());
            webUserModel.setLastName(webUser1.getLastName());
            webUserModel.setFirstName(webUser1.getFirstName());
            var permissions = webUserRepository.getPermissionForWebUser(webUser1).stream().map(webUserPermission -> {
                return new PermissionModel(webUserPermission, webUser1.getCustomer() != null);
            }).collect(Collectors.toList());
            webUserModel.setPermissions(permissions);
            return webUserModel;
        }).orElseThrow(() -> new ResourceNotFoundException(RECORD_DOES_NOT_EXIST_FOR_ID + user.getWebId()));
    }

}
