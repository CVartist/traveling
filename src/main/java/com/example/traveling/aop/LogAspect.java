package com.example.traveling.aop;

import com.example.traveling.pojo.entity.Log;
import com.example.traveling.service.LogService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Aspect
@Component
@Slf4j
public class LogAspect {
    /*@Pointcut("@annotation(RequiredLog)")
    public void log() {
    }*/

    /*@Around("@annotation(RequiredLog)")
    public void doLog(ProceedingJoinPoint joinPoint) throws Throwable {
        log.warn("开始记录日志...");
        int status = 1;
        String error = null;
        long time = 0L;
        long t1 = System.currentTimeMillis();
        try { //CTRL + ALT + T ➡ 生成指定代码块
            joinPoint.proceed();
            long t2 = System.currentTimeMillis();
            time = t2 - t1; // 记录执行时长
        } catch (Throwable throwable) {
            long t3 = System.currentTimeMillis();
            time = t3 - t1;
            throwable.printStackTrace();
        }
    }*/

    @Around("@annotation(com.example.traveling.aop.RequiredLog)")
    public Object doLog(ProceedingJoinPoint joinPoint) throws Throwable {
        log.warn("开始记录日志...");
        int status = 1; //记录状态值,默认为1
        String error = null; //记录错误信息,默认为null
        long time = 0L; //记录执行时长,默认为0毫秒
        long t1 = System.currentTimeMillis();
        try { //CTRL + ALT + T → 生成指定代码块
            Object result = joinPoint.proceed();
            long t2 = System.currentTimeMillis(); //说明代码执行没有异常,
            time = t2 - t1; //记录正常执行完的时间
            return result;
        } catch (Throwable throwable) {
            //一旦目标方法执行时,出现异常,就会执行catch中的代码
            long t3 = System.currentTimeMillis();
            time = t3 - t1; //记录不正常执行完的时间
            status = 0; // 表示程序不是正常执行完毕的
            error = throwable.getMessage();
            throw throwable; // 抛出异常,可以被全局异常处理器拦截
        } finally {
            saveLog(joinPoint, time, status, error);
        }
    }

    @Autowired
    private LogService service;

    private void saveLog(ProceedingJoinPoint joinPoint, long time, int status, String error) throws NoSuchMethodException, JsonProcessingException {
        //①获取IP地址
        //ServletRequestAttributes是Spring中的一个类,提供访问HTTP请求属性的方法
        //RequestContextHolder是Spring中的一个工具类,用于获取当前线程中的请求属性
        ServletRequestAttributes requestAttributes =
                (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        //获取本次的请求对象
        HttpServletRequest request = requestAttributes.getRequest();
        //获取IP地址
        String ip = request.getRemoteAddr();
        String username = null;
        //获取SpringSecurity在后端封装的登录信息(内容很杂)
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            //获取具体的用户信息
            UserDetails principal = (UserDetails) authentication.getPrincipal();
            if (principal != null) {
                username = principal.getUsername();
            }
        }

        Class<?> targetCls = joinPoint.getTarget().getClass();

        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method targetMethod = targetCls.getDeclaredMethod(
                signature.getName(),
                signature.getParameterTypes()
        );
        RequiredLog annotation = targetMethod.getAnnotation(RequiredLog.class);
        String operation = annotation.value();
        String method = targetCls.getName() + "." + targetMethod.getName();
        String params = new ObjectMapper().writeValueAsString(joinPoint.getArgs());
        Log log = new Log();
        log.setTime(time);
        log.setStatus(status);
        log.setError(error);
        log.setIp(ip);
        log.setCreatedTime(new Date());
        log.setUsername(username);
        log.setOperation(operation);
        log.setMethod(method);
        log.setParams(params);
        service.insert(log);
    }

}
