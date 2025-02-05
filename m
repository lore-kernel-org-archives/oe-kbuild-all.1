Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36886192D97
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768370; cv=none; b=noQRAiG52jqPB6U+tPxr7DY+J2d7PCEFmU28jYEH6tpXZpwNZFZzkEFL4VVNW+itFklV4/oGBXPdsRynkUWuLkbDTsdUM0r7J3SHPuSSLvcSmXZYSHmBHdSU3eBcTbWrjYGjqifEqzVE+N4GIYZ/wsZ7GXfMi1v8w2U6QPdmUcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768370; c=relaxed/simple;
	bh=YwUMFkow64c9LO3fV/GC/kVxPHnED67Wh1t9/3AFoag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N5AnAhDAOSF79Q9U0pEjHemotneBQD8GEEJzfL62AH/v4+hKGU2TRVbozi7D80VL+ogZE3qiUsTBb3Q18VD5DQorVbFQDu+MWA21OLro+zQszKcknKnEJN7G85g1NaFLlNdeXpzRQP9fwYxyBBuejSt3cH5iBbz5SMa6fxqpP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VA+0zKHR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VA+0zKHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738768369; x=1770304369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwUMFkow64c9LO3fV/GC/kVxPHnED67Wh1t9/3AFoag=;
  b=VA+0zKHRQUeLKZ8nAjZyLNMgk3LnlVPMUYKSvqmP20E7s8CAS6KLj03E
   iX2x3nUol4ypYAPg8P8fZ+A8o1YULoOKKWTWt7JodxMy71TjfVWzkNBe5
   YQP17R1aF9mMNZEjPvp9wKq0BueRA1nSiI/CNpl0G2aper2v8QD0LhAEX
   lxLOQU4yQewsdECTsq96C4SjT616bbHfYuCv9VHjb+CP2mQdldgzQk7u5
   hNzgrm/8VUU+eCd7FnsHCMC0p0Z4qCXuUXAgyvvG/9dGl9JnHSXgY+MEp
   yFznzn54VTHsdEaD1wWGnq+yansKrzvSlhZ+Z0LTeQmvBdgiYqK5QVmGS
   Q==;
X-CSE-ConnectionGUID: 3Wn/NGvcTTuu0J6L3H3kmw==
X-CSE-MsgGUID: UJ6RMcRJQyGW02EQaA08dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39221648"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39221648"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 07:12:48 -0800
X-CSE-ConnectionGUID: UqHobEmiSSG2zv06GU8dRQ==
X-CSE-MsgGUID: lrujc6+mSlGR8iTxZWxfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110921661"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 07:12:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfh51-000vMN-2F;
	Wed, 05 Feb 2025 15:12:43 +0000
Date: Wed, 5 Feb 2025 23:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 15/22]
 arch/csky/include/asm/page.h:49:29: warning: 'pteval.pte_low' is used
 uninitialized
Message-ID: <202502052326.PRdZ9gL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   ddc42f5fd72394838fc2d280ff2486ccb7178b9a
commit: 9440e0949cbc08fc248f6eacf05e4d47c48f1294 [15/22] mm/damon: handle device-exclusive entries correctly in damon_folio_mkold_one()
config: csky-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052326.PRdZ9gL2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052326.PRdZ9gL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052326.PRdZ9gL2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/mmu_notifier.h:5,
                    from mm/damon/ops-common.c:8:
   mm/damon/ops-common.c: In function 'damon_ptep_mkold':
>> arch/csky/include/asm/page.h:49:29: warning: 'pteval.pte_low' is used uninitialized [-Wuninitialized]
      49 | #define pte_val(x)      ((x).pte_low)
         |                         ~~~~^~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   arch/csky/include/asm/pgtable.h:37:34: note: in expansion of macro 'pte_val'
      37 | #define pte_present(pte)        (pte_val(pte) & _PAGE_PRESENT)
         |                                  ^~~~~~~
   mm/damon/ops-common.c:49:20: note: in expansion of macro 'pte_present'
      49 |         if (likely(pte_present(pteval)))
         |                    ^~~~~~~~~~~
   mm/damon/ops-common.c:47:15: note: 'pteval' declared here
      47 |         pte_t pteval;
         |               ^~~~~~
>> arch/csky/include/asm/pgtable.h:37:47: warning: 'pteval.pte_low' is used uninitialized [-Wuninitialized]
      37 | #define pte_present(pte)        (pte_val(pte) & _PAGE_PRESENT)
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   mm/damon/ops-common.c:49:20: note: in expansion of macro 'pte_present'
      49 |         if (likely(pte_present(pteval)))
         |                    ^~~~~~~~~~~
   mm/damon/ops-common.c:47:15: note: 'pteval.pte_low' was declared here
      47 |         pte_t pteval;
         |               ^~~~~~


vim +49 arch/csky/include/asm/page.h

013de2d6671d89 Guo Ren 2018-09-05  47  
013de2d6671d89 Guo Ren 2018-09-05  48  typedef struct { unsigned long pte_low; } pte_t;
013de2d6671d89 Guo Ren 2018-09-05 @49  #define pte_val(x)	((x).pte_low)
013de2d6671d89 Guo Ren 2018-09-05  50  

:::::: The code at line 49 was first introduced by commit
:::::: 013de2d6671d89de3397904749c86a69ac0686f7 csky: MMU and page table management

:::::: TO: Guo Ren <ren_guo@c-sky.com>
:::::: CC: Guo Ren <ren_guo@c-sky.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
