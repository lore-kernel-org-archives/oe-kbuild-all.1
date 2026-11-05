Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840814;
	b=OO3qL72nT4O1nf780frCxOlzgAET1sxbK1lX9QNpjQtiLdpL6iyQWT6UqTf6UFUua5gz
	 XWSsUd7dPvqVvW9133VpL+rKsERavheEqyjCRlU31vZaL0g2g/AraemIJ51jw4EFCXtWy
	 CzsAod2EV/xlsHj+IZOwyPouPtsTnQjOHBUGSeD+ckUfQcBcTwgHDXjwoxCOZzDiGao6P
	 asLh/a+jZB50/egu4rTR7sZ3vwjaSD+iNP+U6jlOaBDVSYNiR64pGmBCwmGNAKbrehZIQ
	 6aQUcJnZ+D/d5crEB8YrsbIgCrdtTlhDkmUTuEBAaxLdTErfqUzveDFZHX0QNCFkrXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840814;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QeswZ6MXgCXsQWDrlgPsVJNmd6xbg78ec93buPCy+pw=;
	b=JcAkigGx4W5HDC54l72gPQ+O+n8qJitfzuueN0PoiDsKbqxTC0VRrKdPPabIRp8+TESX
	 5Ry18C+KwjPe9/HRxC27UgxNN1mlXSERvzCb70dF1I3f+FrNnDY++nZICcGt6HX6E76Mm
	 gAaCAgoH46CPE1/N0cUDdS1AnYDhIOCNBlTsIxZaVkVIOwWCy4s2imdbZbzuJlGmeSszg
	 RlrUPuXgkBdINhAzSTxnYsigTjSVUaJk1dlcN973tdfFk1J82ZZ6xMfUpZ8n97OiUI/Gw
	 cu3kG9s190tQ9PlV+8Roktw+csJTEV82bIs4CneUAMiyDEkGZTAR94Qg1Xkwj7GUdYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iRqRB0lN;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF1B606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 01:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF1B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iRqRB0lN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793840812; x=1825376812;
  h=date:from:to:cc:subject:message-id;
  bh=gZHWZmeQzrhdZ0U31QicQaWT0rpZ6EB3ME43lrsGnbA=;
  b=iRqRB0lNc2cpo6Qi2T466pNWseqlreE22+nqF0k/Wb/LxIjPHgAsgBwK
   MV8/jsA4DxFX3nyEdWUp2aOsDnEP69bmxP83ELR661+Qjg1YL/afK3wGS
   o5Bl5safKFUtQ/EigIp5IOq29FPOmMlfhvNkuZxCP9386u3FwGHC8CMSP
   9Rli4YGPjWtFhHvAS//UJ8t/vv5p+WR+UAeRHOC6Nev9BK9J/JRLpFOeA
   WMSWHHrY1xQ/Cn4tY4DcMDCFefqtPEyU+/xHbzP46czccYqs07SXz/M3w
   6Eh6ipAS3+ZNzvrtC3muHkzTdGQ5t/Wbpr1jBHFdocQ3oM9fPSOdaNPtl
   A==;
X-CSE-ConnectionGUID: eap1v6x5SJiPBwjaMM79+w==
X-CSE-MsgGUID: OjtAzwMcReyKAuwdQ20Nqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2621694"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2621694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:06:52 -0800
X-CSE-ConnectionGUID: OIAN2iw8ShWbape7SZjQxA==
X-CSE-MsgGUID: nIZA+fUHTKykr+jtJoWmCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6891056"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2026 17:06:50 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOlwD-000000009Q7-1k8R;
	Thu, 05 Nov 2026 01:06:45 +0000
Date: Thu, 05 Nov 2026 02:06:24 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1101:17: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202611050256.zQEykRKb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5fbc2d3bfcb5336b2ee9152493cbaee50cf948eb
commit: 779e0c250a6b8a0a2c1e2f39bedfb159100d113d [8/8] iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
config: arm64-randconfig-r2303-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050256.zQEykRKb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050256.zQEykRKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050256.zQEykRKb-lkp@intel.com/

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
