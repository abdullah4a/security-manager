package com.itinsynclts.securitymanager;

import com.proally.securitymanager.SecurityManagerApplication;
import com.proally.securitymanager.models.RoleModel;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.reactive.AutoConfigureWebTestClient;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(classes = SecurityManagerApplication.class)
@AutoConfigureWebTestClient
class SecurityManagerApplicationTests {
    @Autowired
    private WebApplicationContext context;
    private MockMvc mockMvc;

    @Before
    private void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    void exampleTest(@Autowired WebTestClient webClient) {
        List<RoleModel> roleList=null;
        webClient
                .get().uri("/api/role?active=" + true)
                .exchange()
                .expectStatus().isOk().returnResult().getResponseBody();
    }

    @Test
    public void getRoles() {
        System.out.println("Working");
    }

    //    @NonNull
//    private WebClient webClient;
//    @NonNull
//    private final RoleRepository roleRepository;
    @Test
    void contextLoads() {
    }

    @Test
    public void getAllRoles() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/api/role"))
                .andExpect(status().is2xxSuccessful())
                .andReturn().getResponse().getContentAsString();
    }

    @Test
    void MockMvcShouldNotNull() {
        assertNotNull(mockMvc);
    }
}
