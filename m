Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E5246778
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800386; cv=none; b=B5bCYQSujBRvkQFMTxTVHfK4qfSWGHT829L33n6FHB517uUwekErDS1hwK+wdl/oUl1UNCgq0NlOvN+P21pw8IRxmxaO3BQ2ZoRTIdvytdcSVy+mO101tYN6+o6hBaNf4TvVvoowFWXfc+qwE5PjzXhIcCyKVc62TIa0MgEOHAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800386; c=relaxed/simple;
	bh=VNypKi6K3JvxUAhcu/CIZ2YwIyZ7B3XFKt41eCQwp8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XiA2CRxCrbM7Rf6OM5T7Cco1TqgwSfTUMcGC5f4ys0mn4n0cNrpypLX6j8z3eOLybjKDn1ZIZDj7QIALUNjnSfVJyDcRmjGfMlIxwnEoflQLKflpBRamhQCjx1GhOp5Tyf+v1twbNEMUaiymV2RZ8xkUdpcVYsLqiKM0OAPiYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs5fbwMv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs5fbwMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756800384; x=1788336384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNypKi6K3JvxUAhcu/CIZ2YwIyZ7B3XFKt41eCQwp8c=;
  b=Xs5fbwMv+vnBVDbLXLYxFKRJDe5IzlVfLQ6sv2aipeAhTpbpC2FJKisE
   Mi3qCFwH/FWhOhqRAgURf6+LKMvzhzaufPD750xVzRnw75g/OhnDmC8B6
   pP7V+kwRHZ+UTy3vvtSs2o1P5AIPL0x240Y5KhR05R05mK19NHJ9jJ4jj
   x8ZKlmCqiyha9kWIQRIU7Q5OUy7DhoKdDoEvTROYDd6JRvm77ofCHX8I4
   ANOHZ3Vb0Ub7zEYhOtyxqSUOURWmvDWo8uflg7dScaEfyuyIlHFDnE0PP
   J1/a/fZEipZwiZFgYXHvHqGxnV0vEWug8WyqziDOU4yxFa28nnRd88dMS
   Q==;
X-CSE-ConnectionGUID: m9WdXtCpT1m2bQ5dhlriQQ==
X-CSE-MsgGUID: UsRc3r9tT1yGD1AAU0UulQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58995503"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58995503"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 01:06:23 -0700
X-CSE-ConnectionGUID: KEHFlknYR1aAr3s3s/kt9w==
X-CSE-MsgGUID: jlTumNrOSTW3Frp2dN/ylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175577562"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Sep 2025 01:06:21 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utM1H-0001bm-1D;
	Tue, 02 Sep 2025 08:06:00 +0000
Date: Tue, 2 Sep 2025 16:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2835/2835] arch/loongarch/kernel/efi.c:79:12:
 error: call to undeclared function 'pmd_mkhuge'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202509021500.y8PdGM3g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4899f36878e0612ccb9881145064ae35377bcdcc
commit: 221e2e8bdbb851a519df0bac5a44298dae2b4612 [2835/2835] LoongArch: add kernel setvirtmap for runtime
config: loongarch-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021500.y8PdGM3g-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021500.y8PdGM3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021500.y8PdGM3g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/efi.c:11:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/loongarch/kernel/efi.c:26:
   arch/loongarch/include/asm/tlb.h:144:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     144 |         struct vm_area_struct vma;
         |                               ^
   include/linux/mm_types.h:601:20: note: member 'vm_flags' declared 'const' here
     601 |                 const vm_flags_t vm_flags;
         |                                  ^
>> arch/loongarch/kernel/efi.c:79:12: error: call to undeclared function 'pmd_mkhuge'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      79 |                         entry = pmd_mkhuge(entry);
         |                                 ^
   arch/loongarch/kernel/efi.c:79:12: note: did you mean 'pte_mkhuge'?
   arch/loongarch/include/asm/pgtable.h:419:21: note: 'pte_mkhuge' declared here
     419 | static inline pte_t pte_mkhuge(pte_t pte)
         |                     ^
>> arch/loongarch/kernel/efi.c:79:10: error: assigning to 'pmd_t' from incompatible type 'int'
      79 |                         entry = pmd_mkhuge(entry);
         |                               ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/pmd_mkhuge +79 arch/loongarch/kernel/efi.c

    54	
    55	static int __init efimap_populate_hugepages(
    56			unsigned long start, unsigned long end,
    57			pgprot_t prot)
    58	{
    59		unsigned long addr;
    60		unsigned long next;
    61		pmd_t entry;
    62		pud_t *pud;
    63		pmd_t *pmd;
    64	
    65		for (addr = start; addr < end; addr = next) {
    66			next = pmd_addr_end(addr, end);
    67			pud = pud_offset((p4d_t *)pgd_efi + pgd_index(addr), addr);
    68			if (pud_none(*pud)) {
    69				void *p = memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
    70	
    71				if (!p)
    72					return -1;
    73				pmd_init(p);
    74				pud_populate(&init_mm, pud, p);
    75			}
    76			pmd = pmd_offset(pud, addr);
    77			if (pmd_none(*pmd)) {
    78				entry = pfn_pmd((addr >> PAGE_SHIFT), prot);
  > 79				entry = pmd_mkhuge(entry);
    80				set_pmd_at(&init_mm, addr, pmd, entry);
    81			}
    82		}
    83		return 0;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
