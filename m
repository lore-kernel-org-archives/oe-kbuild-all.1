Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE13F7E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 06:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687673735; x=1719209735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37gAejjjJPRujfaFA60JaJHxyy/f8z0RUaqWsnw3ZVY=;
  b=PTJgUiKx4182Ot5rNPYLZ4BY6rukpjvnXEwSwoNO7URgzXGM53DoreGd
   +P1rlL1srH3HLcsn+z2vfe1E5vzJ3ork2gB3+IQC2Ol+AlZJubRuLsrhV
   ytuTeYrtWqAfGds4jgBgm41ZS293rwuny8g3iOvDhMLAJNz+/VplYOL5g
   UGy/YvoQkzd8nOL+O4RfSWF2HPRaFj4kHYaYxFjFnHCQg1/fWNYfcHEFN
   oVYkzW2mfIFOaU4l9NO/fhAlJkUPy0hchRfqDfvMoTqMXnlhU2DD4be1i
   IQf4TYnJ4eLIJbEfXuH4s1cXZj81lCwii+Bzcbzz6KytGhjouaI0dHVhQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="345783808"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="345783808"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 23:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="805638239"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="805638239"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2023 23:15:32 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDJ23-0009pR-2s;
	Sun, 25 Jun 2023 06:15:31 +0000
Date: Sun, 25 Jun 2023 14:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 13/26]
 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:188:23:
 error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared here (not in a function)
Message-ID: <202306251432.fvyCDrlF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   1fa783ee2b7a45e571a18af62b4ad3f129c90792
commit: c2a413f6b5b4ccabd57a6fb0c07a6d1adbce8026 [13/26] Revert "BACKPORT: FROMLIST: media: Add AV1 uAPI v4"
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230625/202306251432.fvyCDrlF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251432.fvyCDrlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251432.fvyCDrlF-lkp@intel.com/

Note: the chrome-os/chromeos-5.10 HEAD 1fa783ee2b7a45e571a18af62b4ad3f129c90792 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:188:23: error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared here (not in a function)
     188 |         u32 tile_size[V4L2_AV1_MAX_TILE_COUNT];
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:268:26: error: 'V4L2_AV1_MAX_SEGMENTS' undeclared here (not in a function); did you mean 'BLK_MAX_SEGMENTS'?
     268 |         int feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          BLK_MAX_SEGMENTS
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
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:874:49: warning: 'struct v4l2_ctrl_av1_frame' declared inside parameter list will not be visible outside of this definition or declaration
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
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:5,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:7:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function 'vdec_av1_slice_free_working_buffer':
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:240:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     240 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:49:59: note: in expansion of macro '__must_be_array'
      49 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1027:25: note: in expansion of macro 'ARRAY_SIZE'
    1027 |         for (i = 0; i < ARRAY_SIZE(instance->mv); i++)
         |                         ^~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:240:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     240 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:49:59: note: in expansion of macro '__must_be_array'
      49 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1030:25: note: in expansion of macro 'ARRAY_SIZE'
    1030 |         for (i = 0; i < ARRAY_SIZE(instance->seg); i++)
         |                         ^~~~~~~~~~
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:240:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     240 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:49:59: note: in expansion of macro '__must_be_array'
      49 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1033:25: note: in expansion of macro 'ARRAY_SIZE'
    1033 |         for (i = 0; i < ARRAY_SIZE(instance->cdf); i++)
         |                         ^~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: At top level:
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1130:44: warning: 'struct v4l2_av1_global_motion' declared inside parameter list will not be visible outside of this definition or declaration
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
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1150:45: warning: 'struct v4l2_av1_segmentation' declared inside parameter list will not be visible outside of this definition or declaration
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
>> drivers/media/platform/mediatek/vcodec/vdec_drv_if.c:56:14: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_PIX_FMT_VP8_FRAME'?
      56 |         case V4L2_PIX_FMT_AV1_FRAME:
         |              ^~~~~~~~~~~~~~~~~~~~~~
         |              V4L2_PIX_FMT_VP8_FRAME
   drivers/media/platform/mediatek/vcodec/vdec_drv_if.c:56:14: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c: In function 'vdec_msg_queue_init':
>> drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:335:43: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared (first use in this function); did you mean 'V4L2_PIX_FMT_VP8_FRAME'?
     335 |                 if (ctx->current_codec == V4L2_PIX_FMT_AV1_FRAME) {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
         |                                           V4L2_PIX_FMT_VP8_FRAME
   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:335:43: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:24:43: error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared (first use in this function)
      24 | #define VDEC_LAT_TILE_SZ            (64 * V4L2_AV1_MAX_TILE_COUNT)
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:343:51: note: in expansion of macro 'VDEC_LAT_TILE_SZ'
     343 |                         lat_buf->tile_addr.size = VDEC_LAT_TILE_SZ;
         |                                                   ^~~~~~~~~~~~~~~~
--
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:164:31: error: 'V4L2_CID_STATELESS_AV1_SEQUENCE' undeclared here (not in a function); did you mean 'V4L2_CID_STATELESS_MPEG2_SEQUENCE'?
     164 |                         .id = V4L2_CID_STATELESS_AV1_SEQUENCE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_STATELESS_MPEG2_SEQUENCE
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:167:31: error: 'V4L2_PIX_FMT_AV1_FRAME' undeclared here (not in a function); did you mean 'V4L2_PIX_FMT_VP9_FRAME'?
     167 |                 .codec_type = V4L2_PIX_FMT_AV1_FRAME,
         |                               ^~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_PIX_FMT_VP9_FRAME
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:171:31: error: 'V4L2_CID_STATELESS_AV1_FRAME' undeclared here (not in a function); did you mean 'V4L2_CID_STATELESS_VP9_FRAME'?
     171 |                         .id = V4L2_CID_STATELESS_AV1_FRAME,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_STATELESS_VP9_FRAME
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:178:31: error: 'V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY' undeclared here (not in a function)
     178 |                         .id = V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:179:35: error: 'V4L2_AV1_MAX_TILE_COUNT' undeclared here (not in a function)
     179 |                         .dims = { V4L2_AV1_MAX_TILE_COUNT },
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:186:31: error: 'V4L2_CID_MPEG_VIDEO_AV1_PROFILE' undeclared here (not in a function); did you mean 'V4L2_CID_MPEG_VIDEO_VP8_PROFILE'?
     186 |                         .id = V4L2_CID_MPEG_VIDEO_AV1_PROFILE,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_MPEG_VIDEO_VP8_PROFILE
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:187:32: error: 'V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN'?
     187 |                         .min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:195:31: error: 'V4L2_CID_MPEG_VIDEO_AV1_LEVEL' undeclared here (not in a function); did you mean 'V4L2_CID_MPEG_VIDEO_VP9_LEVEL'?
     195 |                         .id = V4L2_CID_MPEG_VIDEO_AV1_LEVEL,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               V4L2_CID_MPEG_VIDEO_VP9_LEVEL
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:196:32: error: 'V4L2_MPEG_VIDEO_AV1_LEVEL_2_0' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_VP9_LEVEL_2_0'?
     196 |                         .min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_VP9_LEVEL_2_0
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:197:32: error: 'V4L2_MPEG_VIDEO_AV1_LEVEL_4_0' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_VP9_LEVEL_4_0'?
     197 |                         .def = V4L2_MPEG_VIDEO_AV1_LEVEL_4_0,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_VP9_LEVEL_4_0
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c:198:32: error: 'V4L2_MPEG_VIDEO_AV1_LEVEL_5_1' undeclared here (not in a function); did you mean 'V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1'?
     198 |                         .max = V4L2_MPEG_VIDEO_AV1_LEVEL_5_1,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1


vim +/V4L2_AV1_MAX_TILE_COUNT +188 drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c

02696b4df5c969 Xiaoyong Lu 2023-05-30   43  
02696b4df5c969 Xiaoyong Lu 2023-05-30   44  #define BIT_FLAG(x, bit)		(!!((x)->flags & (bit)))
02696b4df5c969 Xiaoyong Lu 2023-05-30  @45  #define SEGMENTATION_FLAG(x, name)	(!!((x)->flags & V4L2_AV1_SEGMENTATION_FLAG_##name))
02696b4df5c969 Xiaoyong Lu 2023-05-30  @46  #define QUANT_FLAG(x, name)		(!!((x)->flags & V4L2_AV1_QUANTIZATION_FLAG_##name))
02696b4df5c969 Xiaoyong Lu 2023-05-30  @47  #define SEQUENCE_FLAG(x, name)		(!!((x)->flags & V4L2_AV1_SEQUENCE_FLAG_##name))
02696b4df5c969 Xiaoyong Lu 2023-05-30  @48  #define FH_FLAG(x, name)		(!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
02696b4df5c969 Xiaoyong Lu 2023-05-30   49  
02696b4df5c969 Xiaoyong Lu 2023-05-30   50  #define MINQ 0
02696b4df5c969 Xiaoyong Lu 2023-05-30   51  #define MAXQ 255
02696b4df5c969 Xiaoyong Lu 2023-05-30   52  
02696b4df5c969 Xiaoyong Lu 2023-05-30   53  #define DIV_LUT_PREC_BITS 14
02696b4df5c969 Xiaoyong Lu 2023-05-30   54  #define DIV_LUT_BITS 8
02696b4df5c969 Xiaoyong Lu 2023-05-30   55  #define DIV_LUT_NUM BIT(DIV_LUT_BITS)
02696b4df5c969 Xiaoyong Lu 2023-05-30   56  #define WARP_PARAM_REDUCE_BITS 6
02696b4df5c969 Xiaoyong Lu 2023-05-30   57  #define WARPEDMODEL_PREC_BITS 16
02696b4df5c969 Xiaoyong Lu 2023-05-30   58  
02696b4df5c969 Xiaoyong Lu 2023-05-30   59  #define SEG_LVL_ALT_Q 0
02696b4df5c969 Xiaoyong Lu 2023-05-30   60  #define SECONDARY_FILTER_STRENGTH_NUM_BITS 2
02696b4df5c969 Xiaoyong Lu 2023-05-30   61  
02696b4df5c969 Xiaoyong Lu 2023-05-30   62  static const short div_lut[DIV_LUT_NUM + 1] = {
02696b4df5c969 Xiaoyong Lu 2023-05-30   63  	16384, 16320, 16257, 16194, 16132, 16070, 16009, 15948, 15888, 15828, 15768,
02696b4df5c969 Xiaoyong Lu 2023-05-30   64  	15709, 15650, 15592, 15534, 15477, 15420, 15364, 15308, 15252, 15197, 15142,
02696b4df5c969 Xiaoyong Lu 2023-05-30   65  	15087, 15033, 14980, 14926, 14873, 14821, 14769, 14717, 14665, 14614, 14564,
02696b4df5c969 Xiaoyong Lu 2023-05-30   66  	14513, 14463, 14413, 14364, 14315, 14266, 14218, 14170, 14122, 14075, 14028,
02696b4df5c969 Xiaoyong Lu 2023-05-30   67  	13981, 13935, 13888, 13843, 13797, 13752, 13707, 13662, 13618, 13574, 13530,
02696b4df5c969 Xiaoyong Lu 2023-05-30   68  	13487, 13443, 13400, 13358, 13315, 13273, 13231, 13190, 13148, 13107, 13066,
02696b4df5c969 Xiaoyong Lu 2023-05-30   69  	13026, 12985, 12945, 12906, 12866, 12827, 12788, 12749, 12710, 12672, 12633,
02696b4df5c969 Xiaoyong Lu 2023-05-30   70  	12596, 12558, 12520, 12483, 12446, 12409, 12373, 12336, 12300, 12264, 12228,
02696b4df5c969 Xiaoyong Lu 2023-05-30   71  	12193, 12157, 12122, 12087, 12053, 12018, 11984, 11950, 11916, 11882, 11848,
02696b4df5c969 Xiaoyong Lu 2023-05-30   72  	11815, 11782, 11749, 11716, 11683, 11651, 11619, 11586, 11555, 11523, 11491,
02696b4df5c969 Xiaoyong Lu 2023-05-30   73  	11460, 11429, 11398, 11367, 11336, 11305, 11275, 11245, 11215, 11185, 11155,
02696b4df5c969 Xiaoyong Lu 2023-05-30   74  	11125, 11096, 11067, 11038, 11009, 10980, 10951, 10923, 10894, 10866, 10838,
02696b4df5c969 Xiaoyong Lu 2023-05-30   75  	10810, 10782, 10755, 10727, 10700, 10673, 10645, 10618, 10592, 10565, 10538,
02696b4df5c969 Xiaoyong Lu 2023-05-30   76  	10512, 10486, 10460, 10434, 10408, 10382, 10356, 10331, 10305, 10280, 10255,
02696b4df5c969 Xiaoyong Lu 2023-05-30   77  	10230, 10205, 10180, 10156, 10131, 10107, 10082, 10058, 10034, 10010, 9986,
02696b4df5c969 Xiaoyong Lu 2023-05-30   78  	9963,  9939,  9916,  9892,  9869,  9846,  9823,  9800,  9777,  9754,  9732,
02696b4df5c969 Xiaoyong Lu 2023-05-30   79  	9709,  9687,  9664,  9642,  9620,  9598,  9576,  9554,  9533,  9511,  9489,
02696b4df5c969 Xiaoyong Lu 2023-05-30   80  	9468,  9447,  9425,  9404,  9383,  9362,  9341,  9321,  9300,  9279,  9259,
02696b4df5c969 Xiaoyong Lu 2023-05-30   81  	9239,  9218,  9198,  9178,  9158,  9138,  9118,  9098,  9079,  9059,  9039,
02696b4df5c969 Xiaoyong Lu 2023-05-30   82  	9020,  9001,  8981,  8962,  8943,  8924,  8905,  8886,  8867,  8849,  8830,
02696b4df5c969 Xiaoyong Lu 2023-05-30   83  	8812,  8793,  8775,  8756,  8738,  8720,  8702,  8684,  8666,  8648,  8630,
02696b4df5c969 Xiaoyong Lu 2023-05-30   84  	8613,  8595,  8577,  8560,  8542,  8525,  8508,  8490,  8473,  8456,  8439,
02696b4df5c969 Xiaoyong Lu 2023-05-30   85  	8422,  8405,  8389,  8372,  8355,  8339,  8322,  8306,  8289,  8273,  8257,
02696b4df5c969 Xiaoyong Lu 2023-05-30   86  	8240,  8224,  8208,  8192,
02696b4df5c969 Xiaoyong Lu 2023-05-30   87  };
02696b4df5c969 Xiaoyong Lu 2023-05-30   88  
02696b4df5c969 Xiaoyong Lu 2023-05-30   89  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30   90   * struct vdec_av1_slice_init_vsi - VSI used to initialize instance
02696b4df5c969 Xiaoyong Lu 2023-05-30   91   * @architecture:	architecture type
02696b4df5c969 Xiaoyong Lu 2023-05-30   92   * @reserved:		reserved
02696b4df5c969 Xiaoyong Lu 2023-05-30   93   * @core_vsi:		for core vsi
02696b4df5c969 Xiaoyong Lu 2023-05-30   94   * @cdf_table_addr:	cdf table addr
02696b4df5c969 Xiaoyong Lu 2023-05-30   95   * @cdf_table_size:	cdf table size
02696b4df5c969 Xiaoyong Lu 2023-05-30   96   * @iq_table_addr:	iq table addr
02696b4df5c969 Xiaoyong Lu 2023-05-30   97   * @iq_table_size:	iq table size
02696b4df5c969 Xiaoyong Lu 2023-05-30   98   * @vsi_size:		share vsi structure size
02696b4df5c969 Xiaoyong Lu 2023-05-30   99   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  100  struct vdec_av1_slice_init_vsi {
02696b4df5c969 Xiaoyong Lu 2023-05-30  101  	u32 architecture;
02696b4df5c969 Xiaoyong Lu 2023-05-30  102  	u32 reserved;
02696b4df5c969 Xiaoyong Lu 2023-05-30  103  	u64 core_vsi;
02696b4df5c969 Xiaoyong Lu 2023-05-30  104  	u64 cdf_table_addr;
02696b4df5c969 Xiaoyong Lu 2023-05-30  105  	u32 cdf_table_size;
02696b4df5c969 Xiaoyong Lu 2023-05-30  106  	u64 iq_table_addr;
02696b4df5c969 Xiaoyong Lu 2023-05-30  107  	u32 iq_table_size;
02696b4df5c969 Xiaoyong Lu 2023-05-30  108  	u32 vsi_size;
02696b4df5c969 Xiaoyong Lu 2023-05-30  109  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  110  
02696b4df5c969 Xiaoyong Lu 2023-05-30  111  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  112   * struct vdec_av1_slice_mem - memory address and size
02696b4df5c969 Xiaoyong Lu 2023-05-30  113   * @buf:		dma_addr padding
02696b4df5c969 Xiaoyong Lu 2023-05-30  114   * @dma_addr:		buffer address
02696b4df5c969 Xiaoyong Lu 2023-05-30  115   * @size:		buffer size
02696b4df5c969 Xiaoyong Lu 2023-05-30  116   * @dma_addr_end:	buffer end address
02696b4df5c969 Xiaoyong Lu 2023-05-30  117   * @padding:		for padding
02696b4df5c969 Xiaoyong Lu 2023-05-30  118   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  119  struct vdec_av1_slice_mem {
02696b4df5c969 Xiaoyong Lu 2023-05-30  120  	union {
02696b4df5c969 Xiaoyong Lu 2023-05-30  121  		u64 buf;
02696b4df5c969 Xiaoyong Lu 2023-05-30  122  		dma_addr_t dma_addr;
02696b4df5c969 Xiaoyong Lu 2023-05-30  123  	};
02696b4df5c969 Xiaoyong Lu 2023-05-30  124  	union {
02696b4df5c969 Xiaoyong Lu 2023-05-30  125  		size_t size;
02696b4df5c969 Xiaoyong Lu 2023-05-30  126  		dma_addr_t dma_addr_end;
02696b4df5c969 Xiaoyong Lu 2023-05-30  127  		u64 padding;
02696b4df5c969 Xiaoyong Lu 2023-05-30  128  	};
02696b4df5c969 Xiaoyong Lu 2023-05-30  129  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  130  
02696b4df5c969 Xiaoyong Lu 2023-05-30  131  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  132   * struct vdec_av1_slice_state - decoding state
02696b4df5c969 Xiaoyong Lu 2023-05-30  133   * @err                   : err type for decode
02696b4df5c969 Xiaoyong Lu 2023-05-30  134   * @full                  : transcoded buffer is full or not
02696b4df5c969 Xiaoyong Lu 2023-05-30  135   * @timeout               : decode timeout or not
02696b4df5c969 Xiaoyong Lu 2023-05-30  136   * @perf                  : performance enable
02696b4df5c969 Xiaoyong Lu 2023-05-30  137   * @crc                   : hw checksum
02696b4df5c969 Xiaoyong Lu 2023-05-30  138   * @out_size              : hw output size
02696b4df5c969 Xiaoyong Lu 2023-05-30  139   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  140  struct vdec_av1_slice_state {
02696b4df5c969 Xiaoyong Lu 2023-05-30  141  	int err;
02696b4df5c969 Xiaoyong Lu 2023-05-30  142  	u32 full;
02696b4df5c969 Xiaoyong Lu 2023-05-30  143  	u32 timeout;
02696b4df5c969 Xiaoyong Lu 2023-05-30  144  	u32 perf;
02696b4df5c969 Xiaoyong Lu 2023-05-30  145  	u32 crc[16];
02696b4df5c969 Xiaoyong Lu 2023-05-30  146  	u32 out_size;
02696b4df5c969 Xiaoyong Lu 2023-05-30  147  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  148  
02696b4df5c969 Xiaoyong Lu 2023-05-30  149  /*
02696b4df5c969 Xiaoyong Lu 2023-05-30  150   * enum vdec_av1_slice_resolution_level - resolution level
02696b4df5c969 Xiaoyong Lu 2023-05-30  151   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  152  enum vdec_av1_slice_resolution_level {
02696b4df5c969 Xiaoyong Lu 2023-05-30  153  	AV1_RES_NONE,
02696b4df5c969 Xiaoyong Lu 2023-05-30  154  	AV1_RES_FHD,
02696b4df5c969 Xiaoyong Lu 2023-05-30  155  	AV1_RES_4K,
02696b4df5c969 Xiaoyong Lu 2023-05-30  156  	AV1_RES_8K,
02696b4df5c969 Xiaoyong Lu 2023-05-30  157  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  158  
02696b4df5c969 Xiaoyong Lu 2023-05-30  159  /*
02696b4df5c969 Xiaoyong Lu 2023-05-30  160   * enum vdec_av1_slice_frame_type - av1 frame type
02696b4df5c969 Xiaoyong Lu 2023-05-30  161   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  162  enum vdec_av1_slice_frame_type {
02696b4df5c969 Xiaoyong Lu 2023-05-30  163  	AV1_KEY_FRAME = 0,
02696b4df5c969 Xiaoyong Lu 2023-05-30  164  	AV1_INTER_FRAME,
02696b4df5c969 Xiaoyong Lu 2023-05-30  165  	AV1_INTRA_ONLY_FRAME,
02696b4df5c969 Xiaoyong Lu 2023-05-30  166  	AV1_SWITCH_FRAME,
02696b4df5c969 Xiaoyong Lu 2023-05-30  167  	AV1_FRAME_TYPES,
02696b4df5c969 Xiaoyong Lu 2023-05-30  168  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  169  
02696b4df5c969 Xiaoyong Lu 2023-05-30  170  /*
02696b4df5c969 Xiaoyong Lu 2023-05-30  171   * enum vdec_av1_slice_reference_mode - reference mode type
02696b4df5c969 Xiaoyong Lu 2023-05-30  172   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  173  enum vdec_av1_slice_reference_mode {
02696b4df5c969 Xiaoyong Lu 2023-05-30  174  	AV1_SINGLE_REFERENCE = 0,
02696b4df5c969 Xiaoyong Lu 2023-05-30  175  	AV1_COMPOUND_REFERENCE,
02696b4df5c969 Xiaoyong Lu 2023-05-30  176  	AV1_REFERENCE_MODE_SELECT,
02696b4df5c969 Xiaoyong Lu 2023-05-30  177  	AV1_REFERENCE_MODES,
02696b4df5c969 Xiaoyong Lu 2023-05-30  178  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  179  
02696b4df5c969 Xiaoyong Lu 2023-05-30  180  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  181   * struct vdec_av1_slice_tile_group - info for each tile
02696b4df5c969 Xiaoyong Lu 2023-05-30  182   * @num_tiles:			tile number
02696b4df5c969 Xiaoyong Lu 2023-05-30  183   * @tile_size:			input size for each tile
02696b4df5c969 Xiaoyong Lu 2023-05-30  184   * @tile_start_offset:		tile offset to input buffer
02696b4df5c969 Xiaoyong Lu 2023-05-30  185   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  186  struct vdec_av1_slice_tile_group {
02696b4df5c969 Xiaoyong Lu 2023-05-30  187  	u32 num_tiles;
02696b4df5c969 Xiaoyong Lu 2023-05-30 @188  	u32 tile_size[V4L2_AV1_MAX_TILE_COUNT];
02696b4df5c969 Xiaoyong Lu 2023-05-30  189  	u32 tile_start_offset[V4L2_AV1_MAX_TILE_COUNT];
02696b4df5c969 Xiaoyong Lu 2023-05-30  190  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  191  
02696b4df5c969 Xiaoyong Lu 2023-05-30  192  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  193   * struct vdec_av1_slice_scale_factors - scale info for each ref frame
02696b4df5c969 Xiaoyong Lu 2023-05-30  194   * @is_scaled:  frame is scaled or not
02696b4df5c969 Xiaoyong Lu 2023-05-30  195   * @x_scale:    frame width scale coefficient
02696b4df5c969 Xiaoyong Lu 2023-05-30  196   * @y_scale:    frame height scale coefficient
02696b4df5c969 Xiaoyong Lu 2023-05-30  197   * @x_step:     width step for x_scale
02696b4df5c969 Xiaoyong Lu 2023-05-30  198   * @y_step:     height step for y_scale
02696b4df5c969 Xiaoyong Lu 2023-05-30  199   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  200  struct vdec_av1_slice_scale_factors {
02696b4df5c969 Xiaoyong Lu 2023-05-30  201  	u8 is_scaled;
02696b4df5c969 Xiaoyong Lu 2023-05-30  202  	int x_scale;
02696b4df5c969 Xiaoyong Lu 2023-05-30  203  	int y_scale;
02696b4df5c969 Xiaoyong Lu 2023-05-30  204  	int x_step;
02696b4df5c969 Xiaoyong Lu 2023-05-30  205  	int y_step;
02696b4df5c969 Xiaoyong Lu 2023-05-30  206  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  207  
02696b4df5c969 Xiaoyong Lu 2023-05-30  208  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  209   * struct vdec_av1_slice_frame_refs - ref frame info
02696b4df5c969 Xiaoyong Lu 2023-05-30  210   * @ref_fb_idx:         ref slot index
02696b4df5c969 Xiaoyong Lu 2023-05-30  211   * @ref_map_idx:        ref frame index
02696b4df5c969 Xiaoyong Lu 2023-05-30  212   * @scale_factors:      scale factors for each ref frame
02696b4df5c969 Xiaoyong Lu 2023-05-30  213   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  214  struct vdec_av1_slice_frame_refs {
02696b4df5c969 Xiaoyong Lu 2023-05-30  215  	int ref_fb_idx;
02696b4df5c969 Xiaoyong Lu 2023-05-30  216  	int ref_map_idx;
02696b4df5c969 Xiaoyong Lu 2023-05-30  217  	struct vdec_av1_slice_scale_factors scale_factors;
02696b4df5c969 Xiaoyong Lu 2023-05-30  218  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  219  
02696b4df5c969 Xiaoyong Lu 2023-05-30  220  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  221   * struct vdec_av1_slice_gm - AV1 Global Motion parameters
02696b4df5c969 Xiaoyong Lu 2023-05-30  222   * @wmtype:     The type of global motion transform used
02696b4df5c969 Xiaoyong Lu 2023-05-30  223   * @wmmat:      gm_params
02696b4df5c969 Xiaoyong Lu 2023-05-30  224   * @alpha:      alpha info
02696b4df5c969 Xiaoyong Lu 2023-05-30  225   * @beta:       beta info
02696b4df5c969 Xiaoyong Lu 2023-05-30  226   * @gamma:      gamma info
02696b4df5c969 Xiaoyong Lu 2023-05-30  227   * @delta:      delta info
02696b4df5c969 Xiaoyong Lu 2023-05-30  228   * @invalid:    is invalid or not
02696b4df5c969 Xiaoyong Lu 2023-05-30  229   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  230  struct vdec_av1_slice_gm {
02696b4df5c969 Xiaoyong Lu 2023-05-30  231  	int wmtype;
02696b4df5c969 Xiaoyong Lu 2023-05-30  232  	int wmmat[8];
02696b4df5c969 Xiaoyong Lu 2023-05-30  233  	short alpha;
02696b4df5c969 Xiaoyong Lu 2023-05-30  234  	short beta;
02696b4df5c969 Xiaoyong Lu 2023-05-30  235  	short gamma;
02696b4df5c969 Xiaoyong Lu 2023-05-30  236  	short delta;
02696b4df5c969 Xiaoyong Lu 2023-05-30  237  	char invalid;
02696b4df5c969 Xiaoyong Lu 2023-05-30  238  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  239  
02696b4df5c969 Xiaoyong Lu 2023-05-30  240  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  241   * struct vdec_av1_slice_sm - AV1 Skip Mode parameters
02696b4df5c969 Xiaoyong Lu 2023-05-30  242   * @skip_mode_allowed:  Skip Mode is allowed or not
02696b4df5c969 Xiaoyong Lu 2023-05-30  243   * @skip_mode_present:  specified that the skip_mode will be present or not
02696b4df5c969 Xiaoyong Lu 2023-05-30  244   * @skip_mode_frame:    specifies the frames to use for compound prediction
02696b4df5c969 Xiaoyong Lu 2023-05-30  245   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  246  struct vdec_av1_slice_sm {
02696b4df5c969 Xiaoyong Lu 2023-05-30  247  	u8 skip_mode_allowed;
02696b4df5c969 Xiaoyong Lu 2023-05-30  248  	u8 skip_mode_present;
02696b4df5c969 Xiaoyong Lu 2023-05-30  249  	int skip_mode_frame[2];
02696b4df5c969 Xiaoyong Lu 2023-05-30  250  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  251  
02696b4df5c969 Xiaoyong Lu 2023-05-30  252  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  253   * struct vdec_av1_slice_seg - AV1 Segmentation params
02696b4df5c969 Xiaoyong Lu 2023-05-30  254   * @segmentation_enabled:        this frame makes use of the segmentation tool or not
02696b4df5c969 Xiaoyong Lu 2023-05-30  255   * @segmentation_update_map:     segmentation map are updated during the decoding frame
02696b4df5c969 Xiaoyong Lu 2023-05-30  256   * @segmentation_temporal_update:segmentation map are coded relative the existing segmentaion map
02696b4df5c969 Xiaoyong Lu 2023-05-30  257   * @segmentation_update_data:    new parameters are about to be specified for each segment
02696b4df5c969 Xiaoyong Lu 2023-05-30  258   * @feature_data:                specifies the feature data for a segment feature
02696b4df5c969 Xiaoyong Lu 2023-05-30  259   * @feature_enabled_mask:        the corresponding feature value is coded or not.
02696b4df5c969 Xiaoyong Lu 2023-05-30  260   * @segid_preskip:               segment id will be read before the skip syntax element.
02696b4df5c969 Xiaoyong Lu 2023-05-30  261   * @last_active_segid:           the highest numbered segment id that has some enabled feature
02696b4df5c969 Xiaoyong Lu 2023-05-30  262   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  263  struct vdec_av1_slice_seg {
02696b4df5c969 Xiaoyong Lu 2023-05-30  264  	u8 segmentation_enabled;
02696b4df5c969 Xiaoyong Lu 2023-05-30  265  	u8 segmentation_update_map;
02696b4df5c969 Xiaoyong Lu 2023-05-30  266  	u8 segmentation_temporal_update;
02696b4df5c969 Xiaoyong Lu 2023-05-30  267  	u8 segmentation_update_data;
02696b4df5c969 Xiaoyong Lu 2023-05-30 @268  	int feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
02696b4df5c969 Xiaoyong Lu 2023-05-30  269  	u16 feature_enabled_mask[V4L2_AV1_MAX_SEGMENTS];
02696b4df5c969 Xiaoyong Lu 2023-05-30  270  	int segid_preskip;
02696b4df5c969 Xiaoyong Lu 2023-05-30  271  	int last_active_segid;
02696b4df5c969 Xiaoyong Lu 2023-05-30  272  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  273  
02696b4df5c969 Xiaoyong Lu 2023-05-30  274  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  275   * struct vdec_av1_slice_delta_q_lf - AV1 Loop Filter delta parameters
02696b4df5c969 Xiaoyong Lu 2023-05-30  276   * @delta_q_present:    specified whether quantizer index delta values are present
02696b4df5c969 Xiaoyong Lu 2023-05-30  277   * @delta_q_res:        specifies the left shift which should be applied to decoded quantizer index
02696b4df5c969 Xiaoyong Lu 2023-05-30  278   * @delta_lf_present:   specifies whether loop filter delta values are present
02696b4df5c969 Xiaoyong Lu 2023-05-30  279   * @delta_lf_res:       specifies the left shift which should be applied to decoded
02696b4df5c969 Xiaoyong Lu 2023-05-30  280   *                      loop filter delta values
02696b4df5c969 Xiaoyong Lu 2023-05-30  281   * @delta_lf_multi:     specifies that separate loop filter deltas are sent for horizontal
02696b4df5c969 Xiaoyong Lu 2023-05-30  282   *                      luma edges,vertical luma edges,the u edges, and the v edges.
02696b4df5c969 Xiaoyong Lu 2023-05-30  283   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  284  struct vdec_av1_slice_delta_q_lf {
02696b4df5c969 Xiaoyong Lu 2023-05-30  285  	u8 delta_q_present;
02696b4df5c969 Xiaoyong Lu 2023-05-30  286  	u8 delta_q_res;
02696b4df5c969 Xiaoyong Lu 2023-05-30  287  	u8 delta_lf_present;
02696b4df5c969 Xiaoyong Lu 2023-05-30  288  	u8 delta_lf_res;
02696b4df5c969 Xiaoyong Lu 2023-05-30  289  	u8 delta_lf_multi;
02696b4df5c969 Xiaoyong Lu 2023-05-30  290  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  291  
02696b4df5c969 Xiaoyong Lu 2023-05-30  292  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  293   * struct vdec_av1_slice_quantization - AV1 Quantization params
02696b4df5c969 Xiaoyong Lu 2023-05-30  294   * @base_q_idx:         indicates the base frame qindex. This is used for Y AC
02696b4df5c969 Xiaoyong Lu 2023-05-30  295   *                      coefficients and as the base value for the other quantizers.
02696b4df5c969 Xiaoyong Lu 2023-05-30  296   * @qindex:             qindex
02696b4df5c969 Xiaoyong Lu 2023-05-30  297   * @delta_qydc:         indicates the Y DC quantizer relative to base_q_idx
02696b4df5c969 Xiaoyong Lu 2023-05-30  298   * @delta_qudc:         indicates the U DC quantizer relative to base_q_idx.
02696b4df5c969 Xiaoyong Lu 2023-05-30  299   * @delta_quac:         indicates the U AC quantizer relative to base_q_idx
02696b4df5c969 Xiaoyong Lu 2023-05-30  300   * @delta_qvdc:         indicates the V DC quantizer relative to base_q_idx
02696b4df5c969 Xiaoyong Lu 2023-05-30  301   * @delta_qvac:         indicates the V AC quantizer relative to base_q_idx
02696b4df5c969 Xiaoyong Lu 2023-05-30  302   * @using_qmatrix:      specifies that the quantizer matrix will be used to
02696b4df5c969 Xiaoyong Lu 2023-05-30  303   *                      compute quantizers
02696b4df5c969 Xiaoyong Lu 2023-05-30  304   * @qm_y:               specifies the level in the quantizer matrix that should
02696b4df5c969 Xiaoyong Lu 2023-05-30  305   *                      be used for luma plane decoding
02696b4df5c969 Xiaoyong Lu 2023-05-30  306   * @qm_u:               specifies the level in the quantizer matrix that should
02696b4df5c969 Xiaoyong Lu 2023-05-30  307   *                      be used for chroma U plane decoding.
02696b4df5c969 Xiaoyong Lu 2023-05-30  308   * @qm_v:               specifies the level in the quantizer matrix that should be
02696b4df5c969 Xiaoyong Lu 2023-05-30  309   *                      used for chroma V plane decoding
02696b4df5c969 Xiaoyong Lu 2023-05-30  310   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  311  struct vdec_av1_slice_quantization {
02696b4df5c969 Xiaoyong Lu 2023-05-30  312  	int base_q_idx;
02696b4df5c969 Xiaoyong Lu 2023-05-30  313  	int qindex[V4L2_AV1_MAX_SEGMENTS];
02696b4df5c969 Xiaoyong Lu 2023-05-30  314  	int delta_qydc;
02696b4df5c969 Xiaoyong Lu 2023-05-30  315  	int delta_qudc;
02696b4df5c969 Xiaoyong Lu 2023-05-30  316  	int delta_quac;
02696b4df5c969 Xiaoyong Lu 2023-05-30  317  	int delta_qvdc;
02696b4df5c969 Xiaoyong Lu 2023-05-30  318  	int delta_qvac;
02696b4df5c969 Xiaoyong Lu 2023-05-30  319  	u8 using_qmatrix;
02696b4df5c969 Xiaoyong Lu 2023-05-30  320  	u8 qm_y;
02696b4df5c969 Xiaoyong Lu 2023-05-30  321  	u8 qm_u;
02696b4df5c969 Xiaoyong Lu 2023-05-30  322  	u8 qm_v;
02696b4df5c969 Xiaoyong Lu 2023-05-30  323  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  324  
02696b4df5c969 Xiaoyong Lu 2023-05-30  325  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  326   * struct vdec_av1_slice_lr - AV1 Loop Restauration parameters
02696b4df5c969 Xiaoyong Lu 2023-05-30  327   * @use_lr:                     whether to use loop restoration
02696b4df5c969 Xiaoyong Lu 2023-05-30  328   * @use_chroma_lr:              whether to use chroma loop restoration
02696b4df5c969 Xiaoyong Lu 2023-05-30  329   * @frame_restoration_type:     specifies the type of restoration used for each plane
02696b4df5c969 Xiaoyong Lu 2023-05-30  330   * @loop_restoration_size:      pecifies the size of loop restoration units in units
02696b4df5c969 Xiaoyong Lu 2023-05-30  331   *                              of samples in the current plane
02696b4df5c969 Xiaoyong Lu 2023-05-30  332   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  333  struct vdec_av1_slice_lr {
02696b4df5c969 Xiaoyong Lu 2023-05-30  334  	u8 use_lr;
02696b4df5c969 Xiaoyong Lu 2023-05-30  335  	u8 use_chroma_lr;
02696b4df5c969 Xiaoyong Lu 2023-05-30 @336  	u8 frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX];
02696b4df5c969 Xiaoyong Lu 2023-05-30  337  	u32 loop_restoration_size[V4L2_AV1_NUM_PLANES_MAX];
02696b4df5c969 Xiaoyong Lu 2023-05-30  338  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  339  
02696b4df5c969 Xiaoyong Lu 2023-05-30  340  /**
02696b4df5c969 Xiaoyong Lu 2023-05-30  341   * struct vdec_av1_slice_loop_filter - AV1 Loop filter parameters
02696b4df5c969 Xiaoyong Lu 2023-05-30  342   * @loop_filter_level:          an array containing loop filter strength values.
02696b4df5c969 Xiaoyong Lu 2023-05-30  343   * @loop_filter_ref_deltas:     contains the adjustment needed for the filter
02696b4df5c969 Xiaoyong Lu 2023-05-30  344   *                              level based on the chosen reference frame
02696b4df5c969 Xiaoyong Lu 2023-05-30  345   * @loop_filter_mode_deltas:    contains the adjustment needed for the filter
02696b4df5c969 Xiaoyong Lu 2023-05-30  346   *                              level based on the chosen mode
02696b4df5c969 Xiaoyong Lu 2023-05-30  347   * @loop_filter_sharpness:      indicates the sharpness level. The loop_filter_level
02696b4df5c969 Xiaoyong Lu 2023-05-30  348   *                              and loop_filter_sharpness together determine when
02696b4df5c969 Xiaoyong Lu 2023-05-30  349   *                              a block edge is filtered, and by how much the
02696b4df5c969 Xiaoyong Lu 2023-05-30  350   *                              filtering can change the sample values
02696b4df5c969 Xiaoyong Lu 2023-05-30  351   * @loop_filter_delta_enabled:  filetr level depends on the mode and reference
02696b4df5c969 Xiaoyong Lu 2023-05-30  352   *                              frame used to predict a block
02696b4df5c969 Xiaoyong Lu 2023-05-30  353   */
02696b4df5c969 Xiaoyong Lu 2023-05-30  354  struct vdec_av1_slice_loop_filter {
02696b4df5c969 Xiaoyong Lu 2023-05-30  355  	u8 loop_filter_level[4];
02696b4df5c969 Xiaoyong Lu 2023-05-30 @356  	int loop_filter_ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME];
02696b4df5c969 Xiaoyong Lu 2023-05-30  357  	int loop_filter_mode_deltas[2];
02696b4df5c969 Xiaoyong Lu 2023-05-30  358  	u8 loop_filter_sharpness;
02696b4df5c969 Xiaoyong Lu 2023-05-30  359  	u8 loop_filter_delta_enabled;
02696b4df5c969 Xiaoyong Lu 2023-05-30  360  };
02696b4df5c969 Xiaoyong Lu 2023-05-30  361  

:::::: The code at line 188 was first introduced by commit
:::::: 02696b4df5c969efea41ea0476ea7310120d850c FROMGIT: media: mediatek: vcodec: support stateless AV1 decoder

:::::: TO: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
