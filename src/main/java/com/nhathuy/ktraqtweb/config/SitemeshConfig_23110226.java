package com.nhathuy.ktraqtweb.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import jakarta.servlet.Filter;

@Configuration
public class SitemeshConfig_23110226 {

    @Bean
    public FilterRegistrationBean<Filter> siteMeshFilter() {
        FilterRegistrationBean<Filter> filter = new FilterRegistrationBean<>();
        filter.setFilter(new CustomSiteMeshFilter_23110226());
        filter.addUrlPatterns("/*");
        filter.setName("sitemesh");
        filter.setOrder(1);
        return filter;
    }

    public static class CustomSiteMeshFilter_23110226 extends ConfigurableSiteMeshFilter {
        @Override
        protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
            builder
                .addDecoratorPath("/admin/*", "/views/layout/admin_decorator.jsp")
                .addDecoratorPath("/*", "/views/layout/user_decorator.jsp")
                .addExcludedPath("/api/*")
                .addExcludedPath("/resources/*")
                .addExcludedPath("/static/*");
        }
    }
}


