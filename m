Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E070A341069
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765884188; cv=none; b=QPaChXTvWwlhCxsF6cBlH5VtS8Abpm0ZlYeG1OtMXpX2a9avhR1d6pSVL5e8W4FB7ruCdO69r4eZWMB6i09lFc7twAOCDrvQwjhfD2lGF5n1NxlyT+AzJ+uXpyYN2g8spoN0+ezjUq803/WJcqYgdsYY2ILF9qbEj/VN5/MiZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765884188; c=relaxed/simple;
	bh=NKqkp5Srjqkg3dIv3TzWRLSPB/9xR4xO6gtkGgOA4ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDz8BMSoAqdUifc56fbMVJHuqxBlem6w0CnljTaB9SCZC+j8sygW3BDVZcr95oNMzSsVjxv5mO6djKBztuJsutJc2K1VLP6ZzyNUBksAO6LEyHTF5hQbqz5TydR9Bkqz/woNBmBld0uGIq7Ovtv6LABmnYAjfehuWcX3I7RxPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+WqCiPo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+WqCiPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765884187; x=1797420187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NKqkp5Srjqkg3dIv3TzWRLSPB/9xR4xO6gtkGgOA4ss=;
  b=J+WqCiPoEJ6l52z+gaWBsZL1ryDVQdPQfWk6MuneD+/7onIctiBgd/a6
   uHPjX4kiEmnrv9ObdkJiBSaRhOxRivUgHuNVOmAI/oaoaH3+eGBAjbVyA
   22rjVz6sBHXmmjKbJhgOwVDb7JiqEEpleIIdXZ7hq5T9XmLS8v4KHppJf
   4LkiDtr8BTridJ0cIg0tp4AWfl4qNq66QT1jUWHVlev3ji6sMeep9U9NN
   oBQoBNgz7YP8+4jwzGCSEbbAJJM3iExriGllBibZWV1CB/WmzYDYeBVfN
   GwZdl8ERBLhSKa+z4LiBnifL4YQEUnEB+2kWvcswLJGtmzaM1VaIzQulI
   w==;
X-CSE-ConnectionGUID: dwMJFYRjQBiv8BJlJI4FGw==
X-CSE-MsgGUID: 0yDkIv8BSs+/Y5xxsmLkwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67834864"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67834864"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 03:23:06 -0800
X-CSE-ConnectionGUID: Ym/5GI7HR2+yyP7p6Wu/DQ==
X-CSE-MsgGUID: 6iP+iNLlQmyMeChSI6ppKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202404811"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 03:23:05 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVT8s-000000001ZK-0Zvw;
	Tue, 16 Dec 2025 11:22:58 +0000
Date: Tue, 16 Dec 2025 19:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:112:5: warning: no previous prototype
 for 'kvm_iommu_refill'
Message-ID: <202512161934.KVqcTSGu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f3e91a3d47ad669f50691d94b0274831419f7522
commit: c949df871d0707fe89a2f8d4e95fab7106e28aac [0/3] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251216/202512161934.KVqcTSGu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161934.KVqcTSGu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161934.KVqcTSGu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:112:5: warning: no previous prototype for 'kvm_iommu_refill' [-Wmissing-prototypes]
     112 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:154:6: warning: no previous prototype for 'kvm_iommu_reclaim' [-Wmissing-prototypes]
     154 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:183:5: warning: no previous prototype for 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
     183 | int kvm_iommu_reclaimable(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:216:23: warning: no previous prototype for '__get_vcpu' [-Wmissing-prototypes]
     216 | struct pkvm_hyp_vcpu *__get_vcpu(void)
         |                       ^~~~~~~~~~


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
