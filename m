Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8B618DB0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 22:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740175391; cv=none; b=J+Fv6HPJMQSNOsxacVhHRWTOJdDO23rJEji55geFCzzE/srlGoPglwumfIgvpRa/e7CLcgC1oXYwgoDhGtgkCPMF5dgPg74RJyGdqxq1U1zXBd4c4cFeF/vc/zdOkX6+GUz41jmFh+Mx8A8qosb4FIolF+P8H/K5J+gMxkGzp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740175391; c=relaxed/simple;
	bh=x6OcbBTtdLSpP+HH51mEOfq8tPU/1HgXw+17wnJ2GvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z61mjygfMR7LekP0bSQEt3qJ27IK02ziaWuF9HMCmMsQ2QYJUCbDwNxDwfPaUUQhZIYFPSHFvNl5mCAtfCu0+ncuZlVDypkvRUiXHe+9l3WV844lQpTaJIO2OHP8eG7irS/C0wYS5ZXmOmp/TQx5C78xRaaTg2Q2g4Iny9d194E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuDKrjR4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuDKrjR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740175390; x=1771711390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6OcbBTtdLSpP+HH51mEOfq8tPU/1HgXw+17wnJ2GvM=;
  b=cuDKrjR4SGQEx6oJBBzwg0TlxtKnG+PrlZTtCBQrLKQbQKQ/+To2qCCn
   +ZwMkb9XBJASxvod44LDfGRgoNH0RYA/q0aBySPpiASNzzB1VqDBlMT0R
   h4LKd0HL2DGyKbxdm9TA+kpHuTYjSNuMxkDLmgqsYcoNmjfb5eKKZfKQq
   nt3pg+R5dw3JqrJzjUGFGiV8UH/Xf8y7roFRRWTgjNwAitLOpu0writl2
   zq6ndWcD5PNOlkbV9StlZw9x6fqCjhQxb5L//DTXGcQmIA2sm7xBIRmyJ
   Fv69U+TlwzW3SPzWQI2rOBhamhIfTXtT1pyRJ737nS8BRsYQRXeGAYViq
   w==;
X-CSE-ConnectionGUID: DSQAT6mtTZW+CULEx3a9rw==
X-CSE-MsgGUID: vHlPSBENRcKIRSXJxoiIgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40717970"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="40717970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 14:03:09 -0800
X-CSE-ConnectionGUID: VpGJxu5mQgKj+VS0Dhd5mg==
X-CSE-MsgGUID: Plqo5CaaRnaRiujlzSRUmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="116115955"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Feb 2025 14:03:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlb6v-00063v-2t;
	Fri, 21 Feb 2025 22:03:05 +0000
Date: Sat, 22 Feb 2025 06:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:34: error: 'struct
 iommu_iotlb_gather' has no member named 'start'
Message-ID: <202502220606.GZTz4dtt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e664677e9418d630e952f7610e1bef84d50949dd
commit: c220ef36a11e4fe05cc1e583f8e24d2a61541a87 [1/1] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502220606.GZTz4dtt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220606.GZTz4dtt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220606.GZTz4dtt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:85:5: warning: no previous prototype for 'kvm_iommu_refill' [-Wmissing-prototypes]
      85 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:90:6: warning: no previous prototype for 'kvm_iommu_reclaim' [-Wmissing-prototypes]
      90 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:95:5: warning: no previous prototype for 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
      95 | int kvm_iommu_reclaimable(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_is_disjoint':
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct iommu_iotlb_gather' has no member named 'end'
     338 |         return gather->end != 0 &&
         |                      ^~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:34: error: 'struct iommu_iotlb_gather' has no member named 'start'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                                  ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:339:59: error: 'struct iommu_iotlb_gather' has no member named 'end'
     339 |                 (end + 1 < gather->start || start > gather->end + 1);
         |                                                           ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_range':
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:347:19: error: 'struct iommu_iotlb_gather' has no member named 'start'
     347 |         if (gather->start > iova)
         |                   ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:348:23: error: 'struct iommu_iotlb_gather' has no member named 'start'
     348 |                 gather->start = iova;
         |                       ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:349:19: error: 'struct iommu_iotlb_gather' has no member named 'end'
     349 |         if (gather->end < end)
         |                   ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:350:23: error: 'struct iommu_iotlb_gather' has no member named 'end'
     350 |                 gather->end = end;
         |                       ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: In function 'kvm_iommu_iotlb_gather_add_page':
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:20: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |                    ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:358:38: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     358 |         if ((gather->pgsize && gather->pgsize != size) ||
         |                                      ^~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:362:15: error: 'struct iommu_iotlb_gather' has no member named 'pgsize'
     362 |         gather->pgsize = size;
         |               ^~


vim +339 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   332	
   333	static bool kvm_iommu_iotlb_gather_is_disjoint(struct iommu_iotlb_gather *gather,
   334						       unsigned long iova, size_t size)
   335	{
   336		unsigned long start = iova, end = start + size - 1;
   337	
   338		return gather->end != 0 &&
 > 339			(end + 1 < gather->start || start > gather->end + 1);
   340	}
   341	
   342	static inline void kvm_iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gather,
   343							    unsigned long iova, size_t size)
   344	{
   345		unsigned long end = iova + size - 1;
   346	
   347		if (gather->start > iova)
   348			gather->start = iova;
   349		if (gather->end < end)
   350			gather->end = end;
   351	}
   352	
   353	void kvm_iommu_iotlb_gather_add_page(void *cookie,
   354					     struct iommu_iotlb_gather *gather,
   355					     unsigned long iova,
   356					     size_t size)
   357	{
 > 358		if ((gather->pgsize && gather->pgsize != size) ||
   359		    kvm_iommu_iotlb_gather_is_disjoint(gather, iova, size))
   360			kvm_iommu_iotlb_sync(cookie, gather);
   361	
   362		gather->pgsize = size;
   363		kvm_iommu_iotlb_gather_add_range(gather, iova, size);
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
