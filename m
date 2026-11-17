Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877533;
	b=I5qliaRidLiljtVpm24VSAshp4cHolNWVmaLqQsGlGLWemhni3Px0e1iDjAnpYjrYxL+
	 wEXdLdd6C5ZCcfZxmXeVjbiYYwIM72O0ZJVvtA6/MiKH/uAPSWHrMvVYWPva/meqRFzL2
	 /aGwrWrkuDI51KqTW8l6op8q5u2iY+zS/VQvqrEp+N97hzIPLBxRlZ613QrxrjrPxe87O
	 eKZYb3wtfLKLLZsYS98VggYysoqlTZSbq3uVVIGU08Cg1rFHzpidVBjvq2GCNqXOBEMbh
	 0TdY96uhO+R8VrT7jOSELGp5ZwG2wiRX8Q4GMvabH3fjcfJK82QYIYoW9MlUWqsQ4JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877533;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DygPsxIfgojdfZl9XSxM6x0Up5YJSFzqpnU/GTfGcBE=;
	b=iXHKpjPNvF/a1bb2ZdkXadijwE1oZhir7YwgJKhzAbnMXKsoA1DVU8m3zy4hnl0RoyTD
	 nFT1Qpvq6WAeE9GzVmjV41k6hjOKB+47Yd+9rMFUxLmhjO1NrJ96C6WyQcNlCBKQfJyY6
	 MO8zgDsacJG4soyL7K1hYqx8dsm0qbrwQ//QTtB+u9oRKCvHNXFRVwNBKlklmVUlTOdSF
	 zMJg9hcgpBxYEHuO0XEv03WLNCg31ODKRdrRsSH4I2up21lDv2RRppu54+7SAZvg3REH2
	 99MMoxlzM+y0jUoFlKwRboJh/tKcFioH5cBfCg56uaKRBHi3r6AIPC4WNbjqG4UzU1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eC+6JkWm;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A494606A338
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 01:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A494606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eC+6JkWm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794877533; x=1826413533;
  h=date:from:to:cc:subject:message-id;
  bh=6HhLCRpTXYMGCkz852pwydff2n9IxJSQTjV1xrcDg/I=;
  b=eC+6JkWmXDqvMb8RQ6lfgmsbGcxX5XH+FclVpHRALgQs6r0pL9JUw3+9
   rkCMeObvo0czCcf40tQ1Cb2P64ykBguiehjzDOS+vS6iyTHPs4EFQ9VYx
   yd6zrOLKjmOA4Kx+VyFgrPvQ/Vh/A49Bh5OzXV6b18jtJx2aeLRFLRHqr
   3y2Unoa9kmc2AhNklta1BjeuFVUEuoVHwOc4wgKRGw6qFhXppN2Xbp+Xp
   3zlozhz3p9VdRGtBVL0LxkMkw7rj0WD/8nyrrHTSe9Pcgbg28KLvX9iPH
   CWUPWna2BScFJKIa4i53IPoo5vw/KOkxaFyDPoK/BWohIfAA1btyqfP7T
   Q==;
X-CSE-ConnectionGUID: kdV6OkfbT1CA43ZtLeR1TA==
X-CSE-MsgGUID: Tec+pNhpT1KdTkJcFc1cmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3740656"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3740656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:05:32 -0800
X-CSE-ConnectionGUID: VRC1+PkmRpK98F1RSgUhKw==
X-CSE-MsgGUID: H1nOiqAaRfWIoFRnIQK3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9587827"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 17:05:30 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT7dY-000000002u4-0nm5;
	Tue, 17 Nov 2026 01:05:28 +0000
Date: Tue, 17 Nov 2026 02:05:19 +0100
From: kernel test robot <lkp@intel.com>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 95/96]
 drivers/media/platform/apple/msr/msr-hw.c:151:4: error: call to undeclared
 function 'readq_relaxed'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611170137.AM1Btuwy-lkp@intel.com>
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
config: hexagon-randconfig-2200-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170137.AM1Btuwy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170137.AM1Btuwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170137.AM1Btuwy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/msr/msr-hw.c:151:4: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                         readq_relaxed(base + reg + i * 8));
         |                         ^
>> drivers/media/platform/apple/msr/msr-hw.c:151:4: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
     150 |                 msr_dbg(2, ctx->msr, "%s[%d] dma:  %12llx\n", FRM_STR(frm), i,
         |                                                    ~~~~~~
         |                                                    %12x
     151 |                         readq_relaxed(base + reg + i * 8));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/msr/msr.h:116:50: note: expanded from macro 'msr_dbg'
     116 |         v4l2_dbg(level, debug, &(msr)->v4l2_dev, fmt, ##args)
         |                                                  ~~~    ^~~~
   include/media/v4l2-common.h:74:42: note: expanded from macro 'v4l2_dbg'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                                      ~~~      ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |                             ~~~                   ^~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/msr/msr-hw.c:158:4: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     158 |                         readq_relaxed(base + reg + i * 8));
         |                         ^
   drivers/media/platform/apple/msr/msr-hw.c:158:4: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
     157 |                 msr_dbg(2, ctx->msr, "%s[%d] meta: %12llx\n", FRM_STR(frm), i,
         |                                                    ~~~~~~
         |                                                    %12x
     158 |                         readq_relaxed(base + reg + i * 8));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/msr/msr.h:116:50: note: expanded from macro 'msr_dbg'
     116 |         v4l2_dbg(level, debug, &(msr)->v4l2_dev, fmt, ##args)
         |                                                  ~~~    ^~~~
   include/media/v4l2-common.h:74:42: note: expanded from macro 'v4l2_dbg'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                                      ~~~      ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |                             ~~~                   ^~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/readq_relaxed +151 drivers/media/platform/apple/msr/msr-hw.c

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
