Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A1D15AD8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYrAt0dC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697640192; x=1729176192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yoJo13RpBAeatS9kkeJh7GeTlTUj6M7Uj92Bdcw3oU8=;
  b=CYrAt0dCc3NuIC9Ig+GYyQj2m6R8TSwLaiSVIruNpC/MR3zzbAfeuiG4
   CsYc1XkeoxIU9xaZpiYzRkmvWic9U4AIHKVe04H6d1tCIv2OcDINd3rPJ
   Ek3URgxozmmpm0EJoKLwpOQ5vRoXNsrCs6xpD+DvCyyXuzlMT0dmRX1NN
   6+98USkjp8ovsCDRixw85Lb61LbBttxE/jJ1vuGL1vw3UIKvUA7AXltI8
   qHuSw6sKtkcwvkWH0x1hbeYTxBuMvwA7uOIBPx0ZQnfSiVPSMvUcysXC2
   eYdfhYrznHjFw5B/LFVmAJwgwqWSVecXNDTLP6mhSTnqtdprdV7crCW3B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389903819"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="389903819"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706475267"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="706475267"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Oct 2023 07:43:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt7lC-0000WY-3D;
	Wed, 18 Oct 2023 14:42:58 +0000
Date: Wed, 18 Oct 2023 22:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70] include/linux/completion.h:86:17:
 warning: array subscript 'struct completion[0]' is partly outside array
 bounds of 'unsigned char[4]'
Message-ID: <202310182231.Red84pg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   16d0a659489f8743de04200269719b4b1813a280
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231018/202310182231.Red84pg1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182231.Red84pg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182231.Red84pg1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c: In function 'stream_worker':
   drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:550:25: warning: variable 'vxd' set but not used [-Wunused-but-set-variable]
     550 |         struct vxd_dev *vxd = NULL;
         |                         ^~~
   In file included from include/linux/mm_types.h:14,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:7,
                    from drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:16:
   In function 'init_completion',
       inlined from 'vxd_prepare_fw' at drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1389:2:
>> include/linux/completion.h:86:17: warning: array subscript 'struct completion[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
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
>> drivers/media/platform/img/vxe-vxd/decoder/vxd_core.c:1460:25: warning: array subscript 1 is outside array bounds of 'unsigned int[0]' [-Warray-bounds=]
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
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_vps':
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:594:1: warning: the frame size of 1180 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     594 | }
         | ^
   In function 'HEVC_SWSR_UE',
       inlined from 'bspp_hevc_parse_shortterm_refpicset.constprop' at drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2186:3:
>> drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:55:16: warning: array subscript 'unsigned int[0]' is partly outside array bounds of 'unsigned char[1]' [-Warray-bounds=]
      55 |         *where = swsr_read_unsigned_expgoulomb(swsr_ctx);
         |         ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_shortterm_refpicset.constprop':
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2178:31: note: object 'num_negative_pics' of size 1
    2178 |                 unsigned char num_negative_pics = 0;
         |                               ^~~~~~~~~~~~~~~~~
   In function 'HEVC_SWSR_UE',
       inlined from 'bspp_hevc_parse_shortterm_refpicset.constprop' at drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2191:3:
>> drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:55:16: warning: array subscript 'unsigned int[0]' is partly outside array bounds of 'unsigned char[1]' [-Warray-bounds=]
      55 |         *where = swsr_read_unsigned_expgoulomb(swsr_ctx);
         |         ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c: In function 'bspp_hevc_parse_shortterm_refpicset.constprop':
   drivers/media/platform/img/vxe-vxd/decoder/hevc_secure_parser.c:2179:31: note: object 'num_positive_pics' of size 1
    2179 |                 unsigned char num_positive_pics = 0;
         |                               ^~~~~~~~~~~~~~~~~
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
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1734:28: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
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
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c: In function 'topaz_allocate_coded_package.isra':
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1767:35: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1767 |                  64, &this_package->header_buffer->mem_info))
         |                       ~~~~~~~~~~~~^~~~~~~~~~~~~~~
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
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1770:21: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1770 |         this_package->header_buffer->size =
         |         ~~~~~~~~~~~~^~~~~~~~~~~~~~~
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
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1782:35: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1782 |         if (this_package->mtx_info.code_package_fw_buffer) {
         |             ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1788:45: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1788 |                 kfree(this_package->mtx_info.code_package_fw_buffer);
         |                       ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1789:63: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1789 |                 this_package->mtx_info.code_package_fw_buffer = NULL;
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
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1792:27: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1792 |         kfree(this_package->header_buffer);
         |               ~~~~~~~~~~~~^~~~~~~~~~~~~~~
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
   drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1793:37: warning: array subscript 'struct coded_package_host[0]' is partly outside array bounds of 'unsigned char[4]' [-Warray-bounds=]
    1793 |         this_package->header_buffer = NULL;
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
>> drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1736:41: warning: writing 2 bytes into a region of size 0 [-Wstringop-overflow=]
    1736 |         this_package->num_coded_buffers = 1;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   In function 'kmalloc',
       inlined from 'kzalloc' at include/linux/slab.h:689:9,
       inlined from 'topaz_allocate_coded_package.isra' at drivers/media/platform/img/vxe-vxd/encoder/topaz_api.c:1727:13:
   include/linux/slab.h:553:24: note: at offset 16 into destination object of size 4 allocated by 'kmalloc_trace'
     553 |                 return kmalloc_trace(
         |                        ^~~~~~~~~~~~~~
     554 |                                 kmalloc_caches[kmalloc_type(flags)][index],
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                                 flags, size);
         |                                 ~~~~~~~~~~~~


vim +86 include/linux/completion.h

8b3db9c542e18b Ingo Molnar           2006-07-03  76  
65eb3dc609dec1 Kevin Diggs           2008-08-26  77  /**
ee2f154a598e96 Randy Dunlap          2010-10-26  78   * init_completion - Initialize a dynamically allocated completion
c32f74ab287299 Wolfram Sang          2013-11-14  79   * @x:  pointer to completion structure that is to be initialized
65eb3dc609dec1 Kevin Diggs           2008-08-26  80   *
65eb3dc609dec1 Kevin Diggs           2008-08-26  81   * This inline function will initialize a dynamically created completion
65eb3dc609dec1 Kevin Diggs           2008-08-26  82   * structure.
65eb3dc609dec1 Kevin Diggs           2008-08-26  83   */
b6498aad59b091 Mauro Carvalho Chehab 2020-12-01  84  static inline void init_completion(struct completion *x)
^1da177e4c3f41 Linus Torvalds        2005-04-16  85  {
^1da177e4c3f41 Linus Torvalds        2005-04-16 @86  	x->done = 0;
a5c6234e10280b Thomas Gleixner       2020-03-21  87  	init_swait_queue_head(&x->wait);
^1da177e4c3f41 Linus Torvalds        2005-04-16  88  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  89  

:::::: The code at line 86 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
