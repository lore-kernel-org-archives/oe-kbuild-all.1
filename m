Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1603254A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904728; cv=none; b=jul4DAKIvBjoUyFpwziC3/ZylrZYBtpUSGdRc+SrjNCn4mgI9UKLwI9gSV7OUpFDyL9V5OE+G5kl7vFA/kaZm8LnunW6SEb/bgfe9y4dCBYKj2nar8ynIO3/5VDup8PfPZmphsrXWrJIfljQ17ELYBaCRFcmk/tdQrmFcSi7PNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904728; c=relaxed/simple;
	bh=jivUxZrRZrk4+zlT15F/gYuUYL9Oi/gHii72+S5jIwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZKlGt5GcmxT31CyInyS27tbBMLucRt0PKrgy1MBW555n22Zh8rVk1eLiu1ACQ+ODfpHXhWnVe04ZN3txFFYpXFdgmAG01AyumXEfM+CkiC1SJAmqo/rSp8HP4q4fo4VOm6BvY+RoLSJORS9QDCMbuoowVlb3fYra/QUl1T3amA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZdpI6eG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZdpI6eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765904727; x=1797440727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jivUxZrRZrk4+zlT15F/gYuUYL9Oi/gHii72+S5jIwA=;
  b=PZdpI6eGsLuupd2ADA6KzOuo71TIwEQAQUhQJ7guPJ1KHgIFK68hkNvU
   U2UIafrRQHUHdOngkZ0ihT3/Gr3e05zWnLP5Aob46TMz/DbkYHAD14Tu0
   W1VJxk/XrYqFNLh48HnCW8AIg+MWHOGkujnK+qKlx/R7voiBybpz1G8Rg
   7AOzos+1KQcHr55nKUwhJk/n4y16U2bxDV60NvF7rzwNo49+3vZ7uQOWL
   XtAFDVLynHyAqqBY0dKHCz2c5m0pu4XZ0Qbba/M816lL6ssQx/T3jgyr1
   g9O4AMhaay0qJVOb/zI44/9mmc2ZulFzz0vn8jSzSZhQA/p79rZCr/j1d
   g==;
X-CSE-ConnectionGUID: J7bTPAkpSKi9TUSiy2b7Ig==
X-CSE-MsgGUID: o9fpwpXTSB21wVYqNagT5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78467725"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78467725"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:05:26 -0800
X-CSE-ConnectionGUID: 6Dq7u2I3TSqs2s11Edkd+Q==
X-CSE-MsgGUID: aji2Pkg4RlaAN16QCy25kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197821615"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 09:05:25 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVYTt-000000003cO-3nKi;
	Tue, 16 Dec 2025 17:05:12 +0000
Date: Wed, 17 Dec 2025 01:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:6: warning: no previous prototype
 for 'kvm_iommu_donate_from_cma'
Message-ID: <202512170005.yYm4n70n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: 3f35c377b90d0692801bd74b5501e6dcf81e4900 [0/2] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251217/202512170005.yYm4n70n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170005.yYm4n70n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170005.yYm4n70n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:111:6: warning: no previous prototype for '__kvm_iommu_reclaim_pages' [-Wmissing-prototypes]
     111 | void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:6: warning: no previous prototype for 'kvm_iommu_donate_from_cma' [-Wmissing-prototypes]
     175 | bool kvm_iommu_donate_from_cma(phys_addr_t phys, unsigned long order)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:194:18: warning: no previous prototype for '__get_empty_block_pool' [-Wmissing-prototypes]
     194 | struct hyp_pool *__get_empty_block_pool(phys_addr_t phys)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:215:6: warning: no previous prototype for '__repudiate_host_page' [-Wmissing-prototypes]
     215 | void __repudiate_host_page(void *addr, unsigned long order,
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:222:5: warning: no previous prototype for 'kvm_iommu_refill' [-Wmissing-prototypes]
     222 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:261:6: warning: no previous prototype for 'kvm_iommu_reclaim' [-Wmissing-prototypes]
     261 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:292:5: warning: no previous prototype for 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
     292 | int kvm_iommu_reclaimable(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/kvm_iommu_donate_from_cma +175 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   174	
 > 175	bool kvm_iommu_donate_from_cma(phys_addr_t phys, unsigned long order)
   176	{
   177		phys_addr_t end = phys + PAGE_SIZE * (1 << order);
   178	
   179		if (end <= phys)
   180			return false;
   181	
   182		if (order != pmd_order)
   183			return false;
   184	
   185		if (!IS_ALIGNED(phys, PMD_SIZE))
   186			return false;
   187	
   188		if (phys < cma_base || end > cma_base + cma_size)
   189			return false;
   190	
   191		return true;
   192	}
   193	
 > 194	struct hyp_pool *__get_empty_block_pool(phys_addr_t phys)
   195	{
   196		int p;
   197	
   198		for (p = 0; p < MAX_BLOCK_POOLS; p++) {
   199			struct hyp_pool *pool = &iommu_block_pools[p];
   200	
   201			if (pool->max_order)
   202				continue;
   203	
   204			if (hyp_pool_init(pool, hyp_phys_to_pfn(phys), 1 << pmd_order, 0))
   205				return NULL;
   206	
   207			WRITE_ONCE(__block_pools_available, 1);
   208	
   209			return pool;
   210		}
   211	
   212		return NULL;
   213	}
   214	
 > 215	void __repudiate_host_page(void *addr, unsigned long order,
   216				   struct kvm_hyp_memcache *host_mc)
   217	{
   218		push_hyp_memcache(host_mc, addr, hyp_virt_to_phys, order);
   219		WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1 << order));
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
