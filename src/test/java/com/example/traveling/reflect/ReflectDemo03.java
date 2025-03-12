package com.example.traveling.reflect;


import java.lang.reflect.Constructor;
import java.util.Date;

/**
 * 利用字节码文件创建实例
 */
public class ReflectDemo03 {
    public static void main(String[] args) throws Exception {
        //java.util.Date
        //String line = new Scanner(System.in).nextLine();
        //利用全路径,创建对应的字节码文件对象
        Class cls = Class.forName("com.example.traveling.reflect.Person");
        //利用对象的无参构造创建对象
        Object o = cls.newInstance();
        System.out.println(o);
        //利用含参构造创建对象:
        // ①获取指定的构造器
        Constructor constructor = cls.getConstructor(String.class, int.class);
        // ②执行构造器,并传参数
        o = constructor.newInstance("王五", 21);
        System.out.println(o);
        System.out.println(new Date());
    }
}
