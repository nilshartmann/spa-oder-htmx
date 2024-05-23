package nh.recipify.domain.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloWorldController {

    /**
     * "Regulärer" GET-Controller, der das hello-world.html-Template zurückliefert
     */
    @GetMapping("/hello")
    public String hello() {
        return "hello-world";
    }

    /*
     TODO

     - Template hello-response.html mit th:fragment anlegen
     - /hello-world-Mapping mit headers=HX-Request
      - Antwort z.B. "hello-response :: response"
     */

    @GetMapping(path = "/hello-world", headers = "HX-Request")
    public String helloWorld() {
        return "hello-response :: response";
    }

}
