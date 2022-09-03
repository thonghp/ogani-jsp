package edu.nlu.ogani_jsp.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "role")
public class Role {
    private Integer roleId;
    private String name;

    @Id
    @Column(name = "role_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    @Column(length = 40, nullable = false, unique = true)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" + "roleId=" + roleId + ", name='" + name + '\'' + '}';
    }
}
