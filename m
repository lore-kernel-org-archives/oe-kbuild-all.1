Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC411ABC26
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089979; cv=none; b=OsqsnIU400jSVYJiCyhUyAKmUt1f5tPe0lUq1Tv+Cii10As5XVw4pCjumy6t2MkOMRE7Sq0usyKdcQ2MC++BEYFIS8t0GXyeRxVMyQyM8L5EfEwa9K5cSy3ZoP0ko8B8uGro13/lv1JnBiRmI96I/J6iGjOur0nO/lYX7KEsNa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089979; c=relaxed/simple;
	bh=3MqxVfq8A4ZC9h82akdg6uW20ecjT2BroQ+UjsqemZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAuAqIOTj5X+dt/IXwGL1As2TyxKJ8Ii672uJFoZjJ2/gR7useLfXzCLkHE7bQnAVfUfPgZ5IIiOsKagJ1ErZDMPxzhvhAlxVeYWCECGq7r3WBTvRubts/9pIP57eU38Db7dQQ8tdNtF49uegJJW87EOuqy51FogZZe8Xqw+Qpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZthxzah; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZthxzah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720089977; x=1751625977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3MqxVfq8A4ZC9h82akdg6uW20ecjT2BroQ+UjsqemZY=;
  b=TZthxzahvMwPgicpL2mm8h9FyOHlzRyGzM4naikmR3tDXrwBOFMbC8oL
   YhUVOXcAszwU/fDU8SyWNDkVUt4h9srRnYCHY3DZMuzsCPVVwqQ4VB5/6
   BtrwLEFPfvCIZFN1gpJCiitImwWQ498wnK7f2DTeiEBDxdDxu/IPRVcKV
   bgD1YEBKyOavyh30+MuCEwRxF4XcnjC0ks0j2pOREbJksJbRM8tIrON9/
   sl5/j6s6r2Ik7udRY7EJ28SRAItzIp9ZUq3iwn1iBl+jqcYPd/8IMz+DK
   0kQWFFrrm4iE3O0JvZsGQ8MXAGWKB4T4KYoObL4rz7oN3gCt0AwXyQD2G
   g==;
X-CSE-ConnectionGUID: WbMa2k65TMqyAl2VRHdPig==
X-CSE-MsgGUID: XreRAuWsRf+38h53lmL6ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17085853"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17085853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 03:46:15 -0700
X-CSE-ConnectionGUID: y8KLXvFRS9WFCku7IvEO2A==
X-CSE-MsgGUID: kuGsXNFbRAiM/KEkFam26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51740361"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2024 03:46:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPJyd-000QtN-2f;
	Thu, 04 Jul 2024 10:46:11 +0000
Date: Thu, 4 Jul 2024 18:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 37/53]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:225:16: warning: variable
 'reg' set but not used
Message-ID: <202407041832.EaxCdglM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   2bf23486e7eae67485953abf3529ad2d3a90384b
commit: 23dbb9b1e1ec4cc15b44eeb954b5045ed86daf78 [37/53] add COMPILE_TEST
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240704/202407041832.EaxCdglM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041832.EaxCdglM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041832.EaxCdglM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:225:16: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
     225 |         unsigned long reg, fld;
         |                       ^
   1 warning generated.


vim +/reg +225 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c

32784a9562fb05 Jean-Philippe Brucker 2020-11-06  222  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  223  bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  224  {
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18 @225  	unsigned long reg, fld;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  226  	unsigned long oas;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  227  	unsigned long asid_bits;
51d113c3be09ff Jean-Philippe Brucker 2021-01-22  228  	u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  229  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  230  	if (vabits_actual == 52)
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  231  		feat_mask |= ARM_SMMU_FEAT_VAX;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  232  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  233  	if ((smmu->features & feat_mask) != feat_mask)
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  234  		return false;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  235  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  236  	if (!(smmu->pgsize_bitmap & PAGE_SIZE))
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  237  		return false;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  238  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  239  	/*
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  240  	 * Get the smallest PA size of all CPUs (sanitized by cpufeature). We're
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  241  	 * not even pretending to support AArch32 here. Abort if the MMU outputs
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  242  	 * addresses larger than what we support.
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  243  	 */
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  244  	reg = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
2d987e64e8c756 Mark Brown            2022-09-05  245  	fld = cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  246  	oas = id_aa64mmfr0_parange_to_phys_shift(fld);
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  247  	if (smmu->oas < oas)
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  248  		return false;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  249  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  250  	/* We can support bigger ASIDs than the CPU, but not smaller */
07d7d848b96b57 Mark Brown            2022-09-05  251  	fld = cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_EL1_ASIDBITS_SHIFT);
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  252  	asid_bits = fld ? 16 : 8;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  253  	if (smmu->asid_bits < asid_bits)
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  254  		return false;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  255  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  256  	/*
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  257  	 * See max_pinned_asids in arch/arm64/mm/context.c. The following is
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  258  	 * generally the maximum number of bindable processes.
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  259  	 */
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  260  	if (arm64_kernel_unmapped_at_el0())
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  261  		asid_bits--;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  262  	dev_dbg(smmu->dev, "%d shared contexts\n", (1 << asid_bits) -
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  263  		num_possible_cpus() - 2);
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  264  
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  265  	return true;
d744f9e6c222c8 Jean-Philippe Brucker 2020-09-18  266  }
f534d98b9d2705 Jean-Philippe Brucker 2020-09-18  267  

:::::: The code at line 225 was first introduced by commit
:::::: d744f9e6c222c8086376bc56c86e4380595350bd iommu/arm-smmu-v3: Check for SVA features

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
