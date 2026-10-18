Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE223C5845
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309961; cv=none; b=P/dPp8sHklhBOkcpKLwtHe8eGERVOZxki8p6gIp7W5Ue/yTipcCsxcXFbMIxBg50hr3/RgsS0zbfdr0x2IZn2YlK2oe7vyydEZVP0SevHpWiwgkW+iPqUc5OwyV3FRPag/x7tPozh9bgnmBl5gfaeug63DYZitrj9NzJo4b4MVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309961; c=relaxed/simple;
	bh=Qj7inINxNbHb7naEFf7Wp/4WC6OOP4PGt9kYfkNz4o0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RXCYAS/dfcWry3nEfW5rcM2JzOjTxYkBEVj/+o7kuIDpQuxSbwSKyo0NPA9oUvjCeVOJrFj0oZebRO/qJZh5HVNCrUqNQOV1o06oz0i/YPMI/+TBCoqHmYWsOtkX4vHGTeVhrV5xn1KXEN4fcY/OEM51+hWjUyCyGyv8Z/X40bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf0O1PUY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf0O1PUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309959; x=1823845959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qj7inINxNbHb7naEFf7Wp/4WC6OOP4PGt9kYfkNz4o0=;
  b=cf0O1PUY5vys9OvpFyvAh1GnKKtRtIDAteNuJ/9yWvS1NU1e13aG47+k
   OFlw9/NCw7YTUjEaJcvwvqpMmFHy8cyJ3//aP0jGLcPbelarnlAWC5e8A
   ug6aRywCmZjJbDKYCPMyXV3zGPe0q+gbnyF8rfLmkalfUyRckxgGJYk2i
   gm11/EP1c3j0i4T0rmcZUG7qKYbhXIz8ggrXqsf0sr5Q49LMwNx1B9NpW
   xlsfxD57LhxxsVaS6mptjPnkXqRIty2vhkGBY8g4f6LmZUjYmIc3U2iVy
   WdHGCukEQ5IuLQQsNiThMkMBzzoHRAGYe8/I4tMltaMp5rnmgBwEnK9Pr
   Q==;
X-CSE-ConnectionGUID: iUAKlu6dS1iEd+s6qNA+Uw==
X-CSE-MsgGUID: 7G3tbgU0SxyDnZQtpZ8rIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916670"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916670"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: vUE4S1cyTRa3pi0qsA0r4w==
X-CSE-MsgGUID: I/s+1CIcR96j8d74x/OUig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340773"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004vB-24yg;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:43:41 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 27/27]
 =?us-ascii?Q?arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/a?=
 =?us-ascii?Q?rm-smmu-v3/pkvm/nested/arm-smmu-v3.c:371:28:?= sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202610170148.61sQzSQU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   b4108abbd0e1cb0df40452dee77291f106e1d711
commit: 06c9f4d9879c950588105dfe10034b24ba0b1ebd [27/27] ANDROID: iommu/arm-smmu-v3-kvm: Rework L2 shadowing
config: arm64-randconfig-r2302-20261016 (https://download.01.org/0day-ci/archive/20261017/202610170148.61sQzSQU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170148.61sQzSQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610170148.61sQzSQU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:328:15: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:328:15: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:328:15: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:329:14: sparse: sparse: cast to restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:329:14: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:329:14: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:344:22: sparse: sparse: invalid assignment: |=
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:344:22: sparse:    left side has type restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:344:22: sparse:    right side has type unsigned long long
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:346:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:346:22: sparse:     expected restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:346:22: sparse:     got unsigned long long
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:356:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long @@
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:356:22: sparse:     expected restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:356:22: sparse:     got unsigned long long
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:358:22: sparse: sparse: invalid assignment: |=
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:358:22: sparse:    left side has type restricted __le64
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:358:22: sparse:    right side has type unsigned long long
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:371:30: sparse: sparse: cast to restricted __le64
>> arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:371:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] l2ptr @@     got unsigned long long [usertype] @@
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:371:28: sparse:     expected restricted __le64 [usertype] l2ptr
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:371:28: sparse:     got unsigned long long [usertype]
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:372:27: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:375:35: sparse: sparse: restricted __le64 degrades to integer
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:541:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *base @@     got void * @@
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:541:20: sparse:     expected void [noderef] __iomem *base
   arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c:541:20: sparse:     got void *

vim +371 arch/arm64/kvm/hyp/nvhe/../../../../../drivers/iommu/arm/arm-smmu-v3/pkvm/nested/arm-smmu-v3.c

   320	
   321	static void smmu_attach_stage_2(struct arm_smmu_ste *ste)
   322	{
   323		unsigned long vttbr;
   324		unsigned long ts, sl, ic, oc, sh, tg, ps;
   325		unsigned long cfg;
   326		struct io_pgtable_cfg *pgt_cfg =  &idmap_pgtable->cfg;
   327	
   328		cfg = FIELD_GET(STRTAB_STE_0_CFG, ste->data[0]);
   329		if (!FIELD_GET(STRTAB_STE_0_V, ste->data[0]) ||
   330		    (cfg == STRTAB_STE_0_CFG_ABORT))
   331			return;
   332		/* S2 is not advertised, that should never be attempted. */
   333		if (WARN_ON(cfg == STRTAB_STE_0_CFG_NESTED))
   334			return;
   335		vttbr = pgt_cfg->arm_lpae_s2_cfg.vttbr;
   336		ps = pgt_cfg->arm_lpae_s2_cfg.vtcr.ps;
   337		tg = pgt_cfg->arm_lpae_s2_cfg.vtcr.tg;
   338		sh = pgt_cfg->arm_lpae_s2_cfg.vtcr.sh;
   339		oc = pgt_cfg->arm_lpae_s2_cfg.vtcr.orgn;
   340		ic = pgt_cfg->arm_lpae_s2_cfg.vtcr.irgn;
   341		sl = pgt_cfg->arm_lpae_s2_cfg.vtcr.sl;
   342		ts = pgt_cfg->arm_lpae_s2_cfg.vtcr.tsz;
   343	
   344		ste->data[1] |= FIELD_PREP(STRTAB_STE_1_SHCFG, STRTAB_STE_1_SHCFG_INCOMING);
   345		/* The host shouldn't write dwords 2 and 3, overwrite them. */
 > 346		ste->data[2] = FIELD_PREP(STRTAB_STE_2_VTCR,
   347					  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, ps) |
   348					  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, tg) |
   349					  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, sh) |
   350					  FIELD_PREP(STRTAB_STE_2_VTCR_S2OR0, oc) |
   351					  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, ic) |
   352					  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, sl) |
   353					  FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, ts)) |
   354			 FIELD_PREP(STRTAB_STE_2_S2VMID, 0) |
   355			 STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2R;
   356		ste->data[3] = vttbr & STRTAB_STE_3_S2TTB_MASK;
   357		/* Convert S1 => nested and bypass => S2 */
   358		ste->data[0] |= FIELD_PREP(STRTAB_STE_0_CFG, cfg | BIT(1));
   359	}
   360	
   361	static int smmu_get_host_l2_ste(struct hyp_arm_smmu_v3_nested_device *nested_smmu,
   362					u32 sid, struct arm_smmu_ste *host_ste_out)
   363	{
   364		u64 *host_ste_base = hyp_phys_to_virt(strtab_host_base(nested_smmu));
   365		struct hyp_arm_smmu_v3_device *smmu = &nested_smmu->common;
   366		struct arm_smmu_strtab_l1 host_l1_desc;
   367		struct arm_smmu_strtab_l2 *l2ptr;
   368		phys_addr_t host_l2_tab;
   369		int ret;
   370	
 > 371		host_l1_desc.l2ptr = le64_to_cpu(READ_ONCE(host_ste_base[arm_smmu_strtab_l1_idx(sid)]));
   372		if (!(host_l1_desc.l2ptr & STRTAB_L1_DESC_SPAN))
   373			return -EINVAL;
   374	
   375		host_l2_tab = host_l1_desc.l2ptr & STRTAB_L1_DESC_L2PTR_MASK;
   376		/* Share and pin the table before accessing it. */
   377		ret = smmu_share_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2));
   378		if (ret)
   379			return ret;
   380	
   381		l2ptr = hyp_phys_to_virt(host_l2_tab);
   382		smmu_copy_from_host(smmu, host_ste_out, &l2ptr->stes[arm_smmu_strtab_l2_idx(sid)],
   383				    STRTAB_STE_DWORDS << 3);
   384		WARN_ON(smmu_unshare_pages(host_l2_tab, sizeof(struct arm_smmu_strtab_l2)));
   385		return 0;
   386	}
   387	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
