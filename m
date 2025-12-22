Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0830AAAF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411726; cv=none; b=tsfkgKhYMRu/n5e4U55t5N+FMuNITXsJ4ExZeZ/GpCRMwpAGdmM7LFP/w+O14X8dyKS5h5XwRSbYqtsRhsPjy5RsSfET1RCgmC7bMmwfvhXS4IBgLWtfriVUf/nxwO+kdL36HDZ8MX50SVv8kU+2MCjO42ndVKKB32epVkqfWc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411726; c=relaxed/simple;
	bh=H+5tyWNeMInPQx1asXI6JSiIryrYasiPkuvSEsB9eWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFBhBdknp4BfL5WxHd4oNQRlEuP4sGK6kD+/TOEMy5v4Ib40akJL98nSRdmvfXOFNjCG7ohXCh2nxQ4lLdEElS1/NcPF0rPu8Eoh5jxzeZLg96JViATe8skZXXu+PZbjyohoAvwM4gOtvG7Q7f8wh9bS2QUuCFyUr9myPMOU8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0aIYhIH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0aIYhIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766411721; x=1797947721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+5tyWNeMInPQx1asXI6JSiIryrYasiPkuvSEsB9eWM=;
  b=O0aIYhIHNRzc16Vdscqa1KEjQ3ZwO6BAw3qr1YHDY0C4U0K4Lq0JF6JT
   t2ILXZKeKIYUgr1b4QBgww13y4Vd2FwCaYIbmIAgLWqw7y7zVMvHHQtwv
   O64u++A5ratVchX/nht6eS0p2/oNYpBEnqRBq4qqVcGV9VX+klcS7ZxeR
   kRIWvwN4Buh6N8XSk10Jt4Ld/zx1MJfHtDHO1K2NlDObzX0x5UvTSdY5Y
   nnMYLTyDU1awUdLfS4jlgaBcZgx7xJk5uDY/6/F7Z8C4qd+kt8xtVSBcO
   HNVm/1ltl+PiTZrY6aNIU9B635ws2/K2ZsLTJKelqW7/M8S6puaKn2/eD
   Q==;
X-CSE-ConnectionGUID: HNVClFKZSGSsHDBN+zRDeA==
X-CSE-MsgGUID: fhvJjRGPQMOkU+R3gO1EuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85847735"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="85847735"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:55:20 -0800
X-CSE-ConnectionGUID: sJdld5lSQpS/BGhIciQ15w==
X-CSE-MsgGUID: BLYGh2cMTGqM4a1Dg8MDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200031791"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 05:55:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgNZ-000000005V4-3Z53;
	Mon, 22 Dec 2025 13:55:17 +0000
Date: Mon, 22 Dec 2025 14:54:28 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc1215 1/1] ./arch/arm64/include/asm/pgalloc.h:120:23:
 error: 'pgtable_t' (aka 'struct ptdesc *') and 'struct page *' are not
 pointers to compatible types
Message-ID: <202512221403.fE4TREpY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc1215
head:   f6b3ada105829eaafc93899aabaee60344844f57
commit: f6b3ada105829eaafc93899aabaee60344844f57 [1/1] mm/pgtable: convert pgtable_t to ptdesc pointer
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512221403.fE4TREpY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221403.fE4TREpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221403.fE4TREpY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:109:
   In file included from ./include/linux/pgalloc.h:6:
>> ./arch/arm64/include/asm/pgalloc.h:120:23: error: 'pgtable_t' (aka 'struct ptdesc *') and 'struct page *' are not pointers to compatible types
     120 |         __pmd_populate(pmdp, page_to_phys(ptep),
         |                              ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/memory_model.h:85:37: note: expanded from macro 'page_to_phys'
      85 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   ./include/asm-generic/memory_model.h:47:52: note: expanded from macro '__page_to_pfn'
      47 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                        ^
   ./include/linux/pfn.h:12:36: note: expanded from macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PAGE_SHIFT)
         |                                        ^
   1 error generated.
--
   In file included from mm/oom_kill.c:49:
>> ./arch/arm64/include/asm/tlb.h:78:26: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
      78 |         struct ptdesc *ptdesc = page_ptdesc(pte);
         |                                 ^~~~~~~~~~~~~~~~
   ./include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   1 error generated.
--
   In file included from mm/memory.c:79:
   In file included from ./include/linux/pgalloc.h:6:
>> ./arch/arm64/include/asm/pgalloc.h:120:23: error: 'pgtable_t' (aka 'struct ptdesc *') and 'struct page *' are not pointers to compatible types
     120 |         __pmd_populate(pmdp, page_to_phys(ptep),
         |                              ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/memory_model.h:85:37: note: expanded from macro 'page_to_phys'
      85 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   ./include/asm-generic/memory_model.h:47:52: note: expanded from macro '__page_to_pfn'
      47 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                        ^
   ./include/linux/pfn.h:12:36: note: expanded from macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PAGE_SHIFT)
         |                                        ^
   In file included from mm/memory.c:86:
>> ./arch/arm64/include/asm/tlb.h:78:26: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
      78 |         struct ptdesc *ptdesc = page_ptdesc(pte);
         |                                 ^~~~~~~~~~~~~~~~
   ./include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   2 errors generated.
--
   In file included from arch/arm64/mm/mmu.c:41:
>> ./arch/arm64/include/asm/tlb.h:78:26: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
      78 |         struct ptdesc *ptdesc = page_ptdesc(pte);
         |                                 ^~~~~~~~~~~~~~~~
   ./include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   In file included from arch/arm64/mm/mmu.c:45:
>> ./arch/arm64/include/asm/pgalloc.h:120:23: error: 'pgtable_t' (aka 'struct ptdesc *') and 'struct page *' are not pointers to compatible types
     120 |         __pmd_populate(pmdp, page_to_phys(ptep),
         |                              ^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/memory_model.h:85:37: note: expanded from macro 'page_to_phys'
      85 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~
   ./include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   ./include/asm-generic/memory_model.h:47:52: note: expanded from macro '__page_to_pfn'
      47 | #define __page_to_pfn(page)     (unsigned long)((page) - vmemmap)
         |                                                        ^
   ./include/linux/pfn.h:12:36: note: expanded from macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PAGE_SHIFT)
         |                                        ^
   2 errors generated.
--
   In file included from kernel/sched/core.c:83:
>> ./arch/arm64/include/asm/tlb.h:78:26: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
      78 |         struct ptdesc *ptdesc = page_ptdesc(pte);
         |                                 ^~~~~~~~~~~~~~~~
   ./include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
>> kernel/sched/core.c:7733:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7733 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7708:1: note: array 'preempt_modes' declared here
    7708 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +120 ./arch/arm64/include/asm/pgalloc.h

1d18c47c735e8a Catalin Marinas 2012-03-05  115  
1d18c47c735e8a Catalin Marinas 2012-03-05  116  static inline void
1d18c47c735e8a Catalin Marinas 2012-03-05  117  pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
1d18c47c735e8a Catalin Marinas 2012-03-05  118  {
59511cfd08f32d Ard Biesheuvel  2021-03-10  119  	VM_BUG_ON(mm == &init_mm);
efe72541355d4d Yicong Yang     2024-11-02 @120  	__pmd_populate(pmdp, page_to_phys(ptep),
efe72541355d4d Yicong Yang     2024-11-02  121  		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
1d18c47c735e8a Catalin Marinas 2012-03-05  122  }
1d18c47c735e8a Catalin Marinas 2012-03-05  123  

:::::: The code at line 120 was first introduced by commit
:::::: efe72541355d4d40a4f076af453f6533e98e058c arm64: Add support for FEAT_HAFT

:::::: TO: Yicong Yang <yangyicong@hisilicon.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
