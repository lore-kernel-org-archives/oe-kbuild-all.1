Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD08568B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 13:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681307954; x=1712843954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8e/XygcL+VpGlqDP8/416FKeVG8lZRhX3GsN/1h/FxM=;
  b=T8h6uE3Sp3KGOLdUWvAiIvZWFk/e3J0gKo+B6m6dcFNRTtzysAGEYtp7
   ZCYOhN8yZMsbjtaAxhW63FqT0k2/V+7Foin2b1gpySR3idzYeLK9Saf7D
   IsIbfxn1j9wubl3XDM/PHd8NXABj9D7aH+EjmPhc7cIBCknfUUyg1RCIv
   mFYf9orC0R+GS1dLz04tkq4vNLzIOiPzeCMEqKBMgDTXFSV13/F531vS3
   m0PDw9RzqRrlcEE5ODvshB7IsC/llPQYtzF5DR2xy+HPCfRx0a/6Vp2WC
   x+tkuZGH5E6DZ/s/QuIIAqhQ5FrL3OfImy0YSlHRupiCxM7+BGHFxcu5I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409041799"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="409041799"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 06:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="682478496"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="682478496"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Apr 2023 06:59:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmb0A-000Xln-39;
	Wed, 12 Apr 2023 13:59:10 +0000
Date: Wed, 12 Apr 2023 21:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 10/13] media: verisilicon: Add Rockchip AV1 decoder
Message-ID: <202304122121.TO87cAxT-lkp@intel.com>
References: <20230412115652.403949-11-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412115652.403949-11-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230412]
[cannot apply to media-tree/master rockchip/for-next pza/reset/next pza/imx-drm/next v6.3-rc6 v6.3-rc5 v6.3-rc4 linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230412-195930
patch link:    https://lore.kernel.org/r/20230412115652.403949-11-benjamin.gaignard%40collabora.com
patch subject: [PATCH v6 10/13] media: verisilicon: Add Rockchip AV1 decoder
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230412/202304122121.TO87cAxT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d2d48cc4d559f8d9dccfeb858d13a47ed54e517a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230412-195930
        git checkout d2d48cc4d559f8d9dccfeb858d13a47ed54e517a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/verisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122121.TO87cAxT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/verisilicon/hantro.h:28,
                    from drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:9:
   drivers/media/platform/verisilicon/hantro_hw.h:274:34: error: field 'frame_type' has incomplete type
     274 |         enum v4l2_av1_frame_type frame_type;
         |                                  ^~~~~~~~~~
   drivers/media/platform/verisilicon/hantro_hw.h:277:25: error: 'V4L2_AV1_TOTAL_REFS_PER_FRAME' undeclared here (not in a function)
     277 |         u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_get_frame_index':
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:116:27: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     116 |         int i, idx = frame->ref_frame_idx[ref];
         |                           ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:121:26: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     121 |         timestamp = frame->reference_frame_ts[idx];
         |                          ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:110:72: warning: parameter 'ref' set but not used [-Wunused-but-set-parameter]
     110 | static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
         |                                                                    ~~~~^~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_frame_ref':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:157:53: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     157 |                 av1_dec->frame_refs[i].width = frame->frame_width_minus_1 + 1;
         |                                                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:158:54: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     158 |                 av1_dec->frame_refs[i].height = frame->frame_height_minus_1 + 1;
         |                                                      ^~
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/uapi/linux/kernel.h:6,
                    from include/linux/cache.h:5,
                    from include/linux/time.h:5,
                    from include/linux/videodev2.h:59,
                    from include/media/videobuf2-v4l2.h:15,
                    from include/media/v4l2-mem2mem.h:16,
                    from drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:8:
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:159:68: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     159 |                 av1_dec->frame_refs[i].mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
         |                                                                    ^~
   include/uapi/linux/const.h:34:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:159:50: note: in expansion of macro 'DIV_ROUND_UP'
     159 |                 av1_dec->frame_refs[i].mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
         |                                                  ^~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:160:68: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     160 |                 av1_dec->frame_refs[i].mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
         |                                                                    ^~
   include/uapi/linux/const.h:34:40: note: in definition of macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:160:50: note: in expansion of macro 'DIV_ROUND_UP'
     160 |                 av1_dec->frame_refs[i].mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
         |                                                  ^~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:162:58: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     162 |                 av1_dec->frame_refs[i].frame_type = frame->frame_type;
         |                                                          ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:163:58: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     163 |                 av1_dec->frame_refs[i].order_hint = frame->order_hint;
         |                                                          ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:168:70: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     168 |                         av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
         |                                                                      ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_clean_refs':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:201:41: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     201 |                         if (ctrls->frame->reference_frame_ts[ref] == timestamp)
         |                                         ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_tiles_reallocate':
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:260:66: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_tile_group_entry'
     260 |         unsigned int num_tile_cols = 1 << ctrls->tile_group_entry->tile_col;
         |                                                                  ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:261:49: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     261 |         unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
         |                                                 ^~
   include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                            ^
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:261:31: note: in expansion of macro 'ALIGN'
     261 |         unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
         |                               ^~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:261:49: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     261 |         unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
         |                                                 ^~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:261:31: note: in expansion of macro 'ALIGN'
     261 |         unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
         |                               ^~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:261:49: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     261 |         unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
         |                                                 ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:261:31: note: in expansion of macro 'ALIGN'
     261 |         unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
         |                               ^~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: At top level:
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:320:6: warning: no previous prototype for 'rockchip_vpu981_av1_dec_exit' [-Wmissing-prototypes]
     320 | void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:356:5: warning: no previous prototype for 'rockchip_vpu981_av1_dec_init' [-Wmissing-prototypes]
     356 | int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_prepare_run':
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:413:48: error: 'V4L2_CID_STATELESS_AV1_SEQUENCE' undeclared (first use in this function); did you mean 'V4L2_CID_STATELESS_MPEG2_SEQUENCE'?
     413 |         ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                V4L2_CID_STATELESS_MPEG2_SEQUENCE
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:413:48: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:418:34: error: 'V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY' undeclared (first use in this function)
     418 |             hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:422:45: error: 'V4L2_CID_STATELESS_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_CID_STATELESS_VP9_FRAME'?
     422 |         ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             V4L2_CID_STATELESS_VP9_FRAME
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:427:34: error: 'V4L2_CID_STATELESS_AV1_FILM_GRAIN' undeclared (first use in this function); did you mean 'V4L2_CID_STATELESS_VP9_FRAME'?
     427 |             hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FILM_GRAIN);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  V4L2_CID_STATELESS_VP9_FRAME
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_global_model':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:500:57: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     500 |         const struct v4l2_av1_global_motion *gm = &frame->global_motion;
         |                                                         ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:506:41: error: 'V4L2_AV1_REFS_PER_FRAME' undeclared (first use in this function)
     506 |         for (ref_frame = 0; ref_frame < V4L2_AV1_REFS_PER_FRAME; ++ref_frame) {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:512:43: error: invalid use of undefined type 'const struct v4l2_av1_global_motion'
     512 |                                         gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][3];
         |                                           ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:512:52: error: 'V4L2_AV1_REF_LAST_FRAME' undeclared (first use in this function)
     512 |                                         gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][3];
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:515:43: error: invalid use of undefined type 'const struct v4l2_av1_global_motion'
     515 |                                         gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][2];
         |                                           ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:518:43: error: invalid use of undefined type 'const struct v4l2_av1_global_motion'
     518 |                                         gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][i];
         |                                           ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:522:23: error: invalid use of undefined type 'const struct v4l2_av1_global_motion'
     522 |                 if (gm->type[V4L2_AV1_REF_LAST_FRAME + ref_frame] <= V4L2_AV1_WARP_MODEL_AFFINE)
         |                       ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:522:70: error: 'V4L2_AV1_WARP_MODEL_AFFINE' undeclared (first use in this function)
     522 |                 if (gm->type[V4L2_AV1_REF_LAST_FRAME + ref_frame] <= V4L2_AV1_WARP_MODEL_AFFINE)
         |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:523:69: error: invalid use of undefined type 'const struct v4l2_av1_global_motion'
     523 |                         rockchip_vpu981_av1_dec_get_shear_params(&gm->params[V4L2_AV1_REF_LAST_FRAME + ref_frame][0],
         |                                                                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_tile_info':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:556:67: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     556 |         const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
         |                                                                   ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:560:22: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     560 |             tile_info->context_update_tile_id / tile_info->tile_cols;
         |                      ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:560:58: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     560 |             tile_info->context_update_tile_id / tile_info->tile_cols;
         |                                                          ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:562:22: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     562 |             tile_info->context_update_tile_id % tile_info->tile_cols;
         |                      ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:562:58: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     562 |             tile_info->context_update_tile_id % tile_info->tile_cols;
         |                                                          ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:564:41: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     564 |             context_update_x * tile_info->tile_rows + context_update_y;
         |                                         ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:571:42: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     571 |         for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
         |                                          ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:572:50: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     572 |                 for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
         |                                                  ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:573:56: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     573 |                         int tile_id = tile1 * tile_info->tile_cols + tile0;
         |                                                        ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:576:38: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     576 |                             tile_info->height_in_sbs_minus_1[tile1] + 1;
         |                                      ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:577:43: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     577 |                         u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
         |                                           ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:590:44: error: invalid use of undefined type 'struct v4l2_ctrl_av1_tile_group_entry'
     590 |                         start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
         |                                            ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:590:53: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_tile_group_entry'
     590 |                         start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
         |                                                     ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:590:79: error: invalid use of undefined type 'struct v4l2_ctrl_av1_tile_group_entry'
     590 |                         start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
         |                                                                               ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:590:82: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_tile_group_entry'
     590 |                         start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
         |                                                                                  ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:597:50: error: invalid use of undefined type 'struct v4l2_ctrl_av1_tile_group_entry'
     597 |                         end = start + group_entry[tile_id].tile_size;
         |                                                  ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:597:59: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_tile_group_entry'
     597 |                         end = start + group_entry[tile_id].tile_size;
         |                                                           ^
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:608:39: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     608 |                          !!((tile_info->tile_cols > 1) || (tile_info->tile_rows > 1)));
         |                                       ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:608:69: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     608 |                          !!((tile_info->tile_cols > 1) || (tile_info->tile_rows > 1)));
         |                                                                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:609:63: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     609 |         hantro_reg_write(vpu, &av1_num_tile_cols_8k, tile_info->tile_cols);
         |                                                               ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:610:63: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     610 |         hantro_reg_write(vpu, &av1_num_tile_rows_8k, tile_info->tile_rows);
         |                                                               ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:614:52: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     614 |         if (rockchip_vpu981_av1_tile_log2(tile_info->tile_cols) ||
         |                                                    ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:615:52: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     615 |             rockchip_vpu981_av1_tile_log2(tile_info->tile_rows))
         |                                                    ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:616:72: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     616 |                 hantro_reg_write(vpu, &av1_dec_tile_size_mag, tile_info->tile_size_bytes - 1);
         |                                                                        ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_get_dist':
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:628:35: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_sequence'
     628 |         int bits = ctrls->sequence->order_hint_bits - 1;
         |                                   ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:631:29: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_sequence'
     631 |         if (!ctrls->sequence->order_hint_bits)
         |                             ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_frame_sign_bias':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:649:22: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_sequence'
     649 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                      ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:649:57: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     649 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                                         ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:26: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                          ^~~~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:34: error: 'V4L2_AV1_KEY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:649:43: note: in expansion of macro 'IS_INTRA'
     649 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                           ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:649:57: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     649 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                                         ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:58: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                          ^~~~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:66: error: 'V4L2_AV1_INTRA_ONLY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:649:43: note: in expansion of macro 'IS_INTRA'
     649 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                           ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:661:67: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     661 |                                                              frame->order_hint);
         |                                                                   ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_ref':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:679:30: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     679 |         int cur_width = frame->frame_width_minus_1 + 1;
         |                              ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:680:31: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     680 |         int cur_height = frame->frame_height_minus_1 + 1;
         |                               ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:668:70: warning: parameter 'idx' set but not used [-Wunused-but-set-parameter]
     668 | rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
         |                                                                  ~~~~^~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_segmentation':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:784:57: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     784 |         const struct v4l2_av1_segmentation *seg = &frame->segmentation;
         |                                                         ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:785:20: error: 'V4L2_AV1_MAX_SEGMENTS' undeclared (first use in this function)
     785 |         u32 segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] = { 0 };
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:785:43: error: 'V4L2_AV1_SEG_LVL_MAX' undeclared (first use in this function); did you mean 'V4L2_VP9_SEG_LVL_MAX'?
     785 |         u32 segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] = { 0 };
         |                                           ^~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_VP9_SEG_LVL_MAX
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:789:19: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     789 |         if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
         |                   ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:789:29: error: 'V4L2_AV1_SEGMENTATION_FLAG_ENABLED' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_ENABLED'?
     789 |         if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             V4L2_VP9_SEGMENTATION_FLAG_ENABLED
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:790:18: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     790 |             frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
         |                  ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:790:40: error: 'V4L2_AV1_REFS_PER_FRAME' undeclared (first use in this function)
     790 |             frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:791:69: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     791 |                 int idx = rockchip_vpu981_get_frame_index(ctx, frame->primary_ref_frame);
         |                                                                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:808:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     808 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:808:42: error: 'V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE'?
     808 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:810:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     810 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP));
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:810:42: error: 'V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP'?
     810 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP));
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:812:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     812 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED));
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:815:34: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     815 |                          !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE));
         |                                  ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:815:44: error: 'V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE' undeclared (first use in this function); did you mean 'V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT'?
     815 |                          !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:817:27: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     817 |         if (IS_INTRA(frame->frame_type) ||
         |                           ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:26: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                          ^~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:34: error: 'V4L2_AV1_KEY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:817:13: note: in expansion of macro 'IS_INTRA'
     817 |         if (IS_INTRA(frame->frame_type) ||
         |             ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:817:27: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     817 |         if (IS_INTRA(frame->frame_type) ||
         |                           ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:58: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                          ^~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:66: error: 'V4L2_AV1_INTRA_ONLY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:817:13: note: in expansion of macro 'IS_INTRA'
     817 |         if (IS_INTRA(frame->frame_type) ||
         |             ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:818:21: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     818 |             !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE)) {
         |                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:822:16: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     822 |         if (seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) {
         |                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:826:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     826 |                         if (seg->feature_enabled[s] &
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:827:29: error: implicit declaration of function 'V4L2_AV1_SEGMENT_FEATURE_ENABLED'; did you mean 'V4L2_VP9_SEGMENT_FEATURE_ENABLED'? [-Werror=implicit-function-declaration]
     827 |                             V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             V4L2_VP9_SEGMENT_FEATURE_ENABLED
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:827:62: error: 'V4L2_AV1_SEG_LVL_ALT_Q' undeclared (first use in this function); did you mean 'V4L2_VP9_SEG_LVL_ALT_Q'?
     827 |                             V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
         |                                                              ^~~~~~~~~~~~~~~~~~~~~~
         |                                                              V4L2_VP9_SEG_LVL_ALT_Q
   In file included from include/linux/kernel.h:27,
                    from include/linux/videodev2.h:60:
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:829:50: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     829 |                                     clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q]),
         |                                                  ^~
   include/linux/minmax.h:20:28: note: in definition of macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                            ^
   include/linux/minmax.h:111:28: note: in expansion of macro '__careful_clamp'
     111 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:829:37: note: in expansion of macro 'clamp'
     829 |                                     clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q]),
         |                                     ^~~~~
   include/linux/math.h:143:17: note: in expansion of macro '__abs_choose_expr'
     143 | #define abs(x)  __abs_choose_expr(x, long long,                         \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:829:43: note: in expansion of macro 'abs'
     829 |                                     clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q]),
         |                                           ^~~


vim +116 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c

    43	
  > 44	#define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
    45	
    46	#define LST_BUF_IDX (V4L2_AV1_REF_LAST_FRAME - V4L2_AV1_REF_LAST_FRAME)
    47	#define LST2_BUF_IDX (V4L2_AV1_REF_LAST2_FRAME - V4L2_AV1_REF_LAST_FRAME)
    48	#define LST3_BUF_IDX (V4L2_AV1_REF_LAST3_FRAME - V4L2_AV1_REF_LAST_FRAME)
    49	#define GLD_BUF_IDX (V4L2_AV1_REF_GOLDEN_FRAME - V4L2_AV1_REF_LAST_FRAME)
    50	#define BWD_BUF_IDX (V4L2_AV1_REF_BWDREF_FRAME - V4L2_AV1_REF_LAST_FRAME)
    51	#define ALT2_BUF_IDX (V4L2_AV1_REF_ALTREF2_FRAME - V4L2_AV1_REF_LAST_FRAME)
    52	#define ALT_BUF_IDX (V4L2_AV1_REF_ALTREF_FRAME - V4L2_AV1_REF_LAST_FRAME)
    53	
    54	#define DIV_LUT_PREC_BITS 14
    55	#define DIV_LUT_BITS 8
    56	#define DIV_LUT_NUM BIT(DIV_LUT_BITS)
    57	#define WARP_PARAM_REDUCE_BITS 6
    58	#define WARPEDMODEL_PREC_BITS 16
    59	
    60	#define AV1_DIV_ROUND_UP_POW2(value, n)			\
    61	({							\
    62		typeof(n) _n  = n;				\
    63		typeof(value) _value = value;			\
    64		(_value + (BIT(_n) >> 1)) >> _n;		\
    65	})
    66	
    67	#define AV1_DIV_ROUND_UP_POW2_SIGNED(value, n)				\
    68	({									\
    69		typeof(n) _n_  = n;						\
    70		typeof(value) _value_ = value;					\
    71		(((_value_) < 0) ? -AV1_DIV_ROUND_UP_POW2(-(_value_), (_n_))	\
    72			: AV1_DIV_ROUND_UP_POW2((_value_), (_n_)));		\
    73	})
    74	
    75	struct rockchip_av1_film_grain {
    76		u8 scaling_lut_y[256];
    77		u8 scaling_lut_cb[256];
    78		u8 scaling_lut_cr[256];
    79		s16 cropped_luma_grain_block[4096];
    80		s16 cropped_chroma_grain_block[1024 * 2];
    81	};
    82	
    83	static const short div_lut[DIV_LUT_NUM + 1] = {
    84		16384, 16320, 16257, 16194, 16132, 16070, 16009, 15948, 15888, 15828, 15768,
    85		15709, 15650, 15592, 15534, 15477, 15420, 15364, 15308, 15252, 15197, 15142,
    86		15087, 15033, 14980, 14926, 14873, 14821, 14769, 14717, 14665, 14614, 14564,
    87		14513, 14463, 14413, 14364, 14315, 14266, 14218, 14170, 14122, 14075, 14028,
    88		13981, 13935, 13888, 13843, 13797, 13752, 13707, 13662, 13618, 13574, 13530,
    89		13487, 13443, 13400, 13358, 13315, 13273, 13231, 13190, 13148, 13107, 13066,
    90		13026, 12985, 12945, 12906, 12866, 12827, 12788, 12749, 12710, 12672, 12633,
    91		12596, 12558, 12520, 12483, 12446, 12409, 12373, 12336, 12300, 12264, 12228,
    92		12193, 12157, 12122, 12087, 12053, 12018, 11984, 11950, 11916, 11882, 11848,
    93		11815, 11782, 11749, 11716, 11683, 11651, 11619, 11586, 11555, 11523, 11491,
    94		11460, 11429, 11398, 11367, 11336, 11305, 11275, 11245, 11215, 11185, 11155,
    95		11125, 11096, 11067, 11038, 11009, 10980, 10951, 10923, 10894, 10866, 10838,
    96		10810, 10782, 10755, 10727, 10700, 10673, 10645, 10618, 10592, 10565, 10538,
    97		10512, 10486, 10460, 10434, 10408, 10382, 10356, 10331, 10305, 10280, 10255,
    98		10230, 10205, 10180, 10156, 10131, 10107, 10082, 10058, 10034, 10010, 9986,
    99		9963,  9939,  9916,  9892,  9869,  9846,  9823,  9800,  9777,  9754,  9732,
   100		9709,  9687,  9664,  9642,  9620,  9598,  9576,  9554,  9533,  9511,  9489,
   101		9468,  9447,  9425,  9404,  9383,  9362,  9341,  9321,  9300,  9279,  9259,
   102		9239,  9218,  9198,  9178,  9158,  9138,  9118,  9098,  9079,  9059,  9039,
   103		9020,  9001,  8981,  8962,  8943,  8924,  8905,  8886,  8867,  8849,  8830,
   104		8812,  8793,  8775,  8756,  8738,  8720,  8702,  8684,  8666,  8648,  8630,
   105		8613,  8595,  8577,  8560,  8542,  8525,  8508,  8490,  8473,  8456,  8439,
   106		8422,  8405,  8389,  8372,  8355,  8339,  8322,  8306,  8289,  8273,  8257,
   107		8240,  8224,  8208,  8192,
   108	};
   109	
 > 110	static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
   111	{
   112		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   113		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
   114		const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
   115		u64 timestamp;
 > 116		int i, idx = frame->ref_frame_idx[ref];
   117	
   118		if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
   119			return AV1_INVALID_IDX;
   120	
   121		timestamp = frame->reference_frame_ts[idx];
   122		for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
   123			if (!av1_dec->frame_refs[i].used)
   124				continue;
   125			if (av1_dec->frame_refs[i].timestamp == timestamp)
   126				return i;
   127		}
   128	
   129		return AV1_INVALID_IDX;
   130	}
   131	
   132	static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int ref)
   133	{
   134		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   135		int idx = rockchip_vpu981_get_frame_index(ctx, ref);
   136	
   137		if (idx != AV1_INVALID_IDX)
   138			return av1_dec->frame_refs[idx].order_hint;
   139	
   140		return 0;
   141	}
   142	
   143	static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
   144						     u64 timestamp)
   145	{
   146		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   147		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
   148		const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
   149		int i;
   150	
   151		for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
   152			int j;
   153	
   154			if (av1_dec->frame_refs[i].used)
   155				continue;
   156	
   157			av1_dec->frame_refs[i].width = frame->frame_width_minus_1 + 1;
   158			av1_dec->frame_refs[i].height = frame->frame_height_minus_1 + 1;
   159			av1_dec->frame_refs[i].mi_cols = DIV_ROUND_UP(frame->frame_width_minus_1 + 1, 8);
   160			av1_dec->frame_refs[i].mi_rows = DIV_ROUND_UP(frame->frame_height_minus_1 + 1, 8);
   161			av1_dec->frame_refs[i].timestamp = timestamp;
   162			av1_dec->frame_refs[i].frame_type = frame->frame_type;
   163			av1_dec->frame_refs[i].order_hint = frame->order_hint;
   164			if (!av1_dec->frame_refs[i].vb2_ref)
   165				av1_dec->frame_refs[i].vb2_ref = hantro_get_dst_buf(ctx);
   166	
   167			for (j = 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
   168				av1_dec->frame_refs[i].order_hints[j] = frame->order_hints[j];
   169			av1_dec->frame_refs[i].used = true;
   170			av1_dec->current_frame_index = i;
   171	
   172			return i;
   173		}
   174	
   175		return AV1_INVALID_IDX;
   176	}
   177	
   178	static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, int idx)
   179	{
   180		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   181	
   182		if (idx >= 0)
   183			av1_dec->frame_refs[idx].used = false;
   184	}
   185	
   186	static void rockchip_vpu981_av1_dec_clean_refs(struct hantro_ctx *ctx)
   187	{
   188		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   189		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
   190	
   191		int ref, idx;
   192	
   193		for (idx = 0; idx < AV1_MAX_FRAME_BUF_COUNT; idx++) {
   194			u64 timestamp = av1_dec->frame_refs[idx].timestamp;
   195			bool used = false;
   196	
   197			if (!av1_dec->frame_refs[idx].used)
   198				continue;
   199	
   200			for (ref = 0; ref < V4L2_AV1_TOTAL_REFS_PER_FRAME; ref++) {
   201				if (ctrls->frame->reference_frame_ts[ref] == timestamp)
   202					used = true;
   203			}
   204	
   205			if (!used)
   206				rockchip_vpu981_av1_dec_frame_unref(ctx, idx);
   207		}
   208	}
   209	
   210	static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
   211	{
   212		return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
   213	}
   214	
   215	static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx)
   216	{
   217		size_t cr_offset = rockchip_vpu981_av1_dec_luma_size(ctx);
   218	
   219		return ALIGN((cr_offset * 3) / 2, 64);
   220	}
   221	
   222	static void rockchip_vpu981_av1_dec_tiles_free(struct hantro_ctx *ctx)
   223	{
   224		struct hantro_dev *vpu = ctx->dev;
   225		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   226	
   227		if (av1_dec->db_data_col.cpu)
   228			dma_free_coherent(vpu->dev, av1_dec->db_data_col.size,
   229					  av1_dec->db_data_col.cpu,
   230					  av1_dec->db_data_col.dma);
   231		av1_dec->db_data_col.cpu = NULL;
   232	
   233		if (av1_dec->db_ctrl_col.cpu)
   234			dma_free_coherent(vpu->dev, av1_dec->db_ctrl_col.size,
   235					  av1_dec->db_ctrl_col.cpu,
   236					  av1_dec->db_ctrl_col.dma);
   237		av1_dec->db_ctrl_col.cpu = NULL;
   238	
   239		if (av1_dec->cdef_col.cpu)
   240			dma_free_coherent(vpu->dev, av1_dec->cdef_col.size,
   241					  av1_dec->cdef_col.cpu, av1_dec->cdef_col.dma);
   242		av1_dec->cdef_col.cpu = NULL;
   243	
   244		if (av1_dec->sr_col.cpu)
   245			dma_free_coherent(vpu->dev, av1_dec->sr_col.size,
   246					  av1_dec->sr_col.cpu, av1_dec->sr_col.dma);
   247		av1_dec->sr_col.cpu = NULL;
   248	
   249		if (av1_dec->lr_col.cpu)
   250			dma_free_coherent(vpu->dev, av1_dec->lr_col.size,
   251					  av1_dec->lr_col.cpu, av1_dec->lr_col.dma);
   252		av1_dec->lr_col.cpu = NULL;
   253	}
   254	
   255	static int rockchip_vpu981_av1_dec_tiles_reallocate(struct hantro_ctx *ctx)
   256	{
   257		struct hantro_dev *vpu = ctx->dev;
   258		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   259		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
 > 260		unsigned int num_tile_cols = 1 << ctrls->tile_group_entry->tile_col;
   261		unsigned int height = ALIGN(ctrls->frame->frame_height_minus_1 + 1, 64);
   262		unsigned int height_in_sb = height / 64;
   263		unsigned int stripe_num = ((height + 8) + 63) / 64;
   264		size_t size;
   265	
   266		if (av1_dec->db_data_col.size >=
   267		    ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols)
   268			return 0;
   269	
   270		rockchip_vpu981_av1_dec_tiles_free(ctx);
   271	
   272		size = ALIGN(height * 12 * ctx->bit_depth / 8, 128) * num_tile_cols;
   273		av1_dec->db_data_col.cpu = dma_alloc_coherent(vpu->dev, size,
   274							      &av1_dec->db_data_col.dma,
   275							      GFP_KERNEL);
   276		if (!av1_dec->db_data_col.cpu)
   277			goto buffer_allocation_error;
   278		av1_dec->db_data_col.size = size;
   279	
   280		size = ALIGN(height * 2 * 16 / 4, 128) * num_tile_cols;
   281		av1_dec->db_ctrl_col.cpu = dma_alloc_coherent(vpu->dev, size,
   282							      &av1_dec->db_ctrl_col.dma,
   283							      GFP_KERNEL);
   284		if (!av1_dec->db_ctrl_col.cpu)
   285			goto buffer_allocation_error;
   286		av1_dec->db_ctrl_col.size = size;
   287	
   288		size = ALIGN(height_in_sb * 44 * ctx->bit_depth * 16 / 8, 128) * num_tile_cols;
   289		av1_dec->cdef_col.cpu = dma_alloc_coherent(vpu->dev, size,
   290							   &av1_dec->cdef_col.dma,
   291							   GFP_KERNEL);
   292		if (!av1_dec->cdef_col.cpu)
   293			goto buffer_allocation_error;
   294		av1_dec->cdef_col.size = size;
   295	
   296		size = ALIGN(height_in_sb * (3040 + 1280), 128) * num_tile_cols;
   297		av1_dec->sr_col.cpu = dma_alloc_coherent(vpu->dev, size,
   298							 &av1_dec->sr_col.dma,
   299							 GFP_KERNEL);
   300		if (!av1_dec->sr_col.cpu)
   301			goto buffer_allocation_error;
   302		av1_dec->sr_col.size = size;
   303	
   304		size = ALIGN(stripe_num * 1536 * ctx->bit_depth / 8, 128) * num_tile_cols;
   305		av1_dec->lr_col.cpu = dma_alloc_coherent(vpu->dev, size,
   306							 &av1_dec->lr_col.dma,
   307							 GFP_KERNEL);
   308		if (!av1_dec->lr_col.cpu)
   309			goto buffer_allocation_error;
   310		av1_dec->lr_col.size = size;
   311	
   312		av1_dec->num_tile_cols_allocated = num_tile_cols;
   313		return 0;
   314	
   315	buffer_allocation_error:
   316		rockchip_vpu981_av1_dec_tiles_free(ctx);
   317		return -ENOMEM;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
