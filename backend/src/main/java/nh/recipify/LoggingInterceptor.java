package nh.recipify;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class LoggingInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(LoggingInterceptor.class);

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        request.setAttribute("startTime", System.currentTimeMillis());
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        var timeTaken = (System.currentTimeMillis() - (Long) request.getAttribute("startTime"));
        var it = request.getHeaderNames().asIterator();

        StringBuilder headerBuilder = new StringBuilder();

        while (it.hasNext()) {
            var name = it.next();
            if (name.toLowerCase().startsWith("hx-")) {
                headerBuilder.append(
                    String.format("  %s: %s%n", name, request.getHeader(name))
                );
            }
        }

        log.info("\n  {} {} - {}ms\n{}",
            response.getStatus(),
            request.getRequestURL(),
            timeTaken,
            headerBuilder
        );
    }

    private static String now() {
        LocalTime currentTime = LocalTime.now();
        String formattedTime = currentTime.format(formatter);
        return formattedTime;
    }
}