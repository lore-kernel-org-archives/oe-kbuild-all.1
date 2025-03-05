Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802B8BA2E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 00:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741133433; cv=none; b=d99fynI4sbQomm6RtqpoI73NLxnj5n/mLjRsnM4nLQuBzANi8ul9CY8qoahvV/Pnind+JPp086NtEuPocpxUM+l5pgSJ4tGLeAJ3IuCVDTDPSG+EkzEhs51U8WugDefw3HjGDniOT1nTgbnNPNEaaRXp2SBgJy2uBZA71Fl247g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741133433; c=relaxed/simple;
	bh=iaLjXgtxM5OLaD9TbupHuqRwwqyRlqFP5wiWEUtjs0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGBU2crQclsxLVonH0/3cqhQOqZgsgQUiQGa9AzIo+qPt3WYdKWCZjJ0Wb7dpCqxsJ2p+VBpb+fctXdyBABEtm/ldxLitgbdyU21t9QNwpJV+i1RGMhy7I1k+G4NxQLQ+qVZ90I3/fG3+N7AldkZPGwt5Y8pNhmrt1uS7O5u2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=if/cqR29; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="if/cqR29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741133432; x=1772669432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaLjXgtxM5OLaD9TbupHuqRwwqyRlqFP5wiWEUtjs0k=;
  b=if/cqR291nyWI1gRrjlzm+TDgeMOdpkzcdj95z1gcWsd6aHzqpTKiTiL
   IHm1h87bYFOaTziWa85aR554E8Hl+FAL8xT8qPJeGbdSqI7XbLX633qSR
   tMo0bJDR6LqU7TqIZX4v9SKDE7vvi4zIaNAsrHAopWnswBnAFV/Ap+45Q
   i0z070/HYLsCRZ162XVQmVETVBHNJgR1brFnkFdihiQLXoxW/xAl453c8
   Z+I27L/BCsTHFXMZEhhkY1rR19UPe/zc3u6lEOUJ4XYNN3Aq3GPzwIdcX
   vY5aRCxVCfCorNKfGzrnlJDXkvmMNP4/vi06dyoCmOJ/pGEmUDFy0BG2n
   w==;
X-CSE-ConnectionGUID: RWpMKwV+TnGrttHjDDISVw==
X-CSE-MsgGUID: QnPLzWCpQ4yXNwsW56Ou5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42274412"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="42274412"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 16:10:31 -0800
X-CSE-ConnectionGUID: oszCOutvSsCX+50DQ6GKRA==
X-CSE-MsgGUID: dR4++EP4TweUeDHfRoj21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="118353219"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2025 16:10:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpcLD-000KOs-22;
	Wed, 05 Mar 2025 00:10:27 +0000
Date: Wed, 5 Mar 2025 08:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mm_init/mem_init/v0.1 11/13] arch/xtensa/mm/init.c:69:20:
 warning: 'print_vm_layout' defined but not used
Message-ID: <202503050854.VfNDi7wa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm_init/mem_init/v0.1
head:   55eb95380e481029d5e7b8b442b0fdfbe79a9d3e
commit: 724bede84c7c7988d48b9d91c1af825fda39babe [11/13] dev: xtensa: split out print_vm_layout
config: xtensa-randconfig-001-20250305 (https://download.01.org/0day-ci/archive/20250305/202503050854.VfNDi7wa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050854.VfNDi7wa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050854.VfNDi7wa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/xtensa/mm/init.c:69:20: warning: 'print_vm_layout' defined but not used [-Wunused-function]
      69 | static void __init print_vm_layout(void)
         |                    ^~~~~~~~~~~~~~~


vim +/print_vm_layout +69 arch/xtensa/mm/init.c

    68	
  > 69	static void __init print_vm_layout(void)
    70	{
    71		pr_info("virtual kernel memory layout:\n"
    72	#ifdef CONFIG_KASAN
    73			"    kasan   : 0x%08lx - 0x%08lx  (%5lu MB)\n"
    74	#endif
    75	#ifdef CONFIG_MMU
    76			"    vmalloc : 0x%08lx - 0x%08lx  (%5lu MB)\n"
    77	#endif
    78	#ifdef CONFIG_HIGHMEM
    79			"    pkmap   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
    80			"    fixmap  : 0x%08lx - 0x%08lx  (%5lu kB)\n"
    81	#endif
    82			"    lowmem  : 0x%08lx - 0x%08lx  (%5lu MB)\n"
    83			"    .text   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
    84			"    .rodata : 0x%08lx - 0x%08lx  (%5lu kB)\n"
    85			"    .data   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
    86			"    .init   : 0x%08lx - 0x%08lx  (%5lu kB)\n"
    87			"    .bss    : 0x%08lx - 0x%08lx  (%5lu kB)\n",
    88	#ifdef CONFIG_KASAN
    89			KASAN_SHADOW_START, KASAN_SHADOW_START + KASAN_SHADOW_SIZE,
    90			KASAN_SHADOW_SIZE >> 20,
    91	#endif
    92	#ifdef CONFIG_MMU
    93			VMALLOC_START, VMALLOC_END,
    94			(VMALLOC_END - VMALLOC_START) >> 20,
    95	#ifdef CONFIG_HIGHMEM
    96			PKMAP_BASE, PKMAP_BASE + LAST_PKMAP * PAGE_SIZE,
    97			(LAST_PKMAP*PAGE_SIZE) >> 10,
    98			FIXADDR_START, FIXADDR_END,
    99			(FIXADDR_END - FIXADDR_START) >> 10,
   100	#endif
   101			PAGE_OFFSET, PAGE_OFFSET +
   102			(max_low_pfn - min_low_pfn) * PAGE_SIZE,
   103	#else
   104			min_low_pfn * PAGE_SIZE, max_low_pfn * PAGE_SIZE,
   105	#endif
   106			((max_low_pfn - min_low_pfn) * PAGE_SIZE) >> 20,
   107			(unsigned long)_text, (unsigned long)_etext,
   108			(unsigned long)(_etext - _text) >> 10,
   109			(unsigned long)__start_rodata, (unsigned long)__end_rodata,
   110			(unsigned long)(__end_rodata - __start_rodata) >> 10,
   111			(unsigned long)_sdata, (unsigned long)_edata,
   112			(unsigned long)(_edata - _sdata) >> 10,
   113			(unsigned long)__init_begin, (unsigned long)__init_end,
   114			(unsigned long)(__init_end - __init_begin) >> 10,
   115			(unsigned long)__bss_start, (unsigned long)__bss_stop,
   116			(unsigned long)(__bss_stop - __bss_start) >> 10);
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
