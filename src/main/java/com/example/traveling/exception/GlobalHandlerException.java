package com.example.traveling.exception;

import com.example.traveling.response.JsonResult;
import com.example.traveling.response.StatusCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalHandlerException {
    /**
     * 校验参数校验异常
     */
    @ExceptionHandler(IllegalArgumentException.class)
    public JsonResult doHandleIllegalArgumentException(IllegalArgumentException e) {
        log.warn("IllegalArgumentException msg is {}", e.getMessage());
        return new JsonResult(StatusCode.OPERATION_FAILED, e.getMessage());
    }

    /**
     * 校验运行时异常
     */
    /*@ExceptionHandler(RuntimeException.class)
    public JsonResult doHandleRuntimeException(RuntimeException e) {
        log.error("RuntimeException msg is {}", e.getMessage());
        return new JsonResult(StatusCode.OPERATION_FAILED, e.getMessage());
    }
*/
    /**
     * 拦截SpringSecurity校验用户名不存在时,抛出异常
     */
    @ExceptionHandler(InternalAuthenticationServiceException.class)
    public JsonResult doHandleInternalAuthenticationServiceException(InternalAuthenticationServiceException e) {
        log.error("InternalAuthenticationServiceException msg is {}", e.getMessage());
        return new JsonResult(StatusCode.USERNAME_ERROR, e.getMessage());
    }

    /**
     * 拦截SpringSecurity校验密码不匹配时,抛出异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(BadCredentialsException.class)
    public JsonResult doHandleBadCredentialsException(BadCredentialsException e) {
        log.error("BadCredentialsException msg is {}", e.getMessage());
        return new JsonResult(StatusCode.PASSWORD_ERROR, e.getMessage());
    }

    /**
     * 拦截SpringSecurity权限不匹配时所报异常
     * @param e
     * @return
     */
    @ExceptionHandler(AccessDeniedException.class)
    public JsonResult doHandleAccessDeniedException(AccessDeniedException e) {
        log.error("AccessDeniedException msg is {}", e.getMessage());
        return new JsonResult(StatusCode.FORBIDDEN_ERROR, e.getMessage());
    }
}
