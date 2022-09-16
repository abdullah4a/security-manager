package com.proally.securitymanager.repositories;

import com.proally.securitymanager.domain.RolePermission;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Rana Ali Waseem
 * on 12 Apr, 2021, for iTiNSync
 * ali.waseem@itinsync.com
 */
public interface RolePermissionRepository extends JpaRepository<RolePermission, Long>
{
}
