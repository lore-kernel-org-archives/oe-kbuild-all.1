Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EDD1B815
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771104; cv=none; b=idcjP2FIPMskNlfn5j6uoDiNxf4K+30ikFBqrBg2bmysu2rqSoDgFwotv9/PoUTj2t+BSb9vSYidAl3ansZys6Wo2/2DgZLe+xM/z1UvMR/iEE5I65WKMC8E35zb4PdwaTTtADFT5aDGDNTu2BwTgkqDZuP9chlIGesZjuCDNiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771104; c=relaxed/simple;
	bh=YSBqaJvdFifGIkMkQxQlYkHMmJAUbhWwnlp+uOiAyhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bq5wxuYOccIX4ln8jNHtofHdxGXo5xJwnRHkcn+G/MMmXb8tLMxgkGBkdtLoM/m1QFLd9t9q9UOogA3UL7C3zHWoVVsVY5YykCp5fEIcxPEGVIn7G+0JeoUXNmxOGqTayrahupoZkN4Gfu+CYSZ+nG8P2B4oi+8qQt0su5cjIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoQQUE8o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoQQUE8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731771101; x=1763307101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YSBqaJvdFifGIkMkQxQlYkHMmJAUbhWwnlp+uOiAyhk=;
  b=UoQQUE8okQtgBx5BJuNej+paUAwyL8Jj/UfoALafNJ7TgtkihGsX0qw3
   XJaFoqJGuiMhcd40c8+/YANLYKg+uBXTd46OBvOjzDL6fwWZO4TdZPGuW
   8lel2a8cIF5ICN9aXpqIzDtlRWF+RClNI6vJ3jz/WptyFRHywAWiY/Mqr
   500lLQ+7PdjcSr35YKygbGc6ZKCjViBcmJDq9x76PQV5JxCUtnwfuqcxq
   pyYcy4oYOhpIPgDA/Nh4j55cx4DoQ9dp8/En2O/ISkneN6H4K8yRp3q0Z
   9G8i6hV8Cye3I4PfY/Vyko05u/uw4/h77r742ilaeicRX9RD8kHckTfVT
   A==;
X-CSE-ConnectionGUID: mzbMRaCGT9yx2CFtGlolCw==
X-CSE-MsgGUID: SeczeA06TWSX2FSnSub+2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="57177821"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="57177821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 07:31:37 -0800
X-CSE-ConnectionGUID: MUUbMXhVQZei8T6SB26X0A==
X-CSE-MsgGUID: FZy4X/q1Q227wkij/ekbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93914372"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2024 07:31:36 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCKlq-0000np-0B;
	Sat, 16 Nov 2024 15:31:34 +0000
Date: Sat, 16 Nov 2024 23:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 15/328] arch/arm64/kvm/mmu.c:1432:14:
 warning: variable 'ipa' set but not used
Message-ID: <202411162333.mlBArC7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fuad,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   9e0cc972dd813d5f6581c909beff26e7e531bf4d
commit: f0781f891bb551761322e1cf038866045f8ae748 [15/328] ANDROID: KVM: arm64: Do not use the hva in kvm_handle_guest_abort()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241116/202411162333.mlBArC7w-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411162333.mlBArC7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411162333.mlBArC7w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/mmu.c:7:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/mmu.c:1432:14: warning: variable 'ipa' set but not used [-Wunused-but-set-variable]
    1432 |         phys_addr_t ipa = fault_ipa;
         |                     ^
   5 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/ipa +1432 arch/arm64/kvm/mmu.c

ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1421  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1422  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1423  			  struct kvm_s2_trans *nested,
f0781f891bb551 arch/arm64/kvm/mmu.c Fuad Tabba          2022-10-05  1424  			  struct kvm_memory_slot *memslot,
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1425  			  bool fault_is_perm)
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1426  {
ffd1b63a586096 arch/arm64/kvm/mmu.c Will Deacon         2020-09-30  1427  	int ret = 0;
6396b852e46e56 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1428  	bool write_fault, writable, force_pte = false;
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1429  	bool exec_fault, mte_allowed;
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1430  	bool device = false, vfio_allow_any_uc = false;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1431  	unsigned long mmu_seq;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14 @1432  	phys_addr_t ipa = fault_ipa;
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1433  	struct kvm *kvm = vcpu->kvm;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1434  	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1435  	struct vm_area_struct *vma;
1559b7583ff6ed virt/kvm/arm/mmu.c   James Morse         2019-12-17  1436  	short vma_shift;
f0781f891bb551 arch/arm64/kvm/mmu.c Fuad Tabba          2022-10-05  1437  	gfn_t gfn = fault_ipa >> PAGE_SHIFT;
ba049e93aef7e8 arch/arm/kvm/mmu.c   Dan Williams        2016-01-15  1438  	kvm_pfn_t pfn;
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1439  	bool logging_active = memslot_is_logging(memslot);
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1440  	long vma_pagesize, fault_granule;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1441  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1442  	struct kvm_pgtable *pgt;
f0781f891bb551 arch/arm64/kvm/mmu.c Fuad Tabba          2022-10-05  1443  	unsigned long hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1444  
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1445  	if (fault_is_perm)
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1446  		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
a7d079cea2dffb arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-09  1447  	write_fault = kvm_is_write_fault(vcpu);
c4ad98e4b72cb5 arch/arm64/kvm/mmu.c Marc Zyngier        2020-09-15  1448  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
d0e22b4ac3ba23 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1449  	VM_BUG_ON(write_fault && exec_fault);
d0e22b4ac3ba23 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1450  
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1451  	if (fault_is_perm && !write_fault && !exec_fault) {
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1452  		kvm_err("Unexpected L2 read permission error\n");
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1453  		return -EFAULT;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1454  	}
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1455  
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1456  	/*
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1457  	 * Permission faults just need to update the existing leaf entry,
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1458  	 * and so normally don't require allocations from the memcache. The
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1459  	 * only exception to this is when dirty logging is enabled at runtime
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1460  	 * and a write fault needs to collapse a block entry into a table.
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1461  	 */
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1462  	if (!fault_is_perm || (logging_active && write_fault)) {
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1463  		ret = kvm_mmu_topup_memory_cache(memcache,
fe49fd940e2259 arch/arm64/kvm/mmu.c Marc Zyngier        2023-10-12  1464  						 kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1465  		if (ret)
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1466  			return ret;
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1467  	}
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1468  
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1469  	/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1470  	 * Let's check if we will get back a huge page backed by hugetlbfs, or
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1471  	 * get block mapping for device MMIO region.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1472  	 */
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1473  	mmap_read_lock(current->mm);
09eef83a801512 arch/arm64/kvm/mmu.c Liam Howlett        2021-06-28  1474  	vma = vma_lookup(current->mm, hva);
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1475  	if (unlikely(!vma)) {
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1476  		kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1477  		mmap_read_unlock(current->mm);
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1478  		return -EFAULT;
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1479  	}
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1480  
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1481  	/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1482  	 * logging_active is guaranteed to never be true for VM_PFNMAP
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1483  	 * memslots.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1484  	 */
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1485  	if (logging_active) {
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1486  		force_pte = true;
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1487  		vma_shift = PAGE_SHIFT;
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1488  	} else {
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1489  		vma_shift = get_vma_page_shift(vma, hva);
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1490  	}
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1491  
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1492  	switch (vma_shift) {
faf000397e7f10 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1493  #ifndef __PAGETABLE_PMD_FOLDED
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1494  	case PUD_SHIFT:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1495  		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1496  			break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1497  		fallthrough;
faf000397e7f10 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1498  #endif
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1499  	case CONT_PMD_SHIFT:
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1500  		vma_shift = PMD_SHIFT;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1501  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1502  	case PMD_SHIFT:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1503  		if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1504  			break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1505  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1506  	case CONT_PTE_SHIFT:
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1507  		vma_shift = PAGE_SHIFT;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1508  		force_pte = true;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1509  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1510  	case PAGE_SHIFT:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1511  		break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1512  	default:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1513  		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1514  	}
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1515  
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1516  	vma_pagesize = 1UL << vma_shift;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1517  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1518  	if (nested) {
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1519  		unsigned long max_map_size;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1520  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1521  		max_map_size = force_pte ? PAGE_SIZE : PUD_SIZE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1522  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1523  		ipa = kvm_s2_trans_output(nested);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1524  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1525  		/*
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1526  		 * If we're about to create a shadow stage 2 entry, then we
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1527  		 * can only create a block mapping if the guest stage 2 page
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1528  		 * table uses at least as big a mapping.
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1529  		 */
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1530  		max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1531  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1532  		/*
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1533  		 * Be careful that if the mapping size falls between
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1534  		 * two host sizes, take the smallest of the two.
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1535  		 */
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1536  		if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1537  			max_map_size = PMD_SIZE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1538  		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1539  			max_map_size = PAGE_SIZE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1540  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1541  		force_pte = (max_map_size == PAGE_SIZE);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1542  		vma_pagesize = min(vma_pagesize, (long)max_map_size);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1543  	}
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1544  
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1545  	/*
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1546  	 * Both the canonical IPA and fault IPA must be hugepage-aligned to
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1547  	 * ensure we find the right PFN and lay down the mapping in the right
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1548  	 * place.
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1549  	 */
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1550  	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1551  		fault_ipa &= ~(vma_pagesize - 1);
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1552  		ipa &= ~(vma_pagesize - 1);
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1553  	}
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1554  
f0781f891bb551 arch/arm64/kvm/mmu.c Fuad Tabba          2022-10-05  1555  	gfn = fault_ipa >> PAGE_SHIFT;
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1556  	mte_allowed = kvm_vma_mte_allowed(vma);
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1557  
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1558  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1559  
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1560  	/* Don't use the VMA after the unlock -- it may have vanished */
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1561  	vma = NULL;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1562  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1563  	/*
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1564  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1565  	 * vma_lookup() or __gfn_to_pfn_memslot() become stale prior to
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1566  	 * acquiring kvm->mmu_lock.
10ba2d17d29729 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1567  	 *
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1568  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1569  	 * with the smp_wmb() in kvm_mmu_invalidate_end().
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1570  	 */
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1571  	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1572  	mmap_read_unlock(current->mm);
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1573  
c8b88b332bedf4 arch/arm64/kvm/mmu.c Peter Xu            2022-10-11  1574  	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
10ba2d17d29729 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1575  				   write_fault, &writable, NULL);
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1576  	if (pfn == KVM_PFN_ERR_HWPOISON) {
1559b7583ff6ed virt/kvm/arm/mmu.c   James Morse         2019-12-17  1577  		kvm_send_hwpoison_signal(hva, vma_shift);
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1578  		return 0;
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1579  	}
9ac715954682b2 arch/arm/kvm/mmu.c   Christoffer Dall    2016-08-17  1580  	if (is_error_noslot_pfn(pfn))
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1581  		return -EFAULT;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1582  
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1583  	if (kvm_is_device_pfn(pfn)) {
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1584  		/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1585  		 * If the page was identified as device early by looking at
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1586  		 * the VMA flags, vma_pagesize is already representing the
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1587  		 * largest quantity we can map.  If instead it was mapped
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1588  		 * via gfn_to_pfn_prot(), vma_pagesize is set to PAGE_SIZE
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1589  		 * and must not be upgraded.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1590  		 *
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1591  		 * In both cases, we don't let transparent_hugepage_adjust()
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1592  		 * change things at the last minute.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1593  		 */
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1594  		device = true;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1595  	} else if (logging_active && !write_fault) {
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1596  		/*
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1597  		 * Only actually map the page as writable if this was a write
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1598  		 * fault.
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1599  		 */
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1600  		writable = false;
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1601  	}
b88657674d39fc arch/arm/kvm/mmu.c   Kim Phillips        2014-06-26  1602  
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1603  	if (exec_fault && device)
6d674e28f642e3 virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1604  		return -ENOEXEC;
6d674e28f642e3 virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1605  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1606  	/*
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1607  	 * Potentially reduce shadow S2 permissions to match the guest's own
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1608  	 * S2. For exec faults, we'd only reach this point if the guest
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1609  	 * actually allowed it (see kvm_s2_handle_perm_fault).
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1610  	 *
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1611  	 * Also encode the level of the original translation in the SW bits
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1612  	 * of the leaf entry as a proxy for the span of that translation.
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1613  	 * This will be retrieved on TLB invalidation from the guest and
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1614  	 * used to limit the invalidation scope if a TTL hint or a range
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1615  	 * isn't provided.
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1616  	 */
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1617  	if (nested) {
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1618  		writable &= kvm_s2_trans_writable(nested);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1619  		if (!kvm_s2_trans_readable(nested))
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1620  			prot &= ~KVM_PGTABLE_PROT_R;
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1621  
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1622  		prot |= kvm_encode_nested_level(nested);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1623  	}
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1624  
f783ef1c0e82e4 arch/arm64/kvm/mmu.c Jing Zhang          2022-01-18  1625  	read_lock(&kvm->mmu_lock);
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1626  	pgt = vcpu->arch.hw_mmu->pgt;
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1627  	if (mmu_invalidate_retry(kvm, mmu_seq)) {
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1628  		ret = -EAGAIN;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1629  		goto out_unlock;
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1630  	}
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1631  
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1632  	/*
0529c9021252a5 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1633  	 * If we are not forced to use page mapping, check if we are
0529c9021252a5 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1634  	 * backed by a THP and thus use block mapping if possible.
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1635  	 */
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1636  	if (vma_pagesize == PAGE_SIZE && !(force_pte || device)) {
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1637  		if (fault_is_perm && fault_granule > PAGE_SIZE)
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1638  			vma_pagesize = fault_granule;
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1639  		else
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1640  			vma_pagesize = transparent_hugepage_adjust(kvm, memslot,
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1641  								   hva, &pfn,
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1642  								   &fault_ipa);
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1643  
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1644  		if (vma_pagesize < 0) {
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1645  			ret = vma_pagesize;
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1646  			goto out_unlock;
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1647  		}
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1648  	}
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1649  
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1650  	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
d89585fbb30869 arch/arm64/kvm/mmu.c Peter Collingbourne 2022-11-03  1651  		/* Check the VMM hasn't introduced a new disallowed VMA */
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1652  		if (mte_allowed) {
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1653  			sanitise_mte_tags(kvm, pfn, vma_pagesize);
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1654  		} else {
9f03db6673598f arch/arm64/kvm/mmu.c Marc Zyngier        2021-06-22  1655  			ret = -EFAULT;
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1656  			goto out_unlock;
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1657  		}
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1658  	}
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1659  
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1660  	if (writable)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1661  		prot |= KVM_PGTABLE_PROT_W;
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1662  
25aa28691bb960 arch/arm64/kvm/mmu.c Yanan Wang          2021-06-17  1663  	if (exec_fault)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1664  		prot |= KVM_PGTABLE_PROT_X;
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1665  
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1666  	if (device) {
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1667  		if (vfio_allow_any_uc)
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1668  			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1669  		else
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1670  			prot |= KVM_PGTABLE_PROT_DEVICE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1671  	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1672  		   (!nested || kvm_s2_trans_executable(nested))) {
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1673  		prot |= KVM_PGTABLE_PROT_X;
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1674  	}
a15f693935a9f1 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1675  
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1676  	/*
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1677  	 * Under the premise of getting a FSC_PERM fault, we just need to relax
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1678  	 * permissions only if vma_pagesize equals fault_granule. Otherwise,
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1679  	 * kvm_pgtable_stage2_map() should be called to change block size.
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1680  	 */
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1681  	if (fault_is_perm && vma_pagesize == fault_granule) {
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1682  		/*
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1683  		 * Drop the SW bits in favour of those stored in the
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1684  		 * PTE, which will be preserved.
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1685  		 */
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1686  		prot &= ~KVM_NV_GUEST_MAP_SZ;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1687  		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1688  	} else {
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1689  		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1690  					     __pfn_to_phys(pfn), prot,
ddcadb297ce5cc arch/arm64/kvm/mmu.c Oliver Upton        2022-12-02  1691  					     memcache,
ddcadb297ce5cc arch/arm64/kvm/mmu.c Oliver Upton        2022-12-02  1692  					     KVM_PGTABLE_WALK_HANDLE_FAULT |
ddcadb297ce5cc arch/arm64/kvm/mmu.c Oliver Upton        2022-12-02  1693  					     KVM_PGTABLE_WALK_SHARED);
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1694  	}
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1695  
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1696  out_unlock:
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1697  	read_unlock(&kvm->mmu_lock);
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1698  
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1699  	/* Mark the page dirty only if the fault is handled successfully */
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1700  	if (writable && !ret) {
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1701  		kvm_set_pfn_dirty(pfn);
10ba2d17d29729 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1702  		mark_page_dirty_in_slot(kvm, memslot, gfn);
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1703  	}
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1704  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1705  	kvm_release_pfn_clean(pfn);
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1706  	return ret != -EAGAIN ? ret : 0;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1707  }
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1708  

:::::: The code at line 1432 was first introduced by commit
:::::: fd276e71d1e7b7f729050f2da235a1e6fe4f328a KVM: arm64: nv: Handle shadow stage 2 page faults

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
