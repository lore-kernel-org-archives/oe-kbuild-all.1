Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D60013D60E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721828035; cv=none; b=oTGnTiD2CTdpqM8i33p1XjYBY2a3eMxZHsY5O3nR5tY9Vf5EFyuzfx6p1z3eQdyU25cDHpiB88ZQ/Dgwq0qNOoWcYDd+Pf4NxJuN8+quF+IBzN7XccYIuoaQAgTykUdIylg/+GsDcgayRsgJ5IC2QeH+IKxJ+45sMyx+YvIotCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721828035; c=relaxed/simple;
	bh=fV1MQXJO8AI/yu/FjqE3iFQEUthg6mwM3bWmeHdzBmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XoS2KhveWTUddEbzAOZksXvgl9/nA2nkMWJjWd8sD6J/Tu5QJ2JjXCSIVNSCS2iOMYmz/598KLqxZTj/zY0/REhrVZw4fjUhq56/5HNeE8BfSPKyVKDoAVQf762LqIbpuhkCwGHye5y+3vR/XRZDTa/Yz96+/Ai4D3uY8pC+rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SK2zsIwq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SK2zsIwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721828033; x=1753364033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fV1MQXJO8AI/yu/FjqE3iFQEUthg6mwM3bWmeHdzBmc=;
  b=SK2zsIwqJ148ZTIEIZTZ6epErZt0+xpT+npEoimK+jwY7SjPUJO4+4il
   DD5lLwgT67twAUlhhOe1vauWBKW1Wr7IltlagwV7TtHGHlHJFyMfIweUv
   0fRkJQiKJIvNGdar5YePHhC2gAJVkIo5ldqT//P1Bw6n31YkVtSBFkDgr
   zPgLxQYV5jYKn1DDKDqBUTP+pDM8Cm+7mYYp58fg1iFpkeourCgVpNp1X
   dPilumEB8dzv4EBr9BudslPHRYIygpnyBpCtPJ8PI+133i+asie249ZaS
   9qX2LMzvEAvUS/K+uMNvqwRaNwoXTLCSUNDGGq4fczcajmvqss0Vpnb6m
   w==;
X-CSE-ConnectionGUID: f3NqKi5cQjSTYmDiSwvf1A==
X-CSE-MsgGUID: XCZMKFFdTNeK0MXZVu6tmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19633424"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19633424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:33:53 -0700
X-CSE-ConnectionGUID: QdlFamRoTO+W1PDNpYtU7Q==
X-CSE-MsgGUID: B1gkWEhcTNOoOeL+2cjiug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="56733370"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2024 06:32:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWc6L-000n1W-1u;
	Wed, 24 Jul 2024 13:32:17 +0000
Date: Wed, 24 Jul 2024 21:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 30/41] include/linux/mm_types.h:510:51: error:
 '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not
 compatible with any association
Message-ID: <202407242100.Os4C3CaC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: 4c91e08c705e1b2ce46e4437d405b2170fa47aed [30/41] mm/memory: use ptdesc in __pte_alloc
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242100.Os4C3CaC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242100.Os4C3CaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242100.Os4C3CaC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function '__pte_alloc':
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/memory.c:448:33: note: in expansion of macro 'page_ptdesc'
     448 |         struct ptdesc *ptdesc = page_ptdesc(pte_alloc_one(mm));
         |                                 ^~~~~~~~~~~
   include/linux/mm_types.h:504:41: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     503 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     504 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   mm/memory.c:454:30: note: in expansion of macro 'ptdesc_page'
     454 |                 pte_free(mm, ptdesc_page(ptdesc));
         |                              ^~~~~~~~~~~
   In file included from mm/memory.c:86:
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'long unsigned int *'} but argument is of type 'struct page *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~


vim +510 include/linux/mm_types.h

9a35de4ffc209b Vishal Moola (Oracle  2023-08-07  501) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  502) #define ptdesc_page(pt)			(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  503) 	const struct ptdesc *:		(const struct page *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  504) 	struct ptdesc *:		(struct page *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  505) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  506) #define ptdesc_folio(pt)		(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  507) 	const struct ptdesc *:		(const struct folio *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  508) 	struct ptdesc *:		(struct folio *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  509) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07 @510) #define page_ptdesc(p)			(_Generic((p),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  511) 	const struct page *:		(const struct ptdesc *)(p),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  512) 	struct page *:			(struct ptdesc *)(p)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  513) 

:::::: The code at line 510 was first introduced by commit
:::::: bf2d4334f72e4e033166c5a3bf1331a7238eab9d mm: add utility functions for ptdesc

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
