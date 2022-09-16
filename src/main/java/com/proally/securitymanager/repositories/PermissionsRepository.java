package com.proally.securitymanager.repositories;


import com.proally.securitymanager.domain.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PermissionsRepository extends JpaRepository<Permission, Long>, JpaSpecificationExecutor<Permission>
{
}
