Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6617B25B098
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490490; cv=none; b=D3+9GN6aOPYWLfJhT+VP78P5VHV/mmunClJCkPnLJlDRoHAPw06Z7nMvq6qEFgAA+EPidTezlYAH8QJZKfyLxXUPqXcQgKvlLu+Caj5d2C8geOgilCux1knAKcNLDvu9OjR44svxB+bcpOvFKbvH+MrsrHoWaSPgdFFqBp9OAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490490; c=relaxed/simple;
	bh=MRf9WNbBWTpn+0mzCXIAfnCH5leTUMyVraw3fuDr9rU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O6vPIJ6WcdmDrFV93mDMdViYkP8YO/Vx+BYS0sZ6M9ob5d/DWvIZtYL+3r2fy9SUOCjV3htm7ScbgU81tFQmMpEjSHTOtlq3q0Wem4LD5n+nxVtuIvmVgrAdf9qd8+6UES5Mpyng5pYRh5bKbaSn/Jg3TuvyoTGH4WWXroa+WE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWxa0bTm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWxa0bTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781490489; x=1813026489;
  h=date:from:to:cc:subject:message-id;
  bh=MRf9WNbBWTpn+0mzCXIAfnCH5leTUMyVraw3fuDr9rU=;
  b=gWxa0bTmZx1Q/lg6Z1BBeYeVfZ1DzxzV+yIyX7RpFaanwK5r7AdO5SqM
   I5b2Or8AHTrCXeQoWuYfjhXGFEIN8D7GBj+OMJ659UuxBIDINsfJ0+c1L
   loMf05XVrHIg/dzQ+dW1+YNj50rkLCroX7EBa6vH6nizYJ5+a3OsK9Av/
   VpyabB6vqYKJkuE4pScEu2WURPDsDfBXfDC6EpWMfE5pZQxE/ksZwuh4z
   53234ma6T+t6UV+R85ad3PoMPsAzP7FnY2K6UuMm3lx4K+FZRa3u+lEWG
   Qf6jXw1yZsRZMFcvm5BJhHQKQ47uXGYfgM0ES2dzZvYfahL0omE4IE9se
   Q==;
X-CSE-ConnectionGUID: hdVhMbPlSt+0Sk/nKx0qDA==
X-CSE-MsgGUID: rnVxSNYvTo+DpbMnFbai2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99801416"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="99801416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 19:28:06 -0700
X-CSE-ConnectionGUID: xQt4mSxzRdu+MyA/NgvQRA==
X-CSE-MsgGUID: DeFd22tvRmeifekNvpiZ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="271020555"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2026 19:28:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYx3R-00000000ROI-3Bad;
	Mon, 15 Jun 2026 02:28:01 +0000
Date: Mon, 15 Jun 2026 10:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse:
 sparse: cast from restricted __le64
Message-ID: <202606151017.QU0evpH9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 7cad800485956a263318930613f8f4a084af8c70 iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
date:   5 months ago
config: arm64-randconfig-r123-20260614 (https://download.01.org/0day-ci/archive/20260615/202606151017.QU0evpH9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606151017.QU0evpH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7cad80048595 ("iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606151017.QU0evpH9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le64 const [usertype] eats_s1chk @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse:     expected restricted __le64 const [usertype] eats_s1chk
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse:     got unsigned long long
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le64 const [usertype] eats_trans @@     got unsigned long long @@
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse:     expected restricted __le64 const [usertype] eats_trans
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1103:17: sparse:     got unsigned long long
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse: sparse: cast from restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1124:33: sparse: sparse: cast from restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)
   arch/arm64/include/asm/cmpxchg.h:168:1: sparse: sparse: cast truncates bits from constant value (ffffffff80000000 becomes 0)

vim +1122 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  1095	
  1096	VISIBLE_IF_KUNIT
  1097	void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
  1098					  __le64 *safe_bits)
  1099	{
  1100		const __le64 eats_s1chk =
  1101			FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_S1CHK);
  1102		const __le64 eats_trans =
  1103			FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS);
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
