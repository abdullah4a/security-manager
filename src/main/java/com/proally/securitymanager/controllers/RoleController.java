package com.proally.securitymanager.controllers;

import com.proally.securitymanager.models.RoleModel;
import com.proally.securitymanager.models.RolePermissionModel;
import com.proally.securitymanager.security.AuthUserInfo;
import com.proally.securitymanager.services.RoleServices;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import reactor.util.annotation.NonNull;

import java.util.List;

@RestController
@RequestMapping("/api/role")
@RequiredArgsConstructor
public class RoleController {
    @NonNull
    private final RoleServices roleServices;

    @GetMapping
    public ResponseEntity<Page<RoleModel>> getRoles(@AuthenticationPrincipal AuthUserInfo user,
                                                     @RequestParam(required = false) String search,
                                                     @RequestParam(required = false) Long branch,
                                                     @RequestParam(required = false) boolean active,
                                                     Pageable pageable) {
        return ResponseEntity.ok(roleServices.getRoles(user, branch, active, search, pageable));
    }

    @PostMapping
    public ResponseEntity<RoleModel> createRole(@AuthenticationPrincipal AuthUserInfo user,
                                                 @RequestBody RoleModel roleModel) {
        return ResponseEntity.ok(roleServices.createRole(user, roleModel));
    }

    @PutMapping("{id}")
    public ResponseEntity<RoleModel> updateRole(@AuthenticationPrincipal AuthUserInfo user,
                                                 @PathVariable Long id,
                                                 @RequestBody RoleModel roleModel) {
        return ResponseEntity.ok(roleServices.updateRole(user, id, roleModel));
    }

    @DeleteMapping("{id}")
    public Boolean deleteRole(@AuthenticationPrincipal AuthUserInfo user,
                               @PathVariable Long id) {
        return roleServices.deleteRole(user, id);
    }

    @GetMapping("{id}/permission")
    public ResponseEntity<List<RolePermissionModel>> getRolePermissions(@AuthenticationPrincipal AuthUserInfo userInfo,
                                                                         @PathVariable Long id) {
        return ResponseEntity.ok(roleServices.getRolesAndPermission(userInfo, id));
    }

    @PostMapping("{id}/permission")
    public ResponseEntity<RolePermissionModel> addOrDeleteRolePermissions(@AuthenticationPrincipal AuthUserInfo userInfo,
                                                                           @PathVariable Long id,
                                                                           @RequestBody RolePermissionModel rolePermissionModel) {
        return ResponseEntity.ok(roleServices.addOrDeleteRolePermissions(userInfo, id, rolePermissionModel));
    }
}
