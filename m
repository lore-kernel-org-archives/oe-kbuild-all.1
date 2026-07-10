Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142C71A268
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 01:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783646503; cv=none; b=LBh0K/+HtI9CaqmBXUYWzEo8jVd2Gq8+mpOOcRaNLFG3RsCQctU0n04vWVB4hjUAH5x6rFNkeY3rkkgmOScANx4cVUnIXh9dBZuu6WdrsgDcIuqhzHPYtr8oLNWwACMcGjE8hBA1TYx2cJNHDe920bQBPh+H2if1TaBCDIaVcJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783646503; c=relaxed/simple;
	bh=0IdgSURdKXr+oX0p64fAw04dLOkAEtit0ALsPMGKbhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AIrJqO107rGiQ0ZQAc/CO0WYBNr/o2JnTDaBC2KTf7aVWsXJTPPvsIXHDFJ+ymTjsgCO90rfS1p1+Wx3s/ZQkdHaXhFruZS2652PC9J4SnWtg8P/CyNlwawTKKiYmIKv8SZz8WuPM9lqVy1juawIaqtsKLIVHw7+SRNqFvEbNRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT6wP0MN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT6wP0MN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783646501; x=1815182501;
  h=date:from:to:cc:subject:message-id;
  bh=0IdgSURdKXr+oX0p64fAw04dLOkAEtit0ALsPMGKbhI=;
  b=HT6wP0MNivKoZYzJ4yIatB12RpF/FrM+T3qG+rlJnHTCV7iHMTFpGwIT
   7TtXTdqStLUrkol3yTKWOAo5vvMvTN2bG1na1OGj0IGkc2ePNXaC3gd94
   Jylu+GdQ25zgjiYOf5NySZNtIwnURE4v3YP+H926pKKxYXwxJleCYodn0
   4s2wh+RrpTH91gTVYdYkZDPw+1Va/5ZkGZeFWf5w+XQsmyYc4BA5I1NUn
   ldhiXFouQvSE1f8Nq9zie5oowT2VGWHP8qrborz4nnYdiRNQg/1RoLxim
   rMBg+Mu+4DfFoR7d1qohI0k2PocxZ+/dYljtIs/9/r6R/7+bzLw24RQxI
   A==;
X-CSE-ConnectionGUID: THJzHZTvSSqLDQA1B5Z8XQ==
X-CSE-MsgGUID: 4ybs6UURSD6lSXXqQhNwlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107142977"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107142977"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 18:21:40 -0700
X-CSE-ConnectionGUID: /t1Gu+8kS8uWz9PUYDcArA==
X-CSE-MsgGUID: 8/gONSfSQNey4oQtiWWr7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248377548"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2026 18:21:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whzvs-00000000ILr-19so;
	Fri, 10 Jul 2026 01:21:36 +0000
Date: Fri, 10 Jul 2026 09:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v4 43/58]
 arch/riscv/kernel/sbi_mpxy.c:287:5: error: call to undeclared function
 'memdesc_section'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607100920.4mX8HxCL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   077795f92007de48afcaeab45f9e9217537966d8
commit: d114c0cd70da2e1a20620050e0fa8e512b2d24c4 [43/58] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-r051-20260710 (https://download.01.org/0day-ci/archive/20260710/202607100920.4mX8HxCL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100920.4mX8HxCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100920.4mX8HxCL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/sbi_mpxy.c:287:5: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |                          page_to_phys(shmem_page), 0, 0, 0, 0, 0);
         |                          ^
   include/asm-generic/memory_model.h:85:37: note: expanded from macro 'page_to_phys'
      85 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   arch/riscv/kernel/sbi_mpxy.c:289:29: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     289 |                 free_pages((unsigned long)page_to_virt(shmem_page),
         |                                           ^
   arch/riscv/include/asm/page.h:160:41: note: expanded from macro 'page_to_virt'
     160 | #define page_to_virt(page)      (pfn_to_virt(page_to_pfn(page)))
         |                                              ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   arch/riscv/kernel/sbi_mpxy.c:294:16: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |         mpxy->shmem = page_to_virt(shmem_page);
         |                       ^
   arch/riscv/include/asm/page.h:160:41: note: expanded from macro 'page_to_virt'
     160 | #define page_to_virt(page)      (pfn_to_virt(page_to_pfn(page)))
         |                                              ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   arch/riscv/kernel/sbi_mpxy.c:295:26: error: call to undeclared function 'memdesc_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         mpxy->shmem_phys_addr = page_to_phys(shmem_page);
         |                                 ^
   include/asm-generic/memory_model.h:85:37: note: expanded from macro 'page_to_phys'
      85 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^
   include/asm-generic/memory_model.h:73:21: note: expanded from macro 'page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^
   include/asm-generic/memory_model.h:56:14: note: expanded from macro '__page_to_pfn'
      56 |         int __sec = memdesc_section(__pg->flags);               \
         |                     ^
   4 errors generated.


vim +/memdesc_section +287 arch/riscv/kernel/sbi_mpxy.c

   267	
   268	static int mpxy_setup_shmem(unsigned int cpu)
   269	{
   270		struct page *shmem_page;
   271		struct mpxy_local *mpxy;
   272		struct sbiret sret;
   273	
   274		mpxy = per_cpu_ptr(&mpxy_local, cpu);
   275		if (mpxy->shmem_active)
   276			return 0;
   277	
   278		shmem_page = alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(mpxy_shmem_size));
   279		if (!shmem_page)
   280			return -ENOMEM;
   281	
   282		/*
   283		 * Linux setup of shmem is done in mpxy OVERWRITE mode.
   284		 * flags[1:0] = 00b
   285		 */
   286		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SET_SHMEM,
 > 287				 page_to_phys(shmem_page), 0, 0, 0, 0, 0);
   288		if (sret.error) {
   289			free_pages((unsigned long)page_to_virt(shmem_page),
   290				   get_order(mpxy_shmem_size));
   291			return sbi_err_map_linux_errno(sret.error);
   292		}
   293	
   294		mpxy->shmem = page_to_virt(shmem_page);
   295		mpxy->shmem_phys_addr = page_to_phys(shmem_page);
   296		mpxy->shmem_active = true;
   297	
   298		return 0;
   299	}
   300	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
