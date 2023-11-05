Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E09110940
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbEo25L7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699207240; x=1730743240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ri+XLlaDUZ9OQFuKPq8nt7Euvo/5WNPX1aK4GI/2Xn0=;
  b=KbEo25L7UjoTX3ygn2pv94vPoIe77NrNbX/0U70Et01tEodv7VMOod3k
   p4HctD+82MXHUTcnnbygVIwNlRK9yzgKR2lIlHIE71DPJF5V2v7MDtE0q
   13wgXpY1LAza4+gaRDegJEGlEgdpYZNuY0SVp9LQV7nJkmLDUsS6KDNtF
   lj+6hON6GdJRtu+rkJyGS1URpS8MMSKfVti6WtcJs+HzVLcW4Pmjwe0Pc
   t+fG21mVg5TkyP4I5PIkzH+eFwOI1QqFysohecgvmU/jI2PYxavc85FsZ
   ZYKPYeePCDdoFSjc04Ix/HbVBaB/2gMgEqySKZgVtzoUSoVBZBhmypFpL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="453469440"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="453469440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 10:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905846227"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="905846227"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 10:00:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzhQI-0005gS-22;
	Sun, 05 Nov 2023 18:00:34 +0000
Date: Mon, 6 Nov 2023 01:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:587:15: warning:
 variable 'fw_load_retries' set but not used
Message-ID: <202311060146.EfrnYJgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darren,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   765670365233dc7ad139e5e96c437d333ae94543
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060146.EfrnYJgB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060146.EfrnYJgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060146.EfrnYJgB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:550:18: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:587:15: warning: variable 'fw_load_retries' set but not used [-Wunused-but-set-variable]
     587 |         unsigned int fw_load_retries = 2 * 1000;
         |                      ^
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1460:6: warning: array index 1 is past the end of the array (that has type 'unsigned int[0]') [-Warray-bounds]
    1460 |         if (msg->payload[VXD_PTD_MSG_OFFSET] != 0) {
         |             ^            ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_dec.h:90:2: note: array 'payload' declared here
      90 |         unsigned int payload[0];
         |         ^
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1496:2: warning: array index 1 is past the end of the array (that has type 'unsigned int[0]') [-Warray-bounds]
    1496 |         item->msg.payload[VXD_PTD_MSG_OFFSET] = stream->ptd;
         |         ^                 ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_dec.h:90:2: note: array 'payload' declared here
      90 |         unsigned int payload[0];
         |         ^
   4 warnings generated.
--
>> drivers/media/platform/img/vxe-vxd/decoder/vdecdd_utils_buf.c:315:15: warning: variable 'total_vert_samples' set but not used [-Wunused-but-set-variable]
     315 |         unsigned int total_vert_samples = 0;
         |                      ^
   drivers/media/platform/img/vxe-vxd/decoder/vdecdd_utils_buf.c:588:15: warning: variable 'total_vert_samples' set but not used [-Wunused-but-set-variable]
     588 |         unsigned int total_vert_samples;
         |                      ^
   2 warnings generated.
--
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:220:16: warning: variable 'group_size' set but not used [-Wunused-but-set-variable]
     220 |         unsigned char group_size = 0;
         |                       ^
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:786:2: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     786 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_PICTURE_ROTATION],
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     787 |                           MSVDX_CMDS, ALTERNATIVE_OUTPUT_PICTURE_ROTATION,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     788 |                           USE_AUX_LINE_BUF, benable_auxline_buf ? 1 : 0, unsigned int, int);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:58: note: expanded from macro 'REGIO_WRITE_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:773:2: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     773 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     774 |                           MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     775 |                           ALT_BIT_DEPTH_LUMA_MINUS8,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~
     776 |                           output_config->pixel_info.bitdepth_y - 8, unsigned int, unsigned int);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:58: note: expanded from macro 'REGIO_WRITE_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:769:2: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     769 |         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_ALTERNATIVE_OUTPUT_CONTROL],
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     770 |                           MSVDX_CMDS, ALTERNATIVE_OUTPUT_CONTROL,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     771 |                           ALT_BIT_DEPTH_CHROMA_MINUS8,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     772 |                           output_config->pixel_info.bitdepth_c - 8, unsigned int, unsigned int);
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:58: note: expanded from macro 'REGIO_WRITE_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:718:4: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     718 |                         REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     719 |                                           MSVDX_CMDS, OPERATING_MODE,
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     720 |                                           CHROMA_INTERLEAVED,
         |                                           ~~~~~~~~~~~~~~~~~~~
     721 |                                           row_stride_code >> 3, unsigned int, unsigned int);
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:58: note: expanded from macro 'REGIO_WRITE_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:708:3: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     708 |                 REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     709 |                                   MSVDX_CMDS, OPERATING_MODE, ROW_STRIDE,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     710 |                                   row_stride_code & 0x7, unsigned int, unsigned int);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:58: note: expanded from macro 'REGIO_WRITE_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:702:3: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     702 |                 REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_CHROMA_ROW_STRIDE],
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     703 |                                   MSVDX_CMDS, CHROMA_ROW_STRIDE,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     704 |                                   CHROMA_ROW_STRIDE, uv_stride >> 6, unsigned int, unsigned int);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:58: note: expanded from macro 'REGIO_WRITE_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:698:3: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     698 |                 REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_EXTENDED_ROW_STRIDE],
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     699 |                                   MSVDX_CMDS, EXTENDED_ROW_STRIDE,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     700 |                                   EXT_ROW_STRIDE, y_stride >> 6, unsigned int, unsigned int);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:59:58: note: expanded from macro 'REGIO_WRITE_FIELD'
      59 |                 REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, val_type); \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_int.c:694:3: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
     694 |                 REGIO_WRITE_FIELD(pict_cmds[VDECFW_CMD_OPERATING_MODE],
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     695 |                                   MSVDX_CMDS, OPERATING_MODE,
--
>> drivers/media/platform/img/vxe-vxd/decoder/translation_api.c:1094:2: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
    1094 |         REGIO_WRITE_FIELD_LITE
         |         ^~~~~~~~~~~~~~~~~~~~~~
    1095 |                 (reg,
         |                 ~~~~~
    1096 |                  MSVDX_CMDS, PVDEC_DISPLAY_PICTURE_SIZE, PVDEC_DISPLAY_PICTURE_HEIGHT_MIN1,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1097 |                  str_unit->pict_hdr_info->coded_frame_size.height - 1, unsigned int);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:57: note: expanded from macro 'REGIO_WRITE_FIELD_LITE'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   drivers/media/platform/img/vxe-vxd/decoder/translation_api.c:1090:2: warning: variable '__value' is uninitialized when used within its own initialization [-Wuninitialized]
    1090 |         REGIO_WRITE_FIELD_LITE
         |         ^~~~~~~~~~~~~~~~~~~~~~
    1091 |                 (reg,
         |                 ~~~~~
    1092 |                  MSVDX_CMDS, PVDEC_DISPLAY_PICTURE_SIZE, PVDEC_DISPLAY_PICTURE_WIDTH_MIN1,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1093 |                  str_unit->pict_hdr_info->coded_frame_size.width - 1, unsigned int);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:70:57: note: expanded from macro 'REGIO_WRITE_FIELD_LITE'
      70 |         REGIO_CHECK_VALUE_FITS_WITHIN_FIELD(group, reg, field, __value, type); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/reg_io2.h:42:18: note: expanded from macro 'REGIO_CHECK_VALUE_FITS_WITHIN_FIELD'
      42 |                 type __value = value; \
         |                      ~~~~~~~   ^~~~~
   2 warnings generated.
--
>> drivers/media/platform/img/vxe-vxd/decoder/decoder.c:1453:22: warning: variable 'display_num' set but not used [-Wunused-but-set-variable]
    1453 |         static unsigned int display_num;
         |                             ^
   1 warning generated.
--
>> drivers/media/platform/img/vxe-vxd/decoder/core.c:1268:8: warning: cast from 'int (*)(struct vdecdd_str_unit *, void *)' to 'resource_pfn_freeitem' (aka 'int (*)(void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    1268 |                                           (resource_pfn_freeitem)core_fn_free_stream_unit,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/core.c:3365:8: warning: cast from 'int (*)(struct vdecdd_str_unit *, void *)' to 'resource_pfn_freeitem' (aka 'int (*)(void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    3365 |                                           (resource_pfn_freeitem)core_fn_free_stream_unit,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/core.c:3379:8: warning: cast from 'int (*)(struct vdecdd_str_unit *, void *)' to 'resource_pfn_freeitem' (aka 'int (*)(void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    3379 |                                           (resource_pfn_freeitem)core_fn_free_stream_unit,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
>> drivers/media/platform/img/vxe-vxd/decoder/bspp.c:2092:17: warning: variable 'count_extra_sequences' set but not used [-Wunused-but-set-variable]
    2092 |                         unsigned int count_extra_sequences = 0;
         |                                      ^
>> drivers/media/platform/img/vxe-vxd/decoder/bspp.c:2127:18: warning: variable 'count_extra_ppss' set but not used [-Wunused-but-set-variable]
    2127 |                                 unsigned int count_extra_ppss = 0;
         |                                              ^
>> drivers/media/platform/img/vxe-vxd/decoder/bspp.c:2389:4: warning: cast from 'void (*)(enum swsr_cbevent, struct bspp_grp_bstr_ctx *, unsigned char, unsigned char **, unsigned long long *)' to 'swsr_callback_fxn' (aka 'void (*)(enum swsr_cbevent, void *, unsigned char, unsigned char **, unsigned long long *)') converts to incompatible function type [-Wcast-function-type-strict]
    2389 |                         (swsr_callback_fxn) bspp_shift_reg_cb,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
>> drivers/media/platform/img/vxe-vxd/decoder/jpeg_secure_parser.c:330:17: warning: variable 'mcu_width' set but not used [-Wunused-but-set-variable]
     330 |         unsigned short mcu_width = 0;
         |                        ^
>> drivers/media/platform/img/vxe-vxd/decoder/jpeg_secure_parser.c:331:17: warning: variable 'mcu_height' set but not used [-Wunused-but-set-variable]
     331 |         unsigned short mcu_height = 0;
         |                        ^
>> drivers/media/platform/img/vxe-vxd/decoder/jpeg_secure_parser.c:596:5: warning: no previous prototype for function 'bspp_jpeg_unit_parser' [-Wmissing-prototypes]
     596 | int bspp_jpeg_unit_parser(void *swsr_ctx, struct bspp_unit_data *unit_data)
         |     ^
   drivers/media/platform/img/vxe-vxd/decoder/jpeg_secure_parser.c:596:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     596 | int bspp_jpeg_unit_parser(void *swsr_ctx, struct bspp_unit_data *unit_data)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/media/platform/img/vxe-vxd/encoder/vxe_enc.c:30:6: warning: no previous prototype for function 'mmu_callback' [-Wmissing-prototypes]
      30 | void mmu_callback(enum mmu_callback_type callback_type,
         |      ^
   drivers/media/platform/img/vxe-vxd/encoder/vxe_enc.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | void mmu_callback(enum mmu_callback_type callback_type,
         | ^
         | static 
   1 warning generated.
--
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:348:5: warning: no previous prototype for function 'comm_prepare_fw' [-Wmissing-prototypes]
     348 | int comm_prepare_fw(struct img_fw_context *fw_ctx, enum img_codec codec)
         |     ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     348 | int comm_prepare_fw(struct img_fw_context *fw_ctx, enum img_codec codec)
         | ^
         | static 
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:396:6: warning: no previous prototype for function 'comm_load_h264_tables' [-Wmissing-prototypes]
     396 | void comm_load_h264_tables(struct topaz_dev_ctx *ctx)
         |      ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:396:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     396 | void comm_load_h264_tables(struct topaz_dev_ctx *ctx)
         | ^
         | static 
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:422:6: warning: no previous prototype for function 'comm_load_tables' [-Wmissing-prototypes]
     422 | void comm_load_tables(struct topaz_dev_ctx *ctx)
         |      ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:422:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     422 | void comm_load_tables(struct topaz_dev_ctx *ctx)
         | ^
         | static 
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:456:6: warning: no previous prototype for function 'topaz_setup_firmware' [-Wmissing-prototypes]
     456 | void topaz_setup_firmware(struct topaz_dev_ctx *ctx,
         |      ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:456:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     456 | void topaz_setup_firmware(struct topaz_dev_ctx *ctx,
         | ^
         | static 
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1172:15: warning: no previous prototype for function 'topazdd_get_pipe_usage' [-Wmissing-prototypes]
    1172 | unsigned char topazdd_get_pipe_usage(unsigned char pipe)
         |               ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1172 | unsigned char topazdd_get_pipe_usage(unsigned char pipe)
         | ^
         | static 
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1181:6: warning: no previous prototype for function 'topazdd_set_pipe_usage' [-Wmissing-prototypes]
    1181 | void topazdd_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1181 | void topazdd_set_pipe_usage(unsigned char pipe, unsigned char val)
         | ^
         | static 
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1538:19: warning: variable 'cmd_id' set but not used [-Wunused-but-set-variable]
    1538 |                 enum mtx_cmd_id cmd_id;
         |                                 ^
   7 warnings generated.
--
>> drivers/media/platform/img/vxe-vxd/encoder/topazmmu.c:91:15: warning: variable 'hw_rev' set but not used [-Wunused-but-set-variable]
      91 |         unsigned int hw_rev;
         |                      ^
   1 warning generated.
..


vim +/fw_load_retries +587 drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c

38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  583  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  584  int vxd_create_ctx(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx)
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  585  {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  586  	int ret = 0;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25 @587  	unsigned int fw_load_retries = 2 * 1000;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  588  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  589  	while (!vxd->firmware.ready) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  590  		usleep_range(1000, 2000);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  591  		fw_load_retries--;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  592  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  593  	if (vxd->firmware.buf_id == 0) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  594  		dev_err(vxd->dev, "%s: request fw not yet done!\n", __func__);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  595  		return -EAGAIN;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  596  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  597  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  598  	/* Create memory management context for HW buffers */
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  599  	ret = img_mem_create_ctx(&ctx->mem_ctx);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  600  	if (ret) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  601  		dev_err(vxd->dev, "%s: failed to create mem context (err:%d)!\n", __func__, ret);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  602  		return ret;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  603  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  604  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  605  	ret = img_mmu_ctx_create(vxd->dev, vxd->mmu_config_addr_width,
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  606  				 ctx->mem_ctx, vxd_drv.internal_heap_id,
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  607  				 img_mmu_callback, vxd, &ctx->mmu_ctx);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  608  	if (ret) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  609  		dev_err(vxd->dev, "%s:%d: failed to create mmu ctx\n", __func__, __LINE__);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  610  		ret = -EPERM;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  611  		goto out_destroy_ctx;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  612  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  613  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  614  	ret = img_mmu_map(ctx->mmu_ctx, vxd->mem_ctx, vxd->firmware.buf_id,
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  615  			  vxd_drv.virt_space.fw_addr,
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  616  			  VXD_MMU_PTD_FLAG_READ_ONLY);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  617  	if (ret) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  618  		dev_err(vxd->dev, "%s:%d: failed to map firmware buffer\n", __func__, __LINE__);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  619  		ret = -EPERM;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  620  		goto out_destroy_mmu_ctx;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  621  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  622  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  623  	ret = img_mmu_map(ctx->mmu_ctx, vxd->mem_ctx, vxd->rendec_buf_id,
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  624  			  vxd_drv.virt_space.rendec_addr,
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  625  			  VXD_MMU_PTD_FLAG_NONE);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  626  	if (ret) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  627  		dev_err(vxd->dev, "%s:%d: failed to map rendec buffer\n", __func__, __LINE__);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  628  		ret = -EPERM;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  629  		goto out_unmap_fw;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  630  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  631  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  632  	ret = img_mmu_get_ptd(ctx->mmu_ctx, &ctx->ptd);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  633  	if (ret) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  634  		dev_err(vxd->dev, "%s:%d: failed to get PTD\n", __func__, __LINE__);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  635  		ret = -EPERM;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  636  		goto out_unmap_rendec;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  637  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  638  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  639  	/* load fw - turned Hw on */
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  640  	ret = vxd_make_hw_on_locked(vxd, ctx->ptd);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  641  	if (ret) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  642  		dev_err(vxd->dev, "%s:%d: failed to start HW\n", __func__, __LINE__);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  643  		ret = -EPERM;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  644  		vxd->hw_on = FALSE;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  645  		goto out_unmap_rendec;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  646  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  647  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  648  	init_work(&ctx->work, stream_worker, HWA_DECODER);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  649  	if (!ctx->work) {
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  650  		ret = ENOMEM;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  651  		goto out_unmap_rendec;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  652  	}
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  653  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  654  	vxd->fw_refcnt++;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  655  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  656  	return ret;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  657  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  658  out_unmap_rendec:
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  659  	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->rendec_buf_id);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  660  out_unmap_fw:
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  661  	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->firmware.buf_id);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  662  
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  663  out_destroy_mmu_ctx:
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  664  	img_mmu_ctx_destroy(ctx->mmu_ctx);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  665  out_destroy_ctx:
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  666  	img_mem_destroy_ctx(ctx->mem_ctx);
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  667  	return ret;
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  668  }
38b16088f95825 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2023-04-25  669  

:::::: The code at line 587 was first introduced by commit
:::::: 38b16088f95825e8846b6440e7859b790fe322e2 v4l: vxd-dec: Add IMG VXD Video Decoder mem to mem drive

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
