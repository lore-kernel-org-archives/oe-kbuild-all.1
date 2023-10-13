Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30A980A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIZfjn4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697160452; x=1728696452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1os1a0+qV89I4gxZGWJ7PS6izR5RRGJ37Pa/CNh+yo=;
  b=AIZfjn4ZL3+xljphLSVJ24wH/xL/UX2rgNSPEhjPbsPVeqr//kUC3IRE
   3OX+luDo9ljMrVtXAgKB/v59en/C7czW5a9tjp2y/ZG7ORDyBSVe5ZbHD
   NuFKk9vq+/azfDb7dGQs334Z2OO9H7wzTIUDzc8bA6ShzhIAXEI3sbLeL
   o/NmJtsJ/aVaYDMr7shVIaF209WfDo/wzPOfu9fmiG1S2ux4rbXa2E6A3
   gG8ABmLdYi/VX+LWZrxaez9LLGwa4ZBEQxxpCABUb0oYeYL4Ko+1hopJT
   HJafudRsL9mciXOMVGmyYsYmSyDlynmsdGJ0yXLfPInX7htD0jlpOke0M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416130966"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="416130966"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 18:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731142487"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="731142487"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 18:27:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr6xb-0004B1-1R;
	Fri, 13 Oct 2023 01:27:27 +0000
Date: Fri, 13 Oct 2023 09:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 415/30000]
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c:439:6: warning: no previous prototype for
 'mxsfb_set_fb_hcrop'
Message-ID: <202310130947.njQKAEzn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 109dbe29507e357647431b8bb11ba57edb259d0f [415/30000] drm/mxsfb: Add support for horizontal stride
config: riscv-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310130947.njQKAEzn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130947.njQKAEzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130947.njQKAEzn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mxsfb/mxsfb_crtc.c:439:6: warning: no previous prototype for 'mxsfb_set_fb_hcrop' [-Wmissing-prototypes]
     439 | void mxsfb_set_fb_hcrop(struct mxsfb_drm_private *mxsfb, u32 src_w, u32 fb_w)
         |      ^~~~~~~~~~~~~~~~~~


vim +/mxsfb_set_fb_hcrop +439 drivers/gpu/drm/mxsfb/mxsfb_crtc.c

   438	
 > 439	void mxsfb_set_fb_hcrop(struct mxsfb_drm_private *mxsfb, u32 src_w, u32 fb_w)
   440	{
   441		u32 mask_cnt, htotal, hcount;
   442		u32 vdctrl2, vdctrl3, vdctrl4, transfer_count;
   443		u32 pigeon_12_0, pigeon_12_1, pigeon_12_2;
   444	
   445		if (src_w == fb_w) {
   446			writel(0x0, mxsfb->base + HW_EPDC_PIGEON_12_0);
   447			writel(0x0, mxsfb->base + HW_EPDC_PIGEON_12_1);
   448	
   449			return;
   450		}
   451	
   452		transfer_count = readl(mxsfb->base + LCDC_V4_TRANSFER_COUNT);
   453		hcount = TRANSFER_COUNT_GET_HCOUNT(transfer_count);
   454	
   455		transfer_count &= ~TRANSFER_COUNT_SET_HCOUNT(0xffff);
   456		transfer_count |= TRANSFER_COUNT_SET_HCOUNT(fb_w);
   457		writel(transfer_count, mxsfb->base + LCDC_V4_TRANSFER_COUNT);
   458	
   459		vdctrl2 = readl(mxsfb->base + LCDC_VDCTRL2);
   460		htotal  = VDCTRL2_GET_HSYNC_PERIOD(vdctrl2);
   461		htotal  += fb_w - hcount;
   462		vdctrl2 &= ~VDCTRL2_SET_HSYNC_PERIOD(0x3ffff);
   463		vdctrl2 |= VDCTRL2_SET_HSYNC_PERIOD(htotal);
   464		writel(vdctrl2, mxsfb->base + LCDC_VDCTRL2);
   465	
   466		vdctrl4 = readl(mxsfb->base + LCDC_VDCTRL4);
   467		vdctrl4 &= ~SET_DOTCLK_H_VALID_DATA_CNT(0x3ffff);
   468		vdctrl4 |= SET_DOTCLK_H_VALID_DATA_CNT(fb_w);
   469		writel(vdctrl4, mxsfb->base + LCDC_VDCTRL4);
   470	
   471		/* configure related pigeon registers */
   472		vdctrl3  = readl(mxsfb->base + LCDC_VDCTRL3);
   473		mask_cnt = GET_HOR_WAIT_CNT(vdctrl3) - 5;
   474	
   475		pigeon_12_0 = PIGEON_12_0_SET_STATE_MASK(0x24)		|
   476			      PIGEON_12_0_SET_MASK_CNT(mask_cnt)	|
   477			      PIGEON_12_0_SET_MASK_CNT_SEL(0x6)		|
   478			      PIGEON_12_0_POL_ACTIVE_LOW		|
   479			      PIGEON_12_0_EN;
   480		writel(pigeon_12_0, mxsfb->base + HW_EPDC_PIGEON_12_0);
   481	
   482		pigeon_12_1 = PIGEON_12_1_SET_CLR_CNT(src_w) |
   483			      PIGEON_12_1_SET_SET_CNT(0x0);
   484		writel(pigeon_12_1, mxsfb->base + HW_EPDC_PIGEON_12_1);
   485	
   486		pigeon_12_2 = 0x0;
   487		writel(pigeon_12_2, mxsfb->base + HW_EPDC_PIGEON_12_2);
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
