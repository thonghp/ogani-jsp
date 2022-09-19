package edu.nlu.ogani_jsp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    private Integer categoryId;
    private String name;
    private String alias;
    private boolean enabled;

    public Category(String name, String alias, boolean enabled) {
        this.name = name;
        this.alias = alias;
        this.enabled = enabled;
    }
}
