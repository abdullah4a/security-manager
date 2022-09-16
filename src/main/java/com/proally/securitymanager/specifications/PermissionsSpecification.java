package com.proally.securitymanager.specifications;

import com.proally.securitymanager.domain.Permission;
import org.springframework.data.jpa.domain.Specification;


public interface PermissionsSpecification {
    static Specification<Permission> withClient(Long clientId) {
        if (clientId == null) {
            return null;
        } else {
            return (root, query, cb) -> cb.equal(root.get("client").get("webId"), clientId);
        }
    }

    static Specification<Permission> withSearch(String field, String search) {
        if (search == null) {
            return null;
        } else {
            return (root, query, cb) -> cb.like(root.get(field), "%" + search + "%");
        }
    }

    static Specification<Permission> withActive(Boolean active) {
        return (root, query, cb) -> cb.equal(root.get("active"), active);
    }

    static Specification<Permission> withBranchId(Long branchId) {
        if (branchId == null) {
            return null;
        } else {
            return (root, query, cb) -> cb.equal(root.get("branch").get("webId"), branchId);
        }
    }
}
