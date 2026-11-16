Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869560;
	b=w9p3hJXUt+JTCtIGO6UywS1kWI5Ycr0QUzrayVph/k1kTTWGMTvCX9EFTNCCrAAdbgiE
	 JcTq64EQElIEL0D2HLMHVm/e11U4ngkxw97Kh5N6rKgt1l5k7O9+p/4XfyduFwm8AkL3T
	 jNVhNqAMEia8qZVgAdBNX/jsCfXEbq6jY3PuIhDtTRJ2LEE2UoD4AJ72s1d/VAvs4687s
	 IL9lC8pDCH0I9hGNcmeM91eN3evbMcWhSl21r8tJF+kifa/g3E4YXLmDdWfkSIA195gO2
	 cN95xfF70rjS+7vpYgP/Iynk8Ttz0WuvJSAjoTdce4HCWWqDxOYoAC8kHP2sI8TDHtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ao9mgisv3hBiJlypE67WLoX0blfRlaF8zJop+Uud4IU=;
	b=4CFEqA2FCk3ercsn2LKbEyquUOAtpJ5vcBOsVUGlqZ85IqKwOTx7wPArqlQJR/MA8tPT
	 KhHBMFeC+5JknLgd8CuAxGl/9NXw7nuMdU2BJE5/TaSmJ9Y50f+7nmidpdLVgsaFd6hcs
	 YEkmsZ7YDOG55pRbxb5eftVdKKyXJNbW4hIu62pKIdVpahoWfdp7qGVNDUG3jAXsAj/mW
	 5pZoKda7GOpSBdR4TXnQBO+TVSZ9V7B+6VSjiL9Kn9x1ZiMUOvPGsxekMMzr6PSN20ieL
	 kwHLdEjuO2XtE7JPLSAl+4G109Hg0CaMrcQEVR0KFK+jzY5s5ab3j5Tpgj/niQlhUgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EsbGcuTF;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 22:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EsbGcuTF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794869560; x=1826405560;
  h=date:from:to:cc:subject:message-id;
  bh=MDlwr+DJY3dNKRj9k/ialJiwu2kbHK6f9RPBJmd+3wA=;
  b=EsbGcuTFv5upZ0vLCWT6/uMo6cstVK5KPq9m6Pc5bioP4exU/PcunTrm
   wgT7/MtrUfQgHaG5r7InOdwZ8TVbxc4sfda6Vi07AgWnCVdoFhr7+r85A
   OZ5yr+zGjxPhMMFBPgy357wG3rHfaBKLq+ljpsa2XHRWm8CSOOEoyKzGa
   awBUzM3MWgEsh0Gw/S8WYA8eiAX3R33DrIm1b6qjDfdHLHvqp5NOEOxDc
   zRQ88DydEDiK3F+I4yuhRSO6K6nQNRGAwQC5slJx581uazGOVCD592NgY
   Qunr4Hjwh6LxhSgZpGs5U93VRjkVh3VMe25BYXEzC62JPjXtPRHUn0Yjy
   g==;
X-CSE-ConnectionGUID: LeZ0tLruQQmLdEr8phFQgg==
X-CSE-MsgGUID: M7VTp4qvTl2L8rNydg2NsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3701824"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3701824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:52:39 -0800
X-CSE-ConnectionGUID: JdL1Y5XVQmiPTxTQATz5wg==
X-CSE-MsgGUID: RumKkXd2TlWalBJsiyCmhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9840933"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 14:52:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT5Yv-000000002p4-2ve4;
	Mon, 16 Nov 2026 22:52:33 +0000
Date: Mon, 16 Nov 2026 23:52:28 +0100
From: kernel test robot <lkp@intel.com>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 95/96]
 drivers/media/platform/apple/msr/msr-hw.c:151:25: error: implicit declaration
 of function 'readq_relaxed'; did you mean 'readl_relaxed'?
Message-ID: <202611162341.HCFsqiX2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   41eeb3a08926fbe6037568be57148a360190fbe6
commit: c967c4f5b870c69ed8f3b064e2d53f9171ec93d4 [95/96] media: apple: add msr driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20261116/202611162341.HCFsqiX2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162341.HCFsqiX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611162341.HCFsqiX2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:30,
                    from include/linux/videodev2.h:60,
                    from drivers/media/platform/apple/msr/msr-hw.c:11:
   drivers/media/platform/apple/msr/msr-hw.c: In function 'configure_fmt':
>> drivers/media/platform/apple/msr/msr-hw.c:151:25: error: implicit declaration of function 'readq_relaxed'; did you mean 'readl_relaxed'? [-Wimplicit-function-declaration]
     151 |                         readq_relaxed(base + reg + i * 8));
         |                         ^~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:74:25: note: in expansion of macro 'v4l2_printk'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                         ^~~~~~~~~~~
   drivers/media/platform/apple/msr/msr.h:116:9: note: in expansion of macro 'v4l2_dbg'
     116 |         v4l2_dbg(level, debug, &(msr)->v4l2_dev, fmt, ##args)
         |         ^~~~~~~~
   drivers/media/platform/apple/msr/msr-hw.c:150:17: note: in expansion of macro 'msr_dbg'
     150 |                 msr_dbg(2, ctx->msr, "%s[%d] dma:  %12llx\n", FRM_STR(frm), i,
         |                 ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:74:25: note: in expansion of macro 'v4l2_printk'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                         ^~~~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/media/v4l2-common.h:74:37: note: in expansion of macro 'KERN_DEBUG'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                     ^~~~~~~~~~
   drivers/media/platform/apple/msr/msr.h:116:9: note: in expansion of macro 'v4l2_dbg'
     116 |         v4l2_dbg(level, debug, &(msr)->v4l2_dev, fmt, ##args)
         |         ^~~~~~~~
   drivers/media/platform/apple/msr/msr-hw.c:150:17: note: in expansion of macro 'msr_dbg'
     150 |                 msr_dbg(2, ctx->msr, "%s[%d] dma:  %12llx\n", FRM_STR(frm), i,
         |                 ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:74:25: note: in expansion of macro 'v4l2_printk'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                         ^~~~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/media/v4l2-common.h:74:37: note: in expansion of macro 'KERN_DEBUG'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                     ^~~~~~~~~~
   drivers/media/platform/apple/msr/msr.h:116:9: note: in expansion of macro 'v4l2_dbg'
     116 |         v4l2_dbg(level, debug, &(msr)->v4l2_dev, fmt, ##args)
         |         ^~~~~~~~
   drivers/media/platform/apple/msr/msr-hw.c:157:17: note: in expansion of macro 'msr_dbg'
     157 |                 msr_dbg(2, ctx->msr, "%s[%d] meta: %12llx\n", FRM_STR(frm), i,
         |                 ^~~~~~~


vim +151 drivers/media/platform/apple/msr/msr-hw.c

   124	
   125	static void configure_fmt(struct msr_ctx *ctx, struct msr_vb_buffer *vb,
   126				  struct msr_frame *frm)
   127	{
   128		const struct msr_fmt *fmt = frm->fmt;
   129		void __iomem *base = ctx->msr->base;
   130		size_t reg = 0;
   131		int i;
   132	
   133		reg = IS_SRC(frm) ? 0x180 : 0x280;
   134		msr_writel(ctx, MSR_DMA_ALPHA(fmt->alpha) |
   135			   MSR_DMA_SUBSAMPLING(fmt->subsampling), reg);
   136		msr_dbg(2, ctx->msr, "%s: %x\n", FRM_STR(frm),
   137			readl_relaxed(base + reg));
   138	
   139		for (i = 0; i < MSR_MAX_PLANES; i++) {
   140			msr_writel(ctx, MSR_DMA_STORAGE(fmt->storage[i]),
   141				   reg + 4 + (i * 4));
   142			msr_dbg(2, ctx->msr, "%s[%d]: %05x\n", FRM_STR(frm), i,
   143				readl_relaxed(base + reg + 4 + (i * 4)));
   144		}
   145	
   146		/* XXX: can src have 4 planes? */
   147		reg = IS_SRC(frm) ? 0x198 : 0x290;
   148		for (i = 0; i < MSR_MAX_PLANES; i++) {
   149			msr_writeq(ctx, vb->dma_addrs[i], reg + i * 8);
   150			msr_dbg(2, ctx->msr, "%s[%d] dma:  %12llx\n", FRM_STR(frm), i,
 > 151				readq_relaxed(base + reg + i * 8));
   152		}
   153	
   154		reg = IS_SRC(frm) ? 0x1b8 : 0x2a8;
   155		for (i = 0; i < MSR_MAX_PLANES; i++) {
   156			msr_writeq(ctx, vb->dma_meta_addrs[i], reg + i * 8);
   157			msr_dbg(2, ctx->msr, "%s[%d] meta: %12llx\n", FRM_STR(frm), i,
   158				readq_relaxed(base + reg + i * 8));
   159		}
   160	
   161		reg = IS_SRC(frm) ? 0x1d8 : 0x2c0;
   162		for (i = 0; i < MSR_MAX_PLANES; i++)
   163			msr_writel(ctx, vb->stride[i], reg + i * 4);
   164	
   165		/* offsets? */
   166		reg = IS_SRC(frm) ? 0x1e8 : 0x2cc;
   167	
   168		/* component order, so hw can normalize */
   169		reg = IS_SRC(frm) ? 0x1f8 : 0x2d8;
   170		msr_writel(ctx, MSR_FMT_COMP0(fmt->comp_order[0]) |
   171				MSR_FMT_COMP1(fmt->comp_order[1]) |
   172				MSR_FMT_COMP2(fmt->comp_order[2]) |
   173				MSR_FMT_COMP3(fmt->comp_order[3]), reg);
   174	
   175		msr_writel(ctx, frm->pix.width, reg + 4);
   176		msr_writel(ctx, frm->pix.height, reg + 8);
   177	
   178		/* plane sizes */
   179		reg = IS_SRC(frm) ? 0x234 : 0x308;
   180		msr_writel(ctx, frm->pix.width, reg);
   181		msr_writel(ctx, frm->pix.width / frm->info->hdiv, reg + 4);
   182		msr_writel(ctx, frm->pix.width, reg + 8);
   183	
   184		reg = IS_SRC(frm) ? 0x244 : 0x314;
   185		msr_writel(ctx, frm->pix.height, reg);
   186		msr_writel(ctx, frm->pix.height / frm->info->vdiv, reg + 4);
   187		msr_writel(ctx, frm->pix.height, reg + 8);
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
