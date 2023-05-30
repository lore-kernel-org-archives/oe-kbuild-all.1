Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E4C1EA76
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685468317; x=1717004317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i77o7tey1yauP2rmYSC5qLMN4DUz/Lu7/i4PMfCrjLY=;
  b=CclKEMgJL12N+GyT9T6lG1DqKis8HV7IwmUZo982mVW22hj4Pf2BmxPn
   V5Lzft6+qRPoHAtrgWn/1Xym1HtonYuRqDiLmKtPK1p31zqqFag+GWyrA
   1zV2FVufxvyN+x4Itdbo/wRJR/Cy4b8qywbcYFYnYPN9xXKIZTiRNiL9r
   pwbU5auGDz7fBNLUSVGDhpKieEIYLk6W+twuSjpW7C8jUhOZ53ZOE1tiL
   wGmqjw+dRT7ANXqtWihf2L462A0dpNvXOO1NIHYid81jq22GCS5sUdQwx
   vxlqCAd8LDXIwFFJathlhLyj44HxaGgSrkv4Qsx4yaRsXr1xzk4rUTCWM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383255269"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="383255269"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 10:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="880835724"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="880835724"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 May 2023 10:38:34 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q43Io-0000iN-0s;
	Tue, 30 May 2023 17:38:34 +0000
Date: Wed, 31 May 2023 01:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [v11] media: mediatek: vcodec: support stateless AV1 decoder
Message-ID: <202305310144.HL9pQjAc-lkp@intel.com>
References: <20230530075500.14870-1-xiaoyong.lu@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530075500.14870-1-xiaoyong.lu@mediatek.com>

Hi Xiaoyong,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230530]
[cannot apply to media-tree/master v6.4-rc4 v6.4-rc3 v6.4-rc2 linus/master v6.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoyong-Lu/media-mediatek-vcodec-support-stateless-AV1-decoder/20230530-155716
base:   next-20230530
patch link:    https://lore.kernel.org/r/20230530075500.14870-1-xiaoyong.lu%40mediatek.com
patch subject: [v11] media: mediatek: vcodec: support stateless AV1 decoder
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230531/202305310144.HL9pQjAc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dcf1411dacb831e1283e9f27fd55c6397ff8d578
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoyong-Lu/media-mediatek-vcodec-support-stateless-AV1-decoder/20230530-155716
        git checkout dcf1411dacb831e1283e9f27fd55c6397ff8d578
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/platform/mediatek/vcodec/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310144.HL9pQjAc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:188:23: error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared here (not in a function)
     188 |         u32 tile_size[V4L2_AV1_MAX_TILE_COUNT];
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:268:26: error: 'V4L2_AV1_MAX_SEGMENTS' undeclared here (not in a function)
     268 |         int feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
         |                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:268:49: error: 'V4L2_AV1_SEG_LVL_MAX' undeclared here (not in a function); did you mean 'V4L2_VP9_SEG_LVL_MAX'?
     268 |         int feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
         |                                                 ^~~~~~~~~~~~~~~~~~~~
         |                                                 V4L2_VP9_SEG_LVL_MAX
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:336:35: error: 'V4L2_AV1_NUM_PLANES_MAX' undeclared here (not in a function)
     336 |         u8 frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX];
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:356:36: error: 'V4L2_AV1_TOTAL_REFS_PER_FRAME' undeclared here (not in a function)
     356 |         int loop_filter_ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME];
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:406:27: error: 'V4L2_AV1_MAX_TILE_COLS' undeclared here (not in a function)
     406 |         int mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:407:27: error: 'V4L2_AV1_MAX_TILE_ROWS' undeclared here (not in a function)
     407 |         int mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:559:25: error: 'V4L2_AV1_REFS_PER_FRAME' undeclared here (not in a function)
     559 |         u32 order_hints[V4L2_AV1_REFS_PER_FRAME];
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:874:49: warning: 'struct v4l2_ctrl_av1_frame' declared inside parameter list will not be visible outside of this definition or declaration
     874 |                                          struct v4l2_ctrl_av1_frame *ctrl_fh)
         |                                                 ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_cleanup_slots':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:890:36: error: invalid use of undefined type 'struct v4l2_ctrl_av1_frame'
     890 |                         if (ctrl_fh->reference_frame_ts[ref_id] == timestamp) {
         |                                    ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:903:46: warning: 'struct v4l2_ctrl_av1_frame' declared inside parameter list will not be visible outside of this definition or declaration
     903 |                                       struct v4l2_ctrl_av1_frame *ctrl_fh)
         |                                              ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_slot':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:910:64: error: passing argument 3 of 'vdec_av1_slice_cleanup_slots' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1027:25: note: in expansion of macro 'ARRAY_SIZE'
    1027 |         for (i = 0; i < ARRAY_SIZE(instance->mv); i++)
         |                         ^~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1030:25: note: in expansion of macro 'ARRAY_SIZE'
    1030 |         for (i = 0; i < ARRAY_SIZE(instance->seg); i++)
         |                         ^~~~~~~~~~
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:231:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     231 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:59: note: in expansion of macro '__must_be_array'
      56 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1033:25: note: in expansion of macro 'ARRAY_SIZE'
    1033 |         for (i = 0; i < ARRAY_SIZE(instance->cdf); i++)
         |                         ^~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1130:44: warning: 'struct v4l2_av1_global_motion' declared inside parameter list will not be visible outside of this definition or declaration
    1130 |                                     struct v4l2_av1_global_motion *ctrl_gm)
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_gm':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1135:39: error: invalid use of undefined type 'struct v4l2_av1_global_motion'
    1135 |                 gm[i].wmtype = ctrl_gm->type[i];
         |                                       ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1137:49: error: invalid use of undefined type 'struct v4l2_av1_global_motion'
    1137 |                         gm[i].wmmat[j] = ctrl_gm->params[i][j];
         |                                                 ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1139:43: error: invalid use of undefined type 'struct v4l2_av1_global_motion'
    1139 |                 gm[i].invalid = !!(ctrl_gm->invalid & BIT(i));
         |                                           ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1144:37: error: 'V4L2_AV1_WARP_MODEL_AFFINE' undeclared (first use in this function)
    1144 |                 if (gm[i].wmtype <= V4L2_AV1_WARP_MODEL_AFFINE)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1144:37: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1150:45: warning: 'struct v4l2_av1_segmentation' declared inside parameter list will not be visible outside of this definition or declaration
    1150 |                                      struct v4l2_av1_segmentation *ctrl_seg)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_setup_seg':
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1154:37: note: in expansion of macro 'SEGMENTATION_FLAG'
    1154 |         seg->segmentation_enabled = SEGMENTATION_FLAG(ctrl_seg, ENABLED);
         |                                     ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:58: error: 'V4L2_AV1_SEGMENTATION_FLAG_ENABLED' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_ENABLED'?
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1154:37: note: in expansion of macro 'SEGMENTATION_FLAG'
    1154 |         seg->segmentation_enabled = SEGMENTATION_FLAG(ctrl_seg, ENABLED);
         |                                     ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                ^~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1155:40: note: in expansion of macro 'SEGMENTATION_FLAG'
    1155 |         seg->segmentation_update_map = SEGMENTATION_FLAG(ctrl_seg, UPDATE_MAP);
         |                                        ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:58: error: 'V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP' undeclared (first use in this function); did you mean 'V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP'?
      45 | #define SEGMENTATION_FLAG(x, name)      (!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1155:40: note: in expansion of macro 'SEGMENTATION_FLAG'
    1155 |         seg->segmentation_update_map = SEGMENTATION_FLAG(ctrl_seg, UPDATE_MAP);
         |                                        ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:45:48: error: invalid use of undefined type 'struct v4l2_av1_segmentation'
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


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
