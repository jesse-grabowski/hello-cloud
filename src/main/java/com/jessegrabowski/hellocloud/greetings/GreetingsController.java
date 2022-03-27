package com.jessegrabowski.hellocloud.greetings;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingsController {

    @GetMapping(path = "/hello", produces = MediaType.TEXT_PLAIN_VALUE)
    public @ResponseBody String hello(@RequestParam(required = false, name = "name", defaultValue = "World") String name) {
        return "Hello, ".concat(name);
    }

    @GetMapping(path = "/goodbye", produces = MediaType.TEXT_PLAIN_VALUE)
    public @ResponseBody String goodbye(@RequestParam(required = false, name = "name", defaultValue = "World") String name) {
        return "Goodbye, ".concat(name);
    }
}
