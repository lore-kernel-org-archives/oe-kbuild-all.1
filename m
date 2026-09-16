Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345536493F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 02:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526038; cv=none; b=jxx++MtdkX4uKvVaSJMYfQF8iz/sV85N6ta9sT8/Peg4/GjqNoIi/RGB9vmXJVEH1r0LH7T4hNw6d4VX5ArK59wGRmviyF7ECZMu4Ob6vyFdlw6uH9FMoicCVb32QhakN+d6Mb2xRF610fUsZ6nyCCrmkDxSfxE22haK/sPO3qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526038; c=relaxed/simple;
	bh=vJBfJcIye47ToDMA7Na0nUpkCkALGjdUY4iRKoZBV04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hgdAGs1RI16oZFUZmY6gehCNowQmuRxv9v5cIVXcSu3eo609NR8X9czBsFiV3Xr1at0D/SXsxAYO4csq/dII/0I7Da2uza7JsxLjm6b757IPR+VtldkGvhIfXwMqeqfnVwUN9+hrDWnhKjqH4HJr645vSuCYLYrYN8HJIQc7hiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYVVpnbw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYVVpnbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789526033; x=1821062033;
  h=date:from:to:cc:subject:message-id;
  bh=vJBfJcIye47ToDMA7Na0nUpkCkALGjdUY4iRKoZBV04=;
  b=iYVVpnbwZkUnhIRRImusy/BxLcK2pp52Hk1fLUcnnMEX1hn0oPildACI
   gm5I775gBA/+UDGcDSWziYVhKTAF3ktqxm8gVJhWcRGREoFR104b+qNgD
   9q1jUiaBJ4uYHnHI9+b4i6jmXWmNYrLTkwxWKbvE+SK56M0Itbm5yhGwg
   EOf6P0aShRnCGWRtE7aF5vGviQ8nnoBHJSALDjgiARimDRfkhjvZrh03V
   W6QW3YXZ/wcauaJhgcEJficUjkmaznD0u/Kj68zXcgSr71nw62H+YhFtQ
   PqDfp4DrtN3KLVZknM4i4B0We+2xMrZFIUcaZJyG6FNh7kBAS1PBYSnYq
   w==;
X-CSE-ConnectionGUID: 2z6cIU3TS8Kl2SLVlyKQ9A==
X-CSE-MsgGUID: F98hLXTOSoiKeXIsGKnqMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93600008"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93600008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 19:33:49 -0700
X-CSE-ConnectionGUID: M0DKbdfBSaaPnpvrR27F/Q==
X-CSE-MsgGUID: GAdqzwPRSgOAJeXl0friDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273163794"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2026 19:33:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6fSz-000000005PB-1sMh;
	Wed, 16 Sep 2026 02:33:45 +0000
Date: Wed, 16 Sep 2026 10:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:112:5: sparse: sparse: symbol
 'kvm_iommu_refill' was not declared. Should it be static?
Message-ID: <202609161013.pTKOfZFx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: c949df871d0707fe89a2f8d4e95fab7106e28aac [1/1] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260916/202609161013.pTKOfZFx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161013.pTKOfZFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161013.pTKOfZFx-lkp@intel.com/

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
