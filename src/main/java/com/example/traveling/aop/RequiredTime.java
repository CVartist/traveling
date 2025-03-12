package com.example.traveling.aop;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD) // 描述注解的适用范围
@Retention(RetentionPolicy.RUNTIME) // 表示该注解在运行时存活
public @interface RequiredTime {
}
