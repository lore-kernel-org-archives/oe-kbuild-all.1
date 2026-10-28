Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201869;
	b=zUbfuvrGsGGU8luh6iUwrAytZYXo4XH1cyGCPsop4eCpb+GfzTN6qLoYa0ND04u0Dm0R
	 591KqZvCEqJktTFKk3Sy62vTW2LSmPeYrDaoQkgpT4l8cyYPtbGYVJjyvTsDrq4nV+L+Y
	 BCY5j+CmcgEx5y2Zxy0F9e69QRtr6dU47J/9AVirRtaIGprW/ACmQ6oQlZrAeRNT64j1S
	 mbeVX7BpbP77Q1R3oQppVwIcCA8q6HuGvddOrCv15afPe4JofQlYqsgx2o7ylUkFbTMlt
	 jvvLpXLStXPW724nwMHkEolDgD3LrsZqbn/TliyTaLQLME6BvHnKrnV5hCWL1raoMvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201869;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=R7+wx66B2/O1c5oup4OqCtpoWcbAk/zOcXrfTbsYPTY=;
	b=MOcqi0+YnitNnTN4UagFOdLXLyyCcxPIwUeCCsDm5pyRa+O5ECYMJ5hvBVJmKe/DW7sV
	 yYJcItLE+dBO135XUdE38tIDQvx7QCuUIHpNLaJezpdG6NMF0x/ytT59RpEAWpaWE1esj
	 2GfPrEyO2+TBDuPM+I3CBethJF3Ch6cP51eC5j3YyqUasS30ppCZ+5gmQl+BtSBClVsjD
	 2n+29p4/fY5/8IVzj1x5gEfmc2aHC2nsOAhizSqH987azcH8Avcpb093CRl+roTGyxtRp
	 8ELG9+L2fvYrPUuBA7m6mKdxiwl2YerbWusQjc1+WV5ZiLM20HGPQHrOmRfmKyMy8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqEmQ5+t;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D06606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqEmQ5+t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793201869; x=1824737869;
  h=date:from:to:cc:subject:message-id;
  bh=JgWhliU8pNjjM9bpeW3ichMo/7fDtYs3qpDpnqhnqD0=;
  b=lqEmQ5+t5SiVtNeqPeR48DaeX6Xg3xh4Rnoy3Zq92lFPwXpDOZKTiqD4
   nOWpGbYGn1/iSIsqE1H4n0XeQFYlqYhF5WVO37wGSgFduOmANCRlst4fK
   nY10+0sTw2x6IP0BMxE55zSeQvxPs0gU908E2MC/Ip8dXhUVxUO5maIrb
   DFSSXGGgUQu95uSQU4M81IV+rNawNGTCujnQ3I5dO3uwOdg+6yNQ0Ea8A
   sSmIIoHxBvcFgpmMKq7aSnSZP1FmjpNXRwdo/s9gn1RUcKqTWO+EwgDS5
   xJSay/Eo66eLV26PgrEjntQtxrqlYpWVOnR8g8yy2jPy1A5ijHS2Pi6rP
   g==;
X-CSE-ConnectionGUID: Ohg5cMBSRoWNE5La+WtUtg==
X-CSE-MsgGUID: obUmGujeTzm/JvWij00APg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2020434"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2020434"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 08:37:49 -0700
X-CSE-ConnectionGUID: oJSuyeH7RW2ZpCqNrvlQ/Q==
X-CSE-MsgGUID: O7vd1Gx1S/+BkdOo8r4Wew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4861841"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Oct 2026 08:37:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM5ii-00000000Yty-3s5X;
	Wed, 28 Oct 2026 15:37:44 +0000
Date: Wed, 28 Oct 2026 23:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 4/6] kernel/bpf/arena.c:319:3:
 error: call to undeclared function 'set_pte'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610282314.MeZiVy2g-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux arena-lazy-pte
head:   ce19d941e895a85d7dc1e7d49e6b90b1262f7e79
commit: 71ddc46be0a854bf80bacf6c588aefd04049b95e [4/6] bpf: arena: Add the scratch PTE table and PMD-level fault recovery
config: powerpc64-randconfig-1001-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282314.MeZiVy2g-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282314.MeZiVy2g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282314.MeZiVy2g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/arena.c:307:29: warning: comparison between pointer and integer ('const void *' and 'unsigned long') [-Wpointer-integer-compare]
     307 |         return pmd_page_vaddr(pmd) == (unsigned long)arena->scratch_pt;
         |                ~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/arena.c:319:3: error: call to undeclared function 'set_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     319 |                 set_pte(&arena->scratch_pt[i], pteval);
         |                 ^
   kernel/bpf/arena.c:319:3: note: did you mean 'set_ptes'?
   arch/powerpc/include/asm/pgtable.h:34:6: note: 'set_ptes' declared here
      34 | void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
         |      ^
   1 warning and 1 error generated.


vim +/set_pte +319 kernel/bpf/arena.c

   294	
   295	/*
   296	 * A PMD slot of the band is in one of three states: none, holding the arena's
   297	 * scratch table, or holding a real table. The scratch table maps every page of
   298	 * its slot to the scratch page. Kernel-fault recovery installs it into a none
   299	 * slot, which keeps that path allocation-free: it runs from any context,
   300	 * including NMI, under memory exhaustion and with the arena lock held, and must
   301	 * never oops. The price is that one stray kernel access to an empty slot now
   302	 * backs 2 MB with scratch rather than one page; nothing real can live there,
   303	 * because a real page is only ever installed into a real table.
   304	 */
   305	static bool arena_pmd_is_scratch(struct bpf_arena *arena, pmd_t pmd)
   306	{
 > 307		return pmd_page_vaddr(pmd) == (unsigned long)arena->scratch_pt;
   308	}
   309	
   310	static int arena_alloc_scratch_pt(struct bpf_arena *arena)
   311	{
   312		pte_t pteval = mk_pte(arena->scratch_page, PAGE_KERNEL);
   313		unsigned long i;
   314	
   315		arena->scratch_pt = arena_alloc_pt(arena, true);
   316		if (!arena->scratch_pt)
   317			return -ENOMEM;
   318		for (i = 0; i < PTRS_PER_PTE; i++)
 > 319			set_pte(&arena->scratch_pt[i], pteval);
   320		/*
   321		 * The table is published much later, by the atomic PMD install in the
   322		 * fault handler, which orders these stores before the entry becomes
   323		 * visible. Make that explicit here, where the table is filled.
   324		 */
   325		smp_wmb();
   326		return 0;
   327	}
   328	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
