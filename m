Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D48F4D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681226957; x=1712762957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BpMGCmQzPcYzMIbRUelch1RgDdkoegCvJK2sL/cMMvM=;
  b=KH0Bq9Om+llN23iGpcX5c6MROzo0PtJdlbRdLONR0GyswXLe/ZM59v2y
   zv1hXBr4vnjNxupnm9FcoykU8fdXGRc3HXwmjhXd3ChucymaXT/6kSSB4
   qJg5ZQu2pGwfeHTrK+bjI/dwTOFi6cT1nLClJ6xvYLbtizs1/VE0XksNe
   0w7LSKN7vHIjwTXX45y26ZSRk0wx60bMXQA+4sG3K7vQkwYcu9y9/wKBk
   wW/X3TxNTgPMf/jqicx9y4nLd+TYgrucnbwQt2BF1Ouqt2UyvAHM1jtjs
   +VjTpZNaxYk7v1irIXQ3NaSA4OJSlvjW6ta5jN/ibjDqtELt5e0ht5aPs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346320997"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="346320997"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 08:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666024095"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="666024095"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 08:29:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmFvm-000WRL-2n;
	Tue, 11 Apr 2023 15:29:14 +0000
Date: Tue, 11 Apr 2023 23:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:for-v6.4l 10/14]
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:621:1:
 warning: the frame size of 1080 bytes is larger than 1024 bytes
Message-ID: <202304112306.wIQMEpNy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.4l
head:   957636875b6f098e9a62660c1f7ab68ddf0c2d8a
commit: b44bc9dec4222a111de5eb05af83839ef2c7a2da [10/14] media: verisilicon: Add Rockchip AV1 decoder
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230411/202304112306.wIQMEpNy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v6.4l
        git checkout b44bc9dec4222a111de5eb05af83839ef2c7a2da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/verisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112306.wIQMEpNy-lkp@intel.com/

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
   drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c: In function 'rockchip_vpu981_av1_dec_set_tile_info':
>> drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:621:1: warning: the frame size of 1080 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     621 | }
         | ^


vim +621 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c

   551	
   552	static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
   553	{
   554		struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
   555		struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
   556		struct v4l2_av1_tile_info tile_info = ctrls->frame->tile_info;
   557		const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
   558		    ctrls->tile_group_entry;
   559		int context_update_y =
   560		    tile_info.context_update_tile_id / tile_info.tile_cols;
   561		int context_update_x =
   562		    tile_info.context_update_tile_id % tile_info.tile_cols;
   563		int context_update_tile_id =
   564		    context_update_x * tile_info.tile_rows + context_update_y;
   565		u8 *dst = av1_dec->tile_info.cpu;
   566		struct hantro_dev *vpu = ctx->dev;
   567		int tile0, tile1;
   568	
   569		memset(dst, 0, av1_dec->tile_info.size);
   570	
   571		for (tile0 = 0; tile0 < tile_info.tile_cols; tile0++) {
   572			for (tile1 = 0; tile1 < tile_info.tile_rows; tile1++) {
   573				int tile_id = tile1 * tile_info.tile_cols + tile0;
   574				u32 start, end;
   575				u32 y0 =
   576				    tile_info.height_in_sbs_minus_1[tile1] + 1;
   577				u32 x0 = tile_info.width_in_sbs_minus_1[tile0] + 1;
   578	
   579				// tile size in SB units (width,height)
   580				*dst++ = x0;
   581				*dst++ = 0;
   582				*dst++ = 0;
   583				*dst++ = 0;
   584				*dst++ = y0;
   585				*dst++ = 0;
   586				*dst++ = 0;
   587				*dst++ = 0;
   588	
   589				// tile start position
   590				start = group_entry[tile_id].tile_offset - group_entry[0].tile_offset;
   591				*dst++ = start & 255;
   592				*dst++ = (start >> 8) & 255;
   593				*dst++ = (start >> 16) & 255;
   594				*dst++ = (start >> 24) & 255;
   595	
   596				// # of bytes in tile data
   597				end = start + group_entry[tile_id].tile_size;
   598				*dst++ = end & 255;
   599				*dst++ = (end >> 8) & 255;
   600				*dst++ = (end >> 16) & 255;
   601				*dst++ = (end >> 24) & 255;
   602			}
   603		}
   604	
   605		hantro_reg_write(vpu, &av1_multicore_expect_context_update,
   606				 !!(context_update_x == 0));
   607		hantro_reg_write(vpu, &av1_tile_enable,
   608				 !!((tile_info.tile_cols > 1) || (tile_info.tile_rows > 1)));
   609		hantro_reg_write(vpu, &av1_num_tile_cols_8k, tile_info.tile_cols);
   610		hantro_reg_write(vpu, &av1_num_tile_rows_8k, tile_info.tile_rows);
   611		hantro_reg_write(vpu, &av1_context_update_tile_id,
   612				 context_update_tile_id);
   613		hantro_reg_write(vpu, &av1_tile_transpose, 1);
   614		if (rockchip_vpu981_av1_tile_log2(tile_info.tile_cols) ||
   615		    rockchip_vpu981_av1_tile_log2(tile_info.tile_rows))
   616			hantro_reg_write(vpu, &av1_dec_tile_size_mag, tile_info.tile_size_bytes - 1);
   617		else
   618			hantro_reg_write(vpu, &av1_dec_tile_size_mag, 3);
   619	
   620		hantro_write_addr(vpu, AV1_TILE_BASE, av1_dec->tile_info.dma);
 > 621	}
   622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
