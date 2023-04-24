Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D27C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682339508; x=1713875508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kNe26TLRFq0apmZkI94AnMYGyYo/Wd5ctH0P+jG5uIU=;
  b=bvRAzgVaH41RwPMwA1t5rRHM7Slv0L00kzJ25PZncz3bwzKl1QGqQFw1
   U5lryZv/8sS8yF/wh2qIJWzLCnK+f6LU+g2E+4pDgGGXgqSOxNiFTQNFV
   eIfmWmLiGnvzIQptpm0iMgQ3VaNv/ZGtd9ojOmOdW76CCAhmLlS4Ys28o
   wwdWfRzo1SgP8P/m3J9m9LiRoh2zILN3Um48B8fl3CefmKytnYkUrDHnv
   WL5/NMiqzsJ3XyNYLmSt9KA19zyT2Un+FkOiXTacJMZU3Y79hj7NHmYkn
   2gadLUHEOQ2QdMNDxr0G5DcG/HPu/LAghIZb8TvZ5K937CYuSJ/f3AOqM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="343922917"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="343922917"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 05:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="643343552"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="643343552"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Apr 2023 05:31:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqvM9-000iO0-1J;
	Mon, 24 Apr 2023 12:31:45 +0000
Date: Mon, 24 Apr 2023 20:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [v10] media: mediatek: vcodec: support stateless AV1 decoder
Message-ID: <202304242019.RegSunZC-lkp@intel.com>
References: <20230414083020.22219-1-xiaoyong.lu@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414083020.22219-1-xiaoyong.lu@mediatek.com>

Hi Xiaoyong,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.3 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoyong-Lu/media-mediatek-vcodec-support-stateless-AV1-decoder/20230414-163725
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230414083020.22219-1-xiaoyong.lu%40mediatek.com
patch subject: [v10] media: mediatek: vcodec: support stateless AV1 decoder
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230424/202304242019.RegSunZC-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a2f78eab626ee9b1c17fbe7399d007277463ed80
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoyong-Lu/media-mediatek-vcodec-support-stateless-AV1-decoder/20230414-163725
        git checkout a2f78eab626ee9b1c17fbe7399d007277463ed80
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304242019.RegSunZC-lkp@intel.com/

All errors (new ones prefixed by >>):

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
--
   drivers/media/platform/mediatek/vcodec/vdec_drv_if.c: In function 'vdec_if_init':
>> drivers/media/platform/mediatek/vcodec/vdec_drv_if.c:52:14: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_PIX_FMT_VP9_FRAME'?
      52 |         case V4L2_PIX_FMT_AV1_FRAME:
         |              ^~~~~~~~~~~~~~~~~~~~~~
         |              V4L2_PIX_FMT_VP9_FRAME
   drivers/media/platform/mediatek/vcodec/vdec_drv_if.c:52:14: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c: In function 'vdec_msg_queue_init':
>> drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:284:43: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_PIX_FMT_VP9_FRAME'?
     284 |                 if (ctx->current_codec == V4L2_PIX_FMT_AV1_FRAME) {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_PIX_FMT_VP9_FRAME
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


vim +/V4L2_AV1_MAX_TILE_COUNT +188 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c

    43	
    44	#define BIT_FLAG(x, bit)		(!!((x)->flags & (bit)))
  > 45	#define SEGMENTATION_FLAG(x, name)	(!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
  > 46	#define QUANT_FLAG(x, name)		(!!((x)->flags & V4L2_AV1_QUANTIZATION_FLAG_##name))
  > 47	#define SEQUENCE_FLAG(x, name)		(!!((x)->flags & V4L2_AV1_SEQUENCE_FLAG_##name))
  > 48	#define FH_FLAG(x, name)		(!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
    49	
    50	#define MINQ 0
    51	#define MAXQ 255
    52	
    53	#define DIV_LUT_PREC_BITS 14
    54	#define DIV_LUT_BITS 8
    55	#define DIV_LUT_NUM BIT(DIV_LUT_BITS)
    56	#define WARP_PARAM_REDUCE_BITS 6
    57	#define WARPEDMODEL_PREC_BITS 16
    58	
    59	#define SEG_LVL_ALT_Q 0
    60	#define SECONDARY_FILTER_STRENGTH_NUM_BITS 2
    61	
    62	static const short div_lut[DIV_LUT_NUM + 1] = {
    63		16384, 16320, 16257, 16194, 16132, 16070, 16009, 15948, 15888, 15828, 15768,
    64		15709, 15650, 15592, 15534, 15477, 15420, 15364, 15308, 15252, 15197, 15142,
    65		15087, 15033, 14980, 14926, 14873, 14821, 14769, 14717, 14665, 14614, 14564,
    66		14513, 14463, 14413, 14364, 14315, 14266, 14218, 14170, 14122, 14075, 14028,
    67		13981, 13935, 13888, 13843, 13797, 13752, 13707, 13662, 13618, 13574, 13530,
    68		13487, 13443, 13400, 13358, 13315, 13273, 13231, 13190, 13148, 13107, 13066,
    69		13026, 12985, 12945, 12906, 12866, 12827, 12788, 12749, 12710, 12672, 12633,
    70		12596, 12558, 12520, 12483, 12446, 12409, 12373, 12336, 12300, 12264, 12228,
    71		12193, 12157, 12122, 12087, 12053, 12018, 11984, 11950, 11916, 11882, 11848,
    72		11815, 11782, 11749, 11716, 11683, 11651, 11619, 11586, 11555, 11523, 11491,
    73		11460, 11429, 11398, 11367, 11336, 11305, 11275, 11245, 11215, 11185, 11155,
    74		11125, 11096, 11067, 11038, 11009, 10980, 10951, 10923, 10894, 10866, 10838,
    75		10810, 10782, 10755, 10727, 10700, 10673, 10645, 10618, 10592, 10565, 10538,
    76		10512, 10486, 10460, 10434, 10408, 10382, 10356, 10331, 10305, 10280, 10255,
    77		10230, 10205, 10180, 10156, 10131, 10107, 10082, 10058, 10034, 10010, 9986,
    78		9963,  9939,  9916,  9892,  9869,  9846,  9823,  9800,  9777,  9754,  9732,
    79		9709,  9687,  9664,  9642,  9620,  9598,  9576,  9554,  9533,  9511,  9489,
    80		9468,  9447,  9425,  9404,  9383,  9362,  9341,  9321,  9300,  9279,  9259,
    81		9239,  9218,  9198,  9178,  9158,  9138,  9118,  9098,  9079,  9059,  9039,
    82		9020,  9001,  8981,  8962,  8943,  8924,  8905,  8886,  8867,  8849,  8830,
    83		8812,  8793,  8775,  8756,  8738,  8720,  8702,  8684,  8666,  8648,  8630,
    84		8613,  8595,  8577,  8560,  8542,  8525,  8508,  8490,  8473,  8456,  8439,
    85		8422,  8405,  8389,  8372,  8355,  8339,  8322,  8306,  8289,  8273,  8257,
    86		8240,  8224,  8208,  8192,
    87	};
    88	
    89	/**
    90	 * struct vdec_av1_slice_init_vsi - VSI used to initialize instance
    91	 * @architecture:	architecture type
    92	 * @reserved:		reserved
    93	 * @core_vsi:		for core vsi
    94	 * @cdf_table_addr:	cdf table addr
    95	 * @cdf_table_size:	cdf table size
    96	 * @iq_table_addr:	iq table addr
    97	 * @iq_table_size:	iq table size
    98	 * @vsi_size:		share vsi structure size
    99	 */
   100	struct vdec_av1_slice_init_vsi {
   101		u32 architecture;
   102		u32 reserved;
   103		u64 core_vsi;
   104		u64 cdf_table_addr;
   105		u32 cdf_table_size;
   106		u64 iq_table_addr;
   107		u32 iq_table_size;
   108		u32 vsi_size;
   109	};
   110	
   111	/**
   112	 * struct vdec_av1_slice_mem - memory address and size
   113	 * @buf:		dma_addr padding
   114	 * @dma_addr:		buffer address
   115	 * @size:		buffer size
   116	 * @dma_addr_end:	buffer end address
   117	 * @padding:		for padding
   118	 */
   119	struct vdec_av1_slice_mem {
   120		union {
   121			u64 buf;
   122			dma_addr_t dma_addr;
   123		};
   124		union {
   125			size_t size;
   126			dma_addr_t dma_addr_end;
   127			u64 padding;
   128		};
   129	};
   130	
   131	/**
   132	 * struct vdec_av1_slice_state - decoding state
   133	 * @err                   : err type for decode
   134	 * @full                  : transcoded buffer is full or not
   135	 * @timeout               : decode timeout or not
   136	 * @perf                  : performance enable
   137	 * @crc                   : hw checksum
   138	 * @out_size              : hw output size
   139	 */
   140	struct vdec_av1_slice_state {
   141		int err;
   142		u32 full;
   143		u32 timeout;
   144		u32 perf;
   145		u32 crc[16];
   146		u32 out_size;
   147	};
   148	
   149	/*
   150	 * enum vdec_av1_slice_resolution_level - resolution level
   151	 */
   152	enum vdec_av1_slice_resolution_level {
   153		AV1_RES_NONE,
   154		AV1_RES_FHD,
   155		AV1_RES_4K,
   156		AV1_RES_8K,
   157	};
   158	
   159	/*
   160	 * enum vdec_av1_slice_frame_type - av1 frame type
   161	 */
   162	enum vdec_av1_slice_frame_type {
   163		AV1_KEY_FRAME = 0,
   164		AV1_INTER_FRAME,
   165		AV1_INTRA_ONLY_FRAME,
   166		AV1_SWITCH_FRAME,
   167		AV1_FRAME_TYPES,
   168	};
   169	
   170	/*
   171	 * enum vdec_av1_slice_reference_mode - reference mode type
   172	 */
   173	enum vdec_av1_slice_reference_mode {
   174		AV1_SINGLE_REFERENCE = 0,
   175		AV1_COMPOUND_REFERENCE,
   176		AV1_REFERENCE_MODE_SELECT,
   177		AV1_REFERENCE_MODES,
   178	};
   179	
   180	/**
   181	 * struct vdec_av1_slice_tile_group - info for each tile
   182	 * @num_tiles:			tile number
   183	 * @tile_size:			input size for each tile
   184	 * @tile_start_offset:		tile offset to input buffer
   185	 */
   186	struct vdec_av1_slice_tile_group {
   187		u32 num_tiles;
 > 188		u32 tile_size[V4L2_AV1_MAX_TILE_COUNT];
   189		u32 tile_start_offset[V4L2_AV1_MAX_TILE_COUNT];
   190	};
   191	
   192	/**
   193	 * struct vdec_av1_slice_scale_factors - scale info for each ref frame
   194	 * @is_scaled:  frame is scaled or not
   195	 * @x_scale:    frame width scale coefficient
   196	 * @y_scale:    frame height scale coefficient
   197	 * @x_step:     width step for x_scale
   198	 * @y_step:     height step for y_scale
   199	 */
   200	struct vdec_av1_slice_scale_factors {
   201		u8 is_scaled;
   202		int x_scale;
   203		int y_scale;
   204		int x_step;
   205		int y_step;
   206	};
   207	
   208	/**
   209	 * struct vdec_av1_slice_frame_refs - ref frame info
   210	 * @ref_fb_idx:         ref slot index
   211	 * @ref_map_idx:        ref frame index
   212	 * @scale_factors:      scale factors for each ref frame
   213	 */
   214	struct vdec_av1_slice_frame_refs {
   215		int ref_fb_idx;
   216		int ref_map_idx;
   217		struct vdec_av1_slice_scale_factors scale_factors;
   218	};
   219	
   220	/**
   221	 * struct vdec_av1_slice_gm - AV1 Global Motion parameters
   222	 * @wmtype:     The type of global motion transform used
   223	 * @wmmat:      gm_params
   224	 * @alpha:      alpha info
   225	 * @beta:       beta info
   226	 * @gamma:      gamma info
   227	 * @delta:      delta info
   228	 * @invalid:    is invalid or not
   229	 */
   230	struct vdec_av1_slice_gm {
   231		int wmtype;
   232		int wmmat[8];
   233		short alpha;
   234		short beta;
   235		short gamma;
   236		short delta;
   237		char invalid;
   238	};
   239	
   240	/**
   241	 * struct vdec_av1_slice_sm - AV1 Skip Mode parameters
   242	 * @skip_mode_allowed:  Skip Mode is allowed or not
   243	 * @skip_mode_present:  specified that the skip_mode will be present or not
   244	 * @skip_mode_frame:    specifies the frames to use for compound prediction
   245	 */
   246	struct vdec_av1_slice_sm {
   247		u8 skip_mode_allowed;
   248		u8 skip_mode_present;
   249		int skip_mode_frame[2];
   250	};
   251	
   252	/**
   253	 * struct vdec_av1_slice_seg - AV1 Segmentation params
   254	 * @segmentation_enabled:        this frame makes use of the segmentation tool or not
   255	 * @segmentation_update_map:     segmentation map are updated during the decoding frame
   256	 * @segmentation_temporal_update:segmentation map are coded relative the existing segmentaion map
   257	 * @segmentation_update_data:    new parameters are about to be specified for each segment
   258	 * @feature_data:                specifies the feature data for a segment feature
   259	 * @feature_enabled_mask:        the corresponding feature value is coded or not.
   260	 * @segid_preskip:               segment id will be read before the skip syntax element.
   261	 * @last_active_segid:           the highest numbered segment id that has some enabled feature
   262	 */
   263	struct vdec_av1_slice_seg {
   264		u8 segmentation_enabled;
   265		u8 segmentation_update_map;
   266		u8 segmentation_temporal_update;
   267		u8 segmentation_update_data;
 > 268		int feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
   269		u16 feature_enabled_mask[V4L2_AV1_MAX_SEGMENTS];
   270		int segid_preskip;
   271		int last_active_segid;
   272	};
   273	
   274	/**
   275	 * struct vdec_av1_slice_delta_q_lf - AV1 Loop Filter delta parameters
   276	 * @delta_q_present:    specified whether quantizer index delta values are present
   277	 * @delta_q_res:        specifies the left shift which should be applied to decoded quantizer index
   278	 * @delta_lf_present:   specifies whether loop filter delta values are present
   279	 * @delta_lf_res:       specifies the left shift which should be applied to decoded
   280	 *                      loop filter delta values
   281	 * @delta_lf_multi:     specifies that separate loop filter deltas are sent for horizontal
   282	 *                      luma edges,vertical luma edges,the u edges, and the v edges.
   283	 */
   284	struct vdec_av1_slice_delta_q_lf {
   285		u8 delta_q_present;
   286		u8 delta_q_res;
   287		u8 delta_lf_present;
   288		u8 delta_lf_res;
   289		u8 delta_lf_multi;
   290	};
   291	
   292	/**
   293	 * struct vdec_av1_slice_quantization - AV1 Quantization params
   294	 * @base_q_idx:         indicates the base frame qindex. This is used for Y AC
   295	 *                      coefficients and as the base value for the other quantizers.
   296	 * @qindex:             qindex
   297	 * @delta_qydc:         indicates the Y DC quantizer relative to base_q_idx
   298	 * @delta_qudc:         indicates the U DC quantizer relative to base_q_idx.
   299	 * @delta_quac:         indicates the U AC quantizer relative to base_q_idx
   300	 * @delta_qvdc:         indicates the V DC quantizer relative to base_q_idx
   301	 * @delta_qvac:         indicates the V AC quantizer relative to base_q_idx
   302	 * @using_qmatrix:      specifies that the quantizer matrix will be used to
   303	 *                      compute quantizers
   304	 * @qm_y:               specifies the level in the quantizer matrix that should
   305	 *                      be used for luma plane decoding
   306	 * @qm_u:               specifies the level in the quantizer matrix that should
   307	 *                      be used for chroma U plane decoding.
   308	 * @qm_v:               specifies the level in the quantizer matrix that should be
   309	 *                      used for chroma V plane decoding
   310	 */
   311	struct vdec_av1_slice_quantization {
   312		int base_q_idx;
   313		int qindex[V4L2_AV1_MAX_SEGMENTS];
   314		int delta_qydc;
   315		int delta_qudc;
   316		int delta_quac;
   317		int delta_qvdc;
   318		int delta_qvac;
   319		u8 using_qmatrix;
   320		u8 qm_y;
   321		u8 qm_u;
   322		u8 qm_v;
   323	};
   324	
   325	/**
   326	 * struct vdec_av1_slice_lr - AV1 Loop Restauration parameters
   327	 * @use_lr:                     whether to use loop restoration
   328	 * @use_chroma_lr:              whether to use chroma loop restoration
   329	 * @frame_restoration_type:     specifies the type of restoration used for each plane
   330	 * @loop_restoration_size:      pecifies the size of loop restoration units in units
   331	 *                              of samples in the current plane
   332	 */
   333	struct vdec_av1_slice_lr {
   334		u8 use_lr;
   335		u8 use_chroma_lr;
 > 336		u8 frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX];
   337		u32 loop_restoration_size[V4L2_AV1_NUM_PLANES_MAX];
   338	};
   339	
   340	/**
   341	 * struct vdec_av1_slice_loop_filter - AV1 Loop filter parameters
   342	 * @loop_filter_level:          an array containing loop filter strength values.
   343	 * @loop_filter_ref_deltas:     contains the adjustment needed for the filter
   344	 *                              level based on the chosen reference frame
   345	 * @loop_filter_mode_deltas:    contains the adjustment needed for the filter
   346	 *                              level based on the chosen mode
   347	 * @loop_filter_sharpness:      indicates the sharpness level. The loop_filter_level
   348	 *                              and loop_filter_sharpness together determine when
   349	 *                              a block edge is filtered, and by how much the
   350	 *                              filtering can change the sample values
   351	 * @loop_filter_delta_enabled:  filetr level depends on the mode and reference
   352	 *                              frame used to predict a block
   353	 */
   354	struct vdec_av1_slice_loop_filter {
   355		u8 loop_filter_level[4];
 > 356		int loop_filter_ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME];
   357		int loop_filter_mode_deltas[2];
   358		u8 loop_filter_sharpness;
   359		u8 loop_filter_delta_enabled;
   360	};
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
