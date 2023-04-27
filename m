Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC6D8824
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682627969; x=1714163969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NvwehH72UuaLPKzFkuPFpW1keuFBmPAFYiXFkZJGp0o=;
  b=CJsHvE3Cjq0NOxwJbWVoKbChFPdRMa1YljRS/nT53p1RDxhOwsg1Es1n
   4FOxcQpVUDhyrDTQPhsZ2WO57neHVOxQstEcjKWV00RRrKBt+/OL0mqnd
   3zWINmKItTkdGSf0tp5hksLK+uheDtR+wrPSucuSK8zaXxQgqeZzxxTL4
   /MQYyvoBAdSDXuHiPAU1nZr5p1rwkEej/j9LBZLzYaCmCF7Q0qEJMK0jb
   m+5Hdoz3N4bSzbWiGPPVjeXEzpsIJ2w0IGbDXBkZkJuz8FzS0duGFgXWw
   4iaYCJCqfOEwYyQJHDktSOq1szYDF6/Ftt9iauJmoWFIN+0VKQUZ2aTZp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327892656"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="327892656"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 13:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="671910594"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="671910594"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2023 13:39:26 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps8Oj-00006T-1H;
	Thu, 27 Apr 2023 20:39:25 +0000
Date: Fri, 28 Apr 2023 04:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:159:17: error:
 implicit declaration of function 'vunmap'; did you mean 'kunmap'?
Message-ID: <202304280409.QE54zhrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   d0673ae878bb78807f65a6021cd9642d6d45bb93
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230428/202304280409.QE54zhrv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 3b23f836c2ec0541aea62823eeed7f2bbe88dc43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/img/vxe-vxd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280409.QE54zhrv-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c: In function 'unified_free':
>> drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:159:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]
     159 |                 vunmap(buffer->kptr);
         |                 ^~~~~~
         |                 kunmap
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c: In function 'unified_map_km':
>> drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:24: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
     197 |         buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
         |                        ^~~~
         |                        kmap
>> drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:63: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MTE'?
     197 |         buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
         |                                                               ^~~~~~
         |                                                               VM_MTE
   drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c:197:63: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'get_delayed_work_buff':
>> drivers/media/platform/img/vxe-vxd/common/work_queue.c:148:22: warning: variable 'previous' set but not used [-Wunused-but-set-variable]
     148 |         struct node *previous = NULL;
         |                      ^~~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'stream_worker':
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:550:25: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^~~
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_buf_prepare':
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:36: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                    ^~~~~~~~~~~~
         |                                    pfn_to_page
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:34: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                  ^
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:637:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     637 |         int pages;
         |             ^~~~~
   In file included from include/linux/of_device.h:6,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:21:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_driver_init':
   include/linux/device/driver.h:265:27: warning: passing argument 1 of '__platform_driver_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     265 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                           ^~~~~~~~~~~
   include/linux/platform_device.h:234:36: note: in definition of macro 'platform_driver_register'
     234 |         __platform_driver_register(drv, THIS_MODULE)
         |                                    ^~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:2245:1: note: in expansion of macro 'module_platform_driver'
    2245 | module_platform_driver(vxd_dec_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:235:39: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     235 | extern int __platform_driver_register(struct platform_driver *,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:17:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_driver_exit':
   include/linux/device/driver.h:270:22: warning: passing argument 1 of 'platform_driver_unregister' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     270 |         __unregister(&(__driver) , ##__VA_ARGS__); \
         |                      ^~~~~~~~~~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:2245:1: note: in expansion of macro 'module_platform_driver'
    2245 | module_platform_driver(vxd_dec_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:237:40: note: expected 'struct platform_driver *' but argument is of type 'const struct platform_driver *'
     237 | extern void platform_driver_unregister(struct platform_driver *);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: At top level:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:379:13: warning: 'vxd_error_recovery' defined but not used [-Wunused-function]
     379 | static void vxd_error_recovery(struct vxd_dec_ctx *ctx)
         |             ^~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_props.h:19,
                    from drivers/media/platform/img/vxe-vxd/decoder/decoder.h:29,
                    from drivers/media/platform/img/vxe-vxd/decoder/core.h:20,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:53:
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:65:28: warning: 'VIRT_DIR_IDX_MASK' defined but not used [-Wunused-const-variable=]
      65 | static const unsigned long VIRT_DIR_IDX_MASK = (~((1 << MMU_DIR_SHIFT) - 1));
         |                            ^~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:62:28: warning: 'VIRT_PAGE_TBL_MASK' defined but not used [-Wunused-const-variable=]
      62 | static const unsigned long VIRT_PAGE_TBL_MASK =
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/common/imgmmu.h:60:28: warning: 'VIRT_PAGE_OFF_MASK' defined but not used [-Wunused-const-variable=]
      60 | static const unsigned long VIRT_PAGE_OFF_MASK = ((1 << MMU_PAGE_SHIFT) - 1);
         |                            ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_vps':
>> drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:594:1: warning: the frame size of 1180 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     594 | }
         | ^
--
>> drivers/media/platform/img/vxe-vxd/decoder/jpeg_secure_parser.c:596:5: warning: no previous prototype for 'bspp_jpeg_unit_parser' [-Wmissing-prototypes]
     596 | int bspp_jpeg_unit_parser(void *swsr_ctx, struct bspp_unit_data *unit_data)
         |     ^~~~~~~~~~~~~~~~~~~~~
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
..


vim +159 drivers/media/platform/img/vxe-vxd/common/img_mem_unified.c

309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  145  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  146  static void unified_free(struct heap *heap, struct buffer *buffer)
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  147  {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  148  	void *dev = buffer->device;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  149  	void *sgt = buffer->priv;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  150  	void *sgl;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  151  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  152  	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__,
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  153  		buffer->id, buffer);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  154  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  155  	if (buffer->kptr) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  156  		dev_dbg(dev, "%s vunmap 0x%p\n", __func__, buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  157  		dma_unmap_sg(dev, img_mmu_get_sgl(sgt), img_mmu_get_orig_nents(sgt),
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  158  			     DMA_FROM_DEVICE);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25 @159  		vunmap(buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  160  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  161  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  162  	sgl = img_mmu_get_sgl(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  163  	while (sgl) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  164  		__free_page(sg_page(sgl));
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  165  		sgl = sg_next(sgl);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  166  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  167  	sg_free_table(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  168  	kfree(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  169  }
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  170  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  171  static int unified_map_km(struct heap *heap, struct buffer *buffer)
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  172  {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  173  	void *dev = buffer->device;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  174  	void *sgt = buffer->priv;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  175  	void *sgl = img_mmu_get_sgl(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  176  	unsigned int num_pages = sg_nents(sgl);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  177  	unsigned int orig_nents = img_mmu_get_orig_nents(sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  178  	void **pages;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  179  	int ret;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  180  	pgprot_t prot;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  181  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  182  	dev_dbg(dev, "%s:%d buffer %d (0x%p)\n", __func__, __LINE__, buffer->id, buffer);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  183  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  184  	if (buffer->kptr) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  185  		dev_warn(dev, "%s called for already mapped buffer %d\n", __func__, buffer->id);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  186  		return 0;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  187  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  188  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  189  	pages = kmalloc_array(num_pages, sizeof(void *), GFP_KERNEL);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  190  	if (!pages)
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  191  		return -ENOMEM;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  192  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  193  	img_mmu_get_pages(pages, sgt);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  194  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  195  	prot = PAGE_KERNEL;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  196  	prot = pgprot_writecombine(prot);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25 @197  	buffer->kptr = vmap((struct page **)pages, num_pages, VM_MAP, prot);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  198  	kfree(pages);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  199  	if (!buffer->kptr) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  200  		dev_err(dev, "%s vmap failed!\n", __func__);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  201  		return -EFAULT;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  202  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  203  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  204  	ret = dma_map_sg(dev, sgl, orig_nents, DMA_FROM_DEVICE);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  205  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  206  	if (ret <= 0) {
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  207  		dev_err(dev, "%s dma_map_sg failed!\n", __func__);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  208  		vunmap(buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  209  		return -EFAULT;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  210  	}
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  211  	dev_dbg(dev, "%s:%d buffer %d orig_nents %d nents %d\n", __func__,
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  212  		__LINE__, buffer->id, orig_nents, ret);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  213  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  214  	img_mmu_set_sgt_nents(sgt, ret);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  215  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  216  	dev_dbg(dev, "%s:%d buffer %d vmap to 0x%p\n", __func__, __LINE__,
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  217  		buffer->id, buffer->kptr);
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  218  
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  219  	return 0;
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  220  }
309ef81727dfe5 drivers/media/platform/vxe-vxd/common/img_mem_unified.c Sidraya 2023-04-25  221  

:::::: The code at line 159 was first introduced by commit
:::::: 309ef81727dfe5aec2a8cbcf0db6d42e7c7292e8 v4l: vxd-dec: Create vxd_dec Mem Manager helper library

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
