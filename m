Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157237FF62
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680372; cv=none; b=eq2wW/RHAFXev6caXxY0puoDjO+9GeaSFgmI+9EFjnYckdFSE66qtWbgDOu+CG5e51d4vgfydE/QNXMSt7d/qulmewYR9YvDDHmWjq7ZM20beIA/7ZMECVh0U/QEgPP1BeO7EdeZb/TKekYcvAdDu4q2Cv47/gMdZ66EdHGLUqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680372; c=relaxed/simple;
	bh=VHAcyiISmLxY8JcRXkxkOV5mQB3RpCCb1vQ6LVeS15w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nuX6Y/KJjdA9LrsW0yM9TuDU2e4ujBoOcvHsZugyEpssusG8+o41BlkyVx5YlR8xGCN4kc/a3PbUtYdN8ibTiKN26C25M8+un44C/IeAhtUpvFy41JGrzHryX6yO5heIONvcyKdu2ealiOcaurQ7JwQhu2J1RqdfYT0Jp10Rj6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+7YB2mk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+7YB2mk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769680371; x=1801216371;
  h=date:from:to:cc:subject:message-id;
  bh=VHAcyiISmLxY8JcRXkxkOV5mQB3RpCCb1vQ6LVeS15w=;
  b=L+7YB2mknLHIhQ92RUBTIfzcbLRU84kixWteEYCRbzy8fO0z8iDfXfzZ
   BFy+mgnGzGdFZV5+s3Drzxg+uDWtlMNXLFtF7l0pnLmOzrAo8KyetmgPW
   pXhZ8VJNeNdMhRjvuCWp5E5vbQhx5I/EoRDc8jIQzydklE3RByhZvkO36
   k4ibo9eEZosPlxN/Se/AQqf5D+sFDWDyMGwWU1Da27+2qYus0rztm8Wqu
   kmTg1O2tBe1xXcSwXC/hVt4b/NWongjeIWu2SseI69YRAsUSNIMT9BmrQ
   TMCkRwYrSAk1x00V5or6i/agSm9eHrLnBOqawvlCciir2saDtE523KwDH
   A==;
X-CSE-ConnectionGUID: crbOu0fRTjuYsydkurGfRQ==
X-CSE-MsgGUID: KKqc7YIRSTSCuRI4suhXyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70109454"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70109454"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 01:52:48 -0800
X-CSE-ConnectionGUID: RJS+BGJdQnqKZjR29Bmqug==
X-CSE-MsgGUID: eZnMfUqjRuqU6cNNMyZqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="207775258"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 01:52:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlOhg-00000000bLA-3tEQ;
	Thu, 29 Jan 2026 09:52:44 +0000
Date: Thu, 29 Jan 2026 17:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8/8]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:37:6: sparse: sparse: symbol
 '__block_pools_available' was not declared. Should it be static?
Message-ID: <202601291712.EeJSf0Kc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e4fe966b5aefd11fff0507ef30fea72f8cade6d4
commit: 3f35c377b90d0692801bd74b5501e6dcf81e4900 [8/8] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-randconfig-r131-20260128 (https://download.01.org/0day-ci/archive/20260129/202601291712.EeJSf0Kc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291712.EeJSf0Kc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291712.EeJSf0Kc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:37:6: sparse: sparse: symbol '__block_pools_available' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:111:6: sparse: sparse: symbol '__kvm_iommu_reclaim_pages' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:6: sparse: sparse: symbol 'kvm_iommu_donate_from_cma' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:194:17: sparse: sparse: symbol '__get_empty_block_pool' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:215:6: sparse: sparse: symbol '__repudiate_host_page' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:222:5: sparse: sparse: symbol 'kvm_iommu_refill' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:261:6: sparse: sparse: symbol 'kvm_iommu_reclaim' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:292:5: sparse: sparse: symbol 'kvm_iommu_reclaimable' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:351:21: sparse: sparse: Using plain integer as NULL pointer

vim +/__block_pools_available +37 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    31	
    32	/*
    33	 * hyp_pool->lock is dropped multiple times during a block_pool reclaim. We then
    34	 * need another global lock to serialize that operation with an allocation.
    35	 */
    36	static DEFINE_HYP_SPINLOCK(__block_pools_lock);
  > 37	bool __block_pools_available;
    38	
    39	static const u8 pmd_order = PMD_SHIFT - PAGE_SHIFT;
    40	
    41	DECLARE_PER_CPU(struct kvm_hyp_req, host_hyp_reqs);
    42	
    43	static atomic_t kvm_iommu_idmap_initialized;
    44	
    45	/*
    46	 * All domain operations are lockless thanks to atomics, except for
    47	 * alloc/free domain where:
    48	 * alloc_domain: Wants to initialize the domain and only after set the refcount
    49	 *   so it can be used when fully initialized.
    50	 * free_domain: Wants to clear the domain refcount, then clear the domain, so
    51	 *   no other call can use it while being freed.
    52	 * This creates a race when a domain refcount is 0 and still in the free domain
    53	 * and another alloc_domain is called for the same ID.
    54	 * This should never happen with well behaved host.
    55	 */
    56	static DEFINE_HYP_SPINLOCK(kvm_iommu_domain_lock);
    57	
    58	static inline void kvm_iommu_idmap_init_done(void)
    59	{
    60		atomic_set_release(&kvm_iommu_idmap_initialized, 1);
    61	}
    62	
    63	static inline bool kvm_iommu_is_ready(void)
    64	{
    65		return atomic_read_acquire(&kvm_iommu_idmap_initialized) == 1;
    66	}
    67	
    68	void *kvm_iommu_donate_pages(u8 order, bool request)
    69	{
    70		struct kvm_hyp_req *req = this_cpu_ptr(&host_hyp_reqs);
    71		static int last_block_pool;
    72		void *p;
    73		int i;
    74	
    75		if (!READ_ONCE(__block_pools_available))
    76			goto from_system_pool;
    77	
    78		hyp_spin_lock(&__block_pools_lock);
    79	
    80		i = last_block_pool;
    81		do {
    82			p = hyp_alloc_pages(&iommu_block_pools[i++], order);
    83			if (p) {
    84				last_block_pool = i;
    85				hyp_spin_unlock(&__block_pools_lock);
    86				return p;
    87			}
    88	
    89			if (i >= MAX_BLOCK_POOLS)
    90				i = 0;
    91		} while (i != last_block_pool);
    92	
    93		WRITE_ONCE(__block_pools_available, 0);
    94	
    95		hyp_spin_unlock(&__block_pools_lock);
    96	
    97	from_system_pool:
    98		p = hyp_alloc_pages(&iommu_system_pool, order);
    99		if (p)
   100			return p;
   101	
   102		if (request) {
   103			req->type = KVM_HYP_REQ_TYPE_MEM;
   104			req->mem.dest = REQ_MEM_DEST_HYP_IOMMU;
   105			req->mem.sz_alloc = (1 << order) * PAGE_SIZE;
   106			req->mem.nr_pages = 1;
   107		}
   108		return NULL;
   109	}
   110	
   111	void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
   112	{
   113		/*
   114		 * Order MUST be same allocated page, however the buddy allocator
   115		 * is allowed to give higher order pages.
   116		 */
   117		BUG_ON(order > hyp_virt_to_page(p)->order);
   118	
   119		hyp_put_page(pool, p);
   120	}
   121	
   122	void kvm_iommu_reclaim_pages(void *p, u8 order)
   123	{
   124		phys_addr_t phys = hyp_virt_to_phys(p);
   125		int i;
   126	
   127		if (phys < cma_base || phys >= (cma_base + cma_size)) {
   128			__kvm_iommu_reclaim_pages(&iommu_system_pool, p, order);
   129			return;
   130		}
   131	
   132		hyp_spin_lock(&__block_pools_lock);
   133	
   134		for (i = 0; i < MAX_BLOCK_POOLS; i++) {
   135			struct hyp_pool *pool = &iommu_block_pools[i];
   136	
   137			if (!pool->max_order)
   138				continue;
   139	
   140			if (phys >= pool->range_start && phys < pool->range_end) {
   141				__kvm_iommu_reclaim_pages(pool, p, order);
   142				hyp_spin_unlock(&__block_pools_lock);
   143				return;
   144			}
   145		}
   146	
   147		hyp_spin_lock(&__block_pools_lock);
   148	
   149		WARN_ON(1);
   150	}
   151	
   152	void *kvm_iommu_donate_pages_atomic(u8 order)
   153	{
   154		return hyp_alloc_pages(&iommu_atomic_pool, order);
   155	}
   156	
   157	void kvm_iommu_reclaim_pages_atomic(void *p, u8 order)
   158	{
   159		__kvm_iommu_reclaim_pages(&iommu_atomic_pool, p, order);
   160	}
   161	
   162	/* Request to hypervisor. */
   163	int kvm_iommu_request(struct kvm_hyp_req *req)
   164	{
   165		struct kvm_hyp_req *cur_req = this_cpu_ptr(&host_hyp_reqs);
   166	
   167		if (cur_req->type != KVM_HYP_LAST_REQ)
   168			return -EBUSY;
   169	
   170		memcpy(cur_req, req, sizeof(struct kvm_hyp_req));
   171	
   172		return 0;
   173	}
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
