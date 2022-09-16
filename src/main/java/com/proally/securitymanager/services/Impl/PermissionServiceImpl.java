package com.proally.securitymanager.services.Impl;


import com.proally.securitymanager.domain.Permission;
import com.proally.securitymanager.exception.ResourceNotFoundException;
import com.proally.securitymanager.models.PermissionModel;
import com.proally.securitymanager.repositories.PermissionsRepository;
import com.proally.securitymanager.security.AuthUserInfo;
import com.proally.securitymanager.services.PermissionServices;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import static com.proally.securitymanager.common.Constants.RECORD_DOES_NOT_EXIST_FOR_ID;
import static com.proally.securitymanager.specifications.PermissionsSpecification.withActive;
import static com.proally.securitymanager.specifications.PermissionsSpecification.withSearch;
import static org.bouncycastle.crypto.tls.ConnectionEnd.client;


@RequiredArgsConstructor
@Service
public class PermissionServiceImpl implements PermissionServices {
    @NonNull PermissionsRepository permissionsRepository;


    @Override
    public Page<PermissionModel> getPermissions(AuthUserInfo user, Long branch, boolean active, String search, Pageable pageable) {
        Specification<Permission> permissionSpecification = Specification.where(withActive(active));
        if (!StringUtils.isEmpty(search)) {
            permissionSpecification = permissionSpecification.and(withSearch("title", search))
                    .or(withSearch("description", search)).or(withSearch("permissionCode", search));
        }
        return permissionsRepository.findAll(permissionSpecification, pageable)
                .map(PermissionModel::new);
    }

    @Override
    public PermissionModel createPermission(AuthUserInfo user, PermissionModel permissionModel) {
        permissionModel.setActive(true);
        permissionModel.setPermissionGroupId(1L);
        return new PermissionModel(permissionsRepository.save(permissionModel.disassemble()));
    }

    @Override
    public PermissionModel updatePermission(AuthUserInfo user, Long webId, PermissionModel permissionModel) {
        return permissionsRepository.findById(webId).map(permission -> {
            permission.setPermissionGroupId(permissionModel.getPermissionGroupId());
            permission.setDescription(permissionModel.getDescription());
            permission.setTitle(permissionModel.getTitle());
            permission.setUse(permissionModel.getUse());
            permission.setPermissionGroupId(1L);
            return new PermissionModel(permissionsRepository.save(permission));
        }).orElseThrow(() -> new ResourceNotFoundException(RECORD_DOES_NOT_EXIST_FOR_ID + user.getWebId()));
    }

    @Override
    public Boolean deletePermission(AuthUserInfo user, Long webId) {
        return permissionsRepository.findById(webId).map(permission -> {
            permissionsRepository.delete(permission);
            return true;
        }).orElseThrow(() -> new ResourceNotFoundException(RECORD_DOES_NOT_EXIST_FOR_ID + webId));
    }
}
