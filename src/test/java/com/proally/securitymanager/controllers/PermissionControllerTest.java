package com.proally.securitymanager.controllers;

import com.proally.securitymanager.SecurityManagerApplication;
import com.proally.securitymanager.services.PermissionServices;
import org.junit.Before;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.security.Permissions;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@WebMvcTest
class PermissionControllerTest extends SecurityManagerApplication {

    @MockBean
    private PermissionServices permissionServices;

    @Autowired
    private WebApplicationContext context;

    private final MockMvc mockMvc;

    public PermissionControllerTest(MockMvc mockMvc) {
        this.mockMvc = mockMvc;
    }

    @Test
    void MockMvcShouldNotNull() {
        assertTrue(true);
    }

    @BeforeEach
    void setUp() {
        assertTrue(true);
    }

    @AfterEach
    void tearDown() {
        assertTrue(true);
    }

    @Test
    void getPermissions() throws Exception {
        MvcResult result = mockMvc.perform(get("/api/permission").content(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(status().is2xxSuccessful()).andReturn();
        assertThat(result.getResponse()).isNotNull();
    }

    @Test
    void createPermission() {
        assertTrue(true);
    }

    @Test
    void updatePermission() {
    }

    @Test
    void testGetPermissions() {
    }
}

