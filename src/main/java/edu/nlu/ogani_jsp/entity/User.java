package edu.nlu.ogani_jsp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer userId;
    private String email;
    private String password;
    private String fullName;
    private boolean enabled;
    private String photos;
    private Role role;
}
