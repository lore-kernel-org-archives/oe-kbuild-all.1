Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24706FE1A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 23:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712274980; cv=none; b=aypIX1tbcUBFb85RnTf12hoWhOWhgEREyEeA4NxGZaTsVuXdqfr2fOa1GvJM8L7qg+QqK3TUIVbmlYHXzhkWXZ9jj6InHwGGGVI+1HrOgm1E/j5+z9k+kIPQeVXL7IFN/UzvRe6akFsF9a4hCgYdhPYLtx72rBmUW2DnMbjmYio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712274980; c=relaxed/simple;
	bh=w9oicF7sr3AU45y/8WXSaXhMW7y07ltrg5mjX6qioi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YaCK5VYRmX6UZc1fcZq1ANYvcQ5PmNuYSVdRv1w2nmOKhd+aALCekKZkMeQfk6lfhpMsd71JEs5j1lSDWmX8bO9jwHh4ujOO0S3+MmBIffq6rm6aW5KDEkPRK8OMFn7k4DQnFz3t69KTEV+rUPOBiuEZbADP8Yp29zt53qQKsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6p2lnBL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6p2lnBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712274978; x=1743810978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9oicF7sr3AU45y/8WXSaXhMW7y07ltrg5mjX6qioi0=;
  b=J6p2lnBLJ46we3Lii2nJRtK5WY5ujz0TrExr84AfP97eUlVr4pdeWPnR
   shok9fIlCMZExaLT7W/JK+nsiJBmzZFv4wlUfmN0OQMjMZbVJRJz2cdWW
   i2YNIHndx3fV9aUQ1NqGjI/V0mGTfGRkskElciOy7XTqJaEitKhH8Qs1v
   sFiDZZ9xDb5t6OuoC3Ij/Q5rhvEgP5EHoji2t6krqPZBQ+9I7bcUy0lUs
   2VAT4eWnAWOU93drq/qY9qecJh5b6ndJts/f4z07bzyViHGxERfxvRs5g
   oge9PUr+aO87j7bsOoTFISsDtAumbiy9emzg4yUxmZHW2sv8gZNjKpJRE
   A==;
X-CSE-ConnectionGUID: IBNEcxsGQDOlwDwYQNhAyA==
X-CSE-MsgGUID: 1jTlbI/sS+6poCK0afRdWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7722767"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7722767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 16:56:18 -0700
X-CSE-ConnectionGUID: IIoQ2TwdTcO24y5erKgqrA==
X-CSE-MsgGUID: tJa0g93hT+mL2UnB+KIj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23657229"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2024 16:56:16 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsWwH-0001eC-2o;
	Thu, 04 Apr 2024 23:56:13 +0000
Date: Fri, 5 Apr 2024 07:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 22/30]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:338:22: error: 'struct
 iommu_iotlb_gather' has no member named 'end'
Message-ID: <202404050708.jhE4NAtf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   71a9b4bd904095839bdf986af71afd80c2fcb899
commit: c26de7344b1b12f866e3f55537cf84313317c081 [22/30] ANDROID: KVM: arm64: iommu: support iommu_iotlb_gather
config: arm64-randconfig-004-20240405 (https://download.01.org/0day-ci/archive/20240405/202404050708.jhE4NAtf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050708.jhE4NAtf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050708.jhE4NAtf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9,
                    from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14,
                    from arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:15:
   arch/arm64/kvm/hyp/include/nvhe/refcount.h: In function '__lse_refcount_fetch_add_16':
   arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:22: error: expected string literal before '__LSE_PREAMBLE'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c: At top level:
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


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
