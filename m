Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A14E82D91
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726441125; cv=none; b=ffz/gdpDIS4Z7Mp7qF0oaBaRHJwLIkp4cypCYPZaTfRqF9ydRW84bq8zmuc2qB9NiIMHblmcEL2uIBQUeIRRi5ZN9fbqemal7nW5crLISs4IyVzaXNjJlUk0Tf3Q4R+GrjsIJ3AblN4e6GB2YBU8vgBLcbpTN1IMQeR5hd962gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726441125; c=relaxed/simple;
	bh=8PMh2vvKkPdZmOAWkom196u8EG9gxoIsFV3nSE5SqZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hFht0wGuqKVeKLD8IowkleMru3jXMmvgctufVVbO53nNL0c1SEz7ZniFFeM8dhiNqwRSOrpTNHBvZzghcZIPDmnRgNHKxsOkDATVJPsLC2KmwLl0hqVkKwU5AYf53zKfrJwlKXcTcs85a7efa6IicrTkqV67OTMTIjxndeF/6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5L1uKrP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5L1uKrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726441123; x=1757977123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PMh2vvKkPdZmOAWkom196u8EG9gxoIsFV3nSE5SqZQ=;
  b=R5L1uKrPPoM3fHJ131UQmDiJuopf9UGgj4toj78MqwHckRAV1rT2Y2ZS
   Wra9S3u7BPEGz43BPsLgxFqL1GWgHp/0Bg2TcZszUG50Lszdlv5jsrKyK
   cmUcfTmyDc7sCCxGSysNZXqZp7L6C3b2q7LZixHWeIwa0OiRC8ZN0S3lr
   GD9aXsBvHb+tiD4QrtHv/ELMLwh+GrsfA6LT70sh9FSq92hlN09TX0oYa
   iHj8ejJIJTIEhcGZ8WGD7SbzUkoeBmNnMHGfLFAbfUiqUS4N633epnf4m
   iK+lngOuwFNUDSWcI19yLdbBHRTDgRd5twI3eBu9SForELpXmgl9TkZpr
   Q==;
X-CSE-ConnectionGUID: +dXUWloRQPeBF3U5Z0Q10w==
X-CSE-MsgGUID: LJYILZKITo+KhpYSoMmiyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36405375"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="36405375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 15:58:41 -0700
X-CSE-ConnectionGUID: Rm3oapUWQAeHO0hpY64aWw==
X-CSE-MsgGUID: 7r89xkjTSAmJnyySXhZBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68660036"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2024 15:58:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spyCS-00096l-19;
	Sun, 15 Sep 2024 22:58:36 +0000
Date: Mon, 16 Sep 2024 06:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:36: error:
 implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'?
Message-ID: <202409160633.VMr8MRWi-lkp@intel.com>
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
head:   829eefbd4a1ba5b21fb43beeba454fd5dc23bb80
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240916/202409160633.VMr8MRWi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160633.VMr8MRWi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160633.VMr8MRWi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/img/vxe-vxd/common/img_mem_man.c:24:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/img/vxe-vxd/common/imgmmu.c:20:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'get_delayed_work_buff':
>> drivers/media/platform/img/vxe-vxd/common/work_queue.c:148:22: warning: variable 'previous' set but not used [-Wunused-but-set-variable]
     148 |         struct node *previous = NULL;
         |                      ^~~~~~~~
--
>> drivers/media/platform/img/vxe-vxd/encoder/vxe_enc.c:30:6: warning: no previous prototype for 'mmu_callback' [-Wmissing-prototypes]
      30 | void mmu_callback(enum mmu_callback_type callback_type,
         |      ^~~~~~~~~~~~
--
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:348:5: warning: no previous prototype for 'comm_prepare_fw' [-Wmissing-prototypes]
     348 | int comm_prepare_fw(struct img_fw_context *fw_ctx, enum img_codec codec)
         |     ^~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:396:6: warning: no previous prototype for 'comm_load_h264_tables' [-Wmissing-prototypes]
     396 | void comm_load_h264_tables(struct topaz_dev_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:422:6: warning: no previous prototype for 'comm_load_tables' [-Wmissing-prototypes]
     422 | void comm_load_tables(struct topaz_dev_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:456:6: warning: no previous prototype for 'topaz_setup_firmware' [-Wmissing-prototypes]
     456 | void topaz_setup_firmware(struct topaz_dev_ctx *ctx,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1172:15: warning: no previous prototype for 'topazdd_get_pipe_usage' [-Wmissing-prototypes]
    1172 | unsigned char topazdd_get_pipe_usage(unsigned char pipe)
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1181:6: warning: no previous prototype for 'topazdd_set_pipe_usage' [-Wmissing-prototypes]
    1181 | void topazdd_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c: In function 'comm_dispatch_in_msg':
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_device.c:1538:33: warning: variable 'cmd_id' set but not used [-Wunused-but-set-variable]
    1538 |                 enum mtx_cmd_id cmd_id;
         |                                 ^~~~~~
--
   In file included from drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:31:
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_color_formats.h:18:6: warning: no previous prototype for 'plane_size' [-Wmissing-prototypes]
      18 | void plane_size(enum img_format color_format, unsigned int stride,
         |      ^~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:448:5: warning: no previous prototype for 'topaz_process_message' [-Wmissing-prototypes]
     448 | int topaz_process_message(struct topaz_stream_context *str_ctx, struct mtx_tohost_msg tohost_msg)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:706:6: warning: no previous prototype for 'handle_encoder_firmware_response' [-Wmissing-prototypes]
     706 | void handle_encoder_firmware_response(struct img_writeback_msg *wb_msg, void *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2463:15: warning: no previous prototype for 'topaz_validate_params' [-Wmissing-prototypes]
    2463 | unsigned char topaz_validate_params(struct img_video_params *video_params,
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2767:14: warning: no previous prototype for 'topaz_insert_command' [-Wmissing-prototypes]
    2767 | unsigned int topaz_insert_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2786:14: warning: no previous prototype for 'topaz_insert_command_with_sync' [-Wmissing-prototypes]
    2786 | unsigned int topaz_insert_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2810:14: warning: no previous prototype for 'topaz_insert_mem_command' [-Wmissing-prototypes]
    2810 | unsigned int topaz_insert_mem_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2831:14: warning: no previous prototype for 'topaz_insert_mem_command_with_sync' [-Wmissing-prototypes]
    2831 | unsigned int topaz_insert_mem_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2947:6: warning: no previous prototype for 'topaz_set_pipe_usage' [-Wmissing-prototypes]
    2947 | void topaz_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_video_destroy_context':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:3115:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    3115 |                 if (topaz_mmu_stream_free(str_ctx->mmu_ctx,
         |                 ^~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:3119:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    3119 |                         kfree(video->coded_package[i]->header_buffer);
         |                         ^~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_send_source_frame':
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:3390:22: warning: variable 'halfway_bu' set but not used [-Wunused-but-set-variable]
    3390 |         unsigned int halfway_bu;
         |                      ^~~~~~~~~~
--
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:32:6: warning: no previous prototype for 'calculate_kick_and_bu_size' [-Wmissing-prototypes]
      32 | void calculate_kick_and_bu_size(unsigned int width_in_mbs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:97:14: warning: no previous prototype for 'calculate_stride' [-Wmissing-prototypes]
      97 | unsigned int calculate_stride(enum img_format format, ushort requested_stride_bytes, ushort width)
         |              ^~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:155:6: warning: no previous prototype for 'patch_hw_profile' [-Wmissing-prototypes]
     155 | void patch_hw_profile(struct img_video_params *video_params, struct img_video_context *video)
         |      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:487:6: warning: no previous prototype for 'topaz_setup_input_csc' [-Wmissing-prototypes]
     487 | void topaz_setup_input_csc(struct img_video_context *video,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:746:14: warning: no previous prototype for 'topaz_get_packed_buffer_strides' [-Wmissing-prototypes]
     746 | unsigned int topaz_get_packed_buffer_strides(ushort buffer_stride_bytes,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:837:6: warning: no previous prototype for 'update_driver_mv_scaling' [-Wmissing-prototypes]
     837 | void update_driver_mv_scaling(unsigned int frame_num, unsigned int ref0_num, unsigned int ref1_num,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:952:6: warning: no previous prototype for 'prepare_mv_estimates' [-Wmissing-prototypes]
     952 | void prepare_mv_estimates(struct img_enc_context *enc)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:1027:6: warning: no previous prototype for 'adjust_pic_flags' [-Wmissing-prototypes]
    1027 | void adjust_pic_flags(struct img_enc_context *enc, struct img_rc_params *rc_params,
         |      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:1044:6: warning: no previous prototype for 'setup_rc_data' [-Wmissing-prototypes]
    1044 | void setup_rc_data(struct img_video_context *video, struct pic_params *pic_params,
         |      ^~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api_utils.c:1319:6: warning: no previous prototype for 'topaz_setup_input_format' [-Wmissing-prototypes]
    1319 | void topaz_setup_input_format(struct img_video_context *video,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:27:6: warning: no previous prototype for 'insert_element_token' [-Wmissing-prototypes]
      27 | void insert_element_token(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:69:14: warning: no previous prototype for 'write_upto_8bits_to_elements' [-Wmissing-prototypes]
      69 | unsigned int write_upto_8bits_to_elements(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:138:14: warning: no previous prototype for 'write_upto_32bits_to_elements' [-Wmissing-prototypes]
     138 | unsigned int write_upto_32bits_to_elements(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:166:6: warning: no previous prototype for 'h264_write_bits_startcode_prefix_element' [-Wmissing-prototypes]
     166 | void h264_write_bits_startcode_prefix_element(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:184:14: warning: no previous prototype for 'generate_ue' [-Wmissing-prototypes]
     184 | unsigned int generate_ue(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:223:14: warning: no previous prototype for 'generate_se' [-Wmissing-prototypes]
     223 | unsigned int generate_se(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:241:6: warning: no previous prototype for 'h264_write_bits_scaling_lists' [-Wmissing-prototypes]
     241 | void h264_write_bits_scaling_lists(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:299:6: warning: no previous prototype for 'h264_write_bits_vui_params' [-Wmissing-prototypes]
     299 | void h264_write_bits_vui_params(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:412:6: warning: no previous prototype for 'h264_write_bits_sequence_header' [-Wmissing-prototypes]
     412 | void h264_write_bits_sequence_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:670:6: warning: no previous prototype for 'h264_write_bits_picture_header' [-Wmissing-prototypes]
     670 | void h264_write_bits_picture_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:816:6: warning: no previous prototype for 'h264_write_bits_aud_header' [-Wmissing-prototypes]
     816 | void h264_write_bits_aud_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:907:6: warning: no previous prototype for 'h264_write_bits_extension_slice_header' [-Wmissing-prototypes]
     907 | void h264_write_bits_extension_slice_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:1074:6: warning: no previous prototype for 'h264_write_bits_slice_header' [-Wmissing-prototypes]
    1074 | void h264_write_bits_slice_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:1243:6: warning: no previous prototype for 'h264_prepare_slice_header' [-Wmissing-prototypes]
    1243 | void h264_prepare_slice_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:1296:14: warning: no previous prototype for 'prepare_encode_slice_params' [-Wmissing-prototypes]
    1296 | unsigned int prepare_encode_slice_params(void *enc_ctx, struct slice_params *slice_params,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/header_gen.c:1546:6: warning: no previous prototype for 'h264_write_bits_mvc_sequence_header' [-Wmissing-prototypes]
    1546 | void h264_write_bits_mvc_sequence_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/img/vxe-vxd/encoder/mtx_fwif.c:459:6: warning: no previous prototype for 'mtx_dmac_transfer' [-Wmissing-prototypes]
     459 | void mtx_dmac_transfer(struct img_fw_context *fw_ctx, unsigned int channel,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/mtx_fwif.c:575:6: warning: no previous prototype for 'mtx_set_target' [-Wmissing-prototypes]
     575 | void mtx_set_target(struct img_fw_context *fw_ctx)
         |      ^~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/encoder/mtx_fwif.c:983:14: warning: no previous prototype for 'poll_hw_inactive' [-Wmissing-prototypes]
     983 | unsigned int poll_hw_inactive(struct img_fw_context *fw_ctx)
         |              ^~~~~~~~~~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'stream_worker':
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:550:25: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^~~
--
   drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:782:13: warning: 'hwctrl_dump_state' defined but not used [-Wunused-function]
     782 | static void hwctrl_dump_state(struct vxd_states *prev_state,
         |             ^~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/hw_control.c:22:
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
..


vim +770 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c

f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  623  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  624  static int vxd_dec_buf_prepare(struct vb2_buffer *vb)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  625  {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  626  	struct vxd_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  627  	struct device *dev = ctx->dev->dev;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  628  	struct vxd_dec_q_data *q_data;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  629  	void *sgt;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  630  #ifdef CAPTURE_CONTIG_ALLOC
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  631  	struct page *new_page;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  632  #else
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  633  	void *sgl;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  634  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  635  	struct sg_table *sgt_new;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  636  	void *sgl_new;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25 @637  	int pages;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  638  	int nents = 0;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  639  	int size = 0;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  640  	int plane, num_planes, ret = 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  641  	unsigned long dma_addr;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  642  	struct vxd_mapping *mapping;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  643  	struct list_head *list;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  644  	struct vxd_buffer *buf =
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  645  		container_of(vb, struct vxd_buffer, buffer.vb.vb2_buf);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  646  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  647  	q_data = get_q_data(ctx, vb->vb2_queue->type);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  648  	if (!q_data)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  649  		return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  650  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  651  	num_planes = q_data->fmt->num_planes;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  652  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  653  	for (plane = 0; plane < num_planes; plane++) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  654  		if (vb2_plane_size(vb, plane) < q_data->size_image[plane]) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  655  			dev_err(dev, "data will not fit into plane (%lu < %lu)\n",
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  656  				vb2_plane_size(vb, plane),
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  657  				(long)q_data->size_image[plane]);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  658  			return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  659  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  660  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  661  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  662  	if (buf->mapped && !V4L2_TYPE_IS_OUTPUT(vb->type)) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  663  #ifdef CAPTURE_CONTIG_ALLOC
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  664  		dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  665  #else
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  666  		sgt = vb2_dma_sg_plane_desc(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  667  		if (!sgt)
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  668  			return -EFAULT;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  669  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  670  		dma_addr = sg_phys(img_mmu_get_sgl(sgt));
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  671  #endif
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  672  		if (buf->buf_info.dma_addr != dma_addr) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  673  			list_for_each(list, &ctx->cap_mappings) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  674  				mapping = list_entry(list, struct vxd_mapping, list);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  675  				if (dma_addr == mapping->dma_addr)
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  676  					break;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  677  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  678  				mapping = NULL;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  679  			}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  680  			if (mapping) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  681  				/* skip the mapping, buf update buf_map_id */
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  682  				buf->buf_info.dma_addr = mapping->dma_addr;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  683  				buf->buf_map_id = mapping->buf_map_id;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  684  				buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  685  				buf->mapping = mapping;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  686  				return 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  687  			}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  688  		} else {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  689  			return 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  690  		}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  691  	} else if (buf->mapped) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  692  		return 0;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  693  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  694  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  695  	buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  696  	buf->buf_info.buf_size = vb2_plane_size(vb, 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  697  	buf->buf_info.fd = -1;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  698  	sgt = vb2_dma_sg_plane_desc(vb, 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  699  	if (!sgt) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  700  		dev_err(dev, "Could not get sg_table from plane 0\n");
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  701  		return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  702  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  703  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  704  	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  705  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  706  		ret = core_stream_map_buf_sg(ctx->res_str_id,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  707  					     VDEC_BUFTYPE_BITSTREAM,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  708  					     &buf->buf_info, sgt,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  709  					     &buf->buf_map_id);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  710  		if (ret) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  711  			dev_err(dev, "OUTPUT core_stream_map_buf_sg failed\n");
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  712  			return ret;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  713  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  714  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  715  		buf->bstr_info.buf_size = q_data->size_image[0];
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  716  		buf->bstr_info.cpu_virt_addr = buf->buf_info.cpu_linear_addr;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  717  		buf->bstr_info.mem_attrib =
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  718  			SYS_MEMATTRIB_UNCACHED | SYS_MEMATTRIB_WRITECOMBINE |
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  719  			SYS_MEMATTRIB_INPUT | SYS_MEMATTRIB_CPU_WRITE;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  720  		buf->bstr_info.bufmap_id = buf->buf_map_id;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  721  		lst_init(&buf->seq_unit.bstr_seg_list);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  722  		lst_init(&buf->pic_unit.bstr_seg_list);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  723  		lst_init(&buf->end_unit.bstr_seg_list);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  724  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  725  		list_add_tail(&buf->list, &ctx->out_buffers);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  726  	} else {
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  727  #ifdef CAPTURE_CONTIG_ALLOC
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  728  		buf->buf_info.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  729  #else
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  730  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  731  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  732  		/* Create a single sgt from the plane(s) */
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  733  		sgt_new = kmalloc(sizeof(*sgt_new), GFP_KERNEL);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  734  		if (!sgt_new)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  735  			return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  736  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  737  		for (plane = 0; plane < num_planes; plane++) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  738  			size += ALIGN(vb2_plane_size(vb, plane), PAGE_SIZE);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  739  			sgt = vb2_dma_sg_plane_desc(vb, plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  740  			if (!sgt) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  741  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  742  				kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  743  				return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  744  			}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  745  #ifdef CAPTURE_CONTIG_ALLOC
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  746  			nents += 1;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  747  #else
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  748  			nents += sg_nents(img_mmu_get_sgl(sgt));
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  749  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  750  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  751  		buf->buf_info.buf_size = size;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  752  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  753  		pages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  754  		ret = sg_alloc_table(sgt_new, nents, GFP_KERNEL);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  755  		if (ret) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  756  			kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  757  			return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  758  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  759  		sgl_new = img_mmu_get_sgl(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  760  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  761  		for (plane = 0; plane < num_planes; plane++) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  762  			sgt = vb2_dma_sg_plane_desc(vb, plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  763  			if (!sgt) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  764  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  765  				sg_free_table(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  766  				kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  767  				return -EINVAL;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  768  			}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  769  #ifdef CAPTURE_CONTIG_ALLOC
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25 @770  			new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  771  			sg_set_page(sgl_new, new_page, ALIGN(vb2_plane_size(vb, plane),
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  772  							     PAGE_SIZE), 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  773  			sgl_new = sg_next(sgl_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  774  #else
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  775  			sgl = img_mmu_get_sgl(sgt);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  776  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  777  			while (sgl) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  778  				sg_set_page(sgl_new, sg_page(sgl), img_mmu_get_sgl_length(sgl), 0);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  779  				sgl = sg_next(sgl);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  780  				sgl_new = sg_next(sgl_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  781  			}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  782  #endif
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  783  		}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  784  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  785  		buf->buf_info.pictbuf_cfg = ctx->pict_bufcfg;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  786  		ret = core_stream_map_buf_sg(ctx->res_str_id,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  787  					     VDEC_BUFTYPE_PICTURE,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  788  					     &buf->buf_info, sgt_new,
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  789  					     &buf->buf_map_id);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  790  		sg_free_table(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  791  		kfree(sgt_new);
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  792  		if (ret) {
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  793  			dev_err(dev, "CAPTURE core_stream_map_buf_sg failed\n");
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  794  			return ret;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  795  		}
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  796  		if (buf->mapped == FALSE)
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  797  			list_add_tail(&buf->list, &ctx->cap_buffers);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  798  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  799  		/* Add this to the mappings */
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  800  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  801  
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  802  		mapping->reuse = TRUE;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  803  		mapping->dma_addr = buf->buf_info.dma_addr;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  804  		mapping->buf_map_id = buf->buf_map_id;
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  805  		list_add_tail(&mapping->list, &ctx->cap_mappings);
990f359cbacd40 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  806  		buf->mapping = mapping;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  807  	}
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  808  	buf->mapped = TRUE;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  809  
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  810  	return 0;
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  811  }
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  812  

:::::: The code at line 770 was first introduced by commit
:::::: f1ce557a02e8f185c8585c901a2b2f79a91278e5 v4l: Add V4L2 Interface function implementations

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
