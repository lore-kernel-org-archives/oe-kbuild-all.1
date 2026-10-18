Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30544443C24
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309966; cv=none; b=jBObltUg+nDfFuSxuhNOCG8p4nIySVeX2AY/rUDGyX0xtg2hmVOGSWqp8iQA5G/9PrehDwQBdZRnthZH4bxujojYCwkk9ntutW51thd8+pxAIenLIc2Y6X08m1Z7fM5oyE7yKklPEuDFuga2qgaUhQsEffz6jfANMeW4I/WHbYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309966; c=relaxed/simple;
	bh=TTbDqSd948M8FYXeBDQVIklyv0RX9hrYLz7osFZtvmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dCQysc56VewHJEo4EwOfeZp7HQwgGkIP5n9IVfC8mTozGjBc8W86T8E+4OIkYxy+A/ULsntCf3WQmdhnrOFd5B6FvA7hm0/IOqpKdZInCGv04AF+RfdZjSncM3bkFQ44x8Ni5Sez762XvpdvXkK/TDBDOId0tip/vWOjj/OKExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQQ6M3AZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQQ6M3AZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309962; x=1823845962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TTbDqSd948M8FYXeBDQVIklyv0RX9hrYLz7osFZtvmU=;
  b=WQQ6M3AZwNAbn2F8VzKYA4peyARuYpcxwgymXhEQyivjxEyLODMERZJC
   nwTe9KkXD0UMwlnnQMcgCAxI1Gtg4XT11upI6zWDoG2rhTLqMBb91vAP9
   dCNtTGLC3XJ4TklqtLQOa4xAoGgviTtwgG7SN4pPsO9gelSMYsX9jqdH5
   2NQTpp3hLnX0dTnzSK4bEUmViIYzlNyY4UjlHt5KaiWYHQ1tEjYnRB0Tv
   MiZmO9YUdWXsKvLmukOhMuAK9of14XUk8qC69FTqXtC+4c7dRGrUA1EOn
   nAQrCrQkBuoAPSxpDvf4xLXY9FlvBEksbV0y1QCCAj7XOk+evP3AZrFMA
   g==;
X-CSE-ConnectionGUID: UUlYzicTQHGZJB6g+G7UbQ==
X-CSE-MsgGUID: Rj7fK2XbS1uuvVSIWQDrxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916680"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: z5sdXlmQRC+qNGxLxNnM7g==
X-CSE-MsgGUID: /g4qS0taRaKf0K7vAk0hdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340787"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004v9-1wnQ;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:43:32 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 27/27]
 =?us-ascii?Q?arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/a?=
 =?us-ascii?Q?rm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15:?= sparse:
 sparse: cast to restricted __le64
Message-ID: <202610162053.aF9Q1dlf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   b4108abbd0e1cb0df40452dee77291f106e1d711
commit: 6056d88e71d977020974d7b4af860cbc0ecc6276 [27/27] ANDROID: iommu/arm-smmu-v3-kvm: Support EL2 compiling as a module
config: arm64-randconfig-r2302-20261016 (https://download.01.org/0day-ci/archive/20261016/202610162053.aF9Q1dlf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610162053.aF9Q1dlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610162053.aF9Q1dlf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: cast to restricted __le64
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: restricted __le64 degrades to integer
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:410:15: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:411:14: sparse: sparse: restricted __le64 degrades to integer
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:426:22: sparse: sparse: invalid assignment: |=
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:426:22: sparse:    left side has type restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:426:22: sparse:    right side has type unsigned long long
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:428:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:428:22: sparse:     expected restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:428:22: sparse:     got unsigned long long
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:438:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:438:22: sparse:     expected restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:438:22: sparse:     got unsigned long long
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:440:22: sparse: sparse: invalid assignment: |=
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:440:22: sparse:    left side has type restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:440:22: sparse:    right side has type unsigned long long
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:456:40: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:459:55: sparse: sparse: restricted __le64 degrades to integer
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:612:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:612:20: sparse:     expected void [noderef] __iomem *base
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:612:20: sparse:     got void *

vim +410 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c

edfaf6e6f05331 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  402  
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  403  static void smmu_attach_stage_2(struct arm_smmu_ste *ste)
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  404  {
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  405  	unsigned long vttbr;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  406  	unsigned long ts, sl, ic, oc, sh, tg, ps;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  407  	unsigned long cfg;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  408  	struct io_pgtable_cfg *pgt_cfg =  &idmap_pgtable->cfg;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  409  
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17 @410  	cfg = FIELD_GET(STRTAB_STE_0_CFG, ste->data[0]);
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  411  	if (!FIELD_GET(STRTAB_STE_0_V, ste->data[0]) ||
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  412  	    (cfg == STRTAB_STE_0_CFG_ABORT))
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  413  		return;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  414  	/* S2 is not advertised, that should never be attempted. */
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  415  	if (WARN_ON(cfg == STRTAB_STE_0_CFG_NESTED))
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  416  		return;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  417  	vttbr = pgt_cfg->arm_lpae_s2_cfg.vttbr;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  418  	ps = pgt_cfg->arm_lpae_s2_cfg.vtcr.ps;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  419  	tg = pgt_cfg->arm_lpae_s2_cfg.vtcr.tg;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  420  	sh = pgt_cfg->arm_lpae_s2_cfg.vtcr.sh;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  421  	oc = pgt_cfg->arm_lpae_s2_cfg.vtcr.orgn;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  422  	ic = pgt_cfg->arm_lpae_s2_cfg.vtcr.irgn;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  423  	sl = pgt_cfg->arm_lpae_s2_cfg.vtcr.sl;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  424  	ts = pgt_cfg->arm_lpae_s2_cfg.vtcr.tsz;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  425  
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17 @426  	ste->data[1] |= FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  427  	/* The host shouldn't write dwords 2 and 3, overwrite them. */
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17 @428  	ste->data[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  429  				  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  430  				  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  431  				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  432  				  FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  433  				  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  434  				  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  435  				  FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  436  		 FIELD_PREP(STRTAB_STE_2_S2VMID, 0) |
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  437  		 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  438  	ste->data[3] = vttbr & STRTAB_STE_3_S2TTB_MASK;
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  439  	/* Convert S1 => nested and bypass => S2 */
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  440  	ste->data[0] |= FIELD_PREP(STRTAB_STE_0_CFG, cfg | BIT(1));
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  441  }
8aef06347393f4 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c Mostafa Saleh 2025-11-17  442  

:::::: The code at line 410 was first introduced by commit
:::::: 8aef06347393f4bb6802e81aefa4dd72008e2ee6 FROMLIST: iommu/arm-smmu-v3-kvm: Enable nesting

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Mostafa Saleh <smostafa@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
