package com.ramirez;

import com.intuit.karate.junit5.Karate;

class KarateTests {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:com/ramirez/tests/sample.feature");
    }
}