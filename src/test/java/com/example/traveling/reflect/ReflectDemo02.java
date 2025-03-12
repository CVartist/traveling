package com.example.traveling.reflect;

import java.lang.reflect.Method;

/**
 * 利用反射获取字节码文件中的方法
 */
public class ReflectDemo02 {
    public static void main(String[] args) throws Exception {
        Class<Person> cls = Person.class;
        //获取字节码文件中的所有公开方法(public 并且父类继承的方法也会输出)
        Method[] methods = cls.getMethods();
        for (Method method : methods) {
            System.out.println(method);
        }

        //获取字节码文件中指定的公开方法
        Method method = cls.getMethod("doing", String.class, int.class);
        System.out.println(method);

        //获取字节码文件中的所有方法(包括私有的,但是不包括继承的)
        methods = cls.getDeclaredMethods();
        for (Method method1 : methods) {
            System.out.println(method1);
        }

        //获取字节码文件中的所有方法(包括私有的,但是不包括继承的)
        method = cls.getDeclaredMethod("secret");
        System.out.println(method);
    }
}
