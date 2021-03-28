#include <unity.h>
#include <Arduino.h>

// We must be able to access all (16 in total) sensors
void test_all_light_sensors_readable(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

int main(int argc, char **argv)
{
    UNITY_BEGIN();

    RUN_TEST(test_all_light_sensors_readable);

    UNITY_END();
}