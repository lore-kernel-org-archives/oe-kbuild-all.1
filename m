Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F59A3EA7B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 02:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728009843; cv=none; b=skJ0WwmbYVmhiHuZtXZNFnAga9TGF/z84eN9d5yAk52mDwNymgEZ6an6dil61rl5n2JLb42AFV66An5vain+mOTIpZ+s63Y9fozQdaSlU10S1xpL6rWbnO6vcdTvuTRys4mR3hCq/v92g79bfqKqzKNTZvNoIcwKSeurjZLSbPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728009843; c=relaxed/simple;
	bh=lbdQ1i/MCsSdkn78myLjZy9dgeP7iaYadKyxnaZqoh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JwVeEB3lgB1YFMfhHYSbXyXEP+zYhFHvpF7IWape0+jsMga8oVJqWgmalP9ieWv3JH5e9A8nOrrTxU3CbcMnGeusGpWOmAvT2bq056TGZBUlZaVTshzmzDAoARagJ/Xbvs630tIcKoGyP+L+pH/1gDSZN1j+HMCu3M2/QG3X9wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnYkEm4Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnYkEm4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728009841; x=1759545841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbdQ1i/MCsSdkn78myLjZy9dgeP7iaYadKyxnaZqoh0=;
  b=EnYkEm4QEMdE8aZZdb8Sw6zgESxQB11hAX4DxZqLouaP9q/K2REWGeWh
   lACb4l6IHWPK18R8TKmvEf4b2xbZ+AUyWXr8qpjLc73zvFaR8mxpFFtvh
   hY097DgfYj3KBnzPeZ2J/k0hNzDaZZ1KOvn/msuAdZmpBkVxtz6YN+PCV
   abcsAS5kIlx2Ub7uzfu2xy/vT6rPKcWHuTSbKM4E/ItBbRWfN/49yph+O
   pgCkc/2mW1orkDVhXZ5rvfvbXQ7kQHaZNhhmhiI964ujuE1tklHzyDa7S
   YWGIeTIWpjwKq9eDbo/AAruhe6w4ZuffwuuUsULbmQ2w/KzwAMimegjXE
   A==;
X-CSE-ConnectionGUID: RbetK1wXQ9qQFCy6vq7NRQ==
X-CSE-MsgGUID: 2PvBV1aiSPycuvKJon6JBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26693699"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="26693699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 19:44:00 -0700
X-CSE-ConnectionGUID: xcvnbJJyS1ymZwrvQBt+cg==
X-CSE-MsgGUID: nNM+Mf9UQAaBH4Agc2sGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="78566825"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2024 19:43:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swYIP-000192-1j;
	Fri, 04 Oct 2024 02:43:57 +0000
Date: Fri, 4 Oct 2024 10:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 10091/22150]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct
 iommu_iotlb_gather' has no member named 'end'
Message-ID: <202410041013.MYpnbOa9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   d18b118454ac9b97cc709d4b3b7034f3119500f5
commit: c220ef36a11e4fe05cc1e583f8e24d2a61541a87 [10091/22150] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-003-20241004 (https://download.01.org/0day-ci/archive/20241004/202410041013.MYpnbOa9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041013.MYpnbOa9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041013.MYpnbOa9-lkp@intel.com/

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
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct iommu_iotlb_gather' has no member named 'end'
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


vim +338 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   332	
   333	static bool kvm_iommu_iotlb_gather_is_disjoint(struct iommu_iotlb_gather *gather,
   334						       unsigned long iova, size_t size)
   335	{
   336		unsigned long start = iova, end = start + size - 1;
   337	
 > 338		return gather->end != 0 &&
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
