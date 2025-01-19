Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A48D1FA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737253059; cv=none; b=A6zz2RcT8ntY5NQwarFMLOVh3PGLzHuiOTuaQCquinmgx9IVRUWCqN80wMdpIdhrxy5QqHtNQeRY5fpWxUQ93PAaDuH1G+GxNnogArW5W329/RqNaP+zaj4ZYEaqXVeEsC/B2ix9XisrXm0IzwOBzBeXs5ThMeWQSh4sHRjNEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737253059; c=relaxed/simple;
	bh=wjrV3LmEFzJ7zUGvfBvRrxCtdaY1E1gNDa9aVWs7bZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uroCAatgPF1TRmbrZI/t6pa+PzoT9lZhUCw3iR5spM5aF08ZcVpTkS+sQLOdesmA4SdnSLKgpTe54FekVNxQTHBENoU8asVyYHbmEXEnzoB2zGE1+CYB5gtub0txKFu0Y5Xuug8om55mF57pNXtIFhm3EBPJU0+JFx+NHSWCoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyg+l130; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyg+l130"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737253057; x=1768789057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjrV3LmEFzJ7zUGvfBvRrxCtdaY1E1gNDa9aVWs7bZY=;
  b=dyg+l130OhivzAeC7i5Q/63ltd+XI3uj5YzMvjVyBOuKKKgm4AV9bBBU
   Gw4HcjdfHdHoxC1jty1CYPqMEH6jjG93XT4XyayF6AXYB3037SRSPCRP7
   HEIG6a3MUAKSGVOyaB/AbXV9q/xzUG8fRt2ciR3nJqTPtQVI9IlSQQJTB
   QxF+pRu7NMGh7vXkivUWtXXLVzwIiagNpoqZtTXawiKxoMO1CLT/nxZAC
   iW7QGxwpiX07kDBUYjOtCQVpjI1w86C8+aaOdlFGIgyj0/nieabZo2qyH
   eTmHEjFDMoN7haWf2Fy2B3hmPDVgi6FjNeGSwu+M4OurmAmfa20iF0WUH
   Q==;
X-CSE-ConnectionGUID: v0F4bqsdT2uX4fWHy8muhw==
X-CSE-MsgGUID: eh4AQ67xSt6o4l2JH0Lrpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41326492"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="41326492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 18:17:37 -0800
X-CSE-ConnectionGUID: 1mVWGcD8ShyZpq/pV3VKZQ==
X-CSE-MsgGUID: Mj1GGdGnRnS3MvMculOJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="105995464"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jan 2025 18:17:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZKsX-000V1F-2S;
	Sun, 19 Jan 2025 02:17:33 +0000
Date: Sun, 19 Jan 2025 10:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:6: warning: no previous prototype
 for function 'kvm_iommu_donate_from_cma'
Message-ID: <202501191026.NVx3ASyx-lkp@intel.com>
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
commit: 3f35c377b90d0692801bd74b5501e6dcf81e4900 [1/1] ANDROID: KVM: arm64: iommu: Allow donations from a CMA pool
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250119/202501191026.NVx3ASyx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191026.NVx3ASyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191026.NVx3ASyx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:111:6: warning: no previous prototype for function '__kvm_iommu_reclaim_pages' [-Wmissing-prototypes]
     111 | void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     111 | void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:6: warning: no previous prototype for function 'kvm_iommu_donate_from_cma' [-Wmissing-prototypes]
     175 | bool kvm_iommu_donate_from_cma(phys_addr_t phys, unsigned long order)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     175 | bool kvm_iommu_donate_from_cma(phys_addr_t phys, unsigned long order)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:194:18: warning: no previous prototype for function '__get_empty_block_pool' [-Wmissing-prototypes]
     194 | struct hyp_pool *__get_empty_block_pool(phys_addr_t phys)
         |                  ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:194:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     194 | struct hyp_pool *__get_empty_block_pool(phys_addr_t phys)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:215:6: warning: no previous prototype for function '__repudiate_host_page' [-Wmissing-prototypes]
     215 | void __repudiate_host_page(void *addr, unsigned long order,
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     215 | void __repudiate_host_page(void *addr, unsigned long order,
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:222:5: warning: no previous prototype for function 'kvm_iommu_refill' [-Wmissing-prototypes]
     222 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:222:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     222 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:261:6: warning: no previous prototype for function 'kvm_iommu_reclaim' [-Wmissing-prototypes]
     261 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     261 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:292:5: warning: no previous prototype for function 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
     292 | int kvm_iommu_reclaimable(void)
         |     ^
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     292 | int kvm_iommu_reclaimable(void)
         | ^
         | static 
   7 warnings generated.


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
