Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4619D88B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737215971; cv=none; b=P1VVwnn/6P9b5yKvOpd4+1XOcUze6NJiKw2sxxHQaHq+Ur6HuAggUWaHRfdcjLe4m9zORcq0uRzVGP4gwTamyUBViLHt80Yw/zvaufdg/NyVfCcfgWVA0FRxe0vTWgX71Q4xrw3R3MFtZaPpQtVUGn/QwRWkfwF2TeQSNmfNdqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737215971; c=relaxed/simple;
	bh=HyigXRtrL08TWdlOg4xTKgr3RqK02WsF88JS6miuYNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbw46tYWrt5JptTUepgly1Ud2ZOfpEZu/qGIRCI2QBApj37Hprg7EQw2c+ZB1rcfYTIY9l3bLbXWBZ0vNfsajWZxw+sKWH+h7rNJ8Lcc+vUVePTUGXzGf6VF0XfjKWABo4v5BhEV4M+uz/1kUG9NlYgb6Qmit3ze51UIuZkKHuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eA9Zmstk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eA9Zmstk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737215970; x=1768751970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HyigXRtrL08TWdlOg4xTKgr3RqK02WsF88JS6miuYNA=;
  b=eA9ZmstkSLmkNw8XLyE7ePrbMUaJ4c10JR/hR2sZtj97z+0cCljT2f87
   dn7vnGNwTndjH8Gy2+eY/JEBNj5SSooaobD4V+Q/12G2isDSjHpWpdA2p
   8oOOf0luIM+8TdXk/vEdcj9Ld16Xh8T6Pb09aPZrw+7B8Hz7Q/Tf+ewLF
   ZdCznO3kZae0wWcrU2415oAhYMoh8tIyEknkFbhhIyO2lZpow9JtziUJS
   DbwiuTv1Ks3p+pC0bZT+OXeWnc+eO7r7O58O0VY787QI+zfup3Ri+a4K2
   pCiE9T4qC8axji5VynhNW8loXxisSdzs+N2S/0JlMKj9MANogccTR1wmo
   Q==;
X-CSE-ConnectionGUID: ODqT3z5oTlWPqExvDhXmcw==
X-CSE-MsgGUID: oAS+ur2ISaO+is0Cc99twQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="55189713"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="55189713"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 07:59:29 -0800
X-CSE-ConnectionGUID: Q8jg713CTpun4qWsidkHOw==
X-CSE-MsgGUID: j0QYCgiqS4mauOoSQkke5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136983619"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2025 07:59:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZBEM-000Ua7-2C;
	Sat, 18 Jan 2025 15:59:26 +0000
Date: Sat, 18 Jan 2025 23:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:6: warning: no previous prototype
 for 'kvm_iommu_donate_from_cma'
Message-ID: <202501182311.3pLSVMYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b7e7f27a0d8c205d665797cbe7db6a640417f73c
commit: 3f35c377b90d0692801bd74b5501e6dcf81e4900 [0/1] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250118/202501182311.3pLSVMYS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182311.3pLSVMYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182311.3pLSVMYS-lkp@intel.com/

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
