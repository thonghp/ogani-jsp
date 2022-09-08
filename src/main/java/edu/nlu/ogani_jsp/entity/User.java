package edu.nlu.ogani_jsp.entity;

import lombok.Data;

@Data
public class User {
    private Integer userId;
    private String email;
    private String password;
    private String fullName;
    private boolean enabled;
    private String photos;
    private Role role;
}
