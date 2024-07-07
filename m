Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7C4C7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 03:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720323518; cv=none; b=WmaWT+5C397JYXSLcQBNmgxUUlK2yFKujjH5kJBqG23ze0k7CnwdcrkvbD3TaStO1HxxIOa2c9ylkMY93HJBi7wgDu9DWEgKrMb6/s/EVCIS+BB+c7K9TcWZV5QQrs8lRy7/IUs1qTG8rlnOfVcL1/WRBLoG+esK774uGukqtuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720323518; c=relaxed/simple;
	bh=cSJVNIWOZYTrVRlErS9Sxjvb+SnjFrItazi8hdtTVEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsJ7OO/WaV4pPvjGc2oYLxuoG4J9ckoPLm801FecNlAEc5v++CdMY5gTiTTKoKT05qj9yrrSzbJ6ZsPNDklKyx3wmP2jdwhmO5aFzfmw+vBPgCud5KMQBkMADkF8pSu6sJphhQPuZ94IUmfzNBUYmqyhNUhjOZ6JPV+UuszJ+0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb9208wY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb9208wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720323516; x=1751859516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSJVNIWOZYTrVRlErS9Sxjvb+SnjFrItazi8hdtTVEY=;
  b=hb9208wYVOVxkvcihCCvOOTqv6I/Tmq+Pr8funcxh4fVGdfs3Vw96us/
   dpw2m44vlSymGpi9A0+5dnVNrUpkGDVmkMlaaKTnWcoJfV32ZmL76dGCr
   a3REd3DUhGLlip6Bhch3azJvjqItTFMwRKXP7hoM217oSKpm9mxqktiIx
   dAbyAwQjuTrrDj0BP6k/qLcNZ+wZmCLK4V8Q637OyYu2E3F0P5lqqyLpY
   6J9fC0XWbuNIOm4XMstdfMltZBty7ioBKRFZtpamtwRKyVKU1YYIRQYbr
   MsRNQeE1HXPeiJZynShW0Enr1OCuRLaAE2UtK5X5ZaflhSRBJIZquGgLU
   g==;
X-CSE-ConnectionGUID: Mk7LzLzNTWCyt1x/F+EUXg==
X-CSE-MsgGUID: Zq9YTQNiSTGquIpLKcd0VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17683804"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17683804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 20:38:35 -0700
X-CSE-ConnectionGUID: nuZ9kxQ2RmS5YdCH9CPCow==
X-CSE-MsgGUID: rWE2BNa5TpmJAMS4w7er4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="51514780"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jul 2024 20:38:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQIjO-000UYw-0Q;
	Sun, 07 Jul 2024 03:38:30 +0000
Date: Sun, 7 Jul 2024 11:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 150/150]
 drivers/media/platform/imagination/vxe-vxd/decoder/vxd_core.c:590:15:
 warning: variable 'fw_load_retries' set but not used
Message-ID: <202407071111.ayvXbYrx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   e298dab666632b6f62ed61eac35813331341c3aa
commit: 882d9360984568792cc0fd52aee488411771f76d [150/150] media: imagination: Clean Up Imagination Directory
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407071111.ayvXbYrx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071111.ayvXbYrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071111.ayvXbYrx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_core.c:550:18: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^
>> drivers/media/platform/imagination/vxe-vxd/decoder/vxd_core.c:590:15: warning: variable 'fw_load_retries' set but not used [-Wunused-but-set-variable]
     590 |         unsigned int fw_load_retries = 2 * 1000;
         |                      ^
   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_core.c:1463:6: warning: array index 1 is past the end of the array (that has type 'unsigned int[0]') [-Warray-bounds]
    1463 |         if (msg->payload[VXD_PTD_MSG_OFFSET] != 0) {
         |             ^            ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_dec.h:90:2: note: array 'payload' declared here
      90 |         unsigned int payload[0];
         |         ^
   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_core.c:1499:2: warning: array index 1 is past the end of the array (that has type 'unsigned int[0]') [-Warray-bounds]
    1499 |         item->msg.payload[VXD_PTD_MSG_OFFSET] = stream->ptd;
         |         ^                 ~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_dec.h:90:2: note: array 'payload' declared here
      90 |         unsigned int payload[0];
         |         ^
   4 warnings generated.
--
>> drivers/media/platform/imagination/vxe-vxd/decoder/vdecdd_utils_buf.c:315:15: warning: variable 'total_vert_samples' set but not used [-Wunused-but-set-variable]
     315 |         unsigned int total_vert_samples = 0;
         |                      ^
   drivers/media/platform/imagination/vxe-vxd/decoder/vdecdd_utils_buf.c:588:15: warning: variable 'total_vert_samples' set but not used [-Wunused-but-set-variable]
     588 |         unsigned int total_vert_samples;
         |                      ^
   2 warnings generated.
--
>> drivers/media/platform/imagination/vxe-vxd/decoder/vxd_int.c:220:16: warning: variable 'group_size' set but not used [-Wunused-but-set-variable]
     220 |         unsigned char group_size = 0;
         |                       ^
   1 warning generated.
--
>> drivers/media/platform/imagination/vxe-vxd/decoder/decoder.c:1451:22: warning: variable 'display_num' set but not used [-Wunused-but-set-variable]
    1451 |         static unsigned int display_num;
         |                             ^
   1 warning generated.
--
>> drivers/media/platform/imagination/vxe-vxd/decoder/core.c:1269:8: warning: cast from 'int (*)(struct vdecdd_str_unit *, void *)' to 'resource_pfn_freeitem' (aka 'int (*)(void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    1269 |                                           (resource_pfn_freeitem)core_fn_free_stream_unit,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/decoder/core.c:3369:8: warning: cast from 'int (*)(struct vdecdd_str_unit *, void *)' to 'resource_pfn_freeitem' (aka 'int (*)(void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    3369 |                                           (resource_pfn_freeitem)core_fn_free_stream_unit,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/decoder/core.c:3383:8: warning: cast from 'int (*)(struct vdecdd_str_unit *, void *)' to 'resource_pfn_freeitem' (aka 'int (*)(void *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
    3383 |                                           (resource_pfn_freeitem)core_fn_free_stream_unit,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
>> drivers/media/platform/imagination/vxe-vxd/decoder/bspp.c:2095:17: warning: variable 'count_extra_sequences' set but not used [-Wunused-but-set-variable]
    2095 |                         unsigned int count_extra_sequences = 0;
         |                                      ^
>> drivers/media/platform/imagination/vxe-vxd/decoder/bspp.c:2130:18: warning: variable 'count_extra_ppss' set but not used [-Wunused-but-set-variable]
    2130 |                                 unsigned int count_extra_ppss = 0;
         |                                              ^
>> drivers/media/platform/imagination/vxe-vxd/decoder/bspp.c:2394:4: warning: cast from 'void (*)(enum swsr_cbevent, struct bspp_grp_bstr_ctx *, unsigned char, unsigned char **, unsigned long long *)' to 'swsr_callback_fxn' (aka 'void (*)(enum swsr_cbevent, void *, unsigned char, unsigned char **, unsigned long long *)') converts to incompatible function type [-Wcast-function-type-strict]
    2394 |                         (swsr_callback_fxn) bspp_shift_reg_cb,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
>> drivers/media/platform/imagination/vxe-vxd/decoder/jpeg_secure_parser.c:330:17: warning: variable 'mcu_width' set but not used [-Wunused-but-set-variable]
     330 |         unsigned short mcu_width = 0;
         |                        ^
>> drivers/media/platform/imagination/vxe-vxd/decoder/jpeg_secure_parser.c:331:17: warning: variable 'mcu_height' set but not used [-Wunused-but-set-variable]
     331 |         unsigned short mcu_height = 0;
         |                        ^
>> drivers/media/platform/imagination/vxe-vxd/decoder/jpeg_secure_parser.c:596:5: warning: no previous prototype for function 'bspp_jpeg_unit_parser' [-Wmissing-prototypes]
     596 | int bspp_jpeg_unit_parser(void *swsr_ctx, struct bspp_unit_data *unit_data)
         |     ^
   drivers/media/platform/imagination/vxe-vxd/decoder/jpeg_secure_parser.c:596:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     596 | int bspp_jpeg_unit_parser(void *swsr_ctx, struct bspp_unit_data *unit_data)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/vxe_enc.c:30:6: warning: no previous prototype for function 'mmu_callback' [-Wmissing-prototypes]
      30 | void mmu_callback(enum mmu_callback_type callback_type,
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/vxe_enc.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | void mmu_callback(enum mmu_callback_type callback_type,
         | ^
         | static 
   1 warning generated.
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:348:5: warning: no previous prototype for function 'comm_prepare_fw' [-Wmissing-prototypes]
     348 | int comm_prepare_fw(struct img_fw_context *fw_ctx, enum img_codec codec)
         |     ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     348 | int comm_prepare_fw(struct img_fw_context *fw_ctx, enum img_codec codec)
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:396:6: warning: no previous prototype for function 'comm_load_h264_tables' [-Wmissing-prototypes]
     396 | void comm_load_h264_tables(struct topaz_dev_ctx *ctx)
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:396:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     396 | void comm_load_h264_tables(struct topaz_dev_ctx *ctx)
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:422:6: warning: no previous prototype for function 'comm_load_tables' [-Wmissing-prototypes]
     422 | void comm_load_tables(struct topaz_dev_ctx *ctx)
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:422:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     422 | void comm_load_tables(struct topaz_dev_ctx *ctx)
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:456:6: warning: no previous prototype for function 'topaz_setup_firmware' [-Wmissing-prototypes]
     456 | void topaz_setup_firmware(struct topaz_dev_ctx *ctx,
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:456:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     456 | void topaz_setup_firmware(struct topaz_dev_ctx *ctx,
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1172:15: warning: no previous prototype for function 'topazdd_get_pipe_usage' [-Wmissing-prototypes]
    1172 | unsigned char topazdd_get_pipe_usage(unsigned char pipe)
         |               ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1172 | unsigned char topazdd_get_pipe_usage(unsigned char pipe)
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1181:6: warning: no previous prototype for function 'topazdd_set_pipe_usage' [-Wmissing-prototypes]
    1181 | void topazdd_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1181 | void topazdd_set_pipe_usage(unsigned char pipe, unsigned char val)
         | ^
         | static 
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1538:19: warning: variable 'cmd_id' set but not used [-Wunused-but-set-variable]
    1538 |                 enum mtx_cmd_id cmd_id;
         |                                 ^
   7 warnings generated.
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/topazmmu.c:91:15: warning: variable 'hw_rev' set but not used [-Wunused-but-set-variable]
      91 |         unsigned int hw_rev;
         |                      ^
   1 warning generated.
--
   In file included from drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:31:
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_color_formats.h:18:6: warning: no previous prototype for function 'plane_size' [-Wmissing-prototypes]
      18 | void plane_size(enum img_format color_format, unsigned int stride,
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_color_formats.h:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      18 | void plane_size(enum img_format color_format, unsigned int stride,
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:584:19: warning: variable 'first_bu_in_slice' set but not used [-Wunused-but-set-variable]
     584 |                         unsigned short first_bu_in_slice;
         |                                        ^
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:448:5: warning: no previous prototype for function 'topaz_process_message' [-Wmissing-prototypes]
     448 | int topaz_process_message(struct topaz_stream_context *str_ctx, struct mtx_tohost_msg tohost_msg)
         |     ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     448 | int topaz_process_message(struct topaz_stream_context *str_ctx, struct mtx_tohost_msg tohost_msg)
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:710:6: warning: no previous prototype for function 'handle_encoder_firmware_response' [-Wmissing-prototypes]
     710 | void handle_encoder_firmware_response(struct img_writeback_msg *wb_msg, void *priv)
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:710:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     710 | void handle_encoder_firmware_response(struct img_writeback_msg *wb_msg, void *priv)
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2471:15: warning: variable 'required_core_des1' set but not used [-Wunused-but-set-variable]
    2471 |         unsigned int required_core_des1 = 0;
         |                      ^
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2467:15: warning: no previous prototype for function 'topaz_validate_params' [-Wmissing-prototypes]
    2467 | unsigned char topaz_validate_params(struct img_video_params *video_params,
         |               ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2467:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2467 | unsigned char topaz_validate_params(struct img_video_params *video_params,
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2771:14: warning: no previous prototype for function 'topaz_insert_command' [-Wmissing-prototypes]
    2771 | unsigned int topaz_insert_command(struct img_enc_context *enc_ctx,
         |              ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2771:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2771 | unsigned int topaz_insert_command(struct img_enc_context *enc_ctx,
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2790:14: warning: no previous prototype for function 'topaz_insert_command_with_sync' [-Wmissing-prototypes]
    2790 | unsigned int topaz_insert_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2790:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2790 | unsigned int topaz_insert_command_with_sync(struct img_enc_context *enc_ctx,
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2814:14: warning: no previous prototype for function 'topaz_insert_mem_command' [-Wmissing-prototypes]
    2814 | unsigned int topaz_insert_mem_command(struct img_enc_context *enc_ctx,
         |              ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2814:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2814 | unsigned int topaz_insert_mem_command(struct img_enc_context *enc_ctx,
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2835:14: warning: no previous prototype for function 'topaz_insert_mem_command_with_sync' [-Wmissing-prototypes]
    2835 | unsigned int topaz_insert_mem_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2835:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2835 | unsigned int topaz_insert_mem_command_with_sync(struct img_enc_context *enc_ctx,
         | ^
         | static 
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2951:6: warning: no previous prototype for function 'topaz_set_pipe_usage' [-Wmissing-prototypes]
    2951 | void topaz_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2951:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2951 | void topaz_set_pipe_usage(unsigned char pipe, unsigned char val)
         | ^
         | static 
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:3394:15: warning: variable 'halfway_bu' set but not used [-Wunused-but-set-variable]
    3394 |         unsigned int halfway_bu;
         |                      ^
   12 warnings generated.
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/fw_load_retries +590 drivers/media/platform/imagination/vxe-vxd/decoder/vxd_core.c

28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  586  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  587  int vxd_create_ctx(struct vxd_dev *vxd, struct vxd_dec_ctx *ctx)
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  588  {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  589  	int ret = 0;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16 @590  	unsigned int fw_load_retries = 2 * 1000;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  591  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  592  	while (!vxd->firmware.ready) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  593  		usleep_range(1000, 2000);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  594  		fw_load_retries--;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  595  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  596  	if (vxd->firmware.buf_id == 0) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  597  		dev_err(vxd->dev, "%s: request fw not yet done!\n", __func__);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  598  		return -EAGAIN;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  599  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  600  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  601  	/* Create memory management context for HW buffers */
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  602  	ret = img_mem_create_ctx(&ctx->mem_ctx);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  603  	if (ret) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  604  		dev_err(vxd->dev, "%s: failed to create mem context (err:%d)!\n", __func__, ret);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  605  		return ret;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  606  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  607  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  608  	ret = img_mmu_ctx_create(vxd->dev, vxd->mmu_config_addr_width,
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  609  				 ctx->mem_ctx, vxd_drv.internal_heap_id,
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  610  				 img_mmu_callback, vxd, &ctx->mmu_ctx);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  611  	if (ret) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  612  		dev_err(vxd->dev, "%s:%d: failed to create mmu ctx\n", __func__, __LINE__);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  613  		ret = -EPERM;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  614  		goto out_destroy_ctx;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  615  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  616  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  617  	ret = img_mmu_map(ctx->mmu_ctx, vxd->mem_ctx, vxd->firmware.buf_id,
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  618  			  vxd_drv.virt_space.fw_addr,
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  619  			  VXD_MMU_PTD_FLAG_READ_ONLY);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  620  	if (ret) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  621  		dev_err(vxd->dev, "%s:%d: failed to map firmware buffer\n", __func__, __LINE__);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  622  		ret = -EPERM;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  623  		goto out_destroy_mmu_ctx;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  624  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  625  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  626  	ret = img_mmu_map(ctx->mmu_ctx, vxd->mem_ctx, vxd->rendec_buf_id,
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  627  			  vxd_drv.virt_space.rendec_addr,
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  628  			  VXD_MMU_PTD_FLAG_NONE);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  629  	if (ret) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  630  		dev_err(vxd->dev, "%s:%d: failed to map rendec buffer\n", __func__, __LINE__);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  631  		ret = -EPERM;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  632  		goto out_unmap_fw;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  633  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  634  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  635  	ret = img_mmu_get_ptd(ctx->mmu_ctx, &ctx->ptd);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  636  	if (ret) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  637  		dev_err(vxd->dev, "%s:%d: failed to get PTD\n", __func__, __LINE__);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  638  		ret = -EPERM;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  639  		goto out_unmap_rendec;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  640  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  641  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  642  	/* load fw - turned Hw on */
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  643  	ret = vxd_make_hw_on_locked(vxd, ctx->ptd);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  644  	if (ret) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  645  		dev_err(vxd->dev, "%s:%d: failed to start HW\n", __func__, __LINE__);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  646  		ret = -EPERM;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  647  		vxd->hw_on = FALSE;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  648  		goto out_unmap_rendec;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  649  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  650  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  651  	init_work(&ctx->work, stream_worker, HWA_DECODER);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  652  	if (!ctx->work) {
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  653  		ret = ENOMEM;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  654  		goto out_unmap_rendec;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  655  	}
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  656  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  657  	vxd->fw_refcnt++;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  658  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  659  	return ret;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  660  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  661  out_unmap_rendec:
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  662  	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->rendec_buf_id);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  663  out_unmap_fw:
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  664  	img_mmu_unmap(ctx->mmu_ctx, vxd->mem_ctx, vxd->firmware.buf_id);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  665  
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  666  out_destroy_mmu_ctx:
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  667  	img_mmu_ctx_destroy(ctx->mmu_ctx);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  668  out_destroy_ctx:
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  669  	img_mem_destroy_ctx(ctx->mem_ctx);
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  670  	return ret;
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  671  }
28ad5872e4fc04 drivers/media/platform/vxe-vxd/decoder/vxd_core.c Sidraya 2024-06-16  672  

:::::: The code at line 590 was first introduced by commit
:::::: 28ad5872e4fc046f5220a2c0c45acd2c1235d121 media: vxe-vxd: decoder: Add IMG VXD Video Decoder mem to mem drive

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
