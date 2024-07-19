Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DD5A35
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721432153; cv=none; b=nHXElFyRR/56chCo404N1UTk/EA/CY1QV7j+2QMVPLbL5iA5CcXIx1iAnyHxtoeUd3VFymUrJM6MHz3t+4SI2eIRAvaT8x0l9Pd9cdZmcBCdqTmb4qwtP5paMBY7OOuycI8F/YaG4U3kQcVkZFThIOPqjj3UVU9Pk/1YKkl+2yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721432153; c=relaxed/simple;
	bh=bYhQtOwceJLof454t1JRSYXD9ZzJ1rNmfHOfANBYYL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rz6L7nIFjbvCJINqeTqcYtMxscT6ZmNUq9v6dD+sXPhnRaD2vZO+ANNxLX12upO9t5ckKNtQCQmJn3GnmpWO7w+PtD85Xjtjr0BDx3YJR82llp4dd9Q+5X9a4P0zjL1w+sb9KwuQSRGhmTHMKiZtviEHJjNjVbm9+3syLR3XkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpZNC+VB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpZNC+VB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721432152; x=1752968152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYhQtOwceJLof454t1JRSYXD9ZzJ1rNmfHOfANBYYL8=;
  b=FpZNC+VBTPi/J0YzqsLY6+HB4CxZsdfaSC9ghTJ/QcTgNTG4hc7Dxgxd
   4jFAATjWkwP7fgcuFBGlpg28P6OI8obRL0eqtsnXJa0Z28hAojCnzsd0p
   tNu9pTIzIY9Pu/919TLCaBeaXyGOLgQ9V/cSHO6Ge6z61hav+j3fTIsW0
   6ZqE683T3mJ0xJwwYH30dlUteDxQAG44MESZhUUJxbZKecv6C5Sf91w35
   ltV+AXsjHw6/PAZmFhnqNzRCHyCPTLWHXhW0+N6zxPwlPEoZ8/Cd124Tv
   x7J3f6XCwfA8TRYv0Jo0J+djUrB6VBFzJSBOIfazSLMN2Gg5olDVTe7VQ
   Q==;
X-CSE-ConnectionGUID: 9mXSg9Y8Qbmmq2A0pXaYHQ==
X-CSE-MsgGUID: J1ZNvqGuREKeBHTy4Xdxmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30460260"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="30460260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 16:35:51 -0700
X-CSE-ConnectionGUID: +N1KO0N1S3u9K7cDEgsPDg==
X-CSE-MsgGUID: aDaOa+SuQ/mC2naZ8S0LTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="51166559"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jul 2024 16:35:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUx8d-000ig6-0S;
	Fri, 19 Jul 2024 23:35:47 +0000
Date: Sat, 20 Jul 2024 07:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable3 30/35] include/linux/mm_types.h:510:51: error:
 '_Generic' selector of type 'pte_t *' {aka 'long unsigned int *'} is not
 compatible with any association
Message-ID: <202407200744.QaflUxxs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable3
head:   3fb6eb9b0272c82ed231fdf2a20f6b6d265c4259
commit: f6ba7ce983a499c1f4c6066fdf135e5a2b464054 [30/35] mm/memory: use ptdesc in __pte_alloc
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407200744.QaflUxxs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200744.QaflUxxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200744.QaflUxxs-lkp@intel.com/

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
