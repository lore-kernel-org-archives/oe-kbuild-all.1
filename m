Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237CF63B3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683113718; x=1714649718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e4DCc1dVVlfLSxpq6+6ja6QEhCELvWAZNy2ZWY7bmIE=;
  b=R1ZRRPGkUHnBKn5xt3Qc6WAur4z8F8Ot1ELDiAgtsdVuhr/XXAoCqw0C
   JS+1fpe7K1mfMUh9iAEAnqkyaknQyPePqo/8bBQ+VZ/Ow5Z50lfDPu0/J
   n0M78HX8hK9xpwA1HT6gv0jYsYlGK2AgiRuRQfx376Kg25sYaYk32Sh9o
   TBisUQycAGH9+tghBII334vnzbrRjUXJBdlgLFTcaBaRFKEsVLr/mb0Sb
   0vRZFQHrc+NuTDBl3tYrdkudMO4Eue+2WiBLF987QdbVJxiGZFIlZzt2X
   tPwVjH6sNbzKHA4Ac4gD/gxTB3uR7BPMXyP36AnTjLqapVBFXGDP/QDmw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="332995646"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="332995646"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 04:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="696530800"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="696530800"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 May 2023 04:35:15 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puAlP-0001y0-0u;
	Wed, 03 May 2023 11:35:15 +0000
Date: Wed, 3 May 2023 19:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 10/13] media: verisilicon: Add Rockchip AV1 decoder
Message-ID: <202305031917.GpbJOziD-lkp@intel.com>
References: <20230503083438.85139-11-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503083438.85139-11-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master next-20230428]
[cannot apply to rockchip/for-next pza/reset/next pza/imx-drm/next v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230503-163702
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230503083438.85139-11-benjamin.gaignard%40collabora.com
patch subject: [PATCH v7 10/13] media: verisilicon: Add Rockchip AV1 decoder
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230503/202305031917.GpbJOziD-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3c236849dd49e0704857cf3fdf96d52310b00151
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230503-163702
        git checkout 3c236849dd49e0704857cf3fdf96d52310b00151
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/platform/verisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031917.GpbJOziD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/verisilicon/hantro.h:28,
                    from drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:9:
   drivers/media/platform/verisilicon/hantro_hw.h:274:34: error: field 'frame_type' has incomplete type
     274 |         enum v4l2_av1_frame_type frame_type;
         |                                  ^~~~~~~~~~
   drivers/media/platform/verisilicon/hantro_hw.h:277:25: error: 'V4L2_AV1_TOTAL_REFS_PER_FRAME' undeclared here (not in a function)
     277 |         u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_get_frame_index':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:116:27: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
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
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:260:66: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_tile_group_entry'
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
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_prepare_run':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:413:48: error: 'V4L2_CID_STATELESS_AV1_SEQUENCE' undeclared (first use in this function); did you mean 'V4L2_CID_STATELESS_MPEG2_SEQUENCE'?
     413 |         ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                V4L2_CID_STATELESS_MPEG2_SEQUENCE
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:413:48: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:418:34: error: 'V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY' undeclared (first use in this function)
     418 |             hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:422:45: error: 'V4L2_CID_STATELESS_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_CID_STATELESS_VP9_FRAME'?
     422 |         ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
--
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
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:590:44: error: invalid use of undefined type 'struct v4l2_ctrl_av1_tile_group_entry'
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
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:607:39: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     607 |                          !!((tile_info->tile_cols > 1) || (tile_info->tile_rows > 1)));
         |                                       ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:607:69: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     607 |                          !!((tile_info->tile_cols > 1) || (tile_info->tile_rows > 1)));
         |                                                                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:608:63: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     608 |         hantro_reg_write(vpu, &av1_num_tile_cols_8k, tile_info->tile_cols);
         |                                                               ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:609:63: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     609 |         hantro_reg_write(vpu, &av1_num_tile_rows_8k, tile_info->tile_rows);
         |                                                               ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:612:52: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     612 |         if (rockchip_vpu981_av1_tile_log2(tile_info->tile_cols) ||
         |                                                    ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:613:52: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     613 |             rockchip_vpu981_av1_tile_log2(tile_info->tile_rows))
         |                                                    ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:614:72: error: invalid use of undefined type 'const struct v4l2_av1_tile_info'
     614 |                 hantro_reg_write(vpu, &av1_dec_tile_size_mag, tile_info->tile_size_bytes - 1);
         |                                                                        ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_get_dist':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:626:35: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_sequence'
     626 |         int bits = ctrls->sequence->order_hint_bits - 1;
         |                                   ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:629:29: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_sequence'
     629 |         if (!ctrls->sequence->order_hint_bits)
         |                             ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_frame_sign_bias':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:647:22: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_sequence'
     647 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                      ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:647:57: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     647 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                                         ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:26: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                          ^~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:34: error: 'V4L2_AV1_KEY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:647:43: note: in expansion of macro 'IS_INTRA'
     647 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                           ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:647:57: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     647 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                                         ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:58: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                          ^~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:66: error: 'V4L2_AV1_INTRA_ONLY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:647:43: note: in expansion of macro 'IS_INTRA'
     647 |         if (!sequence->order_hint_bits || IS_INTRA(frame->frame_type)) {
         |                                           ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:659:67: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     659 |                                                              frame->order_hint);
         |                                                                   ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_ref':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:677:30: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     677 |         int cur_width = frame->frame_width_minus_1 + 1;
         |                              ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:678:31: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     678 |         int cur_height = frame->frame_height_minus_1 + 1;
         |                               ^~
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:666:70: warning: parameter 'idx' set but not used [-Wunused-but-set-parameter]
     666 | rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
         |                                                                  ~~~~^~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_segmentation':
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:782:57: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     782 |         const struct v4l2_av1_segmentation *seg = &frame->segmentation;
         |                                                         ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:783:20: error: 'V4L2_AV1_MAX_SEGMENTS' undeclared (first use in this function)
     783 |         u32 segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] = { 0 };
         |                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:783:43: error: 'V4L2_AV1_SEG_LVL_MAX' undeclared (first use in this function); did you mean 'V4L2_VP9_SEG_LVL_MAX'?
     783 |         u32 segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] = { 0 };
         |                                           ^~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_VP9_SEG_LVL_MAX
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:787:19: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     787 |         if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
         |                   ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:787:29: error: 'V4L2_AV1_SEGMENTATION_FLAG_ENABLED' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_ENABLED'?
     787 |         if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             V4L2_VP9_SEGMENTATION_FLAG_ENABLED
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:788:18: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     788 |             frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
         |                  ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:788:40: error: 'V4L2_AV1_REFS_PER_FRAME' undeclared (first use in this function)
     788 |             frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:789:69: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     789 |                 int idx = rockchip_vpu981_get_frame_index(ctx, frame->primary_ref_frame);
         |                                                                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:806:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     806 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:806:42: error: 'V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE'?
     806 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:808:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     808 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP));
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:808:42: error: 'V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP'?
     808 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP));
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:810:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     810 |                          !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED));
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:813:34: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     813 |                          !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE));
         |                                  ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:813:44: error: 'V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE' undeclared (first use in this function); did you mean 'V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT'?
     813 |                          !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:815:27: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     815 |         if (IS_INTRA(frame->frame_type) ||
         |                           ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:26: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                          ^~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:34: error: 'V4L2_AV1_KEY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:815:13: note: in expansion of macro 'IS_INTRA'
     815 |         if (IS_INTRA(frame->frame_type) ||
         |             ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:815:27: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     815 |         if (IS_INTRA(frame->frame_type) ||
         |                           ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:58: note: in definition of macro 'IS_INTRA'
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                          ^~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:44:66: error: 'V4L2_AV1_INTRA_ONLY_FRAME' undeclared (first use in this function)
      44 | #define IS_INTRA(type) ((type == V4L2_AV1_KEY_FRAME) || (type == V4L2_AV1_INTRA_ONLY_FRAME))
         |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:815:13: note: in expansion of macro 'IS_INTRA'
     815 |         if (IS_INTRA(frame->frame_type) ||
         |             ^~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:816:21: error: invalid use of undefined type 'const struct v4l2_ctrl_av1_frame'
     816 |             !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE)) {
         |                     ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:820:16: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     820 |         if (seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) {
         |                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:824:32: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     824 |                         if (seg->feature_enabled[s] &
         |                                ^~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:825:29: error: implicit declaration of function 'V4L2_AV1_SEGMENT_FEATURE_ENABLED'; did you mean 'V4L2_VP9_SEGMENT_FEATURE_ENABLED'? [-Werror=implicit-function-declaration]
     825 |                             V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             V4L2_VP9_SEGMENT_FEATURE_ENABLED
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:825:62: error: 'V4L2_AV1_SEG_LVL_ALT_Q' undeclared (first use in this function); did you mean 'V4L2_VP9_SEG_LVL_ALT_Q'?
     825 |                             V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
         |                                                              ^~~~~~~~~~~~~~~~~~~~~~
         |                                                              V4L2_VP9_SEG_LVL_ALT_Q
   In file included from include/linux/kernel.h:26,
                    from include/linux/videodev2.h:60:
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:827:50: error: invalid use of undefined type 'const struct v4l2_av1_segmentation'
     827 |                                     clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q]),
         |                                                  ^~
   include/linux/minmax.h:20:28: note: in definition of macro '__typecheck'
..


vim +/ref +110 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c

   109	
 > 110	static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
   111	{
   112		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   113		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
   114		const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
   115		u64 timestamp;
   116		int i, idx = frame->ref_frame_idx[ref];
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
