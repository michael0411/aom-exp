LIBVPX_TEST_SRCS-yes += clear_system_state.h
LIBVPX_TEST_SRCS-yes += register_state_check.h
LIBVPX_TEST_SRCS-yes += test.mk
LIBVPX_TEST_SRCS-yes += acm_random.h
LIBVPX_TEST_SRCS-yes += md5_helper.h
LIBVPX_TEST_SRCS-yes += codec_factory.h
LIBVPX_TEST_SRCS-yes += test_libvpx.cc
LIBVPX_TEST_SRCS-yes += util.h
LIBVPX_TEST_SRCS-yes += video_source.h

##
## BLACK BOX TESTS
##
## Black box tests only use the public API.
##
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += altref_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += config_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += cq_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += datarate_test.cc

LIBVPX_TEST_SRCS-yes                   += encode_test_driver.cc
LIBVPX_TEST_SRCS-yes                   += encode_test_driver.h
LIBVPX_TEST_SRCS-$(CONFIG_ENCODERS)    += error_resilience_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_ENCODERS)    += i420_video_source.h
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += keyframe_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += borders_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += resize_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += cpu_speed_test.cc

LIBVPX_TEST_SRCS-$(CONFIG_DECODERS)    += ../md5_utils.h ../md5_utils.c
LIBVPX_TEST_SRCS-yes                   += decode_test_driver.cc
LIBVPX_TEST_SRCS-yes                   += decode_test_driver.h
LIBVPX_TEST_SRCS-$(CONFIG_DECODERS)    += ivf_video_source.h

## WebM Parsing
NESTEGG_SRCS                           += ../nestegg/halloc/halloc.h
NESTEGG_SRCS                           += ../nestegg/halloc/src/align.h
NESTEGG_SRCS                           += ../nestegg/halloc/src/halloc.c
NESTEGG_SRCS                           += ../nestegg/halloc/src/hlist.h
NESTEGG_SRCS                           += ../nestegg/include/nestegg/nestegg.h
NESTEGG_SRCS                           += ../nestegg/src/nestegg.c
LIBVPX_TEST_SRCS-$(CONFIG_DECODERS)    += $(NESTEGG_SRCS)
LIBVPX_TEST_SRCS-$(CONFIG_DECODERS)    += webm_video_source.h

LIBVPX_TEST_SRCS-$(CONFIG_DECODERS)    += test_vector_test.cc

##
## WHITE BOX TESTS
##
## Whitebox tests invoke functions not exposed via the public API. Certain
## shared library builds don't make these functions accessible.
##
ifeq ($(CONFIG_SHARED),)

## VP8
ifneq ($(CONFIG_VP8_ENCODER)$(CONFIG_VP8_DECODER),)

# These tests require both the encoder and decoder to be built.
ifeq ($(CONFIG_VP8_ENCODER)$(CONFIG_VP8_DECODER),yesyes)
LIBVPX_TEST_SRCS-yes                   += vp8_boolcoder_test.cc
endif

LIBVPX_TEST_SRCS-yes                   += idct_test.cc
LIBVPX_TEST_SRCS-yes                   += intrapred_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_POSTPROC)    += pp_filter_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_ENCODERS)    += sad_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += set_roi.cc
LIBVPX_TEST_SRCS-yes                   += sixtap_predict_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += subtract_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += vp9_subtract_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += variance_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_DECODER) += vp8_decrypt_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP8_ENCODER) += vp8_fdct4x4_test.cc

endif # VP8

## VP9
ifneq ($(CONFIG_VP9_ENCODER)$(CONFIG_VP9_DECODER),)

# These tests require both the encoder and decoder to be built.
ifeq ($(CONFIG_VP9_ENCODER)$(CONFIG_VP9_DECODER),yesyes)
LIBVPX_TEST_SRCS-yes                   += vp9_boolcoder_test.cc

# IDCT test currently depends on FDCT function
LIBVPX_TEST_SRCS-yes                   += idct8x8_test.cc
LIBVPX_TEST_SRCS-yes                   += superframe_test.cc
LIBVPX_TEST_SRCS-yes                   += tile_independence_test.cc
endif

LIBVPX_TEST_SRCS-$(CONFIG_VP9)         += convolve_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += fdct4x4_test.cc

LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += fdct8x8_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += dct16x16_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += variance_test.cc
LIBVPX_TEST_SRCS-$(CONFIG_VP9_ENCODER) += dct32x32_test.cc

endif # VP9


endif


##
## TEST DATA
##
LIBVPX_TEST_DATA-$(CONFIG_ENCODERS) += hantro_collage_w352h288.yuv
LIBVPX_TEST_DATA-$(CONFIG_ENCODERS) += hantro_odd.yuv

LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-001.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-002.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-003.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-004.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-005.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-006.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-007.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-008.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-009.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-010.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-011.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-012.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-013.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-014.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-015.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-016.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-017.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-018.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1400.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1411.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1416.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1417.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1402.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1412.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1418.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1424.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-01.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-02.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-03.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-04.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1401.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1403.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1407.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1408.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1409.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1410.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1413.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1414.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1415.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1425.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1426.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1427.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1432.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1435.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1436.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1437.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1441.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1442.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-04-partitions-1404.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-04-partitions-1405.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-04-partitions-1406.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1428.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1429.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1430.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1431.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1433.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1434.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1438.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1439.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1440.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1443.ivf
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-001.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-002.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-003.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-004.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-005.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-006.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-007.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-008.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-009.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-010.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-011.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-012.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-013.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-014.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-015.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-016.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-017.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-00-comprehensive-018.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1400.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1411.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1416.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-01-intra-1417.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1402.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1412.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1418.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-02-inter-1424.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1401.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1403.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1407.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1408.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1409.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1410.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1413.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1414.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1415.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1425.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1426.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1427.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1432.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1435.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1436.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1437.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1441.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-1442.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-01.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-02.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-03.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-03-segmentation-04.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-04-partitions-1404.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-04-partitions-1405.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-04-partitions-1406.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1428.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1429.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1430.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1431.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1433.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1434.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1438.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1439.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1440.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP8_DECODER) += vp80-05-sharpness-1443.ivf.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-00.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-00.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-01.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-01.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-02.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-02.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-03.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-03.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-04.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-04.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-05.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-05.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-06.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-06.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-07.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-07.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-09.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-09.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-11.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-11.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-12.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-12.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-13.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-13.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-14.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-14.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-15.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-15.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-17.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-17.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-19.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-19.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-20.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-20.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-21.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-21.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-22.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-22.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-23.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-23.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-24.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-24.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-25.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-25.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-26.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-26.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-27.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-27.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-28.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-28.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-29.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-29.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-30.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-30.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-31.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-31.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-33.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-33.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-35.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-35.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-36.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-36.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-37.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-37.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-38.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-38.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-39.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-39.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-40.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-40.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-41.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-41.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-42.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-42.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-43.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-43.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-44.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-44.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-45.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-45.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-46.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-46.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-47.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-47.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-48.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-48.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-49.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-49.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-50.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-50.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-51.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-51.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-52.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-52.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-53.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-53.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-54.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-54.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-55.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-55.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-56.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-56.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-57.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-57.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-58.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-58.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-59.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-59.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-60.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-60.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-61.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-61.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-62.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-62.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-63.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-00-quantizer-63.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-1.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-1.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-2.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-2.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-3.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-3.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-4.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-4.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-5.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-5.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-6.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-6.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-7.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-01-sharpness-7.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-08x66.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-10x66.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-16x66.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-18x66.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-32x66.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-34x66.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-64x66.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x08.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x08.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x10.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x10.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x16.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x16.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x18.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x18.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x32.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x32.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x34.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x34.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x64.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x64.webm.md5
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x66.webm
LIBVPX_TEST_DATA-$(CONFIG_VP9_DECODER) += vp90-02-1-size-66x66.webm.md5
