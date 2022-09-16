package com.proally.securitymanager.specifications;

import com.proally.securitymanager.domain.Role;
import org.springframework.data.jpa.domain.Specification;


public interface RoleSpecification {
    static Specification<Role> withClient(Long clientId) {
        if (clientId == null) {
            return null;
        } else {
            return (root, query, cb) -> cb.equal(root.get("client").get("webId"), clientId);
        }
    }

    static Specification<Role> withSearch(String field, String search) {
        if (search == null) {
            return null;
        } else {
            return (root, query, cb) -> cb.like(root.get(field), "%" + search + "%");
        }
    }

    static Specification<Role> withActive(Boolean active) {
        return (root, query, cb) -> cb.equal(root.get("active"), active);
    }

    static Specification<Role> withBranchId(Long branchId) {
        if (branchId == null) {
            return null;
        } else {
            return (root, query, cb) -> cb.equal(root.get("branch").get("webId"), branchId);
        }
    }
}
