Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DBD299AAB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777792891; cv=none; b=R1xEa+EJdFE9jK6FXwQCS5LSK81BI+3TQkTrMi2+5DD3nk6MqKEGkUErzbNuU2uUI8Ayx/wmBQjV2BIPEmX5Bfwc+uwlThRpikp+TZygn7ZTE6l50WUiomOQlAo2znCG8lEdfuvEU3zYjBYbCzoDtRSvxaWLCQWuNsSquMPOtWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777792891; c=relaxed/simple;
	bh=QMTgc7QEbykopHRnyDyAa3x9kHCEtq05icioyVKc3zc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z9xEC6Oe56/dl6RM4LLrWiChboxL+aKXeStKJdWcH0XSZZA6IAYetoFL4yaJgcmmrwLjE6FeZJHBq/iKRpPuRTrQadMRZIPnVPqu8PQWK2AjZNvwA+gp0+C5Zafpj/DQXUxIlP75nJwnLXGZB4YlEyX0RRc31HcfZ9XCniptlt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNykyyNC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNykyyNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777792890; x=1809328890;
  h=date:from:to:cc:subject:message-id;
  bh=QMTgc7QEbykopHRnyDyAa3x9kHCEtq05icioyVKc3zc=;
  b=TNykyyNC6Dgb5asoNSePe73rpfpuELXS4ST8SbwRotK6QM7UynTs9DeR
   d9I5BSmic4BauPobKDzjOeFPTvZ3z62P05FgknOoUv0N6UqnRBzUmdSbK
   5IQIoCcqSkoNtD7OhLEUpvwy1X2/0PewTjrKirREaXgcpsPeaX32EzQFE
   hj4VP0oVxQVlFlzFq4b4fWaKl7aneif9wM71genEEZPpot3pconhHtvDb
   9EBo1J1blNDEVDSwCcF2RzpC1fgpUQqVCKUdYjtXmVy7KJSUO6WKvRq9l
   02tymOsY/nKjysJbQ0uVQXujbUH5eeDYgeFcAsuiZ7+NYKnpqDPbGboTO
   g==;
X-CSE-ConnectionGUID: m4xlO8OxRXuH1lxpXYJHWA==
X-CSE-MsgGUID: AHR56JWJQwWtWfLAOItfnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82540068"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82540068"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 00:21:27 -0700
X-CSE-ConnectionGUID: OfDXyE6YSLCL1vJFMPfxhA==
X-CSE-MsgGUID: M1k4MPYjSmOdTFsbr4mlZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="228737440"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 May 2026 00:21:26 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJR8l-000000002JL-3CJQ;
	Sun, 03 May 2026 07:21:23 +0000
Date: Sun, 03 May 2026 15:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 8/69] arch/microblaze/include/asm/page.h:26:9:
 warning: 'PTE_SHIFT' redefined
Message-ID: <202605031520.Hdy1tWJr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 7445c40244aacfd71c931e23818d81c246dcd0dd [8/69] mm: Introduce PTE_SIZE, PTE_SHIFT and PTE_MASK
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031520.Hdy1tWJr-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031520.Hdy1tWJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031520.Hdy1tWJr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/shm.h:6,
                    from include/linux/sched.h:23,
                    from arch/microblaze/kernel/asm-offsets.c:14:
>> arch/microblaze/include/asm/page.h:26:9: warning: 'PTE_SHIFT' redefined
      26 | #define PTE_SHIFT       (PAGE_SHIFT - 2)        /* 1024 ptes per page */
         |         ^~~~~~~~~
   In file included from arch/microblaze/include/asm/page.h:22:
   include/vdso/page.h:13:9: note: this is the location of the previous definition
      13 | #define PTE_SHIFT      CONFIG_PTE_SHIFT
         |         ^~~~~~~~~
   arch/microblaze/include/asm/page.h: In function 'virt_to_pfn':
   arch/microblaze/include/asm/page.h:26:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      26 | #define PTE_SHIFT       (PAGE_SHIFT - 2)        /* 1024 ptes per page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   include/linux/pfn.h:11:33: note: in expansion of macro 'PAGE_SHIFT'
      11 | #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~
   arch/microblaze/include/asm/page.h:95:34: note: in expansion of macro 'PFN_DOWN'
      95 | # define phys_to_pfn(phys)      (PFN_DOWN(phys))
         |                                  ^~~~~~~~
   arch/microblaze/include/asm/page.h:122:16: note: in expansion of macro 'phys_to_pfn'
     122 |         return phys_to_pfn(__pa(vaddr));
         |                ^~~~~~~~~~~
   arch/microblaze/include/asm/page.h:26:26: note: each undeclared identifier is reported only once for each function it appears in
      26 | #define PTE_SHIFT       (PAGE_SHIFT - 2)        /* 1024 ptes per page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   include/linux/pfn.h:11:33: note: in expansion of macro 'PAGE_SHIFT'
      11 | #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~
   arch/microblaze/include/asm/page.h:95:34: note: in expansion of macro 'PFN_DOWN'
      95 | # define phys_to_pfn(phys)      (PFN_DOWN(phys))
         |                                  ^~~~~~~~
   arch/microblaze/include/asm/page.h:122:16: note: in expansion of macro 'phys_to_pfn'
     122 |         return phys_to_pfn(__pa(vaddr));
         |                ^~~~~~~~~~~
   arch/microblaze/include/asm/page.h: In function 'pfn_to_virt':
   arch/microblaze/include/asm/page.h:26:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      26 | #define PTE_SHIFT       (PAGE_SHIFT - 2)        /* 1024 ptes per page */
         |                          ^~~~~~~~~~
   arch/microblaze/include/asm/page.h:109:11: note: in definition of macro '__phys_to_virt'
     109 |         ((addr) + CONFIG_KERNEL_START - CONFIG_KERNEL_BASE_ADDR)
         |           ^~~~
   arch/microblaze/include/asm/page.h:127:16: note: in expansion of macro '__va'
     127 |         return __va(pfn_to_phys((pfn)));
         |                ^~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   include/linux/pfn.h:12:46: note: in expansion of macro 'PAGE_SHIFT'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PAGE_SHIFT)
         |                                              ^~~~~~~~~~
   arch/microblaze/include/asm/page.h:96:34: note: in expansion of macro 'PFN_PHYS'
      96 | # define pfn_to_phys(pfn)       (PFN_PHYS(pfn))
         |                                  ^~~~~~~~
   arch/microblaze/include/asm/page.h:127:21: note: in expansion of macro 'pfn_to_phys'
     127 |         return __va(pfn_to_phys((pfn)));
         |                     ^~~~~~~~~~~
   include/asm-generic/memory_model.h: In function 'pfn_valid':
   arch/microblaze/include/asm/page.h:26:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      26 | #define PTE_SHIFT       (PAGE_SHIFT - 2)        /* 1024 ptes per page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   arch/microblaze/include/asm/page.h:101:50: note: in expansion of macro 'PAGE_SHIFT'
     101 | #  define ARCH_PFN_OFFSET       (memory_start >> PAGE_SHIFT)
         |                                                  ^~~~~~~~~~
   include/asm-generic/memory_model.h:28:36: note: in expansion of macro 'ARCH_PFN_OFFSET'
      28 |         unsigned long pfn_offset = ARCH_PFN_OFFSET;
         |                                    ^~~~~~~~~~~~~~~
   include/asm-generic/getorder.h: In function 'get_order':
   arch/microblaze/include/asm/page.h:26:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      26 | #define PTE_SHIFT       (PAGE_SHIFT - 2)        /* 1024 ptes per page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/getorder.h:33:48: note: in expansion of macro 'PAGE_SHIFT'
      33 |                         return BITS_PER_LONG - PAGE_SHIFT;
         |                                                ^~~~~~~~~~
   arch/microblaze/include/asm/pgtable.h: At top level:
   arch/microblaze/include/asm/page.h:26:26: error: 'PAGE_SHIFT' undeclared here (not in a function)
      26 | #define PTE_SHIFT       (PAGE_SHIFT - 2)        /* 1024 ptes per page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   arch/microblaze/include/asm/pgtable.h:89:26: note: in expansion of macro 'PAGE_SHIFT'
      89 | #define PGDIR_SHIFT     (PAGE_SHIFT + PTE_SHIFT)
         |                          ^~~~~~~~~~
   arch/microblaze/include/asm/pgtable.h:99:37: note: in expansion of macro 'PGDIR_SHIFT'
      99 | #define PTRS_PER_PGD    (1 << (32 - PGDIR_SHIFT))
         |                                     ^~~~~~~~~~~
   arch/microblaze/include/asm/pgtable.h:381:29: note: in expansion of macro 'PTRS_PER_PGD'
     381 | extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
         |                             ^~~~~~~~~~~~
   include/vdso/page.h:31:25: error: 'PTE_SHIFT' undeclared here (not in a function)
      31 | #define PAGE_SHIFT      PTE_SHIFT


vim +/PTE_SHIFT +26 arch/microblaze/include/asm/page.h

a1253977dff4a03 John Williams 2009-06-22  25  
9f78d3b5ab97a22 Michal Simek  2012-07-31 @26  #define PTE_SHIFT	(PAGE_SHIFT - 2)	/* 1024 ptes per page */
9f78d3b5ab97a22 Michal Simek  2012-07-31  27  

:::::: The code at line 26 was first introduced by commit
:::::: 9f78d3b5ab97a22a7e836312c495804ee4bca4ab microblaze: Do not used hardcoded value in exception handler

:::::: TO: Michal Simek <monstr@monstr.eu>
:::::: CC: Michal Simek <monstr@monstr.eu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
