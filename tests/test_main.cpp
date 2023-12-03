#include "../src/sources/utils.cpp"
#include <catch2/catch_test_macros.hpp>
#include <iostream>

TEST_CASE("Hello world") { REQUIRE(helper::getHelloWorld() == "Hello World!"); }
