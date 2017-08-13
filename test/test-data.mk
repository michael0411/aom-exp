LIBAOM_TEST_SRCS-yes += test-data.mk

# Encoder test source
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += hantro_collage_w352h288.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += hantro_odd.yuv

LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_10_420.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_10_422.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_10_444.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_10_440.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_12_420.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_12_422.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_12_444.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_12_440.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_8_420_a10-1.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_8_420.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_8_422.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_8_444.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += park_joy_90p_8_440.yuv

LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += desktop_credits.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += niklas_1280_720_30.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += rush_hour_444.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += screendata.y4m
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += niklas_640_480_30.yuv

ifeq ($(CONFIG_DECODE_PERF_TESTS),yes)
# Encode / Decode test
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += niklas_1280_720_30.yuv
endif  # CONFIG_DECODE_PERF_TESTS

ifeq ($(CONFIG_ENCODE_PERF_TESTS),yes)
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += desktop_640_360_30.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += kirland_640_480_30.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += macmarcomoving_640_480_30.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += macmarcostationary_640_480_30.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += niklas_1280_720_30.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += tacomanarrows_640_480_30.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += tacomasmallcameramovement_640_480_30.yuv
LIBAOM_TEST_DATA-$(CONFIG_AV1_ENCODER) += thaloundeskmtg_640_480_30.yuv
endif  # CONFIG_ENCODE_PERF_TESTS

# sort and remove duplicates
LIBAOM_TEST_DATA-yes := $(sort $(LIBAOM_TEST_DATA-yes))

