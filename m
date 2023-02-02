Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCA9819
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 02:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675303626; x=1706839626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=URTVsO4qsZZntuZvzanfATprFmazlVXiEbxpN1FuDPA=;
  b=R6jfYk7PoS7z2nggN31V19JwUHx5Hk25+WSe3GdOT3OfhhrlzYonWa0q
   HkVrefwKenLEkq15rEyGDNMpcA4RVdE98ePDzBI9hf6rJx04XaVbYuPm8
   0VQhwGC5iNlNSf1lBXCE+qaFzX2Rr3Tg8pwWCvmpU4f2Q3OmYtfTKOgjT
   6CwDvCxKB+nghd6N8njMuAfDZ3kRUalD5vTNBpaFbeNRlXd/wgt0RRgJL
   j776YWa6wv771hk6I5GXIOGjVDdowBSdsKYjfkXBCwV4A1zXgSVDgo30n
   Qv0cJR9AVh5xdNMpPYiXYFfXg6/KXFQBKkir3TFcUp9sObHxZriDhoRrK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326028775"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="326028775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993900135"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="993900135"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2023 18:07:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNP0A-00061Q-1T;
	Thu, 02 Feb 2023 02:07:02 +0000
Date: Thu, 2 Feb 2023 10:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v8] media: mediatek: vcodec: support stateless AV1
 decoder
Message-ID: <202302021040.lJ7LhTlv-lkp@intel.com>
References: <20230130123816.16568-1-xiaoyong.lu@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130123816.16568-1-xiaoyong.lu@mediatek.com>

Hi Xiaoyong,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.2-rc6 next-20230201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoyong-Lu/media-mediatek-vcodec-support-stateless-AV1-decoder/20230130-204003
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230130123816.16568-1-xiaoyong.lu%40mediatek.com
patch subject: [RFC PATCH v8] media: mediatek: vcodec: support stateless AV1 decoder
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302021040.lJ7LhTlv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b4973d856c53254bc10f6d5039b18e0105e24f10
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoyong-Lu/media-mediatek-vcodec-support-stateless-AV1-decoder/20230130-204003
        git checkout b4973d856c53254bc10f6d5039b18e0105e24f10
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/vdec_drv_if.c: In function 'vdec_if_init':
>> drivers/media/platform/mediatek/vcodec/vdec_drv_if.c:52:14: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_PIX_FMT_VP8_FRAME'?
      52 |         case V4L2_PIX_FMT_AV1_FRAME:
         |              ^~~~~~~~~~~~~~~~~~~~~~
         |              V4L2_PIX_FMT_VP8_FRAME
   drivers/media/platform/mediatek/vcodec/vdec_drv_if.c:52:14: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c: In function 'vdec_msg_queue_init':
>> drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:284:43: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_PIX_FMT_VP8_FRAME'?
     284 |                 if (ctx->current_codec == V4L2_PIX_FMT_AV1_FRAME) {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_PIX_FMT_VP8_FRAME
   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:284:43: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:24:43: error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared (first use in this function)
      24 | #define VDEC_LAT_TILE_SZ            (64 * V4L2_AV1_MAX_TILE_COUNT)
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:292:51: note: in expansion of macro 'VDEC_LAT_TILE_SZ'
     292 |                         lat_buf->tile_addr.size = VDEC_LAT_TILE_SZ;
         |                                                   ^~~~~~~~~~~~~~~~
--
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:112:31: error: 'V4L2_CID_STATELESS_AV1_SEQUENCE' undeclared here (not in a function); did you mean 'V4L2_CID_STATELESS_MPEG2_SEQUENCE'?
     112 |                         .id = V4L2_CID_STATELESS_AV1_SEQUENCE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_STATELESS_MPEG2_SEQUENCE
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:115:31: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared here (not in a function); did you mean 'V4L2_PIX_FMT_VP9_FRAME'?
     115 |                 .codec_type = V4L2_PIX_FMT_AV1_FRAME,
         |                               ^~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_PIX_FMT_VP9_FRAME
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:119:31: error: 'V4L2_CID_STATELESS_AV1_FRAME' undeclared here (not in a function); did you mean 'V4L2_CID_STATELESS_VP9_FRAME'?
     119 |                         .id = V4L2_CID_STATELESS_AV1_FRAME,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_STATELESS_VP9_FRAME
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:126:31: error: 'V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY' undeclared here (not in a function)
     126 |                         .id = V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:127:35: error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared here (not in a function)
     127 |                         .dims = { V4L2_AV1_MAX_TILE_COUNT },
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:134:31: error: 'V4L2_CID_MPEG_VIDEO_AV1_PROFILE' undeclared here (not in a function); did you mean 'V4L2_CID_MPEG_VIDEO_VP8_PROFILE'?
     134 |                         .id = V4L2_CID_MPEG_VIDEO_AV1_PROFILE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_MPEG_VIDEO_VP8_PROFILE
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:135:32: error: 'V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN'?
     135 |                         .min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:143:31: error: 'V4L2_CID_MPEG_VIDEO_AV1_LEVEL' undeclared here (not in a function); did you mean 'V4L2_CID_MPEG_VIDEO_VP9_LEVEL'?
     143 |                         .id = V4L2_CID_MPEG_VIDEO_AV1_LEVEL,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_MPEG_VIDEO_VP9_LEVEL
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:144:32: error: 'V4L2_MPEG_VIDEO_AV1_LEVEL_2_0' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_VP9_LEVEL_2_0'?
     144 |                         .min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_VP9_LEVEL_2_0
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:145:32: error: 'V4L2_MPEG_VIDEO_AV1_LEVEL_4_0' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_VP9_LEVEL_4_0'?
     145 |                         .def = V4L2_MPEG_VIDEO_AV1_LEVEL_4_0,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_VP9_LEVEL_4_0
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:146:32: error: 'V4L2_MPEG_VIDEO_AV1_LEVEL_5_1' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1'?
     146 |                         .max = V4L2_MPEG_VIDEO_AV1_LEVEL_5_1,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1
--
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:188:23: error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared here (not in a function)
     188 |         u32 tile_size[V4L2_AV1_MAX_TILE_COUNT];
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:268:26: error: 'V4L2_AV1_MAX_SEGMENTS' undeclared here (not in a function)
     268 |         int feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
         |                          ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:268:49: error: 'V4L2_AV1_SEG_LVL_MAX' undeclared here (not in a function); did you mean 'V4L2_VP9_SEG_LVL_MAX'?
     268 |         int feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
         |                                                 ^~~~~~~~~~~~~~~~~~~~
         |                                                 V4L2_VP9_SEG_LVL_MAX
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:336:35: error: 'V4L2_AV1_NUM_PLANES_MAX' undeclared here (not in a function)
     336 |         u8 frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX];
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:356:36: error: 'V4L2_AV1_TOTAL_REFS_PER_FRAME' undeclared here (not in a function)
     356 |         int loop_filter_ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME];
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:406:27: error: 'V4L2_AV1_MAX_TILE_COLS' undeclared here (not in a function)
     406 |         int mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:407:27: error: 'V4L2_AV1_MAX_TILE_ROWS' undeclared here (not in a function)
     407 |         int mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
         |                           ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:559:25: error: 'V4L2_AV1_REFS_PER_FRAME' undeclared here (not in a function)
     559 |         u32 order_hints[V4L2_AV1_REFS_PER_FRAME];
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:874:49: warning: 'struct v4l2_ctrl_av1_frame' declared inside parameter list will not be visible outside of this definition or declaration
     874 |                                          struct v4l2_ctrl_av1_frame *ctrl_fh)
         |                                                 ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_cleanup_slots':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:890:36: error: invalid use of undefined type 'struct v4l2_ctrl_av1_frame'
     890 |                         if (ctrl_fh->reference_frame_ts[ref_id] == timestamp) {
         |                                    ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:903:46: warning: 'struct v4l2_ctrl_av1_frame' declared inside parameter list will not be visible outside of this definition or declaration
     903 |                                       struct v4l2_ctrl_av1_frame *ctrl_fh)
         |                                              ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_slot':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:910:64: error: passing argument 3 of 'vdec_av1_slice_cleanup_slots' from incompatible pointer type [-Werror=incompatible-pointer-types]
     910 |         vdec_av1_slice_cleanup_slots(&vsi->slots, &vsi->frame, ctrl_fh);
         |                                                                ^~~~~~~
         |                                                                |
         |                                                                struct v4l2_ctrl_av1_frame *
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:874:70: note: expected 'struct v4l2_ctrl_av1_frame *' but argument is of type 'struct v4l2_ctrl_av1_frame *'
     874 |                                          struct v4l2_ctrl_av1_frame *ctrl_fh)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:933:28: error: invalid use of undefined type 'struct v4l2_ctrl_av1_frame'
     933 |                 if (ctrl_fh->reference_frame_ts[ref_id] == timestamp)
         |                            ^~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:7:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_free_working_buffer':
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:59: note: in expansion of macro '__must_be_array'
      55 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1027:25: note: in expansion of macro 'ARRAY_SIZE'
    1027 |         for (i = 0; i < ARRAY_SIZE(instance->mv); i++)
         |                         ^~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:59: note: in expansion of macro '__must_be_array'
      55 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1030:25: note: in expansion of macro 'ARRAY_SIZE'
    1030 |         for (i = 0; i < ARRAY_SIZE(instance->seg); i++)
         |                         ^~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:59: note: in expansion of macro '__must_be_array'
      55 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1033:25: note: in expansion of macro 'ARRAY_SIZE'
    1033 |         for (i = 0; i < ARRAY_SIZE(instance->cdf); i++)
         |                         ^~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1130:44: warning: 'struct v4l2_av1_global_motion' declared inside parameter list will not be visible outside of this definition or declaration
    1130 |                                     struct v4l2_av1_global_motion *ctrl_gm)
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_gm':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1135:39: error: invalid use of undefined type 'struct v4l2_av1_global_motion'
    1135 |                 gm[i].wmtype = ctrl_gm->type[i];
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1137:49: error: invalid use of undefined type 'struct v4l2_av1_global_motion'
    1137 |                         gm[i].wmmat[j] = ctrl_gm->params[i][j];
         |                                                 ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1139:43: error: invalid use of undefined type 'struct v4l2_av1_global_motion'
    1139 |                 gm[i].invalid = !!(ctrl_gm->invalid & BIT(i));
         |                                           ^~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1144:37: error: 'V4L2_AV1_WARP_MODEL_AFFINE' undeclared (first use in this function)
    1144 |                 if (gm[i].wmtype <= V4L2_AV1_WARP_MODEL_AFFINE)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1144:37: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1150:45: warning: 'struct v4l2_av1_segmentation' declared inside parameter list will not be visible outside of this definition or declaration
    1150 |                                      struct v4l2_av1_segmentation *ctrl_seg)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_seg':
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1154:37: note: in expansion of macro 'SEGMENTATION_FLAG'
    1154 |         seg->segmentation_enabled = SEGMENTATION_FLAG(ctrl_seg, ENABLED);
         |                                     ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:58: error: 'V4L2_AV1_SEGMENTATION_FLAG_ENABLED' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_ENABLED'?
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1154:37: note: in expansion of macro 'SEGMENTATION_FLAG'
    1154 |         seg->segmentation_enabled = SEGMENTATION_FLAG(ctrl_seg, ENABLED);
         |                                     ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1155:40: note: in expansion of macro 'SEGMENTATION_FLAG'
    1155 |         seg->segmentation_update_map = SEGMENTATION_FLAG(ctrl_seg, UPDATE_MAP);
         |                                        ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:58: error: 'V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP'?
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1155:40: note: in expansion of macro 'SEGMENTATION_FLAG'
    1155 |         seg->segmentation_update_map = SEGMENTATION_FLAG(ctrl_seg, UPDATE_MAP);
         |                                        ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1156:45: note: in expansion of macro 'SEGMENTATION_FLAG'
    1156 |         seg->segmentation_temporal_update = SEGMENTATION_FLAG(ctrl_seg, TEMPORAL_UPDATE);
         |                                             ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:58: error: 'V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE'?
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1156:45: note: in expansion of macro 'SEGMENTATION_FLAG'
    1156 |         seg->segmentation_temporal_update = SEGMENTATION_FLAG(ctrl_seg, TEMPORAL_UPDATE);
         |                                             ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1157:41: note: in expansion of macro 'SEGMENTATION_FLAG'
    1157 |         seg->segmentation_update_data = SEGMENTATION_FLAG(ctrl_seg, UPDATE_DATA);
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:58: error: 'V4L2_AV1_SEGMENTATION_FLAG_UPDATE_DATA' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA'?
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1157:41: note: in expansion of macro 'SEGMENTATION_FLAG'
    1157 |         seg->segmentation_update_data = SEGMENTATION_FLAG(ctrl_seg, UPDATE_DATA);
         |                                         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1158:30: note: in expansion of macro 'SEGMENTATION_FLAG'
    1158 |         seg->segid_preskip = SEGMENTATION_FLAG(ctrl_seg, SEG_ID_PRE_SKIP);
         |                              ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:58: error: 'V4L2_AV1_SEGMENTATION_FLAG_SEG_ID_PRE_SKIP' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP'?
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1158:30: note: in expansion of macro 'SEGMENTATION_FLAG'
    1158 |         seg->segid_preskip = SEGMENTATION_FLAG(ctrl_seg, SEG_ID_PRE_SKIP);
         |                              ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1159:42: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
    1159 |         seg->last_active_segid = ctrl_seg->last_active_seg_id;
         |                                          ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1162:56: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
    1162 |                 seg->feature_enabled_mask[i] = ctrl_seg->feature_enabled[i];
         |                                                        ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1164:59: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
    1164 |                         seg->feature_data[i][j] = ctrl_seg->feature_data[i][j];
         |                                                           ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1169:47: warning: 'struct v4l2_av1_quantization' declared inside parameter list will not be visible outside of this definition or declaration
    1169 |                                        struct v4l2_av1_quantization *ctrl_quant)
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_quant':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1171:39: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1171 |         quant->base_q_idx = ctrl_quant->base_q_idx;
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1172:39: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1172 |         quant->delta_qydc = ctrl_quant->delta_q_y_dc;
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1173:39: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1173 |         quant->delta_qudc = ctrl_quant->delta_q_u_dc;
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1174:39: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1174 |         quant->delta_quac = ctrl_quant->delta_q_u_ac;
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1175:39: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1175 |         quant->delta_qvdc = ctrl_quant->delta_q_v_dc;
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1176:39: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1176 |         quant->delta_qvac = ctrl_quant->delta_q_v_ac;
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1177:33: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1177 |         quant->qm_y = ctrl_quant->qm_y;
         |                                 ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1178:33: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1178 |         quant->qm_u = ctrl_quant->qm_u;
         |                                 ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1179:33: error: invalid use of undefined type 'struct v4l2_av1_quantization'
    1179 |         quant->qm_v = ctrl_quant->qm_v;
         |                                 ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:46:48: error: invalid use of undefined type 'struct v4l2_av1_quantization'
      46 | #define QUANT_FLAG(x, name)             (!!((x)->flags & V4L2_AV1_QUANTIZATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1180:32: note: in expansion of macro 'QUANT_FLAG'
    1180 |         quant->using_qmatrix = QUANT_FLAG(ctrl_quant, USING_QMATRIX);
         |                                ^~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:46:58: error: 'V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX' undeclared (first use in this function)
      46 | #define QUANT_FLAG(x, name)             (!!((x)->flags & V4L2_AV1_QUANTIZATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1180:32: note: in expansion of macro 'QUANT_FLAG'
    1180 |         quant->using_qmatrix = QUANT_FLAG(ctrl_quant, USING_QMATRIX);
         |                                ^~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_get_qindex':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1184:42: warning: parameter 'segmentation_id' set but not used [-Wunused-but-set-parameter]
    1184 |                                      int segmentation_id)
         |                                      ~~~~^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1201:44: warning: 'struct v4l2_av1_loop_restoration' declared inside parameter list will not be visible outside of this definition or declaration
    1201 |                                     struct v4l2_av1_loop_restoration  *ctrl_lr)
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_lr':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1208:56: error: invalid use of undefined type 'struct v4l2_av1_loop_restoration'
    1208 |                 lr->frame_restoration_type[i] = ctrl_lr->frame_restoration_type[i];
         |                                                        ^~


vim +52 drivers/media/platform/mediatek/vcodec/vdec_drv_if.c

    16	
    17	int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
    18	{
    19		enum mtk_vdec_hw_arch hw_arch = ctx->dev->vdec_pdata->hw_arch;
    20		int ret = 0;
    21	
    22		switch (fourcc) {
    23		case V4L2_PIX_FMT_H264_SLICE:
    24			if (!ctx->dev->vdec_pdata->is_subdev_supported) {
    25				ctx->dec_if = &vdec_h264_slice_if;
    26				ctx->hw_id = MTK_VDEC_CORE;
    27			} else {
    28				ctx->dec_if = &vdec_h264_slice_multi_if;
    29				ctx->hw_id = IS_VDEC_LAT_ARCH(hw_arch) ? MTK_VDEC_LAT0 : MTK_VDEC_CORE;
    30			}
    31			break;
    32		case V4L2_PIX_FMT_H264:
    33			ctx->dec_if = &vdec_h264_if;
    34			ctx->hw_id = MTK_VDEC_CORE;
    35			break;
    36		case V4L2_PIX_FMT_VP8_FRAME:
    37			ctx->dec_if = &vdec_vp8_slice_if;
    38			ctx->hw_id = MTK_VDEC_CORE;
    39			break;
    40		case V4L2_PIX_FMT_VP8:
    41			ctx->dec_if = &vdec_vp8_if;
    42			ctx->hw_id = MTK_VDEC_CORE;
    43			break;
    44		case V4L2_PIX_FMT_VP9:
    45			ctx->dec_if = &vdec_vp9_if;
    46			ctx->hw_id = MTK_VDEC_CORE;
    47			break;
    48		case V4L2_PIX_FMT_VP9_FRAME:
    49			ctx->dec_if = &vdec_vp9_slice_lat_if;
    50			ctx->hw_id = IS_VDEC_LAT_ARCH(hw_arch) ? MTK_VDEC_LAT0 : MTK_VDEC_CORE;
    51			break;
  > 52		case V4L2_PIX_FMT_AV1_FRAME:
    53			ctx->dec_if = &vdec_av1_slice_lat_if;
    54			ctx->hw_id = MTK_VDEC_LAT0;
    55			break;
    56		default:
    57			return -EINVAL;
    58		}
    59	
    60		mtk_vcodec_dec_enable_hardware(ctx, ctx->hw_id);
    61		ret = ctx->dec_if->init(ctx);
    62		mtk_vcodec_dec_disable_hardware(ctx, ctx->hw_id);
    63	
    64		return ret;
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
