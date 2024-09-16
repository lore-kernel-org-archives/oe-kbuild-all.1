Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F5156228
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726486437; cv=none; b=YCrDZtZAQMxC/zFuWcaCgnfEPBZgHwZh7SGwFNqy0IGi7o31SVxmB8/8FKAK3WI+/hQRKFsd6gBEkkL89BX0fefaHS1UJrIp25L6wQgM64B69/DNjQStyrPnOgpKLKAK7R/+62E1tT0QLKba7TLlhkD5qTPkCoj3kfKX+L7U5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726486437; c=relaxed/simple;
	bh=ZcUa10c1sl+KXYnv0aiLqdMgC7C6xz6kzRyb7j+K7Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PlchXKFtDnbK1vg+lZoSYFd3KheXT35YuYY6NvvvbGcfEM+cIcEg/sOcHRb5oOuuroyN5fabzWiPFEGcBqQp2KfiA/ozhV0GPZClkCSkibD3z+bk8xSo+tc4HFWyisVk4jUVTJCqTcH9sIEnW8L8/DaV9DQzZwMW53xN/1Foc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpM46fkb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpM46fkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726486435; x=1758022435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZcUa10c1sl+KXYnv0aiLqdMgC7C6xz6kzRyb7j+K7Kw=;
  b=NpM46fkbw3yBsO4DLoFroS/rH5z8LDssAGrRhSmJpOXhYOicL0NTgRkw
   evzmqFZLWvw9Qi01vcAVLt/VQnUNnIJD6oe8lkXYw5svmoz2oQcw6ZXQ1
   OB4shh6HuyEJxHH1hRHDx89cN5yyUp5ZAeSUBdp1DVOJzG97UJKWd6H7v
   YZmFK8LF6o67/kFiI5zxxzUujl5cQQr7BLrD0l0ygHUg6nG06xZ7EGQrE
   YHhmNuGrgWd3oEqgN+EwwqbbDo3DgAvdC6lxIdUyAS3ojJIM+5jU7MYf2
   MxOIPVoJjxQEl5dDjqzzl3udeMIzI+g+A2E5gAcT/xfTQ5j973I/Jmmsk
   Q==;
X-CSE-ConnectionGUID: lAHLc/tbSt6enbIEvj6mwA==
X-CSE-MsgGUID: +1owAud7Ql2bAK3YxM3H5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24791768"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24791768"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 04:33:52 -0700
X-CSE-ConnectionGUID: MvlAWDRGQBuY1iERXe/GKg==
X-CSE-MsgGUID: aXzo3zYjRGa6a1oUQeO/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73217286"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2024 04:33:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq9zI-0009hw-1T;
	Mon, 16 Sep 2024 11:33:48 +0000
Date: Mon, 16 Sep 2024 19:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70]
 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:34: error:
 assignment to 'struct page *' from 'int' makes pointer from integer without
 a cast
Message-ID: <202409161948.6tqNrp4k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   829eefbd4a1ba5b21fb43beeba454fd5dc23bb80
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240916/202409161948.6tqNrp4k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161948.6tqNrp4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161948.6tqNrp4k-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'init_work':
>> drivers/media/platform/img/vxe-vxd/common/work_queue.c:42:15: warning: allocation of insufficient size '4' for type 'struct work_struct' with size '16' [-Walloc-size]
      42 |         *work = kzalloc(sizeof(*work), GFP_KERNEL);
         |               ^
   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'init_delayed_work':
>> drivers/media/platform/img/vxe-vxd/common/work_queue.c:65:15: warning: allocation of insufficient size '4' for type 'struct delayed_work' with size '44' [-Walloc-size]
      65 |         *work = kzalloc(sizeof(*work), GFP_KERNEL);
         |               ^
   drivers/media/platform/img/vxe-vxd/common/work_queue.c: In function 'get_delayed_work_buff':
   drivers/media/platform/img/vxe-vxd/common/work_queue.c:148:22: warning: variable 'previous' set but not used [-Wunused-but-set-variable]
     148 |         struct node *previous = NULL;
         |                      ^~~~~~~~
--
   In file included from drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:31:
   drivers/media/platform/img/vxe-vxd/encoder/topaz_color_formats.h:18:6: warning: no previous prototype for 'plane_size' [-Wmissing-prototypes]
      18 | void plane_size(enum img_format color_format, unsigned int stride,
         |      ^~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:448:5: warning: no previous prototype for 'topaz_process_message' [-Wmissing-prototypes]
     448 | int topaz_process_message(struct topaz_stream_context *str_ctx, struct mtx_tohost_msg tohost_msg)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:706:6: warning: no previous prototype for 'handle_encoder_firmware_response' [-Wmissing-prototypes]
     706 | void handle_encoder_firmware_response(struct img_writeback_msg *wb_msg, void *priv)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package':
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:18: warning: allocation of insufficient size '4' for type 'struct coded_package_host' with size '18' [-Walloc-size]
    1727 |         *package = kzalloc(sizeof(*package), GFP_KERNEL);
         |                  ^
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: At top level:
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2463:15: warning: no previous prototype for 'topaz_validate_params' [-Wmissing-prototypes]
    2463 | unsigned char topaz_validate_params(struct img_video_params *video_params,
         |               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2767:14: warning: no previous prototype for 'topaz_insert_command' [-Wmissing-prototypes]
    2767 | unsigned int topaz_insert_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2786:14: warning: no previous prototype for 'topaz_insert_command_with_sync' [-Wmissing-prototypes]
    2786 | unsigned int topaz_insert_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2810:14: warning: no previous prototype for 'topaz_insert_mem_command' [-Wmissing-prototypes]
    2810 | unsigned int topaz_insert_mem_command(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2831:14: warning: no previous prototype for 'topaz_insert_mem_command_with_sync' [-Wmissing-prototypes]
    2831 | unsigned int topaz_insert_mem_command_with_sync(struct img_enc_context *enc_ctx,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:2947:6: warning: no previous prototype for 'topaz_set_pipe_usage' [-Wmissing-prototypes]
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
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:3390:22: warning: variable 'halfway_bu' set but not used [-Wunused-but-set-variable]
    3390 |         unsigned int halfway_bu;
         |                      ^~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package.isra':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1734:28: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1734 |         this_package->busy = 0;
         |         ~~~~~~~~~~~~~~~~~~~^~~
   In file included from drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:16:
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:689:9,
       inlined from 'topaz_allocate_coded_package.isra' at drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:13:
   include/linux/slab.h:553:24: note: object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package.isra':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1736:41: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1736 |         this_package->num_coded_buffers = 1;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:689:9,
       inlined from 'topaz_allocate_coded_package.isra' at drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:13:
   include/linux/slab.h:553:24: note: object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package.isra':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1739:55: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1739 |         this_package->mtx_info.code_package_fw_buffer =
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
    1740 |                 kzalloc(sizeof(struct img_buffer), GFP_KERNEL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:689:9,
       inlined from 'topaz_allocate_coded_package.isra' at drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:13:
   include/linux/slab.h:553:24: note: object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package.isra':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1746:37: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1746 |         this_package->header_buffer = kzalloc(sizeof(*this_package->header_buffer), GFP_KERNEL);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:689:9,
       inlined from 'topaz_allocate_coded_package.isra' at drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:13:
   include/linux/slab.h:553:24: note: object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package.isra':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1759:41: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1759 |                  &this_package->mtx_info.code_package_fw_buffer->mem_info))
         |                   ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:689:9,
       inlined from 'topaz_allocate_coded_package.isra' at drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:13:
   include/linux/slab.h:553:24: note: object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'stream_worker':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:550:25: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'vxd_prepare_fw':
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1384:36: warning: allocation of insufficient size '4' for type 'struct completion' with size '28' [-Walloc-size]
    1384 |         *firmware_loading_complete = kmalloc(sizeof(*firmware_loading_complete), GFP_KERNEL);
         |                                    ^
   In file included from include/linux/mm_types.h:14,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:7,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:16:
   In function 'init_completion',
       inlined from 'vxd_prepare_fw' at drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1389:2:
   include/linux/completion.h:86:17: warning: array subscript 'struct completion[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
      86 |         x->done = 0;
         |         ~~~~~~~~^~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:18:
   In function 'kmalloc',
       inlined from 'vxd_prepare_fw' at drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1384:31:
   include/linux/slab.h:553:24: note: object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'vxd_send_msg':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1460:25: warning: array subscript 1 is outside array bounds of 'unsigned int[0]' [-Warray-bounds=]
    1460 |         if (msg->payload[VXD_PTD_MSG_OFFSET] != 0) {
         |             ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/platform/img/vxe-vxd/decoder/vxd_pvdec_priv.h:22,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:33:
   drivers/media/platform/img/vxe-vxd/decoder/vxd_dec.h:90:22: note: while referencing 'payload'
      90 |         unsigned int payload[0];
         |                      ^~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1496:26: warning: array subscript 1 is outside array bounds of 'unsigned int[0]' [-Warray-bounds=]
    1496 |         item->msg.payload[VXD_PTD_MSG_OFFSET] = stream->ptd;
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/vxd_dec.h:90:22: note: while referencing 'payload'
      90 |         unsigned int payload[0];
         |                      ^~~~~~~
--
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c: In function 'vxd_dec_buf_prepare':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:36: error: implicit declaration of function 'phys_to_page'; did you mean 'pfn_to_page'? [-Wimplicit-function-declaration]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                    ^~~~~~~~~~~~
         |                                    pfn_to_page
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:770:34: error: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     770 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                  ^
   drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c:637:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
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
--
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_vps':
>> drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:594:1: warning: the frame size of 1168 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     594 | }
         | ^
   In function 'HEVC_SWSR_UE',
       inlined from 'bspp_hevc_parse_shortterm_refpicset.constprop' at drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2186:3:
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:55:16: warning: array subscript 'unsigned int[0]' is partly outside array bounds of 'unsigned char[1]' [-Warray-bounds=]
      55 |         *where = swsr_read_unsigned_expgoulomb(swsr_ctx);
         |         ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_shortterm_refpicset.constprop':
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2178:31: note: object 'num_negative_pics' of size 1
    2178 |                 unsigned char num_negative_pics = 0;
         |                               ^~~~~~~~~~~~~~~~~
   In function 'HEVC_SWSR_UE',
       inlined from 'bspp_hevc_parse_shortterm_refpicset.constprop' at drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2191:3:
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:55:16: warning: array subscript 'unsigned int[0]' is partly outside array bounds of 'unsigned char[1]' [-Warray-bounds=]
      55 |         *where = swsr_read_unsigned_expgoulomb(swsr_ctx);
         |         ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_shortterm_refpicset.constprop':
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2179:31: note: object 'num_positive_pics' of size 1
    2179 |                 unsigned char num_positive_pics = 0;
         |                               ^~~~~~~~~~~~~~~~~


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
f1ce557a02e8f1 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c Sidraya 2023-04-25  637  	int pages;
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
