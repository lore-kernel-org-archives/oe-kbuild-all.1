Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD65EC2E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681803176; x=1713339176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/CsH5itBgqjfGmvkHnKY0e4atENZYMW1TNfyAt1hjY=;
  b=nxyz1FS7kZGTrrqoT8kODaNIL2NhjqkTdWiXlbwbhZhdSO+WLkExmObU
   Hvo36o36l58XhI/2EpGvDpj202DlE/fTTY6Tx9GbRboYk1PZoZS5+zLcT
   oWu3U+yC7JTMosLyb6PRM/9Bem6d4hxBp7mqay4AMb5eVfYG7sjo8JjUu
   xPjOi3yfFD8yqWHpRo9R53z0xViGKf+6fYeFBnLI9IRGc/vjWKEPXAzco
   wB6Je8POm0k4mK8h2aPliTsBpxbqF1TnsEuaNC1SSPrmu673Rzlr8ZgKA
   OGPEOSaDSUSXwGFZYYPqKSOs6E3wKhrlkhGrg4B9LclO9XjkDyqnKYDgS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347850624"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="347850624"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 00:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668399586"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="668399586"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2023 00:32:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pofpB-000d6f-0C;
	Tue, 18 Apr 2023 07:32:25 +0000
Date: Tue, 18 Apr 2023 15:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [hverkuil-media-tree:for-v6.4l 211/215]
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1024:1:
 warning: the frame size of 1112 bytes is larger than 1024 bytes
Message-ID: <202304181533.M3yTL6Ju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.4l
head:   007517353ed5a98dc414642c541252edea3133e2
commit: b64337cb7965e94c72bf01017c37fd47f85c5d33 [211/215] media: verisilicon: Add Rockchip AV1 decoder
config: arm-randconfig-r036-20230418 (https://download.01.org/0day-ci/archive/20230418/202304181533.M3yTL6Ju-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v6.4l
        git checkout b64337cb7965e94c72bf01017c37fd47f85c5d33
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/platform/verisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181533.M3yTL6Ju-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:320:6: warning: no previous prototype for 'rockchip_vpu981_av1_dec_exit' [-Wmissing-prototypes]
     320 | void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:356:5: warning: no previous prototype for 'rockchip_vpu981_av1_dec_init' [-Wmissing-prototypes]
     356 | int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1143:6: warning: no previous prototype for 'rockchip_vpu981_av1_dec_done' [-Wmissing-prototypes]
    1143 | void rockchip_vpu981_av1_dec_done(struct hantro_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1890:5: warning: no previous prototype for 'rockchip_vpu981_av1_dec_run' [-Wmissing-prototypes]
    1890 | int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_segmentation':
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1024:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1024 | }
         | ^


vim +1024 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c

   778	
   779	static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
   780	{
   781		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   782		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
   783		const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
   784		const struct v4l2_av1_segmentation *seg = &frame->segmentation;
   785		u32 segval[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX] = { 0 };
   786		struct hantro_dev *vpu = ctx->dev;
   787		u8 segsign = 0, preskip_segid = 0, last_active_seg = 0, i, j;
   788	
   789		if (!!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) &&
   790		    frame->primary_ref_frame < V4L2_AV1_REFS_PER_FRAME) {
   791			int idx = rockchip_vpu981_get_frame_index(ctx, frame->primary_ref_frame);
   792	
   793			if (idx >= 0) {
   794				dma_addr_t luma_addr, mv_addr = 0;
   795				struct hantro_decoded_buffer *seg;
   796				size_t mv_offset = rockchip_vpu981_av1_dec_chroma_size(ctx);
   797	
   798				seg = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
   799				luma_addr = hantro_get_dec_buf_addr(ctx, &seg->base.vb.vb2_buf);
   800				mv_addr = luma_addr + mv_offset;
   801	
   802				hantro_write_addr(vpu, AV1_SEGMENTATION, mv_addr);
   803				hantro_reg_write(vpu, &av1_use_temporal3_mvs, 1);
   804			}
   805		}
   806	
   807		hantro_reg_write(vpu, &av1_segment_temp_upd_e,
   808				 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE));
   809		hantro_reg_write(vpu, &av1_segment_upd_e,
   810				 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP));
   811		hantro_reg_write(vpu, &av1_segment_e,
   812				 !!(seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED));
   813	
   814		hantro_reg_write(vpu, &av1_error_resilient,
   815				 !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE));
   816	
   817		if (IS_INTRA(frame->frame_type) ||
   818		    !!(frame->flags & V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE)) {
   819			hantro_reg_write(vpu, &av1_use_temporal3_mvs, 0);
   820		}
   821	
   822		if (seg->flags & V4L2_AV1_SEGMENTATION_FLAG_ENABLED) {
   823			int s;
   824	
   825			for (s = 0; s < V4L2_AV1_MAX_SEGMENTS; s++) {
   826				if (seg->feature_enabled[s] &
   827				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_Q)) {
   828					segval[s][V4L2_AV1_SEG_LVL_ALT_Q] =
   829					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q]),
   830						  0, 255);
   831					segsign |=
   832						(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_Q] < 0) << s;
   833				}
   834	
   835				if (seg->feature_enabled[s] &
   836				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_Y_V))
   837					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_V] =
   838						clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]),
   839						      -63, 63);
   840	
   841				if (seg->feature_enabled[s] &
   842				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_Y_H))
   843					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_H] =
   844					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]),
   845						  -63, 63);
   846	
   847				if (seg->feature_enabled[s] &
   848				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_U))
   849					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_U] =
   850					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_U]),
   851						  -63, 63);
   852	
   853				if (seg->feature_enabled[s] &
   854				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_ALT_LF_V))
   855					segval[s][V4L2_AV1_SEG_LVL_ALT_LF_V] =
   856					    clamp(abs(seg->feature_data[s][V4L2_AV1_SEG_LVL_ALT_LF_V]),
   857						  -63, 63);
   858	
   859				if (frame->frame_type && seg->feature_enabled[s] &
   860				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_FRAME))
   861					segval[s][V4L2_AV1_SEG_LVL_REF_FRAME]++;
   862	
   863				if (seg->feature_enabled[s] &
   864				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_SKIP))
   865					segval[s][V4L2_AV1_SEG_LVL_REF_SKIP] = 1;
   866	
   867				if (seg->feature_enabled[s] &
   868				    V4L2_AV1_SEGMENT_FEATURE_ENABLED(V4L2_AV1_SEG_LVL_REF_GLOBALMV))
   869					segval[s][V4L2_AV1_SEG_LVL_REF_GLOBALMV] = 1;
   870			}
   871		}
   872	
   873		for (i = 0; i < V4L2_AV1_MAX_SEGMENTS; i++) {
   874			for (j = 0; j < V4L2_AV1_SEG_LVL_MAX; j++) {
   875				if (seg->feature_enabled[i]
   876				    & V4L2_AV1_SEGMENT_FEATURE_ENABLED(j)) {
   877					preskip_segid |= (j >= V4L2_AV1_SEG_LVL_REF_FRAME);
   878					last_active_seg = max(i, last_active_seg);
   879				}
   880			}
   881		}
   882	
   883		hantro_reg_write(vpu, &av1_last_active_seg, last_active_seg);
   884		hantro_reg_write(vpu, &av1_preskip_segid, preskip_segid);
   885	
   886		hantro_reg_write(vpu, &av1_seg_quant_sign, segsign);
   887	
   888		/* Write QP, filter level, ref frame and skip for every segment */
   889		hantro_reg_write(vpu, &av1_quant_seg0,
   890				 segval[0][V4L2_AV1_SEG_LVL_ALT_Q]);
   891		hantro_reg_write(vpu, &av1_filt_level_delta0_seg0,
   892				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
   893		hantro_reg_write(vpu, &av1_filt_level_delta1_seg0,
   894				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
   895		hantro_reg_write(vpu, &av1_filt_level_delta2_seg0,
   896				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_U]);
   897		hantro_reg_write(vpu, &av1_filt_level_delta3_seg0,
   898				 segval[0][V4L2_AV1_SEG_LVL_ALT_LF_V]);
   899		hantro_reg_write(vpu, &av1_refpic_seg0,
   900				 segval[0][V4L2_AV1_SEG_LVL_REF_FRAME]);
   901		hantro_reg_write(vpu, &av1_skip_seg0,
   902				 segval[0][V4L2_AV1_SEG_LVL_REF_SKIP]);
   903		hantro_reg_write(vpu, &av1_global_mv_seg0,
   904				 segval[0][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
   905	
   906		hantro_reg_write(vpu, &av1_quant_seg1,
   907				 segval[1][V4L2_AV1_SEG_LVL_ALT_Q]);
   908		hantro_reg_write(vpu, &av1_filt_level_delta0_seg1,
   909				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
   910		hantro_reg_write(vpu, &av1_filt_level_delta1_seg1,
   911				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
   912		hantro_reg_write(vpu, &av1_filt_level_delta2_seg1,
   913				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_U]);
   914		hantro_reg_write(vpu, &av1_filt_level_delta3_seg1,
   915				 segval[1][V4L2_AV1_SEG_LVL_ALT_LF_V]);
   916		hantro_reg_write(vpu, &av1_refpic_seg1,
   917				 segval[1][V4L2_AV1_SEG_LVL_REF_FRAME]);
   918		hantro_reg_write(vpu, &av1_skip_seg1,
   919				 segval[1][V4L2_AV1_SEG_LVL_REF_SKIP]);
   920		hantro_reg_write(vpu, &av1_global_mv_seg1,
   921				 segval[1][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
   922	
   923		hantro_reg_write(vpu, &av1_quant_seg2,
   924				 segval[2][V4L2_AV1_SEG_LVL_ALT_Q]);
   925		hantro_reg_write(vpu, &av1_filt_level_delta0_seg2,
   926				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
   927		hantro_reg_write(vpu, &av1_filt_level_delta1_seg2,
   928				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
   929		hantro_reg_write(vpu, &av1_filt_level_delta2_seg2,
   930				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_U]);
   931		hantro_reg_write(vpu, &av1_filt_level_delta3_seg2,
   932				 segval[2][V4L2_AV1_SEG_LVL_ALT_LF_V]);
   933		hantro_reg_write(vpu, &av1_refpic_seg2,
   934				 segval[2][V4L2_AV1_SEG_LVL_REF_FRAME]);
   935		hantro_reg_write(vpu, &av1_skip_seg2,
   936				 segval[2][V4L2_AV1_SEG_LVL_REF_SKIP]);
   937		hantro_reg_write(vpu, &av1_global_mv_seg2,
   938				 segval[2][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
   939	
   940		hantro_reg_write(vpu, &av1_quant_seg3,
   941				 segval[3][V4L2_AV1_SEG_LVL_ALT_Q]);
   942		hantro_reg_write(vpu, &av1_filt_level_delta0_seg3,
   943				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
   944		hantro_reg_write(vpu, &av1_filt_level_delta1_seg3,
   945				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
   946		hantro_reg_write(vpu, &av1_filt_level_delta2_seg3,
   947				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_U]);
   948		hantro_reg_write(vpu, &av1_filt_level_delta3_seg3,
   949				 segval[3][V4L2_AV1_SEG_LVL_ALT_LF_V]);
   950		hantro_reg_write(vpu, &av1_refpic_seg3,
   951				 segval[3][V4L2_AV1_SEG_LVL_REF_FRAME]);
   952		hantro_reg_write(vpu, &av1_skip_seg3,
   953				 segval[3][V4L2_AV1_SEG_LVL_REF_SKIP]);
   954		hantro_reg_write(vpu, &av1_global_mv_seg3,
   955				 segval[3][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
   956	
   957		hantro_reg_write(vpu, &av1_quant_seg4,
   958				 segval[4][V4L2_AV1_SEG_LVL_ALT_Q]);
   959		hantro_reg_write(vpu, &av1_filt_level_delta0_seg4,
   960				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
   961		hantro_reg_write(vpu, &av1_filt_level_delta1_seg4,
   962				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
   963		hantro_reg_write(vpu, &av1_filt_level_delta2_seg4,
   964				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_U]);
   965		hantro_reg_write(vpu, &av1_filt_level_delta3_seg4,
   966				 segval[4][V4L2_AV1_SEG_LVL_ALT_LF_V]);
   967		hantro_reg_write(vpu, &av1_refpic_seg4,
   968				 segval[4][V4L2_AV1_SEG_LVL_REF_FRAME]);
   969		hantro_reg_write(vpu, &av1_skip_seg4,
   970				 segval[4][V4L2_AV1_SEG_LVL_REF_SKIP]);
   971		hantro_reg_write(vpu, &av1_global_mv_seg4,
   972				 segval[4][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
   973	
   974		hantro_reg_write(vpu, &av1_quant_seg5,
   975				 segval[5][V4L2_AV1_SEG_LVL_ALT_Q]);
   976		hantro_reg_write(vpu, &av1_filt_level_delta0_seg5,
   977				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
   978		hantro_reg_write(vpu, &av1_filt_level_delta1_seg5,
   979				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
   980		hantro_reg_write(vpu, &av1_filt_level_delta2_seg5,
   981				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_U]);
   982		hantro_reg_write(vpu, &av1_filt_level_delta3_seg5,
   983				 segval[5][V4L2_AV1_SEG_LVL_ALT_LF_V]);
   984		hantro_reg_write(vpu, &av1_refpic_seg5,
   985				 segval[5][V4L2_AV1_SEG_LVL_REF_FRAME]);
   986		hantro_reg_write(vpu, &av1_skip_seg5,
   987				 segval[5][V4L2_AV1_SEG_LVL_REF_SKIP]);
   988		hantro_reg_write(vpu, &av1_global_mv_seg5,
   989				 segval[5][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
   990	
   991		hantro_reg_write(vpu, &av1_quant_seg6,
   992				 segval[6][V4L2_AV1_SEG_LVL_ALT_Q]);
   993		hantro_reg_write(vpu, &av1_filt_level_delta0_seg6,
   994				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
   995		hantro_reg_write(vpu, &av1_filt_level_delta1_seg6,
   996				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
   997		hantro_reg_write(vpu, &av1_filt_level_delta2_seg6,
   998				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_U]);
   999		hantro_reg_write(vpu, &av1_filt_level_delta3_seg6,
  1000				 segval[6][V4L2_AV1_SEG_LVL_ALT_LF_V]);
  1001		hantro_reg_write(vpu, &av1_refpic_seg6,
  1002				 segval[6][V4L2_AV1_SEG_LVL_REF_FRAME]);
  1003		hantro_reg_write(vpu, &av1_skip_seg6,
  1004				 segval[6][V4L2_AV1_SEG_LVL_REF_SKIP]);
  1005		hantro_reg_write(vpu, &av1_global_mv_seg6,
  1006				 segval[6][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
  1007	
  1008		hantro_reg_write(vpu, &av1_quant_seg7,
  1009				 segval[7][V4L2_AV1_SEG_LVL_ALT_Q]);
  1010		hantro_reg_write(vpu, &av1_filt_level_delta0_seg7,
  1011				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_Y_V]);
  1012		hantro_reg_write(vpu, &av1_filt_level_delta1_seg7,
  1013				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_Y_H]);
  1014		hantro_reg_write(vpu, &av1_filt_level_delta2_seg7,
  1015				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_U]);
  1016		hantro_reg_write(vpu, &av1_filt_level_delta3_seg7,
  1017				 segval[7][V4L2_AV1_SEG_LVL_ALT_LF_V]);
  1018		hantro_reg_write(vpu, &av1_refpic_seg7,
  1019				 segval[7][V4L2_AV1_SEG_LVL_REF_FRAME]);
  1020		hantro_reg_write(vpu, &av1_skip_seg7,
  1021				 segval[7][V4L2_AV1_SEG_LVL_REF_SKIP]);
  1022		hantro_reg_write(vpu, &av1_global_mv_seg7,
  1023				 segval[7][V4L2_AV1_SEG_LVL_REF_GLOBALMV]);
> 1024	}
  1025	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
