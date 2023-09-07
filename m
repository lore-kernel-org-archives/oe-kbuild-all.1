Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A21134B2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694108243; x=1725644243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIaP1Ovo4Wp3jrfo32d2Ir3i4Pjzk/QPiDtFpJ7aqNg=;
  b=UIe0yREpsAACHhp52ucMbbeXrth3ozV9NtJRJjmG6NGFpWX3jyXOouGf
   8agNqaM4/Mdw9dd/VV5oQTYsP7cwLMb1g7o3HpXbuZ3GetpYHwGCnZPxu
   IMiexmynwJ/KLxFDeYQofLplGmKe8PHuXL6p58ttNgSF3rEaselXvBgOR
   Xu/LKUVXs52ReaEjZ0+g3kdCl41L3+1cH7wJHVqDb+cKe0sE3RX8zwdSD
   JUWHNUYnt1/SZ66/KJT3WZqTWi/izkdoG7IyvbJa0WfZZUjAkObb0fZjc
   HI3wntCRG3oedwpziRY/Z8ijemw7VVjofehSnVbHuWOdPYhwZDtD1j09G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367680910"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="367680910"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 10:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="777158412"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="777158412"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 10:37:18 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeIwO-0001RE-2U;
	Thu, 07 Sep 2023 17:37:16 +0000
Date: Fri, 8 Sep 2023 01:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:enc-dec-cmd 28/31]
 drivers/media/platform/verisilicon/hantro_v4l2.c:892:17: error: implicit
 declaration of function 'v4l2_m2m_last_buffer_done'; did you mean
 'v4l2_m2m_dst_buf_remove'?
Message-ID: <202309080107.yMT2LFbB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git enc-dec-cmd
head:   2036ca38beff822c3ebbf9ae60b5bb184cbe6e19
commit: 7c08f89f12294f745b7202b12d8e1f7e4a6a936f [28/31] media: core: v4l2-mem2mem: remove v4l2_m2m_last_buffer_done
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230908/202309080107.yMT2LFbB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080107.yMT2LFbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080107.yMT2LFbB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/verisilicon/hantro_v4l2.c: In function 'hantro_buf_queue':
>> drivers/media/platform/verisilicon/hantro_v4l2.c:892:17: error: implicit declaration of function 'v4l2_m2m_last_buffer_done'; did you mean 'v4l2_m2m_dst_buf_remove'? [-Werror=implicit-function-declaration]
     892 |                 v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vbuf);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 v4l2_m2m_dst_buf_remove
   cc1: some warnings being treated as errors


vim +892 drivers/media/platform/verisilicon/hantro_v4l2.c

775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c Ezequiel Garcia 2018-12-05  875  
a29add8c9bb29d drivers/staging/media/hantro/hantro_v4l2.c            Philipp Zabel   2019-06-12  876  static void hantro_buf_queue(struct vb2_buffer *vb)
775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c Ezequiel Garcia 2018-12-05  877  {
a29add8c9bb29d drivers/staging/media/hantro/hantro_v4l2.c            Philipp Zabel   2019-06-12  878  	struct hantro_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c Ezequiel Garcia 2018-12-05  879  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c Ezequiel Garcia 2018-12-05  880  
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  881  	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  882  	    vb2_is_streaming(vb->vb2_queue) &&
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  883  	    v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  884  		unsigned int i;
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  885  
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  886  		for (i = 0; i < vb->num_planes; i++)
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  887  			vb2_set_plane_payload(vb, i, 0);
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  888  
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  889  		vbuf->field = V4L2_FIELD_NONE;
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  890  		vbuf->sequence = ctx->sequence_cap++;
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  891  
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31 @892  		v4l2_m2m_last_buffer_done(ctx->fh.m2m_ctx, vbuf);
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  893  		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  894  		return;
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  895  	}
daf3999c12dcef drivers/staging/media/hantro/hantro_v4l2.c            Chen-Yu Tsai    2022-03-31  896  
775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c Ezequiel Garcia 2018-12-05  897  	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c Ezequiel Garcia 2018-12-05  898  }
775fec69008d30 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c Ezequiel Garcia 2018-12-05  899  

:::::: The code at line 892 was first introduced by commit
:::::: daf3999c12dcef14151710052fca9adfbc3967bc media: hantro: Implement support for encoder commands

:::::: TO: Chen-Yu Tsai <wenst@chromium.org>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
