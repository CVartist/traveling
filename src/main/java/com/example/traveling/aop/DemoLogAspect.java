package com.example.traveling.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class DemoLogAspect {
    @Pointcut("execution(* com.example.traveling.controller.TestController.wan*(..))")
    private void log() {
    }

    @Around("log()")
    public Object around(ProceedingJoinPoint jp) throws Throwable {
        System.out.println("------------------------------");
        Long startTime = System.currentTimeMillis();
        jp.proceed();
        Long endTime = System.currentTimeMillis();
        Long totalTime = endTime - startTime;
        System.out.println("消耗时间：" + totalTime + "ms");
        return null;
    }
}
