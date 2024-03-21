Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53611B64A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 02:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710987214; cv=none; b=MlEwd+oDycgGz685CPQ7shq7nkvq6aOsnrXA6gwQ1fB6ctuQczjLDCz0xkdjTzgbUeZM+i1e4+VyWCq7sfCujVr86QisBrC2XB+gaq3KidIyA+y3gU+PLfPwfZFbTy8uD6L54SCw5eFToqc9+ZI8jz74ZL8IovKyxk0whx2gJPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710987214; c=relaxed/simple;
	bh=a92WiXu/Utx93QKoG/euxUo2nM3VgGjCXehGqu9HlaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KnS8aUexCEhRfDd8fAfNKQ2WCha2f03kh+z0FFsV9a/UZp2MsCkuny2hvbjCzUnRM0ZNakNyln6IoNgglCbpGIYVJ8TLMtH7tiq6YxxofsfTiMd0Cbp89PNKkPtfhcnsc8T2zl7fvoVpqLAgQehWngnFetxsoJTzEAs0RYVUGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJQnsxZC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJQnsxZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710987212; x=1742523212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a92WiXu/Utx93QKoG/euxUo2nM3VgGjCXehGqu9HlaE=;
  b=eJQnsxZCbO7shJn62IVByyRr9j4nOb6yO/HS0AOwGUFBs97DlH3XtiTa
   RYNg6mJpRgOqcm7zu9X2sSc/azvGUGsHDeN1KneDOtjau9z0sG/+jIUrD
   dzpDcS8yMImYB4YM8MBC1Zvsm2hWw2GC2gRP12Z1OOyY8nkzSZEltcAfr
   gTQY/3WHGemo30Nd/Wd2KLnIhAQ6/PGEpfpalOjifBDZWnpQsP3CiUW9W
   PlUN/aQ1p3a9VTBUSKZ7SP21iLWOtq+Ih7HxbeOSt4zEC0xpU741RPWVn
   XchgawjjW1GCPje/J4O108LsNIRZxtqNjyX+i04F6+u8Yg+t81RWpfVTr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6069210"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6069210"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 19:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="18996102"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2024 19:13:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn7vs-000J5f-0a;
	Thu, 21 Mar 2024 02:13:28 +0000
Date: Thu, 21 Mar 2024 10:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0320 9/23]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:585:20: error: incompatible
 function pointer types initializing 'int (*)(struct iommu_domain *, struct
 device *, ioasid_t, struct iommu_domain *)' (aka 'int (*)(struct
 iommu_domain *, struct device *, unsign...
Message-ID: <202403211051.MvEQB6bM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0320
head:   f26c7fa4ff804f89cb51636efd5da08d8da2cd1a
commit: ffc80bb1fe85184541af0c36faedb2d3ad528fee [9/23] iommu: Pass existing domain for set_dev_pasid op
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240321/202403211051.MvEQB6bM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403211051.MvEQB6bM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403211051.MvEQB6bM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:6:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:585:20: error: incompatible function pointer types initializing 'int (*)(struct iommu_domain *, struct device *, ioasid_t, struct iommu_domain *)' (aka 'int (*)(struct iommu_domain *, struct device *, unsigned int, struct iommu_domain *)') with an expression of type 'int (struct iommu_domain *, struct device *, ioasid_t)' (aka 'int (struct iommu_domain *, struct device *, unsigned int)') [-Wincompatible-function-pointer-types]
     585 |         .set_dev_pasid          = arm_smmu_sva_set_dev_pasid,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +585 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c

386fa64fd52baa Lu Baolu 2022-10-31  583  
386fa64fd52baa Lu Baolu 2022-10-31  584  static const struct iommu_domain_ops arm_smmu_sva_domain_ops = {
386fa64fd52baa Lu Baolu 2022-10-31 @585  	.set_dev_pasid		= arm_smmu_sva_set_dev_pasid,
386fa64fd52baa Lu Baolu 2022-10-31  586  	.free			= arm_smmu_sva_domain_free
386fa64fd52baa Lu Baolu 2022-10-31  587  };
386fa64fd52baa Lu Baolu 2022-10-31  588  

:::::: The code at line 585 was first introduced by commit
:::::: 386fa64fd52baadb849ed60c78b024fd1618278e arm-smmu-v3/sva: Add SVA domain support

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
