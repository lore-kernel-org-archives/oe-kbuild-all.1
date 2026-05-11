Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906B378806
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778471218; cv=none; b=D2DWhJgGkiaJqhAgwvH4tEVicQOHUBRlXKUPJ/jfNeqD+Agk5EaWpdm9uQULxFnOXKPohrsRfThvWmoYyDISQmnzj1rE+THI9/VdqZene5XPd5vhzDkjiZoh/r2Ju6Jn5jJVaqrULdtT4WF2qbZ8vb55clyd1lVYYnnSK9PFrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778471218; c=relaxed/simple;
	bh=hD+zvl/sfPKu0cRe/CKUt/BApGY0pYadzt3eIKfsZnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MaUE5TUI47NuY0g7kvkBzt5bJwsfL2vvhiJZ23tyrXuo8zi3gueD7iy9uB+3/z6GMbKeN/+GRsF0Icaa+7SLJCWeD0CwMhlBsL+8MoILHRFcOL5S/zbZV6cmekhJhW9dsTT6jvp2LkDy3HLd2MUAsEUAAtj0QG4RTQYjjE/IrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5uSCxr0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5uSCxr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778471216; x=1810007216;
  h=date:from:to:cc:subject:message-id;
  bh=hD+zvl/sfPKu0cRe/CKUt/BApGY0pYadzt3eIKfsZnM=;
  b=m5uSCxr0P+YauaT4OJtRwbf0heW9NieK1ievTucwhqvIiOuB92V9JH8I
   Y8LWVBTmD/Yvtqkj289yMfnEIdN9/Wa28uyXubraAeV1qdD2odnRheaxA
   9VV/Pe2AsgZQBvgwkv2k67lFaVDlDbY2gEPNxidQh/h6S1TeXBp37HKS3
   kCzKr/I8rkXDj4T48+AHxsUsmJDWotROfAwhk+eD40R5Th6T1Xy0wVR8X
   yYlV978eVhA4MvXwEPKeaMP+zeEUJ3I4+SMsshr1AbeRZ90k8tPVZm7+Q
   f+l0dFx4He7NEKPPPsXehpGjFn4EkKryluO0Q3MzfzoVY9/j5k7LAb9Mo
   g==;
X-CSE-ConnectionGUID: ZXfN521QTTekbhjFVvzMLw==
X-CSE-MsgGUID: rReY3DIEQi+I2zfFzjF74w==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="96918129"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="96918129"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 20:46:55 -0700
X-CSE-ConnectionGUID: JSrbhA4uTM6niG57ga5ASQ==
X-CSE-MsgGUID: RzOzL5I0Q5KP9n9pCnHifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="236361294"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 May 2026 20:46:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMHbW-000000007s5-45Ta;
	Mon, 11 May 2026 03:46:50 +0000
Date: Mon, 11 May 2026 05:46:02 +0200
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/sparse-vmemmap.c:192:57: error: 'GFP_PGTABLE_KERNEL'
 undeclared
Message-ID: <202605110509.Rqu6RwCj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/mm-Introduce-kpkeys/20260511-035515
head:   0d3293fffa052760cd8744b91e08b4c258894d35
commit: 183bd16e8357a68038cb9c4f9156fba842ad8942 mm: kpkeys: Protect vmemmap page tables
date:   8 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605110509.Rqu6RwCj-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110509.Rqu6RwCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110509.Rqu6RwCj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/workqueue.h:9,
                    from ./include/linux/mm_types.h:19,
                    from ./include/linux/mmzone.h:22,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/mm.h:8,
                    from mm/sparse-vmemmap.c:21:
   mm/sparse-vmemmap.c: In function 'vmemmap_alloc_pgtable':
>> mm/sparse-vmemmap.c:192:57: error: 'GFP_PGTABLE_KERNEL' undeclared (first use in this function)
     192 |                 struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
         |                                                         ^~~~~~~~~~~~~~~~~~
   ./include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   ./include/linux/mm.h:3661:33: note: in expansion of macro 'alloc_hooks'
    3661 | #define pagetable_alloc(...)    alloc_hooks(pagetable_alloc_noprof(__VA_ARGS__))
         |                                 ^~~~~~~~~~~
   mm/sparse-vmemmap.c:192:41: note: in expansion of macro 'pagetable_alloc'
     192 |                 struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
         |                                         ^~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:192:57: note: each undeclared identifier is reported only once for each function it appears in
     192 |                 struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
         |                                                         ^~~~~~~~~~~~~~~~~~
   ./include/linux/alloc_tag.h:253:16: note: in definition of macro 'alloc_hooks_tag'
     253 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   ./include/linux/mm.h:3661:33: note: in expansion of macro 'alloc_hooks'
    3661 | #define pagetable_alloc(...)    alloc_hooks(pagetable_alloc_noprof(__VA_ARGS__))
         |                                 ^~~~~~~~~~~
   mm/sparse-vmemmap.c:192:41: note: in expansion of macro 'pagetable_alloc'
     192 |                 struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
         |                                         ^~~~~~~~~~~~~~~
>> ./include/linux/alloc_tag.h:265:1: error: initialization of 'struct ptdesc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     265 | ({                                                                      \
         | ^
   ./include/linux/mm.h:3661:33: note: in expansion of macro 'alloc_hooks'
    3661 | #define pagetable_alloc(...)    alloc_hooks(pagetable_alloc_noprof(__VA_ARGS__))
         |                                 ^~~~~~~~~~~
   mm/sparse-vmemmap.c:192:41: note: in expansion of macro 'pagetable_alloc'
     192 |                 struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
         |                                         ^~~~~~~~~~~~~~~


vim +/GFP_PGTABLE_KERNEL +192 mm/sparse-vmemmap.c

   186	
   187	static void * __meminit vmemmap_alloc_pgtable(int node)
   188	{
   189		void *p;
   190	
   191		if (slab_is_available()) {
 > 192			struct ptdesc *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL, 0);
   193	
   194			return ptdesc ? ptdesc_address(ptdesc) : NULL;
   195		}
   196	
   197		if (kpkeys_hardened_pgtables_early_enabled()) {
   198			phys_addr_t phys = kpkeys_physmem_pgtable_alloc();
   199	
   200			p = phys ? phys_to_virt(phys) : NULL;
   201		} else {
   202			p = __earlyonly_bootmem_alloc(node, PAGE_SIZE, PAGE_SIZE,
   203						      __pa(MAX_DMA_ADDRESS));
   204		}
   205	
   206		if (!p)
   207			return NULL;
   208		memset(p, 0, PAGE_SIZE);
   209	
   210		return p;
   211	}
   212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
