package com.example.traveling.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * SpringSecurity的配置类
 */
@Slf4j
@Configuration
// 开启方法的授权检测功能
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Bean
    public PasswordEncoder passwordEncoder() {
        // 指定密码不加密
        // return NoOpPasswordEncoder.getInstance();
        return new BCryptPasswordEncoder();
    }

    // 配置认证管理器
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    // 配置黑名单
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // 默认访问自己项目中的登录页面
        // 会判断没有登录的时候,会自动跳转指定页面 http://localhost:8080/login.html
        http.formLogin().loginPage("/login.html");
        //配置白名单(不需要校验也可以直接访问的资源)
        //String[] urls = {"/reg.html", "/login.html", "/reg", "/login"};
        //调用方法时的顺序,必须要是这个顺序,否则不生效!
        // http.authorizeRequests()
        //         .mvcMatchers(urls) // 匹配资源路径
        //         .permitAll() // 直接放行上面的资源(不需要登录,也可以访问)
        //         .anyRequest() // 除了上述匹配的资源以外的其他资源
        //         .authenticated(); // 其他资源必须要登录认证才可以访问
        // 配置黑名单
        String[] urls = {"/admin.html", "/personal.html", "/postArticle.html", "/articleManagement.html", "/v1/users"};
        http.authorizeRequests()
                .mvcMatchers(urls) // 匹配资源路径
                .authenticated() // 匹配资源必须要登录认证才可以访问
                .anyRequest() // 除了上述匹配的资源以外的其他资源
                .permitAll(); // 直接放行其他的资源(不需要登录,也可以访问)
        //关闭默认开启的跨域攻击
        http.csrf().disable();
        //super.configure(http);//是SpringSecurit
    }
}
