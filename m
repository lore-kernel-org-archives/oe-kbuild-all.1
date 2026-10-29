Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793318208;
	b=mcheY7OGLp1Zd66Ljv9Uwv7NUHjfpXDnDeaSdMUhMsvVy1om5xxLXbk5GUUAbPl44mFv
	 RNJ6X9olkRpKjhFFxGziGZbgLbxDLIeBoHlok1PFpP/06y1utAZd7P/6VRS8y6ci1LZKy
	 kcyZtA/osCq3ryLHzVCLHu0oy7ao9sS7AmLCRHFGfWnFjq30xeA19U5fV5OxW0IgeMO4g
	 i6qvFRAUdyz8f6nEZMNYqa/jJArlxdNmJJQziua5m+CTc/1A8QTiUXnBx7h84wwAhg9cH
	 +imRebq2+dTS/Zh+f5xzV/ldmxgZz4BI7h58Sg3YlaaRH9rhRf01l4NA32zSG7hpySQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793318208;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eeFHa8uDM9z3csoLJpwbbZY2UATD3i+Tc2mez6sr9So=;
	b=rj/kCpYwZdan8mnftDdpt0hiYkJo7ZNMOH99zHv85BP6FbTC6sEdMlBUjimAqJGFrS0Z
	 RwVCZz76fITmELHHgYFDXYnszHDduqfMnkYvD2cveQS3X7I860YZFV8Kv4WZxI3GHywsO
	 k7RGYVWMxuyB75A5nOeHvT23dFb1FwVwNmlfRcm0wOv+EljtdGgIwNM86FNLyFFCmQLN5
	 Cywv110RMlgOJHglXoxaMfi4BA5FzCWOvFPXybistlT5y2FBGo3F+Iuv9cTNmvvSt/XfR
	 9RsGwASB0wzjeNi9grAgGS9fU3WBQwOIiA2b4kloDGqKvUdaDV9NHiMBof41xSVMRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoTCAhze;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD70606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 23:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD70606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HoTCAhze
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793318207; x=1824854207;
  h=date:from:to:cc:subject:message-id;
  bh=FzWmcoc6vD5XkjEBifPiD6UPznVNKCal6rKRZKFzalo=;
  b=HoTCAhzeW0INFyWLVgzJDSJQ746tFpGsmkfaRAL4wyoWW10iO/a/QrWK
   2NylBTEcsLsP5N36M5qS4qs5SFFw7zu7Zh8mYPqX2jMy7H/5GlUF2laVe
   m+MCmYeBlRlc27Njmsuh3Lf4UT1EaFIxhmUBFqLSu/sWc8FWIovJG/sfp
   IKGdkKPgUr3WgFzm0N8Y+bc/bGyLhnba5FvCkzvFm0RKsFuw+mfG9r3Z/
   JUIdQrpeBnTDV0dbQWE+mh3kY6KFvvz7LcemPHK470/UFdmujYyU2jK1V
   JJEmyhXTNTCY3i+FhtBSc2QuFvmvfD88cWNPM/CRyVKADfxlJCadr0y0w
   w==;
X-CSE-ConnectionGUID: gmbcj21hQRK8IgR9NJ8hnQ==
X-CSE-MsgGUID: B5xM++r8RumGQv57akJlqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1959953"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1959953"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 16:56:46 -0700
X-CSE-ConnectionGUID: xSBlwtlgSY6GA8bz1UbI7Q==
X-CSE-MsgGUID: TeP/qqSLQF+gckgCwD5frw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5424009"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2026 16:56:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMZz8-00000000b5A-21Vi;
	Thu, 29 Oct 2026 23:56:42 +0000
Date: Fri, 30 Oct 2026 07:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:112:5: warning: no previous prototype
 for 'kvm_iommu_refill'
Message-ID: <202610300757.0uBlnPtO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: c949df871d0707fe89a2f8d4e95fab7106e28aac [2/2] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261030/202610300757.0uBlnPtO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300757.0uBlnPtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300757.0uBlnPtO-lkp@intel.com/

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
