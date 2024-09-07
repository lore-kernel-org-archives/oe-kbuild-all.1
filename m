Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BDA3A1A8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725684199; cv=none; b=bZZwUQsSGYgKMt+M7t73Aw+X6PP5Wovbp8t6K8mwht+r2D1IHP1wodsqzYl+IunPnFE8izE9At/LwcE2vIv4cUrRWFtiwR2ZLe95fNsphaGa4ylizxWfTACUMInabz1z0ddTFmqcbfqwwkgmP77M0Bw4J0z3Xp8RUgFhzeC29tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725684199; c=relaxed/simple;
	bh=xxsfHKkLrdiUYUPStfoB58cOr2Qw4h/7LPoP8IXmRl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NeBVBopOGMSUekAHRJMnjIfO1rN27SGtHkr0iiCKqKGfiWksyCLbFq/jvtngDCfAViKzQUaz/8HY8X5Bxi3SVaNw2S01jqi4mn8Cgy82F4UUhDFq1170u/QOj+HptDDoG/BGHOHZ0nwNMSRpPFZErCgT8hyiUH89uQISMhVcOwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hS3wPYXo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hS3wPYXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725684197; x=1757220197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xxsfHKkLrdiUYUPStfoB58cOr2Qw4h/7LPoP8IXmRl0=;
  b=hS3wPYXoMDYUIuQo8rQ3ACoOUUUOaxd5LV82/g9dUVb/6ny+36br1a3L
   hgcwiz36KeKqbfbLkm6+u8XRvR9qXhieX/bVrSnadQHu/UptUvTT5pcH/
   kjYbQDksZLrgFPZ6Fugu2kFP1e9fT4RJfGWmJBabKZ6pEki2aAm6uDj9z
   qkY3AAFTZduJCEPOS4IFlwwdmHVHWkDrWzYxBm6S/Mnz1WtTcw2mC/KwF
   hiKuOnpg5CJz/MRxvN+dKxdLJiH2zqZClin5gp30IDus2E1hpw/zLn7To
   uuCHmoc8ZzGf937mRn4kZPu468c9rU9qr3Dw+BZY6z4kknyDNWQISZxTD
   A==;
X-CSE-ConnectionGUID: qGLN4YLIRkWKF7ddnpOGoQ==
X-CSE-MsgGUID: Qaxee2IJSR6igFzufW4u0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23955065"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="23955065"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 21:43:16 -0700
X-CSE-ConnectionGUID: IpOEppZCQcuMeq67yT7UjQ==
X-CSE-MsgGUID: +1tJdl63TLCiL1OACEJeHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="71106909"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Sep 2024 21:43:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smnI0-000C7b-1y;
	Sat, 07 Sep 2024 04:43:12 +0000
Date: Sat, 7 Sep 2024 12:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13863/13880]
 arch/arm64/kernel/virtcca_cvm_host.c:37:6: warning: no previous prototype
 for function 'is_virtcca_cvm_enable'
Message-ID: <202409071200.Tf9aVoeY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   10e0ea7796b38b1d35a6969966016d7a42d77b7f
commit: ed007ade0cef81fb47328683b8a7eec5edfa8494 [13863/13880] virtcca feature: secure smmu init
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409071200.Tf9aVoeY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071200.Tf9aVoeY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071200.Tf9aVoeY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/virtcca_cvm_host.c:6:
   In file included from include/linux/mm.h:2242:
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
>> arch/arm64/kernel/virtcca_cvm_host.c:37:6: warning: no previous prototype for function 'is_virtcca_cvm_enable' [-Wmissing-prototypes]
      37 | bool is_virtcca_cvm_enable(void)
         |      ^
   arch/arm64/kernel/virtcca_cvm_host.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | bool is_virtcca_cvm_enable(void)
         | ^
         | static 
   6 warnings generated.
--
>> arch/arm64/kvm/tmi.c:142: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write command to command queue
   arch/arm64/kvm/tmi.c:166: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Map mmio stage2 translation for device
   arch/arm64/kvm/tmi.c:180: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Unmap mmio stage2 translation for device
   arch/arm64/kvm/tmi.c:193: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write device mmio
   arch/arm64/kvm/tmi.c:208: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Read device mmio
   arch/arm64/kvm/tmi.c:233: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Attach device and configure L2 ste before activate CVM
   arch/arm64/kvm/tmi.c:276: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write smmu secure register
   arch/arm64/kvm/tmi.c:290: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Read smmu secure register
--
   In file included from drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:6:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2242:
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
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:509:13: warning: no previous prototype for function 'virtcca_smmu_evtq_thread' [-Wmissing-prototypes]
     509 | irqreturn_t virtcca_smmu_evtq_thread(int irq, void *dev)
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:509:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     509 | irqreturn_t virtcca_smmu_evtq_thread(int irq, void *dev)
         | ^
         | static 
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:527:13: warning: no previous prototype for function 'virtcca_smmu_gerror_handler' [-Wmissing-prototypes]
     527 | irqreturn_t virtcca_smmu_gerror_handler(int irq, void *dev)
         |             ^
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:527:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     527 | irqreturn_t virtcca_smmu_gerror_handler(int irq, void *dev)
         | ^
         | static 
   7 warnings generated.
--
>> drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:58: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Traverse pcie topology to find the root <bus,device> number
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:80: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Traverse pcie topology to find child devices
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:118: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get all devices which share the same root_bd as dev
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:146: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Add device obj to hash tablse
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:183: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Whether the root port is secure or not
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:204: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Whether the vm is confidential vm
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:225: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Whether the stream id of dev is confidential
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:246: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Whether the cmd queue need transfer to secure world
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:298: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write queue command to TMM
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:328: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write a batch of queue command to TMM, if need sync, will send additional cmd queue
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:383: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialize a queue of the corresponding type
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:424: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write values to secure smmu registers and wait for completion
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:449: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write values to glabal bypass register
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:485: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Disable the secure smmu
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:505: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The secure evt queue thread
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:520: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The secure gerror handler
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:590: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Disable secure smmu irq function
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:603: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enable secure smmu irq function
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:617: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get irq index from platform
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:636: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Complete the stage2 page table establishment for the security device
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:691: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Setting up the STE config content for the security device
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:729: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Add secure device to hash table
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:766: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Delegate device to secure state
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:815: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enable the PCIe protection controller function of the security device
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:844: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write secure smmu msi msg
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:877: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enable secure smmu msi
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:907: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set secure irq handle
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:945: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write value to smmu registers and wait for completion
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:965: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialize the smmu irq
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:1016: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * For SMMU, it has various uses. In virtCCA scenario,
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:1044: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enable the smmu secure state
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:1079: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Whether the smmu support secure registers and secure stage2 translate
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:1113: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Implement security settings for corresponding devices targeting the secure smmu domain
   drivers/iommu/arm/arm-smmu-v3/arm-s-smmu-v3.c:1171: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialize the smmu security features


vim +/is_virtcca_cvm_enable +37 arch/arm64/kernel/virtcca_cvm_host.c

    36	
  > 37	bool is_virtcca_cvm_enable(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
