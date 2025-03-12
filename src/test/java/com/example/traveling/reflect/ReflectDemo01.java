package com.example.traveling.reflect;

import java.lang.reflect.Method;

/**
 * java反射机制
 * 反射是java中的动态机制,以前写的java代码只是在编译期执行的内容,如果运行过程中想要执行,
 * 就需要使用反射了,反射允许我们在运行时期再确定对象的实例化,方法的调用以及属性的操作等等内容,
 * 使得我们的程序的灵活性大大的提升
 * Test.java → Test.class 编译期 → 运行期
 */
public class ReflectDemo01 {
    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException {
        /*
         * Class类对象 不是类的关键字class
         * Class类的每一个实例都用于表示JVM中加载的一个类,并且每个类一旦加载,一定有一个对应的Class实例,
         * 并且该实例有且仅有一个
         * new User() → 加载User → 创建Class User对象
         * 该对象是可以在运行过程中使用的,并且该对象内部封装了被加载的类的所有的信息
         * 所有反射的操作基本第一步就是要获取操作对象的Class实例
         * */
        //获取String类的类对象
        //①类名.class
        //②对象.getClass()
        //③Class.forName(类的全路径)
        // Class<String> stringClass = String.class;
        // Class stringClass = new String().getClass();
        Class stringClass = Class.forName("java.lang.String");
        System.out.println("类全名: " + stringClass.getName());
        System.out.println("类名: " + stringClass.getSimpleName());
        //获取类中的所有的公开方法
        Method[] methods = stringClass.getMethods();
        System.out.println("输出" + stringClass.getSimpleName() + "类中的所有公开方法");
        for (Method method : methods) {
            System.out.println(method);
        }
        Method method = stringClass.getDeclaredMethod("compareTo",String.class);
        System.out.println(method);
    }
}
