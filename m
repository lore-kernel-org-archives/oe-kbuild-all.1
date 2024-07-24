Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F8215A848
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721831964; cv=none; b=eioz/lWPKSDB1te9fRputRu2nJgHQ24CiSqxcK6q540fZFV2WrU6tjdUT3dAcpX+1RXcUoN00HZ7/yMF0dfLo0XrCyxOH3431DKiQXUF0I8pwob6PBLLrEQOvgKPLzjJ3yLRthrfQ0qGob37JUDI9YlofZZzac2OBPCV3yg0rsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721831964; c=relaxed/simple;
	bh=f/V663D/gXkf/ESHaTDK5X+MluWrB7AAKnD/+TqurlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4J4R9EGU0DPI5Rt/YHJM6+MI1wcUQAfZNvmg3tTuAC//4W+2mUL1cXfDxT3rLbZX2EHbi45qnRf9lbDRzwS6xw/uv1BZiIYfXPrN/Z3ZRdivikCQrGtVc2zW1sSGxzdYYr8BM33+6vDAP6fqHvE4jHPyGvnRBcBJH18kzdzxVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMMXh0Cl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMMXh0Cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721831963; x=1753367963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f/V663D/gXkf/ESHaTDK5X+MluWrB7AAKnD/+TqurlQ=;
  b=cMMXh0Cl/BGoBmQO5T7IhN5+AXSdJwfluSwUh0bPWNTkc+H9RbKoEG55
   RyywqNHR5a1zpmzY/s36qDdDAA48R3ML0RdPqBvlJNPq8L8ss6VJAM9Ka
   VLTYwsUsq+kfcYKCa63EfgHk+tbPIge/zSpAd2UAq00kaTcs9sy9QdnLQ
   IrBtp6dF04YDHFdZyqd2qCf17wewJ1h7yrLwZrOoc/fEzxwElEw7HFnkH
   vUnTMOjzOGyi2csLZZgwRyj3lfpvqgbg9QIiFLK+QJ/MFjNMb22nNPEdN
   tke85W/sSIZKMsUa7hct1daYZowtmJmvqdvHAPspB+94x1RdLAJHmP0jT
   Q==;
X-CSE-ConnectionGUID: AglpBnw6TeCBoYCyvROQxQ==
X-CSE-MsgGUID: X2YJrhTrTLijBwtNmDZpVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19208769"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="19208769"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 07:39:22 -0700
X-CSE-ConnectionGUID: MrVNAxcySSebouqCq65clA==
X-CSE-MsgGUID: h8suCfDbRaKkHlT2NKz49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52477748"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Jul 2024 07:39:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWd9D-000n4q-0V;
	Wed, 24 Jul 2024 14:39:19 +0000
Date: Wed, 24 Jul 2024 22:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 30/41] include/linux/mm_types.h:510:51: error:
 '_Generic' selector of type 'pte_t *' is not compatible with any association
Message-ID: <202407242227.YfSuMzhv-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407242227.YfSuMzhv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242227.YfSuMzhv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242227.YfSuMzhv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function '__pte_alloc':
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
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
   In file included from arch/m68k/include/asm/pgalloc.h:16,
                    from mm/memory.c:86:
   arch/m68k/include/asm/motorola_pgalloc.h:42:61: note: expected 'pgtable_t' {aka 'pte_t *'} but argument is of type 'struct page *'
      42 | static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
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
