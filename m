Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36731E507
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098567; cv=none; b=rKTU0eaQzwPH+/HfaNej4OWUPVZikjRlulp85G5syAtOWs4IKzVQVabk6xLpu5uuLwFwXFnTexBBHSTZ8bOckmzSD6zs6shgRpMaNGXNIgxmWrIBO40KyR+dL2NkXrfe62EI7EdKl5ZwMCLzrAxjYINKcmEv4/nuTQdXyMonGMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098567; c=relaxed/simple;
	bh=S2XqjBjyvF//0FqHyF1GnrySEjU1PWQ99+MAazdepis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QspUXMSl6lhSYxxKU+NeZHIBrC3xsGKvJDC/WizrjzV3J5pQTZRGuKyHLAUZueSiFQR48qpfSpTq/yRbIQ7OPB1+pDt5GKQWBpvGLs/p7bKraQYhw01i0d0MiSmpb2kYI635lxYSBMZ9AC0dFwZAityyfcoFOERdIsFmyGKzcYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJVb3uUe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJVb3uUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720098566; x=1751634566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2XqjBjyvF//0FqHyF1GnrySEjU1PWQ99+MAazdepis=;
  b=aJVb3uUe+dF+pRmXDGNOvla6I1CEhdVqFwell55dcuQZbFpEJM67Cbkq
   hEPrpOMFJCRjRAJCFbaxHro2cLiAsGK3wrHatqtptBxAkcpZU+DYrao05
   ZC8deXid8Bg8oBm4tS/c86N8OyVfFP9IOBue7oRPaKDssy/d6GS2qwLYT
   y9B34cRyS42uhZs9gvKDv/aUkaJRi/l6Je8OyNBeBjnIATqFdoPrM6920
   vZhh9ww+U0zxCOwxsOGflJj1FLzRLmS615dfLsQcc2DipN630KJnvsGkJ
   bXdwWpoxI9WXu67AE9nRfDhbopO1oh7Ti9qOKTRrAElT5jGbBJr+dj9Rh
   A==;
X-CSE-ConnectionGUID: EWSJVUObRkOQsIS0KdeZqQ==
X-CSE-MsgGUID: YTvfJba+SZauAz2sx9Y+lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20282393"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="20282393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 06:09:24 -0700
X-CSE-ConnectionGUID: DeRiJR7BT3yhAidpk2lXKQ==
X-CSE-MsgGUID: gt0mzsoqQ/iiWsMhKdR49Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46729950"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2024 06:09:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPMDA-000R1E-1d;
	Thu, 04 Jul 2024 13:09:20 +0000
Date: Thu, 4 Jul 2024 21:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 37/53]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:755:23: error: field has
 incomplete type 'struct mmu_notifier'
Message-ID: <202407042126.RWXfqjTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   2bf23486e7eae67485953abf3529ad2d3a90384b
commit: 23dbb9b1e1ec4cc15b44eeb954b5045ed86daf78 [37/53] add COMPILE_TEST
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240704/202407042126.RWXfqjTW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042126.RWXfqjTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042126.RWXfqjTW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:15:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2210:
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
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:32:
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:755:23: error: field has incomplete type 'struct mmu_notifier'
     755 |         struct mmu_notifier             mmu_notifier;
         |                                         ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:755:9: note: forward declaration of 'struct mmu_notifier'
     755 |         struct mmu_notifier             mmu_notifier;
         |                ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:37:9: warning: 'VA_BITS' macro redefined [-Wmacro-redefined]
      37 | #define VA_BITS 39
         |         ^
   arch/riscv/include/asm/pgtable.h:71:9: note: previous definition is here
      71 | #define VA_BITS         (pgtable_l5_enabled ? \
         |         ^
   6 warnings and 1 error generated.
--
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:6:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2210:
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
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:8:
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:755:23: error: field has incomplete type 'struct mmu_notifier'
     755 |         struct mmu_notifier             mmu_notifier;
         |                                         ^
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h:755:9: note: forward declaration of 'struct mmu_notifier'
     755 |         struct mmu_notifier             mmu_notifier;
         |                ^
   5 warnings and 1 error generated.


vim +755 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h

e881e7839fba8a Jean-Philippe Brucker 2020-09-18  735  
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  736  struct arm_smmu_domain {
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  737  	struct arm_smmu_device		*smmu;
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  738  	struct mutex			init_mutex; /* Protects smmu pointer */
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  739  
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  740  	struct io_pgtable_ops		*pgtbl_ops;
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  741  	atomic_t			nr_ats_masters;
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  742  
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  743  	enum arm_smmu_domain_stage	stage;
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  744  	union {
d9e6a7bc850524 Jason Gunthorpe       2023-10-25  745  		u32 asid;
d9e6a7bc850524 Jason Gunthorpe       2023-10-25  746  		u16 vmid;
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  747  	};
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  748  
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  749  	struct iommu_domain		domain;
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  750  
66ca62e207593d Jason Gunthorpe       2023-10-02  751  	/* List of struct arm_smmu_master_domain */
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  752  	struct list_head		devices;
e881e7839fba8a Jean-Philippe Brucker 2020-09-18  753  	spinlock_t			devices_lock;
32784a9562fb05 Jean-Philippe Brucker 2020-11-06  754  
fe82cc90ebd542 Jason Gunthorpe       2023-09-29 @755  	struct mmu_notifier		mmu_notifier;
cd695945fc949d Jason Gunthorpe       2022-07-06  756  	bool				btm_invalidation : 1;
cd695945fc949d Jason Gunthorpe       2022-07-06  757  	bool				nesting_parent : 1;
cd695945fc949d Jason Gunthorpe       2022-07-06  758  };
cd695945fc949d Jason Gunthorpe       2022-07-06  759  

:::::: The code at line 755 was first introduced by commit
:::::: fe82cc90ebd54274527da25d7e1e7f9d0ac5a8d7 iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
