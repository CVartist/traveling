package com.example.traveling.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
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
public class SysNoticeAspect {
    @Pointcut("bean(testController)")
//    @Pointcut("bean(*Controller)")
    public void doNotice() {

    }

    @Before("doNotice()")
    public void doBefore() {
        log.warn("@Before: 前置通知执行了~");
    }

    @After("doNotice()")
    public void doAfter() {
        log.warn("@After: 后置通知执行了~");
    }

    @AfterReturning("doNotice()")
    public void doAfterReturning() {
        log.warn("@AfterReturning: 返回通知执行了~");
    }

    @AfterThrowing("doNotice()")
    public void doAfterThrowing() {
        log.warn("@AfterThrowing: 异常通知执行了~");
    }

    /**
     * 测试环绕通知
     *
     * @Around 注解描述当前方法是一个环绕通知, 环绕通知一定有切入点, 环绕通知一定有通知方法
     * ProceedingJoinPoint 参数类型: 用于获取切入点方法的信息
     * Object proceed = joinPoint.proceed(); 用于执行切入点方法
     *
     *
     */
    @Around("doNotice()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        log.warn("@Around: 环绕通知在方法执行前执行了~");
        Object proceed = joinPoint.proceed();
        log.warn("@Around: 环绕通知在方法执行后执行了~");
        return proceed;
    }
}
