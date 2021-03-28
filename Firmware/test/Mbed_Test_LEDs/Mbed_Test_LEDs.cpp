#include <unity.h>
#include <Arduino.h>

// We must be able to power on all 16 LEDs
void test_all_LEDs_togglable(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

int main(int argc, char **argv)
{
    UNITY_BEGIN();

    RUN_TEST(test_all_LEDs_togglable);

    UNITY_END();
}