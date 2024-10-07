Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED602800
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728283777; cv=none; b=TeEcEzGX0Upmu8vVsHYG9xiEOtbXKDIiEUrH5VejKJshd/0M9UNqEqvR1y4uqW8l9z+GBOROKSP+8AU0VozWAxVTkll2JJL7vZygK70PgvEazGwbdhCwe1S7G04VcefgyiSds1kPhBUiWHx7UoSG6u1ywSonPB35TdicVUCNotk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728283777; c=relaxed/simple;
	bh=vSRF6VfXA3uNVpWYfnMfNlCLb36488zTgDpTvjnB5hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bA6AC7qjvhCze6i4DcIcHkrzLYdXchs+XOafIt+zF84o85DEDNwTR6Vr5oJFy/lZtHhJi+EPl/H4YyJLMciyQHXml/Q8gvpX4PZkItF2o+1P9RJkQwKA8CEk+ltcepHxZHhy6df6zRCg3xe0BTRSEPdotK6MKV3QzjCM0xYw0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7JR6cQX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7JR6cQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728283776; x=1759819776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSRF6VfXA3uNVpWYfnMfNlCLb36488zTgDpTvjnB5hI=;
  b=c7JR6cQXOqLTroFehsz79OU9Dsw415/mvGA3Ur0sz9D5vyQDp99StEjk
   M+060t3nXDu7J4jyoIS7I4M+g0hLcMkIYl8DAS9XvMwoTbspENiZkXhyX
   8DygU1w81PXFr6bB6FiEkmzsHtcnHrLHVpOZLsI6AzQY96lFDgKdlDOcT
   A/PgXFKo3ISeZKqk5T7vIPxumUGUiDRnJdlf5+HuwaRWSXrWSs9KP174M
   B/bb/oemPjrC9d4azX4VB3GHxX0Hw/zpPQecCffYSQVOWC9qVUoplRgdn
   rPoPuDPJegWBx5EhG/WWeKtswLB/KS4jM/wvhKWU4I/pfvKdvE4uxAmI9
   g==;
X-CSE-ConnectionGUID: cqZaRZz2RbuZQf18QP+ReA==
X-CSE-MsgGUID: sBKag9s9R8qL2E8qLavMUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="30303045"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="30303045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 23:49:35 -0700
X-CSE-ConnectionGUID: vd+iAxaVTvKdaCSw+FML0A==
X-CSE-MsgGUID: RK5uQYiBRaWfwcbdSch0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="80157177"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2024 23:49:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxhYh-0004go-25;
	Mon, 07 Oct 2024 06:49:31 +0000
Date: Mon, 7 Oct 2024 14:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:smmuv3_nesting 8/13]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:37:9: error: implicit
 declaration of function 'arm_smmu_make_s2_domain_ste'
Message-ID: <202410071420.v34rXHLS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   001e0c0e12b947eb9f8c10a4a9af17d3e553778d
commit: 78386173763b7040e4a9309bc06818b1b915b9d9 [8/13] iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED
config: arm64-randconfig-r051-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071420.v34rXHLS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071420.v34rXHLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071420.v34rXHLS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c: In function 'arm_smmu_make_nested_cd_table_ste':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:37:9: error: implicit declaration of function 'arm_smmu_make_s2_domain_ste' [-Wimplicit-function-declaration]
      37 |         arm_smmu_make_s2_domain_ste(target, master, nested_domain->s2_parent,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c: In function 'arm_smmu_make_nested_domain_ste':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:82:17: error: implicit declaration of function 'arm_smmu_make_abort_ste'; did you mean 'arm_smmu_make_s1_cd'? [-Wimplicit-function-declaration]
      82 |                 arm_smmu_make_abort_ste(target);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 arm_smmu_make_s1_cd


vim +/arm_smmu_make_s2_domain_ste +37 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c

    32	
    33	static void arm_smmu_make_nested_cd_table_ste(
    34		struct arm_smmu_ste *target, struct arm_smmu_master *master,
    35		struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
    36	{
  > 37		arm_smmu_make_s2_domain_ste(target, master, nested_domain->s2_parent,
    38					    ats_enabled);
    39	
    40		target->data[0] = cpu_to_le64(STRTAB_STE_0_V |
    41					      FIELD_PREP(STRTAB_STE_0_CFG,
    42							 STRTAB_STE_0_CFG_NESTED));
    43		target->data[0] |= nested_domain->ste[0] &
    44				   ~cpu_to_le64(STRTAB_STE_0_CFG);
    45		target->data[1] |= nested_domain->ste[1];
    46	}
    47	
    48	/*
    49	 * Create a physical STE from the virtual STE that userspace provided when it
    50	 * created the nested domain. Using the vSTE userspace can request:
    51	 * - Non-valid STE
    52	 * - Abort STE
    53	 * - Bypass STE (install the S2, no CD table)
    54	 * - CD table STE (install the S2 and the userspace CD table)
    55	 */
    56	static void arm_smmu_make_nested_domain_ste(
    57		struct arm_smmu_ste *target, struct arm_smmu_master *master,
    58		struct arm_smmu_nested_domain *nested_domain, bool ats_enabled)
    59	{
    60		unsigned int cfg =
    61			FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0]));
    62	
    63		/*
    64		 * Userspace can request a non-valid STE through the nesting interface.
    65		 * We relay that into an abort physical STE with the intention that
    66		 * C_BAD_STE for this SID can be generated to userspace.
    67		 */
    68		if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
    69			cfg = STRTAB_STE_0_CFG_ABORT;
    70	
    71		switch (cfg) {
    72		case STRTAB_STE_0_CFG_S1_TRANS:
    73			arm_smmu_make_nested_cd_table_ste(target, master, nested_domain,
    74							  ats_enabled);
    75			break;
    76		case STRTAB_STE_0_CFG_BYPASS:
    77			arm_smmu_make_s2_domain_ste(
    78				target, master, nested_domain->s2_parent, ats_enabled);
    79			break;
    80		case STRTAB_STE_0_CFG_ABORT:
    81		default:
  > 82			arm_smmu_make_abort_ste(target);
    83			break;
    84		}
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
