package com.example.traveling.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * 切面类
 *
 * @Aspect 注解描述当前类是一个切面类型, 只要是切面, 一定包含以下两部分
 * ①切入点: 指定哪些内容(点)需要扩展功能
 * ②通知: 在切入点要执行的扩展功能,就写在通知方法中
 */
@Component
@Slf4j
@Aspect
public class SysTimeAspect {
    /**
     * @Pointcut注解一般都是描述一个方法,在注解中定义切入点 ①方法就是普通方法,内部不需要写任何东西,只是一个载体
     * ②注解中写的内容是一个切入点表达式,通过该表达式,我们可以选中任意类中的元素
     */
//    @Pointcut("bean(testController)")
//    @Pointcut("execution(* cn.tedu.traveling.controller.TestController.wan*())")
    @Pointcut("@annotation(com.example.traveling.aop.RequiredTime)")
    private void timePointCut() {

    }

    /**
     * @Around 表示当前方法是环绕通知
     * 通知有多种类型,环绕通知是用于方法前后执行时的
     * 通知时也需要绑定切入点,绑定的方式就是在注解中指定切入点方法
     * <p>
     * ProceedingJoinPoint 该对象实例,可以理解为切面插入的连接点方法本身,
     * 并且实例调用proceed方法后,会返回一个Object结果,该结果就是插入的连接点方法返回的结果
     */
    @Around("timePointCut()")
    public Object notice1(ProceedingJoinPoint joinPoint) throws Throwable {
        long t1 = System.currentTimeMillis();
        Object result = joinPoint.proceed();//wan2()
        long t2 = System.currentTimeMillis();
        log.info("共耗时 {} 毫秒", (t2 - t1));
        System.out.println(result);
        return result;
    }
}
