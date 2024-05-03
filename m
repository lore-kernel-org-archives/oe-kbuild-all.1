Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BD52206E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764892; cv=none; b=iMJP4eAEbKo9Y6pGFkpj8rdfDmw0N8+aEOn0/gllc6g+MIcy/RpKl+ko5D6Zj55CNetmTHmCPqE+oQhLmljPf2N5sR5/tn20dqfbAVk4tuML2F5ttmSeSsKS6YneSDyfI601yCMchY/K8vI+Y7eOkJOMFeZeEc8qQRVvwTDBp04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764892; c=relaxed/simple;
	bh=yriVs5+ckN4UOIvv+pAxb/6vfs+g4JMSaK2Ln76aVVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNuowb1/4TglclMW3toK8ViGMMg5F9PX+0iqK39uyPKM2YveGrww6UdO2r60UQoXa5R/JR4sfv2IS22aS7Y/lT+EekozPvIuCqPvkpvzo4xGn9C1z0Q1pZjsw1Nwfa1Rkqqed6YAxhzdRQKm7VVQx2JL/eQkA7YE57UNy1O4NTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4CPXfHD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4CPXfHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714764890; x=1746300890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yriVs5+ckN4UOIvv+pAxb/6vfs+g4JMSaK2Ln76aVVM=;
  b=m4CPXfHDnvgvo5tzRZQqgArmkq4APiZ6a3DguJd3NTwMy45fZcsYhuyZ
   pqvNh7YfWBNCEVoR+In2K1xoQ7kEfpAGQ71ykx6BSAMwyyqYuFihX7X7H
   om5xhV1f2TT9qRJuJCoaoWVleDmc1E9okh5etdXdezzSF+Bf5N2rFmlV2
   WeM4TQzurMiKXfqGmYPZk9jD5deszCXqeqP/0KWC3R9hgGiRyE8mAZ0LU
   PoZp4W0MfIhouCr7k2a5Clf7EgjqFOmBqwVmpSLatCPeX0ATuQQ3aCRrj
   vP/ckJCCwk+tZzP0dCGMJMW1yZj6W6fkQ5rFZawYO/Na8RdVUgKjN6pQk
   Q==;
X-CSE-ConnectionGUID: 9dECIVSxQ7yX6Y8zTINdLA==
X-CSE-MsgGUID: dXP8yq32T/SlBcOzi+H62g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21138970"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21138970"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 12:34:49 -0700
X-CSE-ConnectionGUID: Qz9P/KGRS0eTv8xiu8PKzg==
X-CSE-MsgGUID: zLkMGCqoTvOB5lEpbOmyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28045504"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2024 12:34:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2ygA-000C32-1B;
	Fri, 03 May 2024 19:34:46 +0000
Date: Sat, 4 May 2024 03:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 833/1143]
 drivers/media/platform/aspeed/aspeed-video.c:749:3: warning: variable
 'offset' is uninitialized when used here
Message-ID: <202405040305.EWnPDpAQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: f927aff15f50ab040743318cbffad708f2a60818 [833/1143] media: aspeed: Workaround for AST2700 VE1
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240504/202405040305.EWnPDpAQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040305.EWnPDpAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040305.EWnPDpAQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/aspeed/aspeed-video.c:749:3: warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
                   offset |= (val >> 8) & 0xff;
                   ^~~~~~
   drivers/media/platform/aspeed/aspeed-video.c:741:18: note: initialize the variable 'offset' to silence this warning
                   u32 val, offset;
                                  ^
                                   = 0
   1 warning generated.


vim +/offset +749 drivers/media/platform/aspeed/aspeed-video.c

   697	
   698	static int aspeed_video_start_frame(struct aspeed_video *video)
   699	{
   700		dma_addr_t addr;
   701		unsigned long flags;
   702		struct aspeed_video_buffer *buf;
   703		u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
   704		bool bcd_buf_need = (video->format != VIDEO_FMT_STANDARD);
   705	
   706		if (video->v4l2_input_status) {
   707			v4l2_dbg(1, debug, &video->v4l2_dev, "No signal; don't start frame\n");
   708			return 0;
   709		}
   710	
   711		if (!(seq_ctrl & VE_SEQ_CTRL_COMP_BUSY) ||
   712		    !(seq_ctrl & VE_SEQ_CTRL_CAP_BUSY)) {
   713			v4l2_dbg(1, debug, &video->v4l2_dev, "Engine busy; don't start frame\n");
   714			return -EBUSY;
   715		}
   716	
   717		if (bcd_buf_need && !video->bcd.size) {
   718			if (!aspeed_video_alloc_buf(video, &video->bcd,
   719						    VE_BCD_BUFF_SIZE)) {
   720				dev_err(video->dev, "Failed to allocate BCD buffer\n");
   721				dev_err(video->dev, "don't start frame\n");
   722				return -ENOMEM;
   723			}
   724			aspeed_video_write(video, VE_BCD_ADDR, _make_addr(video->bcd.dma));
   725			v4l2_dbg(1, debug, &video->v4l2_dev, "bcd addr(%pad) size(%d)\n",
   726				 &video->bcd.dma, video->bcd.size);
   727		} else if (!bcd_buf_need && video->bcd.size) {
   728			aspeed_video_free_buf(video, &video->bcd);
   729		}
   730	
   731		if (video->input == VIDEO_INPUT_GFX) {
   732			u32 val;
   733	
   734			// update input buffer address as gfx's
   735			regmap_read(video->gfx, GFX_DISPLAY_ADDR, &val);
   736			aspeed_video_write(video, VE_TGS_0, val);
   737		} else if (video->input == VIDEO_INPUT_MEM) {
   738			aspeed_video_write(video, VE_TGS_0, _make_addr(video->dbg_src.dma));
   739		} else if (video->version == 7 && video->id == 1) {
   740			// 2700-A0 VE1 auto NG. Manually setup registers.
   741			u32 val, offset;
   742			u64 addr;
   743	
   744			regmap_read(video->scu, 0xa8c, &val);
   745			addr = (val & ~0xf);
   746			addr <<= 4;
   747	
   748			val = readl(video->vga_base + 0x6c);
 > 749			offset |= (val >> 8) & 0xff;
   750			offset |= (val & 0xff) << 8;
   751	
   752			val = readl(video->vga_base + 0xac);
   753			offset |= (val >> 8) & 0x00ff0000;
   754			offset <<= 2;
   755			addr |= offset;
   756	
   757			aspeed_video_write(video, VE_TGS_0, _make_addr(addr));
   758		}
   759	
   760		spin_lock_irqsave(&video->lock, flags);
   761		buf = list_first_entry_or_null(&video->buffers,
   762					       struct aspeed_video_buffer, link);
   763		if (!buf) {
   764			spin_unlock_irqrestore(&video->lock, flags);
   765			v4l2_dbg(1, debug, &video->v4l2_dev, "No buffers; don't start frame\n");
   766			return -EPROTO;
   767		}
   768	
   769		set_bit(VIDEO_FRAME_INPRG, &video->flags);
   770		addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
   771		spin_unlock_irqrestore(&video->lock, flags);
   772	
   773		aspeed_video_write(video, VE_COMP_PROC_OFFSET, 0);
   774		aspeed_video_write(video, VE_COMP_OFFSET, 0);
   775		aspeed_video_write(video, VE_COMP_ADDR, _make_addr(addr));
   776	
   777		aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
   778				    VE_INTERRUPT_COMP_COMPLETE);
   779	
   780		if (video->format == VIDEO_FMT_PARTIAL) {
   781			aspeed_video_partial_jpeg_update_regs(video);
   782			if (test_bit(VIDEO_BOUNDING_BOX, &video->flags)) {
   783				video->perf.last_sample = ktime_get();
   784				seq_ctrl = VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP;
   785			} else {
   786				seq_ctrl = VE_SEQ_CTRL_TRIG_COMP;
   787			}
   788		} else {
   789			video->perf.last_sample = ktime_get();
   790			seq_ctrl = VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP;
   791		}
   792		aspeed_video_update(video, VE_SEQ_CTRL, 0, seq_ctrl);
   793	
   794		return 0;
   795	}
   796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
