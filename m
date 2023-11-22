Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C256B21A11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aj2GUycg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700656977; x=1732192977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5TtwUzpRFweVkmCN6nbCeRbZqYeR0YnJjbQusO8aHOM=;
  b=Aj2GUycg7LqN5/0V7y1xxPe7nCuuIePHMyG2YpQFEmjNB0Hao6cys4Yc
   k/QrlgxmhYtm49cqeNklKUULOv3tx1quqDl/qsz4RKmYNW9vieYWailEk
   2McrmvRJNx3dAhRtFbV46AQ13HKce6YvmxGMpLwdY5HTVuntG+Vw1GC1l
   ZR9AfiBKd2JN4ufbkuIaZNSgFQe21XU41XWFYUAamenOeJqxMMeUP6gN4
   V58KKyVldActY7wY/ZdzEB4wCbz4OOe7n4JONswUOw6XyAxCsmeBbSOQr
   5sQtCQ/L988+1XJi5yCzN9X5ChfPwe6bK+EH0RyOp3IoP9KBxY9qGCoW0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391815150"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="391815150"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910779588"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910779588"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2023 04:42:56 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5mZC-0000TH-0A;
	Wed, 22 Nov 2023 12:42:54 +0000
Date: Wed, 22 Nov 2023 20:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 11/20]
 arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:76:19: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202311221646.tEz297fg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   e039fcabed80b9a58b88b12d52b2527340cf4ade
commit: 498f6cfaf999cf670a3f88aee403ceabb0033257 [11/20] ANDROID: KVM: arm64: s2mpu: Replace struct s2mpu with pkvm_iommu
config: arm64-randconfig-r122-20231121 (https://download.01.org/0day-ci/archive/20231122/202311221646.tEz297fg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221646.tEz297fg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221646.tEz297fg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:76:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:76:19: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:76:19: sparse:     got void *
>> arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:117:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:117:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:117:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:126:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:126:33: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:126:33: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:165:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:165:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:165:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:166:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:166:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:167:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:167:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:167:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:168:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:168:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:168:9: sparse:     got void *
>> arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:182:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:182:38: sparse:     expected void [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:182:38: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:189:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:189:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:189:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:199:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:199:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:199:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:200:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:200:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:200:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:201:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:201:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:201:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:208:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:208:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:208:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:219:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:219:17: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:219:17: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:228:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:228:9: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:228:9: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:497:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:497:17: sparse:     expected void volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:497:17: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:499:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:499:42: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:499:42: sparse:     got void *
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:527:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *va @@     got void [noderef] __iomem * @@
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:527:25: sparse:     expected void *va
   arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c:527:25: sparse:     got void [noderef] __iomem *

vim +76 arch/arm64/kvm/hyp/nvhe/iommu/s2mpu.c

6a2df2071281ab David Brazdil 2021-06-29   63  
498f6cfaf999cf David Brazdil 2022-02-14   64  static u32 __context_cfg_valid_vid(struct pkvm_iommu *dev, u32 vid_bmap)
880d95ffa3a649 David Brazdil 2022-01-07   65  {
498f6cfaf999cf David Brazdil 2022-02-14   66  	struct s2mpu_drv_data *data = (struct s2mpu_drv_data *)dev->data;
880d95ffa3a649 David Brazdil 2022-01-07   67  	u8 ctx_vid[NR_CTX_IDS] = { 0 };
880d95ffa3a649 David Brazdil 2022-01-07   68  	unsigned int vid, ctx = 0;
880d95ffa3a649 David Brazdil 2022-01-07   69  	unsigned int num_ctx;
880d95ffa3a649 David Brazdil 2022-01-07   70  	u32 res;
880d95ffa3a649 David Brazdil 2022-01-07   71  
880d95ffa3a649 David Brazdil 2022-01-07   72  	/* Only initialize once. */
498f6cfaf999cf David Brazdil 2022-02-14   73  	if (data->context_cfg_valid_vid)
498f6cfaf999cf David Brazdil 2022-02-14   74  		return data->context_cfg_valid_vid;
880d95ffa3a649 David Brazdil 2022-01-07   75  
880d95ffa3a649 David Brazdil 2022-01-07  @76  	num_ctx = readl_relaxed(dev->va + REG_NS_NUM_CONTEXT) & NUM_CONTEXT_MASK;
880d95ffa3a649 David Brazdil 2022-01-07   77  	while (vid_bmap) {
880d95ffa3a649 David Brazdil 2022-01-07   78  		/* Break if we cannot allocate more. */
880d95ffa3a649 David Brazdil 2022-01-07   79  		if (ctx >= num_ctx)
880d95ffa3a649 David Brazdil 2022-01-07   80  			break;
880d95ffa3a649 David Brazdil 2022-01-07   81  
880d95ffa3a649 David Brazdil 2022-01-07   82  		vid = __ffs(vid_bmap);
880d95ffa3a649 David Brazdil 2022-01-07   83  		vid_bmap &= ~BIT(vid);
880d95ffa3a649 David Brazdil 2022-01-07   84  		ctx_vid[ctx++] = vid;
880d95ffa3a649 David Brazdil 2022-01-07   85  	}
880d95ffa3a649 David Brazdil 2022-01-07   86  
880d95ffa3a649 David Brazdil 2022-01-07   87  	/* The following loop was unrolled so bitmasks are constant. */
880d95ffa3a649 David Brazdil 2022-01-07   88  	BUILD_BUG_ON(NR_CTX_IDS != 8);
880d95ffa3a649 David Brazdil 2022-01-07   89  	res = CTX_CFG_ENTRY(0, ctx, ctx_vid[0])
880d95ffa3a649 David Brazdil 2022-01-07   90  	    | CTX_CFG_ENTRY(1, ctx, ctx_vid[1])
880d95ffa3a649 David Brazdil 2022-01-07   91  	    | CTX_CFG_ENTRY(2, ctx, ctx_vid[2])
880d95ffa3a649 David Brazdil 2022-01-07   92  	    | CTX_CFG_ENTRY(3, ctx, ctx_vid[3])
880d95ffa3a649 David Brazdil 2022-01-07   93  	    | CTX_CFG_ENTRY(4, ctx, ctx_vid[4])
880d95ffa3a649 David Brazdil 2022-01-07   94  	    | CTX_CFG_ENTRY(5, ctx, ctx_vid[5])
880d95ffa3a649 David Brazdil 2022-01-07   95  	    | CTX_CFG_ENTRY(6, ctx, ctx_vid[6])
880d95ffa3a649 David Brazdil 2022-01-07   96  	    | CTX_CFG_ENTRY(7, ctx, ctx_vid[7]);
880d95ffa3a649 David Brazdil 2022-01-07   97  
498f6cfaf999cf David Brazdil 2022-02-14   98  	data->context_cfg_valid_vid = res;
880d95ffa3a649 David Brazdil 2022-01-07   99  	return res;
880d95ffa3a649 David Brazdil 2022-01-07  100  }
880d95ffa3a649 David Brazdil 2022-01-07  101  
498f6cfaf999cf David Brazdil 2022-02-14  102  static int __initialize_v9(struct pkvm_iommu *dev)
880d95ffa3a649 David Brazdil 2022-01-07  103  {
880d95ffa3a649 David Brazdil 2022-01-07  104  	u32 ssmt_valid_vid_bmap, ctx_cfg;
880d95ffa3a649 David Brazdil 2022-01-07  105  
880d95ffa3a649 David Brazdil 2022-01-07  106  	/* Assume all VIDs may be generated by the connected SSMTs for now. */
880d95ffa3a649 David Brazdil 2022-01-07  107  	ssmt_valid_vid_bmap = ALL_VIDS_BITMAP;
880d95ffa3a649 David Brazdil 2022-01-07  108  	ctx_cfg = __context_cfg_valid_vid(dev, ssmt_valid_vid_bmap);
880d95ffa3a649 David Brazdil 2022-01-07  109  	if (!ctx_cfg)
880d95ffa3a649 David Brazdil 2022-01-07  110  		return -EINVAL;
880d95ffa3a649 David Brazdil 2022-01-07  111  
f6b90bb6f59d0d David Brazdil 2021-06-23  112  	/*
880d95ffa3a649 David Brazdil 2022-01-07  113  	 * Write CONTEXT_CFG_VALID_VID configuration before touching L1ENTRY*
880d95ffa3a649 David Brazdil 2022-01-07  114  	 * registers. Writes to those registers are ignored unless there is
880d95ffa3a649 David Brazdil 2022-01-07  115  	 * a context ID allocated to the corresponding VID (v9 only).
f6b90bb6f59d0d David Brazdil 2021-06-23  116  	 */
880d95ffa3a649 David Brazdil 2022-01-07 @117  	writel_relaxed(ctx_cfg, dev->va + REG_NS_CONTEXT_CFG_VALID_VID);
880d95ffa3a649 David Brazdil 2022-01-07  118  	return 0;
880d95ffa3a649 David Brazdil 2022-01-07  119  }
880d95ffa3a649 David Brazdil 2022-01-07  120  
498f6cfaf999cf David Brazdil 2022-02-14  121  static int __initialize(struct pkvm_iommu *dev)
f6b90bb6f59d0d David Brazdil 2021-06-23  122  {
498f6cfaf999cf David Brazdil 2022-02-14  123  	struct s2mpu_drv_data *data = (struct s2mpu_drv_data *)dev->data;
498f6cfaf999cf David Brazdil 2022-02-14  124  
498f6cfaf999cf David Brazdil 2022-02-14  125  	if (!data->version)
498f6cfaf999cf David Brazdil 2022-02-14  126  		data->version = readl_relaxed(dev->va + REG_NS_VERSION);
f6b90bb6f59d0d David Brazdil 2021-06-23  127  
498f6cfaf999cf David Brazdil 2022-02-14  128  	switch (data->version & VERSION_CHECK_MASK) {
880d95ffa3a649 David Brazdil 2022-01-07  129  	case S2MPU_VERSION_8:
880d95ffa3a649 David Brazdil 2022-01-07  130  		return 0;
880d95ffa3a649 David Brazdil 2022-01-07  131  	case S2MPU_VERSION_9:
880d95ffa3a649 David Brazdil 2022-01-07  132  		return __initialize_v9(dev);
880d95ffa3a649 David Brazdil 2022-01-07  133  	default:
880d95ffa3a649 David Brazdil 2022-01-07  134  		return -EINVAL;
880d95ffa3a649 David Brazdil 2022-01-07  135  	}
f6b90bb6f59d0d David Brazdil 2021-06-23  136  }
f6b90bb6f59d0d David Brazdil 2021-06-23  137  
498f6cfaf999cf David Brazdil 2022-02-14  138  static void __set_control_regs(struct pkvm_iommu *dev)
f6b90bb6f59d0d David Brazdil 2021-06-23  139  {
f6b90bb6f59d0d David Brazdil 2021-06-23  140  	u32 ctrl0 = 0, irq_vids;
f6b90bb6f59d0d David Brazdil 2021-06-23  141  
f6b90bb6f59d0d David Brazdil 2021-06-23  142  	/*
f6b90bb6f59d0d David Brazdil 2021-06-23  143  	 * Note: We set the values of CTRL0, CTRL1 and CFG registers here but we
f6b90bb6f59d0d David Brazdil 2021-06-23  144  	 * still rely on the correctness of their reset values. S2MPUs *must*
f6b90bb6f59d0d David Brazdil 2021-06-23  145  	 * reset to a state where all DMA traffic is blocked until the hypervisor
f6b90bb6f59d0d David Brazdil 2021-06-23  146  	 * writes its configuration to the S2MPU. A malicious EL1 could otherwise
f6b90bb6f59d0d David Brazdil 2021-06-23  147  	 * attempt to bypass the permission checks in the window between powering
f6b90bb6f59d0d David Brazdil 2021-06-23  148  	 * on the S2MPU and this function being called.
f6b90bb6f59d0d David Brazdil 2021-06-23  149  	 */
f6b90bb6f59d0d David Brazdil 2021-06-23  150  
f6b90bb6f59d0d David Brazdil 2021-06-23  151  	/* Enable the S2MPU, otherwise all traffic would be allowed through. */
f6b90bb6f59d0d David Brazdil 2021-06-23  152  	ctrl0 |= CTRL0_ENABLE;
f6b90bb6f59d0d David Brazdil 2021-06-23  153  
f6b90bb6f59d0d David Brazdil 2021-06-23  154  	/*
f6b90bb6f59d0d David Brazdil 2021-06-23  155  	 * Enable interrupts on fault for all VIDs. The IRQ must also be
f6b90bb6f59d0d David Brazdil 2021-06-23  156  	 * specified in DT to get unmasked in the GIC.
f6b90bb6f59d0d David Brazdil 2021-06-23  157  	 */
f6b90bb6f59d0d David Brazdil 2021-06-23  158  	ctrl0 |= CTRL0_INTERRUPT_ENABLE;
f6b90bb6f59d0d David Brazdil 2021-06-23  159  	irq_vids = ALL_VIDS_BITMAP;
f6b90bb6f59d0d David Brazdil 2021-06-23  160  
f6b90bb6f59d0d David Brazdil 2021-06-23  161  	/* Return SLVERR/DECERR to device on permission fault. */
f6b90bb6f59d0d David Brazdil 2021-06-23  162  	ctrl0 |= is_version(dev, S2MPU_VERSION_9) ? CTRL0_FAULT_RESP_TYPE_DECERR
f6b90bb6f59d0d David Brazdil 2021-06-23  163  						  : CTRL0_FAULT_RESP_TYPE_SLVERR;
f6b90bb6f59d0d David Brazdil 2021-06-23  164  
f6b90bb6f59d0d David Brazdil 2021-06-23  165  	writel_relaxed(irq_vids, dev->va + REG_NS_INTERRUPT_ENABLE_PER_VID_SET);
f6b90bb6f59d0d David Brazdil 2021-06-23  166  	writel_relaxed(0, dev->va + REG_NS_CFG);
f6b90bb6f59d0d David Brazdil 2021-06-23  167  	writel_relaxed(0, dev->va + REG_NS_CTRL1);
f6b90bb6f59d0d David Brazdil 2021-06-23  168  	writel_relaxed(ctrl0, dev->va + REG_NS_CTRL0);
f6b90bb6f59d0d David Brazdil 2021-06-23  169  }
f6b90bb6f59d0d David Brazdil 2021-06-23  170  
89dc7c6b94744b David Brazdil 2022-01-10  171  /* Poll the given SFR as long as its value has all bits of a given mask set. */
89dc7c6b94744b David Brazdil 2022-01-10  172  static void __wait_while(void __iomem *addr, u32 mask)
89dc7c6b94744b David Brazdil 2022-01-10  173  {
89dc7c6b94744b David Brazdil 2022-01-10  174  	while ((readl_relaxed(addr) & mask) == mask)
89dc7c6b94744b David Brazdil 2022-01-10  175  		continue;
89dc7c6b94744b David Brazdil 2022-01-10  176  }
89dc7c6b94744b David Brazdil 2022-01-10  177  
498f6cfaf999cf David Brazdil 2022-02-14  178  static void __wait_for_invalidation_complete(struct pkvm_iommu *dev)
89dc7c6b94744b David Brazdil 2022-01-10  179  {
89dc7c6b94744b David Brazdil 2022-01-10  180  	/* Must not access SFRs while S2MPU is busy invalidating (v9 only). */
89dc7c6b94744b David Brazdil 2022-01-10  181  	if (is_version(dev, S2MPU_VERSION_9)) {
89dc7c6b94744b David Brazdil 2022-01-10 @182  		__wait_while(dev->va + REG_NS_STATUS,
89dc7c6b94744b David Brazdil 2022-01-10  183  			     STATUS_BUSY | STATUS_ON_INVALIDATING);
89dc7c6b94744b David Brazdil 2022-01-10  184  	}
89dc7c6b94744b David Brazdil 2022-01-10  185  }
89dc7c6b94744b David Brazdil 2022-01-10  186  

:::::: The code at line 76 was first introduced by commit
:::::: 880d95ffa3a64937f3802bfd8174fc2b2e807684 ANDROID: KVM: arm64: s2mpu: Move SFR init to EL2

:::::: TO: David Brazdil <dbrazdil@google.com>
:::::: CC: David Brazdil <dbrazdil@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
