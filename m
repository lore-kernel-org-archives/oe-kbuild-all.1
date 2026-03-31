Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4388146A66
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920493; cv=none; b=joFUZhp77QJjfNlViA+7RYl6Y545uwQMiyjKqo4lrgHMSgX9N5NqW3Mw2Hs8k4qBxJLyUOMJ3U5xHH4GGztVY3qG5cdPzGNgt99caFybh+YvTFn1Hrl5lsxMlcOo2mXNRsJ2GP6FYZhVqzL8SzA+JI19REVGlBYt1KBKWfPRIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920493; c=relaxed/simple;
	bh=DAz1S4Ownr2Ze+klJ7eJvZGZHwSMsHGp7Yaut+rvVBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C6IBVWqRLflcfm06yr7GRyEe6UXzBm2/43OAGMrQAtAhSlHt1RF0Z+qqEweYTrtSw3rR+N17lXIkhT3+6H64Zg/ieMMmvn4oQpwdqJpw4vdDhnqXrCfpJZ+wAECts0SzKc+xHsN09QmUtgtMAv8MzrovgaylJdZgB9h85iYIIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cznVKfxV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cznVKfxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774920492; x=1806456492;
  h=date:from:to:cc:subject:message-id;
  bh=DAz1S4Ownr2Ze+klJ7eJvZGZHwSMsHGp7Yaut+rvVBU=;
  b=cznVKfxV1DjDfnIz2hqa2IzlSYn3YQPjQnFgJe14H0ciesIA6pPbbpRI
   XHkUhgDzh66hYuADwEoEBzVC1TWLtVF9SneDomAi3xSUImQk2LgC8P7yk
   A0PAM1HGdB4KjwdjZuIeEuTVoY2rw70gBGXT5tFuAc0iF38fwHdHcAL4y
   Z8lerqe2LZDDfhxFa5BmMymbySWevXSdry+UCwjIjR7jM8JonzsC2JvZe
   mMjw43JIPr4J4F/2wUonHE50Qxlf1EEusnDyIRBEie/LGSFasmeGmCWn9
   hx97j4IKVs2n+zlKCh61YCYfMyo1thmbEHp+dDUV+nKUVZVgBpP0yeT0m
   g==;
X-CSE-ConnectionGUID: JjA5YkflSrWypYvnhcoBIQ==
X-CSE-MsgGUID: 4IJlvgeDQ12AuoO6UAXJeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93305946"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93305946"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 18:28:12 -0700
X-CSE-ConnectionGUID: Piy+OVfSQ2SXxtx32EtnaQ==
X-CSE-MsgGUID: 0vXnN9wuSyq7yEui2Xx2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="225223501"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Mar 2026 18:28:10 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ntn-000000001yT-1c0u;
	Tue, 31 Mar 2026 01:28:07 +0000
Date: Tue, 31 Mar 2026 09:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:6: warning: no previous prototype
 for 'kvm_iommu_donate_from_cma'
Message-ID: <202603310957.A5rNOra0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: 3f35c377b90d0692801bd74b5501e6dcf81e4900 [0/2] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260331/202603310957.A5rNOra0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310957.A5rNOra0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310957.A5rNOra0-lkp@intel.com/

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
