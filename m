Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718F288B8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768625144; cv=none; b=BpCrhzkWBHZwlBkPysAEHfUSEVjpUoHtvgViBiBHIn0JXe7h1sPTK/VPE2WpS7hDF6StYQd+pAR6IH6iHPtMpX3sc118TnKblxHhp1PysREgzdkFHGJZdT5Ej4azkL6ADVDyPV2Ay1v9SLGOP6jBJxskHOfXnRjVf0p/RXiecqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768625144; c=relaxed/simple;
	bh=wX7VA5hURFpAHYQ7bjvVc8KFxkLKW8zaAbDOIUFTylQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QR9LO50KGMM7d1d0D0sJYnJxivbaJaqsGP2JHV8K9R4BEKaRDLWquAotf71rS3Eq6ylUFzHeoL2syP6vFV9jDqa1cJJP3SOAUtc9YR/oqaiWE0EkkXZNFZnY5krqpDEYQgpAf+mDchQCFzcdg6XywHT8vKO1/mlxB05YTAtSKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQleyua8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQleyua8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768625142; x=1800161142;
  h=date:from:to:cc:subject:message-id;
  bh=wX7VA5hURFpAHYQ7bjvVc8KFxkLKW8zaAbDOIUFTylQ=;
  b=YQleyua8x7sT8L8G2sRkvOcdVHGFFAcAFqtBUgLfw1UsNL0cTuQSS8Ou
   aeElfem9YnVxgfuM11IVlwpboS/Zx0l8d48cGDpdcn9CFZiXcvpgpj8sB
   ST3Wo2WMCb3WcXsPllhuwlVunPmHaISfuJ5aU6r+r6ZLvWOwxjdXwJsUu
   dZ8AaNXrnvao/sQqz2KVR6Q87hRLR83OixRR6Nk3F31GZcBdLLBS5wlQN
   v4Hlb2yUktak6/rojWtlKRKBqU+2oFtG9E+/Ivdthhj77vZnbXg/m3oFU
   7M50I1ADmO5THRvYjWNd2xfgrj3Bv9LSr63at7uGeqnl2qg8cu3dY9GZ2
   w==;
X-CSE-ConnectionGUID: qQy8dZEDSpy8qSoiBL72zQ==
X-CSE-MsgGUID: 8FR323OjTQ6qTviWKbseBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73788899"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73788899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 20:45:41 -0800
X-CSE-ConnectionGUID: NVwWGEaqR7KH8/2QU17STQ==
X-CSE-MsgGUID: nutFxk9mStyPXR6DUM+cfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="204562858"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jan 2026 20:45:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgyBt-00000000LZ6-12Zo;
	Sat, 17 Jan 2026 04:45:37 +0000
Date: Sat, 17 Jan 2026 12:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:compound_head 2/15]
 include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared; did
 you mean 'memcmp'?
Message-ID: <202601171242.5uijKr0u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git compound_head
head:   b85ab3c6f9b0b85159a92143639da1947695d8da
commit: 44d8c0bdca357faa441b6a75b316a399a31b2bd1 [2/15] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260117/202601171242.5uijKr0u-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171242.5uijKr0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171242.5uijKr0u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/page.h:211,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:9:
   arch/riscv/include/asm/pgtable-64.h: In function 'pud_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:230:16: note: in expansion of macro 'pfn_to_page'
     230 |         return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
         |                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:18:34: note: each undeclared identifier is reported only once for each function it appears in
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:230:16: note: in expansion of macro 'pfn_to_page'
     230 |         return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
         |                ^~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h: In function 'p4d_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:335:16: note: in expansion of macro 'pfn_to_page'
     335 |         return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
         |                ^~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h: In function 'pgd_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable-64.h:392:16: note: in expansion of macro 'pfn_to_page'
     392 |         return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
         |                ^~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h: In function 'pmd_page':
>> include/asm-generic/memory_model.h:18:34: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/riscv/include/asm/pgtable.h:274:16: note: in expansion of macro 'pfn_to_page'
     274 |         return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
         |                ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +18 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  17  
67de648211fa04 Andy Whitcroft    2006-06-23 @18  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
67de648211fa04 Andy Whitcroft    2006-06-23  19  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  20  				 ARCH_PFN_OFFSET)
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  21  

:::::: The code at line 18 was first introduced by commit
:::::: 67de648211fa041fe08a0c25241a4980bbb90698 [PATCH] squash duplicate page_to_pfn and pfn_to_page

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
