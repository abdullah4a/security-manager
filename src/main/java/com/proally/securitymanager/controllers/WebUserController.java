package com.proally.securitymanager.controllers;

import com.proally.securitymanager.models.WebUserModel;
import com.proally.securitymanager.security.AuthUserInfo;
import com.proally.securitymanager.services.WebUserService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/user")
@RequiredArgsConstructor
public class WebUserController {
    @NonNull
    private final WebUserService webUserService;

    @GetMapping("/list")
    public ResponseEntity<Page<WebUserModel>> get(@AuthenticationPrincipal AuthUserInfo user,
                                                  Pageable pageable) {
        return ResponseEntity.ok(webUserService.getAllUsers(user, true, pageable));
    }

    @PostMapping("/auth/singup")
    public ResponseEntity<WebUserModel> signup(@RequestBody WebUserModel webUserModel) {
        return ResponseEntity.ok(webUserService.signup(webUserModel));
    }

    @GetMapping("/currentUser")
    public ResponseEntity<WebUserModel> getUser(@AuthenticationPrincipal AuthUserInfo userInfo) {
        return ResponseEntity.ok(webUserService.getUserDetails(userInfo));
    }
}
