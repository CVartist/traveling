package com.example.traveling.reflect;


import java.lang.reflect.Method;

/**
 * 利用字节码文件调用方法
 */
public class ReflectDemo04 {
    public static void main(String[] args) throws Exception {
        Person person = new Person();
        person.say();
        Class cls = Class.forName("com.example.traveling.reflect.Person");
        //创建对象
        Object o = cls.newInstance();
        //获取方法
        Method say = cls.getMethod("say");
        //调用方法 对象.方法名() → 方法对象.invoke(对象);
        say.invoke(o);
        //获取含参方法
        Method doing = cls.getMethod("doing", String.class, int.class);
        //调用方法,如果方法含参,需要传参数
        doing.invoke(o, "学java", 10);
        //调用私有方法 暴力反射
        Method secret = cls.getDeclaredMethod("secret");
        //强行打开该私有方法的权限,私有的内容也可以调用了
        secret.setAccessible(true);
        secret.invoke(o);
    }
}