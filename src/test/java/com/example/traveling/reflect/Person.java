package com.example.traveling.reflect;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person {
    private String name = "张三";
    private int age = 18;

    public void say() {
        System.out.println(name + "say: Hello!");
    }

    public void cry() {
        System.out.println(name + "cry: WaWaWa!");
    }

    public void sleep() {
        System.out.println(name + ": sleep!");
    }

    public void run() {
        System.out.println(name + ":running!");
    }

    public void doing(String thing) {
        System.out.println(name + ":" + thing);
    }

    public void doing(String thing, int sum) {
        for (int i = 0; i < sum; i++) {
            System.out.println(name + ":" + thing);
        }
    }

    private void secret() {
        System.out.println(name + ": this is a secret!");
    }
}
