Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73908B662
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 23:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716507657; cv=none; b=GZCOpz7LXZNGyVGF8iAswedGC3ID7+y0eeOPpgn3hZ4vAjshMj/9DRJeqpbEX/TTPj2J+cJGJaV/nFDSNoJthmznMx22zTRGxJkB5Z/qFOrgI0ZNM+/ALKWQwQdjAoExKg58H0KpXzV0Ub/jSOLOAEjZBjClMKtFGaXYU9h1jzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716507657; c=relaxed/simple;
	bh=mmTbDnMLVHJXvEWdB8oYZ2jt63JngxbpCTI2kHj1/44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXKzoecEbAyKOiVB88IzRGGsNEDgSJlBiMdXvkcrzoJt2FaZtoMyJVeS9qxUW8kWp0a+Kq/xGqYHp5cDauT1aQi8or0sWxtvZeb1gSC6FnfzR9W6n2wgSy0CfqbU1hxBZ3TG4No9e7oTnvNA0vdxGbx2MXY6RjRtlpjJ0DK0Amc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWR7MXcM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWR7MXcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716507655; x=1748043655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmTbDnMLVHJXvEWdB8oYZ2jt63JngxbpCTI2kHj1/44=;
  b=VWR7MXcMafq64bvPozfbHReCIZuXgzkL3ahNJdBV1SK+pzSdEqnNoqA8
   oLBEljFT104tLqTRC6XS3IF2TxCD3HOuhqSvqrHftxb/OJOpn/1xPOozB
   xzckcUXQlx0bFKDp9Y55x7ocT/tVpNaIBIiR80SL0caww6KqNnOezCAUK
   dOqbU8x5ZACrJn/sIBSCkALIiHNN7CjhMB8lhxGl8U/0LbEolTQwzWHW+
   l0ok8GCa0SG4yFDtBw0Op9lJgR58z2H3v1E6olYEIdiPmQFfbX81FdP7C
   VDdkaBn9trkunvM+MrbXEBDQvZRh1CUsaGyFc+VDrji/jPEbMC7c4b3i2
   A==;
X-CSE-ConnectionGUID: vUFzTlkgQnOqxl85OxpcTg==
X-CSE-MsgGUID: DyCbqSIZRYKGwVYHFDuuUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="35380087"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="35380087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 16:40:55 -0700
X-CSE-ConnectionGUID: J2L77dWBT5CwtRxmEITB5Q==
X-CSE-MsgGUID: 6Nsh9JEkTd+GwqFAsgdBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="38817402"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2024 16:40:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAI3H-0003cv-1a;
	Thu, 23 May 2024 23:40:51 +0000
Date: Fri, 24 May 2024 07:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 43/60]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5: warning: no
 previous prototype for function 'smmu_map_pages'
Message-ID: <202405240758.pXucQcYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   43cb2bafebd1e2e6ef5c7b72b1d0bcebe0497678
commit: a737b7d0e7214b258b75010404de3de09d2d5c0d [43/60] ANDROID: KVM: arm64: iommu: Reduce the logic in generic code
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240524/202405240758.pXucQcYM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405240758.pXucQcYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405240758.pXucQcYM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:7:
   In file included from drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h:5:
   In file included from arch/arm64/include/asm/kvm_asm.h:52:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:5: warning: no previous prototype for function 'smmu_domain_config_s2' [-Wmissing-prototypes]
     768 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:768:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     768 | int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain, u64 *ent)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:800:5: warning: no previous prototype for function 'smmu_domain_config_s1' [-Wmissing-prototypes]
     800 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:800:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     800 | int smmu_domain_config_s1(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:874:5: warning: no previous prototype for function 'smmu_domain_finalise' [-Wmissing-prototypes]
     874 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:874:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     874 | int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1149:5: warning: no previous prototype for function 'smmu_alloc_domain' [-Wmissing-prototypes]
    1149 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1149 | int smmu_alloc_domain(struct kvm_hyp_iommu_domain *domain, u32 type)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:6: warning: no previous prototype for function 'smmu_free_domain' [-Wmissing-prototypes]
    1168 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1168:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1168 | void smmu_free_domain(struct kvm_hyp_iommu_domain *domain)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1180:6: warning: no previous prototype for function 'smmu_dabt_device' [-Wmissing-prototypes]
    1180 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1180 | bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1223:6: warning: no previous prototype for function 'smmu_dabt_handler' [-Wmissing-prototypes]
    1223 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         |      ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1223 | bool smmu_dabt_handler(struct kvm_cpu_context *host_ctxt, u64 esr, u64 addr)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:5: warning: no previous prototype for function 'smmu_suspend' [-Wmissing-prototypes]
    1235 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1235 | int smmu_suspend(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1248:5: warning: no previous prototype for function 'smmu_resume' [-Wmissing-prototypes]
    1248 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1248 | int smmu_resume(struct kvm_hyp_iommu *iommu)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:5: warning: no previous prototype for function 'smmu_map_pages' [-Wmissing-prototypes]
    1260 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1260:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1260 | int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
         | ^
         | static 
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1410:5: warning: no previous prototype for function 'smmu_init_hyp_module' [-Wmissing-prototypes]
    1410 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         |     ^
   drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c:1410:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1410 | int smmu_init_hyp_module(const struct pkvm_module_ops *ops)
         | ^
         | static 
   16 warnings generated.


vim +/smmu_map_pages +1260 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

  1259	
> 1260	int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
  1261			   phys_addr_t paddr, size_t pgsize,
  1262			   size_t pgcount, int prot, size_t *total_mapped)
  1263	{
  1264		size_t mapped;
  1265		size_t granule;
  1266		int ret;
  1267		struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
  1268	
  1269		granule = 1UL << __ffs(domain->pgtable->cfg.pgsize_bitmap);
  1270		if (!IS_ALIGNED(iova | paddr | pgsize, granule))
  1271			return -EINVAL;
  1272	
  1273		hyp_spin_lock(&smmu_domain->pgt_lock);
  1274		while (pgcount && !ret) {
  1275			mapped = 0;
  1276			ret = domain->pgtable->ops.map_pages(&domain->pgtable->ops, iova, paddr, pgsize,
  1277							     pgcount, prot, 0, &mapped);
  1278			if (ret)
  1279				break;
  1280			WARN_ON(!IS_ALIGNED(mapped, pgsize));
  1281			WARN_ON(mapped > pgcount * pgsize);
  1282	
  1283			pgcount -= mapped / pgsize;
  1284			*total_mapped += mapped;
  1285			iova += mapped;
  1286			paddr += mapped;
  1287		}
  1288		hyp_spin_unlock(&smmu_domain->pgt_lock);
  1289	
  1290		return 0;
  1291	}
  1292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
