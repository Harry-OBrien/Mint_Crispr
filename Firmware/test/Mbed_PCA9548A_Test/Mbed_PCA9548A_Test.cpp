#include <unity.h>
#include <Arduino.h>

// On startup, all downstream busses should be set to 8
void test_all_channels_zero_on_power_cycle(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

// On reset, all downstream busses should be set to 8
void test_all_channels_zero_on_reset(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

// A channel can be set to be active correctly
void test_channel_activated_correctly(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

// A channel can be set to be inactive correctly
void test_channel_deactivated_correctly(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

// The tracking that we're doing in software matches the value on the PCA9548A chip.
void test_channel_tracking_correct(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

int main(int argc, char **argv)
{
    UNITY_BEGIN();

    RUN_TEST(test_all_channels_zero_on_power_cycle);
    RUN_TEST(test_all_channels_zero_on_reset);
    RUN_TEST(test_channel_activated_correctly);
    RUN_TEST(test_channel_deactivated_correctly);

    UNITY_END();
}