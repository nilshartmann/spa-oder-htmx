package nh.recipify.domain.web;

import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.Objects;
import java.util.stream.Collectors;

public class CssClassNameUtil {

    public static String cssClassName(String... names) {
        return Arrays.stream(names)
            .filter(Objects::nonNull)
            .map(String::trim)
            .filter(StringUtils::hasText)
            .collect(Collectors.joining(" "));
    }

}
