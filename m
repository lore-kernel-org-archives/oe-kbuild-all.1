Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CD049620
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 05:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797489; cv=none; b=ZASt54TAToEbuMZcJx4yhKG1sA2V4VCrvBHhaMUpZaqbJzOfBZ2qkPLQ7mYCT6c/7eGEsFT/nxj1Zwev/vppS+JK17nGWy+4xn5ATg/8plXxQsadeH+MSpSrJ3Cq9WD1sSVYeVcGOFledqz2B2aX9bzMCMPyK55XFuDJ9TA+08w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797489; c=relaxed/simple;
	bh=Fl/94nPGCbmPpncQkGdwoiZLcbNLQHG6zSggSyIuqBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P8UtNn3yQwdOsfuiG0TUc51o0VHJbAWo+um6oVk5mKqp+N3ESKqWIkerg+jkZTvAb7z1+WluvrR+Zu+mxPAbtbw4J+GJYeyWxeaqz9eSz6FBZNSHbJXZgnlFzQBGWHRYJlROg/E31bePcKCKi53DEEpD7tKdrWuP8gJ0EBEez2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYBxSiqC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYBxSiqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789797488; x=1821333488;
  h=date:from:to:cc:subject:message-id;
  bh=Fl/94nPGCbmPpncQkGdwoiZLcbNLQHG6zSggSyIuqBE=;
  b=ZYBxSiqCzIhaCDkZQsePO6o3BVZMF533KfSiWPICMGjDg6wdXX/1mAKT
   /uBf3TgT2ZgxRxxaWyeGWFUsC2DqyjUgs71ob7ZDEFMkMK29L48a3jFMM
   qFHOEx8iC1NBQLY37mz+nq+1ptBEXSZX109yRgkCPg7LTQv4KyCqY/mki
   OBCMYh03CkhXszg2D3RW5kPAWpNruB9P7EO7/k2mUvSSSCO4wYE66K+iB
   dGzw4RXE96praHUBTITFQgOkHeSRxEtw4EntFogijGoEGDuVhKquMJpzd
   24xa5qfJtiaYi+uhhoTt9s+AP9z9ZE4ZNokpNOqYRwSAEazLo2hREohRl
   g==;
X-CSE-ConnectionGUID: aWCYAEeFQ1qbnZqQtFhTsQ==
X-CSE-MsgGUID: 4SIBGQu+SxmKpfzr9A2nuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90348177"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90348177"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 22:58:06 -0700
X-CSE-ConnectionGUID: ZQEIuW59Rum0A8f+3dCjLA==
X-CSE-MsgGUID: VcggKysLQI2Wm1ZVthnhug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="276678897"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Sep 2026 22:58:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7o5K-00000000Agj-14XV;
	Sat, 19 Sep 2026 05:58:02 +0000
Date: Sat, 19 Sep 2026 13:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:112:5: sparse: sparse: symbol
 'kvm_iommu_refill' was not declared. Should it be static?
Message-ID: <202609191345.hwKh6fZv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: c949df871d0707fe89a2f8d4e95fab7106e28aac [1/1] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260919/202609191345.hwKh6fZv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191345.hwKh6fZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191345.hwKh6fZv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:24:1: sparse: sparse: symbol '__pcpu_scope___cur_context' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:112:5: sparse: sparse: symbol 'kvm_iommu_refill' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:154:6: sparse: sparse: symbol 'kvm_iommu_reclaim' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:183:5: sparse: sparse: symbol 'kvm_iommu_reclaimable' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:216:22: sparse: sparse: symbol '__get_vcpu' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:396:21: sparse: sparse: Using plain integer as NULL pointer

vim +/kvm_iommu_refill +112 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

   111	
 > 112	int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
   113	{
   114		struct kvm_hyp_memcache tmp_mc = *host_mc;
   115	
   116		if (!kvm_iommu_ops)
   117			return -EINVAL;
   118	
   119		while (tmp_mc.nr_pages) {
   120			unsigned long order = FIELD_GET(~PAGE_MASK, tmp_mc.head);
   121			phys_addr_t phys = tmp_mc.head & PAGE_MASK;
   122			struct hyp_pool *pool = &iommu_system_pool;
   123			u64 nr_pages;
   124			void *addr;
   125	
   126			if (check_shl_overflow(1UL, order, &nr_pages) ||
   127			    !IS_ALIGNED(phys, PAGE_SIZE << order))
   128				return -EINVAL;
   129	
   130			addr = admit_host_page(&tmp_mc, order);
   131			if (!addr)
   132				return -EINVAL;
   133			*host_mc = tmp_mc;
   134	
   135			if (kvm_iommu_donate_from_cma(phys, order)) {
   136				hyp_spin_lock(&__block_pools_lock);
   137				pool = __get_empty_block_pool(phys);
   138				hyp_spin_unlock(&__block_pools_lock);
   139				if (!pool) {
   140					__repudiate_host_page(addr, order, &tmp_mc);
   141					*host_mc = tmp_mc;
   142					return -EBUSY;
   143				}
   144			} else {
   145				hyp_virt_to_page(addr)->order = order;
   146				hyp_set_page_refcounted(hyp_virt_to_page(addr));
   147				hyp_put_page(pool, addr);
   148			}
   149		}
   150	
   151		return 0;
   152	}
   153	
 > 154	void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
   155	{
   156		unsigned long prev_nr_pages = host_mc->nr_pages;
   157		unsigned long block_pages = 1 << pmd_order;
   158		int p = 0;
   159	
   160		if (!kvm_iommu_ops)
   161			return;
   162	
   163		reclaim_hyp_pool(&iommu_system_pool, host_mc, target);
   164	
   165		target -= host_mc->nr_pages - prev_nr_pages;
   166	
   167		while (target > block_pages && p < MAX_BLOCK_POOLS) {
   168			struct hyp_pool *pool = &iommu_block_pools[p];
   169	
   170			hyp_spin_lock(&__block_pools_lock);
   171	
   172			if (hyp_pool_free_pages(pool) == block_pages) {
   173				reclaim_hyp_pool(pool, host_mc, block_pages);
   174				hyp_pool_init_empty(pool, 1);
   175				target -= block_pages;
   176			}
   177	
   178			hyp_spin_unlock(&__block_pools_lock);
   179			p++;
   180		}
   181	}
   182	
 > 183	int kvm_iommu_reclaimable(void)
   184	{
   185		unsigned long reclaimable = 0;
   186		int p;
   187	
   188		if (!kvm_iommu_ops)
   189			return 0;
   190	
   191		reclaimable += hyp_pool_free_pages(&iommu_system_pool);
   192	
   193		/*
   194		 * This also accounts for blocks, allocated from the CMA region. This is
   195		 * not exactly what the shrinker wants... but we need to have a way to
   196		 * report this memory to the host.
   197		 */
   198	
   199		for (p = 0; p < MAX_BLOCK_POOLS; p++) {
   200			unsigned long __free_pages = hyp_pool_free_pages(&iommu_block_pools[p]);
   201	
   202			if (__free_pages == 1 << pmd_order)
   203				reclaimable += __free_pages;
   204		}
   205	
   206		return reclaimable;
   207	}
   208	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
