Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D33A4527
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779546027; cv=none; b=F+l131tcihUPitjNSAhg0eCi8P5c9PgIf7dYroJ94qoz7dMon/ruBIS7ow6kQehnuL+Oq84n98on3b4tBP6h6tWSi/u0Fsv8N6WBp7ZotykHkcMujIQ42A8x/fEKabQrgqZfyxzpPeL1iU6FO9JVBOIKvrQg+hyHAizEHQ86vpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779546027; c=relaxed/simple;
	bh=gleYTS4+lvfTxay1JO3absxeDozyH28xPSlMwciAYec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GzhK+P2RxB/vsz3/qSJvS9/+qFW2xvjutbke1YP48jGEzGdih34tetrR0HhkHVYxu+sBikZLJ5cauwQLBIYN4Jc6XTXG0bXn4m5i5HJMu3ijwmDavriSdOgaL0kmTUMuKcQshhHISXJ4CkJLW6iB6+FV8zv2hA+An9JQxtVLVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwVPDmDf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwVPDmDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779546025; x=1811082025;
  h=date:from:to:cc:subject:message-id;
  bh=gleYTS4+lvfTxay1JO3absxeDozyH28xPSlMwciAYec=;
  b=FwVPDmDf7wW3hgJC4eWnXP2qvD132yiXDhRqmA+fd2ig0aZA4qNLDvKm
   AlfAY7ZaFQoXAR2nNP7wLLf8aiGJUAPuWc5061DWcxns8Zu2FEcyfyJZM
   nRW6EhdP5SM8SXAvOYsGCi/4SEQebCWWS9FPfVm1eTRu7mu/mVDyN9/tE
   oZnlVTpwfBZZMbwNU6337872uUG7YNG9nyRkAk7MxTuCfnXf6gaZTD+jC
   EAgxxoRPICi4fADYtNuXgGh/s3usQlvgGJ7PU7bhxF/VFeZihXXgqtrN3
   uL1alYd/RMhdDjGB/rj38hiK6qHGIGpOFfcq2wUk7wZ0w7vvcIX92mvz4
   w==;
X-CSE-ConnectionGUID: IQAppFdYT3m+12zGHZfPtA==
X-CSE-MsgGUID: d/0Zk7wxSpu1QjdnLgTpCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="67972283"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67972283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 07:20:25 -0700
X-CSE-ConnectionGUID: duJddBgnSTKT3WDMkun6iQ==
X-CSE-MsgGUID: shuce1S3Tf+ehmL867wi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245457087"
Received: from lkp-server01.sh.intel.com (HELO cef7325a8999) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 07:20:23 -0700
Received: from kbuild by cef7325a8999 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQnDA-0000000008L-0jfI;
	Sat, 23 May 2026 14:20:20 +0000
Date: Sat, 23 May 2026 22:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 0/1]
 drivers/iommu/intel/iommu.c:3866:75: sparse: sparse: incorrect type in
 argument 6 (different base types)
Message-ID: <202605232211.fcmYuPlp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   6794f901dd75b16bbfd428ab3be1e510710da4c7
commit: 8b8d3297e39418f542b6e947ffddafab5698dbc1 [0/1] ANDROID: iommu/vt-d: pKVM: Hypercalls for domain pagetable management
config: x86_64-randconfig-121-20260522 (https://download.01.org/0day-ci/archive/20260523/202605232211.fcmYuPlp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605232211.fcmYuPlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605232211.fcmYuPlp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/intel/iommu.c:3866:75: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected int gfp @@     got restricted gfp_t [usertype] gfp @@
   drivers/iommu/intel/iommu.c:3866:75: sparse:     expected int gfp
   drivers/iommu/intel/iommu.c:3866:75: sparse:     got restricted gfp_t [usertype] gfp
   drivers/iommu/intel/iommu.c:3992:13: sparse: sparse: context imbalance in 'intel_iommu_enforce_cache_coherency_fs' - wrong count at exit
   drivers/iommu/intel/iommu.c:4012:13: sparse: sparse: context imbalance in 'intel_iommu_enforce_cache_coherency_ss' - wrong count at exit

vim +3866 drivers/iommu/intel/iommu.c

  3830	
  3831	static int intel_iommu_map(struct iommu_domain *domain,
  3832				   unsigned long iova, phys_addr_t hpa,
  3833				   size_t size, int iommu_prot, gfp_t gfp)
  3834	{
  3835		struct dmar_domain *dmar_domain = to_dmar_domain(domain);
  3836		u64 max_addr;
  3837		int prot = 0;
  3838	
  3839		if (iommu_prot & IOMMU_READ)
  3840			prot |= DMA_PTE_READ;
  3841		if (iommu_prot & IOMMU_WRITE)
  3842			prot |= DMA_PTE_WRITE;
  3843		if (dmar_domain->set_pte_snp)
  3844			prot |= DMA_PTE_SNP;
  3845	
  3846		max_addr = iova + size;
  3847		if (dmar_domain->max_addr < max_addr) {
  3848			u64 end;
  3849	
  3850			/* check if minimum agaw is sufficient for mapped address */
  3851			end = __DOMAIN_MAX_ADDR(dmar_domain->gaw) + 1;
  3852			if (end < max_addr) {
  3853				pr_err("%s: iommu width (%d) is not "
  3854				       "sufficient for the mapped address (%llx)\n",
  3855				       __func__, dmar_domain->gaw, max_addr);
  3856				return -EFAULT;
  3857			}
  3858			dmar_domain->max_addr = max_addr;
  3859		}
  3860		/* Round up size to next multiple of PAGE_SIZE, if it and
  3861		   the low bits of hpa would take us onto the next page */
  3862		size = aligned_nrpages(hpa, size);
  3863	
  3864		if (pkvm_enabled())
  3865			return pkvm_domain_map(dmar_domain, iova >> VTD_PAGE_SHIFT,
> 3866					       hpa >> VTD_PAGE_SHIFT, size, prot, gfp);
  3867	
  3868		return domain_map(dmar_domain, iova >> VTD_PAGE_SHIFT,
  3869				  hpa >> VTD_PAGE_SHIFT, size, prot, gfp);
  3870	}
  3871	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
