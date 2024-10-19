package nh.recipify;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.TestConfiguration;

@TestConfiguration(proxyBeanMethods = false)
public class TestBackendApplication {

    private static final Logger log = LoggerFactory.getLogger(TestBackendApplication.class);

    public static void main(String[] args) {

        var userDir = System.getProperties().getProperty("user.dir");

        if (!userDir.contains("spa-oder-htmx/backend")) {
            log.warn("""
                ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ Current user dir '{}' does not seem to be 'backend' module of this project.
                Please make sure, you run recipify-backend from 'backend' project
                  (You might need to adjust working directory)
                """, userDir);
        }


        log.info("""
            ### LOCAL DEVELOPMENT. ACTIVATING 'dev' PROFILE! ###""");


        System.setProperty("spring.profiles.active", "dev");
        SpringApplication.from(BackendApplication::main).with(PostgresDbTestContainer.class).run(args);
    }

}
