Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B24E3624D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 04:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933033; cv=none; b=Go98bjTLtdwBEkYphAaLbEJqiJE9VxfwEJvHqTI65VTJGnLZMFMNIFEhgW47w9sbuKkaU6OzYLE02zU9m71TA/pByk16TmJxEDG0Zk4fTD77YUEpKXYi8njGhycB4DM9JSx0g8YMTp+cSKZKYkRhwiCjezJWX/no5H+Tj3q/Vv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933033; c=relaxed/simple;
	bh=AhzZtHmRzoCvjN8Li3GZvyzRuyHEEoOcNFko2QTyRzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ae8PVGBBN95r2JPsxJw9TMrYgwRv/ZBLGwFepQrYpKuvUBX3qHiDo93+OeOjml+a5FJe6ncvhJMbk+KgRdyVJlAmu1gtqW5a/2z0II4gxnbGqEEZA8slPCutgwl7uhpznM63l2RZMqfx7cNuT6Xyx09m6+lBXfxE3D697KgTxgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuVhVyTN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuVhVyTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774933032; x=1806469032;
  h=date:from:to:cc:subject:message-id;
  bh=AhzZtHmRzoCvjN8Li3GZvyzRuyHEEoOcNFko2QTyRzw=;
  b=UuVhVyTNPNe9UGQjuGlDjK2N3u+BpMkt3UAtF5HzDT537QiBZM/6r4cl
   vyHa1Y2XiwmABaVbHSRdpNSDmRowCYdVNPmXZReNYld8QhD4jXbKLXReH
   05xouPVS+Z4ZaFX52fGN6d9UipB+LCjLmQ1wihfAWMuGGfuIxIMPtXrlj
   PvOhweCaP1LW9q/Ts/6vrjAzzGaHeO5Rc2+hnOT9Z59AkuDGVRtIap3v4
   0j3nZbsaOU1zS/EO8gqM1i0xx4sCu/R6luIljR44GL63pCULtXoTBlc+Y
   zC34zB0oAvf42j0sO1SmZWPnXzAl9TLQF267ub8UGvR/pYl7MokzCh5Bf
   Q==;
X-CSE-ConnectionGUID: n79+4FAOSv6OIr8/6KFEew==
X-CSE-MsgGUID: 6Vc/EnW+SOeHujK2jndAoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75819998"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75819998"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 21:57:12 -0700
X-CSE-ConnectionGUID: KCochgvpT/qVEO8ogCXsNw==
X-CSE-MsgGUID: cwFFYA0kS820BTaMWohwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226217663"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2026 21:57:11 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7RA4-000000002Fb-03a4;
	Tue, 31 Mar 2026 04:57:08 +0000
Date: Tue, 31 Mar 2026 12:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 4/4]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:112:5: warning: no previous prototype
 for 'kvm_iommu_refill'
Message-ID: <202603311225.j2VG1o81-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   a7407abfdc833cab1cd2b6f4f2276b8915d4c260
commit: c949df871d0707fe89a2f8d4e95fab7106e28aac [4/4] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260331/202603311225.j2VG1o81-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311225.j2VG1o81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311225.j2VG1o81-lkp@intel.com/

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
