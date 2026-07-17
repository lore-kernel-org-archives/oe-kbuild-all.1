Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C838838A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314633; cv=none; b=ty3mLCFUsNWsi4JvdqtKW5JEOttwG/GsvT2vXpavEKDVO3pfHS0t7233b9MgwZeWkLfcg29TGeOtSPlqixbjchDmvDyX7tjGN0CK16Zd+iVhKWNy9wztarXbdiN3+fs3kc7ZzwCrRW4780S0rL++yRnFTCWKxNCGfZoAoZhgHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314633; c=relaxed/simple;
	bh=oA3BQA7+AXpYovKFuzsve4Sq2XrrKMH9OunnXj+hvwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WpB52cdjJxiEy43N+3APok5+mZPo/Ku1pwetOzGxgGLue4JNy7YBok2VMeyH28BsPaIIbFz5awtTrD0DlirEPXKNJr07L+ZfzXeh/xIsBhqzkcfVXxP/jm3Weuuibd5CXPmaXrttF741lgOFljezpEIhrCN1dcmiZp/v3i9u84k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyAWKYS1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyAWKYS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784314633; x=1815850633;
  h=date:from:to:cc:subject:message-id;
  bh=oA3BQA7+AXpYovKFuzsve4Sq2XrrKMH9OunnXj+hvwQ=;
  b=LyAWKYS1j1/dE9dMenUBQhJw2QWKyhKh4iHg+Tk/h6+U6uLAOXnr1TOC
   zLACO6tIxwDRb25nvXEVK/6mPaUnJyEAa892Bvyr6dUL0KUMqXw0RGfYB
   BsYaRVY3RRYf3QpLXiRpacQx+LX+IkuqWvyuigEd1CUCfhuvQ/CAO3hDu
   QNneQP5KL8HGQ2HoZOJXnVJbpywf6ro3RQgP/fFmtZ3raRmy0XfWv/ZAI
   JT9m4e4BGjRJhdhBvkpV/8snWo/vEbMGCKiZmSLZKOVxDwwuLBXszt/re
   SIZ14gY8f7rKsX5Tt2mam3LJ6cwvID0u1WHtbPXjTF1A4iZtPUs3Dv4PG
   A==;
X-CSE-ConnectionGUID: Gsc0WdmIRDWD8UiY2DMAZA==
X-CSE-MsgGUID: NYnGKn9hRtSsenS4cBzbQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88668130"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="88668130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 11:57:12 -0700
X-CSE-ConnectionGUID: +oXZFuw+RhK5obDiw98juQ==
X-CSE-MsgGUID: PVhb5Y7LT1ym1/4c9HTjBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="250505283"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 11:57:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wknkB-00000000T2g-1mRW;
	Fri, 17 Jul 2026 18:57:07 +0000
Date: Sat, 18 Jul 2026 02:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202607180236.xfBHh7Tw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af5e34a41cd607c00ef752e00331736570992354
commit: 7cad800485956a263318930613f8f4a084af8c70 iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
date:   6 months ago
config: arm64-randconfig-r111-20260717 (https://download.01.org/0day-ci/archive/20260718/202607180236.xfBHh7Tw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180236.xfBHh7Tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7cad80048595 ("iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180236.xfBHh7Tw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le64 const [usertype] eats_s1chk @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse:     expected restricted __le64 const [usertype] eats_s1chk
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse:     got unsigned long long
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le64 const [usertype] eats_trans @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse:     expected restricted __le64 const [usertype] eats_trans
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse:     got unsigned long long
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse: sparse: cast from restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1124:33: sparse: sparse: cast from restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +1101 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1095	
  1096	VISIBLE_IF_KUNIT
  1097	void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
  1098					  __le64 *safe_bits)
  1099	{
  1100		const __le64 eats_s1chk =
> 1101			FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_S1CHK);
  1102		const __le64 eats_trans =
> 1103			FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS);
  1104	
  1105		/*
  1106		 * When an STE changes EATS_TRANS, the sequencing code in the attach
  1107		 * logic already will have the PCI cap for ATS disabled. Thus at this
  1108		 * moment we can expect that the device will not generate ATS queries
  1109		 * and so we don't care about the sequencing of EATS. The purpose of
  1110		 * EATS_TRANS is to protect the system from hostile untrusted devices
  1111		 * that issue ATS when the PCI config space is disabled. However, if
  1112		 * EATS_TRANS is being changed, then we must have already trusted the
  1113		 * device as the EATS_TRANS security block is being disabled.
  1114		 *
  1115		 *  Note: now the EATS_TRANS update is moved to the first entry_set().
  1116		 *  Changing S2S and EATS might transiently result in S2S=1 and EATS=1
  1117		 *  which is a bad STE (see "5.2 Stream Table Entry"). In such a case,
  1118		 *  we can't do a hitless update. Also, it should not be added to the
  1119		 *  safe bits with STRTAB_STE_1_EATS_S1CHK, because EATS=0b11 would be
  1120		 *  effectively an errant 0b00 configuration.
  1121		 */
> 1122		if (!((cur[1] | target[1]) & cpu_to_le64(eats_s1chk)) &&
  1123		    !((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
  1124			safe_bits[1] |= cpu_to_le64(eats_trans);
  1125	
  1126		/*
  1127		 * MEV does not meaningfully impact the operation of the HW, it only
  1128		 * changes how many fault events are generated, thus we can relax it
  1129		 * when computing the ordering. The spec notes the device can act like
  1130		 * MEV=1 anyhow:
  1131		 *
  1132		 *  Note: Software must expect, and be able to deal with, coalesced
  1133		 *  fault records even when MEV == 0.
  1134		 */
  1135		safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
  1136	}
  1137	EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
  1138	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
