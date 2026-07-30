Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02D331EA8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785380036; cv=none; b=VTgSvUD6N2NFnlmyc4u4B8gThDBqAU2j7WvLejaE4JURfB9jYlUXyZmFTQYzJMclJqg3AwdMeuUMG5NYBjL2xZTPg75atBiQlPrKBsgwy4k8QfoU1lY5jo13pnf8q4bMjqi9m24e+07ZZAdPvkphAAd3ifghDcn1u1Mgk3I1BQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785380036; c=relaxed/simple;
	bh=DiE9dlZ7cZC3a12t4XjgMU4SfjkbzbErjLBlJjH2g2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BvPYZxNk24VwurwFrUFvsDtfg5LSyPqcsmklBPA4gRuGb0racbT8sf6RhNuIqBxLgMPUboKQ5LiI9Ref8rKfVSH9AfGn9lmPf0dhyAdJZ72t+uEiOtlkx1Q+WDICz7ptErarRadqQZnINYI6WhKfC1DoutqHRpofKWmFX2ciWLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gq4OFBqr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gq4OFBqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785380035; x=1816916035;
  h=date:from:to:cc:subject:message-id;
  bh=DiE9dlZ7cZC3a12t4XjgMU4SfjkbzbErjLBlJjH2g2U=;
  b=gq4OFBqrOHQ7rVZeFkVqnlB5gv8kDAJMhbl36P4P0dkFnaVc+1tt74yu
   RInHSQMQ3IhigNGcGvGMW350x/vmkYBpHj3d7e42Pd2oJ686YKwVEx/0o
   ag2uvr/T00FhH8ZTp01LvTSBHd46AgFuOvqw/nHCXiCCBVnVmC6O0ujzt
   MrQ9B3wSNSkKb5j+NNo1auBQuKH/dWKdscsiAxct7XAHJJNipPqhjkgf1
   d4ns2N9GtZ1cx0pxL2NX/YfFoFi0UkeRKDaemBd69rkgvyzlhmZDdD63X
   iA95sPZzbsdLuaUM8PmImGBhcl4y7q2UhY9I1r/rRcvI37yKq7m0aCupe
   Q==;
X-CSE-ConnectionGUID: MSeAS9fRS+Sc0P7NZSNmxQ==
X-CSE-MsgGUID: GEHWkKETTV6Iv1vgd5iqeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96657939"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="96657939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:53:54 -0700
X-CSE-ConnectionGUID: v0aPepdgQ4yB1nMWokOAxA==
X-CSE-MsgGUID: PMAokxzITq6YF6A23O6x5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="258394002"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2026 19:53:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpGtr-00000000fxC-1Oho;
	Thu, 30 Jul 2026 02:53:40 +0000
Date: Thu, 30 Jul 2026 10:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [linux-next:master 7971/10444]
 include/linux/pageblock-flags.h:66:53: error: 'HPAGE_PMD_ORDER' undeclared
Message-ID: <202607301045.WpMtpkDq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   78bc8af4affb9a732504eb22eeac7d1e50883853
commit: f476132a8999edf2225185652dce98a42347e8c9 [7971/10444] mm/mm_init: don't rely on memblock to get KHO scratch migratetype
config: x86_64-randconfig-123-20260729 (https://download.01.org/0day-ci/archive/20260730/202607301045.WpMtpkDq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301045.WpMtpkDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301045.WpMtpkDq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/nodemask.h:92,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from arch/x86/include/asm/special_insns.h:10,
                    from arch/x86/include/asm/io.h:45,
                    from include/linux/io.h:12,
                    from mm/memfd_luo.c:76:
   include/linux/kexec_handover.h: In function 'kho_scratch_migratetype':
>> include/linux/pageblock-flags.h:66:53: error: 'HPAGE_PMD_ORDER' undeclared (first use in this function)
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   include/linux/minmax.h:83:27: note: in definition of macro '__cmp'
      83 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                           ^
   include/linux/pageblock-flags.h:66:33: note: in expansion of macro 'MIN_T'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                 ^~~~~
   include/linux/pageblock-flags.h:75:41: note: in expansion of macro 'pageblock_order'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/kexec_handover.h:47:48: note: in expansion of macro 'pageblock_nr_pages'
      47 |         if (kho_scratch_overlap(PFN_PHYS(pfn), pageblock_nr_pages << PAGE_SHIFT))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/pageblock-flags.h:66:53: note: each undeclared identifier is reported only once for each function it appears in
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                                     ^~~~~~~~~~~~~~~
   include/linux/minmax.h:83:27: note: in definition of macro '__cmp'
      83 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                           ^
   include/linux/pageblock-flags.h:66:33: note: in expansion of macro 'MIN_T'
      66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
         |                                 ^~~~~
   include/linux/pageblock-flags.h:75:41: note: in expansion of macro 'pageblock_order'
      75 | #define pageblock_nr_pages      (1UL << pageblock_order)
         |                                         ^~~~~~~~~~~~~~~
   include/linux/kexec_handover.h:47:48: note: in expansion of macro 'pageblock_nr_pages'
      47 |         if (kho_scratch_overlap(PFN_PHYS(pfn), pageblock_nr_pages << PAGE_SHIFT))
         |                                                ^~~~~~~~~~~~~~~~~~


vim +/HPAGE_PMD_ORDER +66 include/linux/pageblock-flags.h

72801513b2bfb6 Baolin Wang 2024-04-05  65  
3800d55250976b Zi Yan      2025-06-04 @66  #define pageblock_order		MIN_T(unsigned int, HPAGE_PMD_ORDER, PAGE_BLOCK_MAX_ORDER)
72801513b2bfb6 Baolin Wang 2024-04-05  67  

:::::: The code at line 66 was first introduced by commit
:::::: 3800d55250976b7a4bd42c255b267bc242669709 mm: rename CONFIG_PAGE_BLOCK_ORDER to CONFIG_PAGE_BLOCK_MAX_ORDER

:::::: TO: Zi Yan <ziy@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
