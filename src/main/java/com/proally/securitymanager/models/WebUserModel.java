package com.proally.securitymanager.models;

import com.proally.securitymanager.domain.WebUser;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WebUserModel {
    private Long webId;
    private Long clientId;
    private String description;
    private String email;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private Long branchId;
    private Long customerId;
    private Integer status;
    private List<String> featureGated = new ArrayList<>();
    private List<PermissionModel> permissions;
    private String active;

    public WebUserModel(WebUser webUser) {
        this.webId = webUser.getWebId();
        this.description = webUser.getFirstName() + " " + webUser.getLastName();
        this.active = webUser.getStatus() == 0 ? "Active" : "Not Active";
        this.email = webUser.getEmail();
        this.phoneNumber = webUser.getPhoneNumber();
    }

}
