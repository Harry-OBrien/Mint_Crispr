#include <unity.h>
#include <PCA9548A_Mock.hpp>

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

// The active channels do not change if the passed value is greater than or equal to 8, or less than 0.
void test_no_change_on_activating_invalid_channel(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

// The active channels do not change if the passed value is greater than or equal to 8, or less than 0.
void test_no_change_on_deactivating_invalid_channel(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

// The state tracked in software should reset to 0 when reset is called
void test_reset_sets_state_zero(void)
{
    TEST_FAIL_MESSAGE("Test not implemented.");
}

int main(int argc, char **argv)
{
    UNITY_BEGIN();

    RUN_TEST(test_channel_activated_correctly);
    RUN_TEST(test_channel_deactivated_correctly);

    RUN_TEST(test_no_change_on_activating_invalid_channel);
    RUN_TEST(test_no_change_on_deactivating_invalid_channel);

    RUN_TEST(test_reset_sets_state_zero);

    UNITY_END();
}