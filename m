Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C80B653
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720337212; cv=none; b=Cz+0SdR9f9nExdNKviI8rd4VC6N5ttwcTLapWggYSzSJzVulTkW39ckApYERMaJonhgD6sqIhIr6RC9wjWmESDsitJBn+w1hyBqG9Fgcl3bsZiDe/eP2s7JwQBRsBK7BES0F9KGzv+F2ml5+bo85ZjSM+n9g1vncBQ1yowihBCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720337212; c=relaxed/simple;
	bh=n45JCxJpwuh/nzIh4hLF8W2rVbe6VK0nDOuUfJQ7PIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qA8UHCVHvFyV6/HjGgSbjZwvvcW5oJfNsorqzmA2MGt7Fwyvm9kyZvzL3v5bDQkIOcfiDriPKhb+kZlOZK55zMYMTA/If3PNjzQcUUl0aKIsr/NwQ6MgYEy/VW+F+sYCwvncLTLJT/Bep5GRbNZtn7j3BhMmH701BFWhgPjTd3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGvrWICs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGvrWICs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720337210; x=1751873210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n45JCxJpwuh/nzIh4hLF8W2rVbe6VK0nDOuUfJQ7PIk=;
  b=oGvrWICsfI4zdBpiscYM/3I2ZMORD+pd9VF8OHMHW72KJH/iVJlKWKCn
   /3Tza27lC/jCAgJBR93eXplUn/wvVfhF5bOfNkXW7qh8WJLZMSgMHaAsL
   EY0tl4hp/fUFXqOzc4m5yYHAbf3egIz5HqPHKW/eP7b0mjd2t9d5U/nZ3
   vSYJJGsPbinDK1DZDPBDVnCGeZ0XV6dORXoEU/KXx1oVBvmQIr6dqXe4Y
   YRnHTyaad0bgY862vudy2lSpeowKo9D7VAfe7kfyoUjec/CgmfXKYKom7
   /Fa3fobPGVwLLKkAY9HiUu6D+0t47wMVCIAKcd/Bs8oMyavwu2tqaGIGg
   w==;
X-CSE-ConnectionGUID: z5+L3eZuRFi3cGg+G84ikQ==
X-CSE-MsgGUID: b2KmLtkbS4KKLNAHsjRngw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17664158"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17664158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 00:26:41 -0700
X-CSE-ConnectionGUID: Y6C1q/v8QWCEded7BzZRIQ==
X-CSE-MsgGUID: W3UzwJGxQx269bUI+EWwcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="70406744"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2024 00:26:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQMI9-000Uiu-0T;
	Sun, 07 Jul 2024 07:26:37 +0000
Date: Sun, 7 Jul 2024 15:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 150/150]
 drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:65:28: warning:
 'VIRT_DIR_IDX_MASK' defined but not used
Message-ID: <202407071548.LmqZlbgX-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407071548.LmqZlbgX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071548.LmqZlbgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071548.LmqZlbgX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/imagination/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/imagination/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/imagination/vxe-vxd/decoder/dec_resources.c:21:
>> drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_buf_prepare':
   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:911:36: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     911 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                    ^~~~~~~~~~~~
         |                                    pfn_to_page
>> drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:911:34: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     911 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                  ^
>> drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:778:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     778 |         int pages;
         |             ^~~~~
   In file included from drivers/media/platform/imagination/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/imagination/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/imagination/vxe-vxd/decoder/core.h:20,
                    from drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:53:
   drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h: At top level:
>> drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/media/platform/imagination/vxe-vxd/decoder/jpeg_secure_parser.c:596:5: warning: no previous prototype for 'bspp_jpeg_unit_parser' [-Wmissing-prototypes]
     596 | int bspp_jpeg_unit_parser(void *swsr_ctx, struct bspp_unit_data *unit_data)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/vxe_enc.c:30:6: warning: no previous prototype for 'mmu_callback' [-Wmissing-prototypes]
      30 | void mmu_callback(enum mmu_callback_type callback_type,
         |      ^~~~~~~~~~~~
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:348:5: warning: no previous prototype for 'comm_prepare_fw' [-Wmissing-prototypes]
     348 | int comm_prepare_fw(struct img_fw_context *fw_ctx, enum img_codec codec)
         |     ^~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:396:6: warning: no previous prototype for 'comm_load_h264_tables' [-Wmissing-prototypes]
     396 | void comm_load_h264_tables(struct topaz_dev_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:422:6: warning: no previous prototype for 'comm_load_tables' [-Wmissing-prototypes]
     422 | void comm_load_tables(struct topaz_dev_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:456:6: warning: no previous prototype for 'topaz_setup_firmware' [-Wmissing-prototypes]
     456 | void topaz_setup_firmware(struct topaz_dev_ctx *ctx,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1172:15: warning: no previous prototype for 'topazdd_get_pipe_usage' [-Wmissing-prototypes]
    1172 | unsigned char topazdd_get_pipe_usage(unsigned char pipe)
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1181:6: warning: no previous prototype for 'topazdd_set_pipe_usage' [-Wmissing-prototypes]
    1181 | void topazdd_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c: In function 'comm_dispatch_in_msg':
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_device.c:1538:33: warning: variable 'cmd_id' set but not used [-Wunused-but-set-variable]
    1538 |                 enum mtx_cmd_id cmd_id;
         |                                 ^~~~~~
--
   In file included from drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:31:
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_color_formats.h:18:6: warning: no previous prototype for 'plane_size' [-Wmissing-prototypes]
      18 | void plane_size(enum img_format color_format, unsigned int stride,
         |      ^~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:448:5: warning: no previous prototype for 'topaz_process_message' [-Wmissing-prototypes]
     448 | int topaz_process_message(struct topaz_stream_context *str_ctx, struct mtx_tohost_msg tohost_msg)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:710:6: warning: no previous prototype for 'handle_encoder_firmware_response' [-Wmissing-prototypes]
     710 | void handle_encoder_firmware_response(struct img_writeback_msg *wb_msg, void *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2467:15: warning: no previous prototype for 'topaz_validate_params' [-Wmissing-prototypes]
    2467 | unsigned char topaz_validate_params(struct img_video_params *video_params,
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2771:14: warning: no previous prototype for 'topaz_insert_command' [-Wmissing-prototypes]
    2771 | unsigned int topaz_insert_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2790:14: warning: no previous prototype for 'topaz_insert_command_with_sync' [-Wmissing-prototypes]
    2790 | unsigned int topaz_insert_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2814:14: warning: no previous prototype for 'topaz_insert_mem_command' [-Wmissing-prototypes]
    2814 | unsigned int topaz_insert_mem_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2835:14: warning: no previous prototype for 'topaz_insert_mem_command_with_sync' [-Wmissing-prototypes]
    2835 | unsigned int topaz_insert_mem_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:2951:6: warning: no previous prototype for 'topaz_set_pipe_usage' [-Wmissing-prototypes]
    2951 | void topaz_set_pipe_usage(unsigned char pipe, unsigned char val)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c: In function 'topaz_send_source_frame':
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:3394:22: warning: variable 'halfway_bu' set but not used [-Wunused-but-set-variable]
    3394 |         unsigned int halfway_bu;
         |                      ^~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package.isra':
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:1740:41: warning: writing 2 bytes into a region of size 0 [-Wstringop-overflow=]
    1740 |         this_package->num_coded_buffers = 1;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   In file included from drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:16:
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:720:9,
       inlined from 'topaz_allocate_coded_package.isra' at drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api.c:1731:13:
   include/linux/slab.h:599:24: note: at offset 16 into destination object of size 4 allocated by 'kmalloc_trace'
     599 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     600 |                                 kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     601 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:32:6: warning: no previous prototype for 'calculate_kick_and_bu_size' [-Wmissing-prototypes]
      32 | void calculate_kick_and_bu_size(unsigned int width_in_mbs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:97:14: warning: no previous prototype for 'calculate_stride' [-Wmissing-prototypes]
      97 | unsigned int calculate_stride(enum img_format format, ushort requested_stride_bytes, ushort width)
         |              ^~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:155:6: warning: no previous prototype for 'patch_hw_profile' [-Wmissing-prototypes]
     155 | void patch_hw_profile(struct img_video_params *video_params, struct img_video_context *video)
         |      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:487:6: warning: no previous prototype for 'topaz_setup_input_csc' [-Wmissing-prototypes]
     487 | void topaz_setup_input_csc(struct img_video_context *video,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:746:14: warning: no previous prototype for 'topaz_get_packed_buffer_strides' [-Wmissing-prototypes]
     746 | unsigned int topaz_get_packed_buffer_strides(ushort buffer_stride_bytes,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:837:6: warning: no previous prototype for 'update_driver_mv_scaling' [-Wmissing-prototypes]
     837 | void update_driver_mv_scaling(unsigned int frame_num, unsigned int ref0_num, unsigned int ref1_num,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:952:6: warning: no previous prototype for 'prepare_mv_estimates' [-Wmissing-prototypes]
     952 | void prepare_mv_estimates(struct img_enc_context *enc)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:1027:6: warning: no previous prototype for 'adjust_pic_flags' [-Wmissing-prototypes]
    1027 | void adjust_pic_flags(struct img_enc_context *enc, struct img_rc_params *rc_params,
         |      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:1044:6: warning: no previous prototype for 'setup_rc_data' [-Wmissing-prototypes]
    1044 | void setup_rc_data(struct img_video_context *video, struct pic_params *pic_params,
         |      ^~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/topaz_api_utils.c:1319:6: warning: no previous prototype for 'topaz_setup_input_format' [-Wmissing-prototypes]
    1319 | void topaz_setup_input_format(struct img_video_context *video,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:27:6: warning: no previous prototype for 'insert_element_token' [-Wmissing-prototypes]
      27 | void insert_element_token(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:69:14: warning: no previous prototype for 'write_upto_8bits_to_elements' [-Wmissing-prototypes]
      69 | unsigned int write_upto_8bits_to_elements(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:138:14: warning: no previous prototype for 'write_upto_32bits_to_elements' [-Wmissing-prototypes]
     138 | unsigned int write_upto_32bits_to_elements(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:166:6: warning: no previous prototype for 'h264_write_bits_startcode_prefix_element' [-Wmissing-prototypes]
     166 | void h264_write_bits_startcode_prefix_element(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:184:14: warning: no previous prototype for 'generate_ue' [-Wmissing-prototypes]
     184 | unsigned int generate_ue(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:223:14: warning: no previous prototype for 'generate_se' [-Wmissing-prototypes]
     223 | unsigned int generate_se(struct mtx_header_params *mtx_header,
         |              ^~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:241:6: warning: no previous prototype for 'h264_write_bits_scaling_lists' [-Wmissing-prototypes]
     241 | void h264_write_bits_scaling_lists(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:299:6: warning: no previous prototype for 'h264_write_bits_vui_params' [-Wmissing-prototypes]
     299 | void h264_write_bits_vui_params(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:412:6: warning: no previous prototype for 'h264_write_bits_sequence_header' [-Wmissing-prototypes]
     412 | void h264_write_bits_sequence_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:670:6: warning: no previous prototype for 'h264_write_bits_picture_header' [-Wmissing-prototypes]
     670 | void h264_write_bits_picture_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:816:6: warning: no previous prototype for 'h264_write_bits_aud_header' [-Wmissing-prototypes]
     816 | void h264_write_bits_aud_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:907:6: warning: no previous prototype for 'h264_write_bits_extension_slice_header' [-Wmissing-prototypes]
     907 | void h264_write_bits_extension_slice_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:1074:6: warning: no previous prototype for 'h264_write_bits_slice_header' [-Wmissing-prototypes]
    1074 | void h264_write_bits_slice_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:1243:6: warning: no previous prototype for 'h264_prepare_slice_header' [-Wmissing-prototypes]
    1243 | void h264_prepare_slice_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:1296:14: warning: no previous prototype for 'prepare_encode_slice_params' [-Wmissing-prototypes]
    1296 | unsigned int prepare_encode_slice_params(void *enc_ctx, struct slice_params *slice_params,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/header_gen.c:1546:6: warning: no previous prototype for 'h264_write_bits_mvc_sequence_header' [-Wmissing-prototypes]
    1546 | void h264_write_bits_mvc_sequence_header(struct mtx_header_params *mtx_header,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/media/platform/imagination/vxe-vxd/encoder/mtx_fwif.c:459:6: warning: no previous prototype for 'mtx_dmac_transfer' [-Wmissing-prototypes]
     459 | void mtx_dmac_transfer(struct img_fw_context *fw_ctx, unsigned int channel,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/mtx_fwif.c:575:6: warning: no previous prototype for 'mtx_set_target' [-Wmissing-prototypes]
     575 | void mtx_set_target(struct img_fw_context *fw_ctx)
         |      ^~~~~~~~~~~~~~
>> drivers/media/platform/imagination/vxe-vxd/encoder/mtx_fwif.c:983:14: warning: no previous prototype for 'poll_hw_inactive' [-Wmissing-prototypes]
     983 | unsigned int poll_hw_inactive(struct img_fw_context *fw_ctx)
         |              ^~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/imagination/vxe-vxd/common/imgmmu.c:20:
>> drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
--
   drivers/media/platform/imagination/vxe-vxd/common/work_queue.c: In function 'get_delayed_work_buff':
>> drivers/media/platform/imagination/vxe-vxd/common/work_queue.c:148:22: warning: variable 'previous' set but not used [-Wunused-but-set-variable]
     148 |         struct node *previous = NULL;
         |                      ^~~~~~~~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/VIRT_DIR_IDX_MASK +65 drivers/media/platform/imagination/vxe-vxd/common/imgmmu.h

32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16  58  
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16  59  /* @brief Page offset mask in virtual address - bottom bits */
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16 @60  static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16  61  /* @brief Page table index mask in virtual address - middle bits */
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16 @62  static const unsigned long VIRT_PAGE_TBL_MASK =
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16  63  	(((1 << MMU_DIR_SHIFT) - 1) & ~(((1 << MMU_PAGE_SHIFT) - 1)));
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16  64  /* @brief Directory index mask in virtual address - high bits */
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16 @65  static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
32c3c2cc0c6921 drivers/media/platform/vxe-vxd/common/imgmmu.h Sidraya 2024-06-16  66  

:::::: The code at line 65 was first introduced by commit
:::::: 32c3c2cc0c692145f2c2b0d1fdfce55fef1b07df media: vxe-vxd: common: Create mmu programming helper library

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
