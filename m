Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9CA130A47
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721488591; cv=none; b=Xw1C7WZEk79og2VprsSnvx6YMRnh+kyeeYhT/dwAu9BtEJGlSxMn+qvQx9Cv8g3rZaNwNvh/HQ11vSuvcSXGw3UyXqfFB4XOPOTKqjIDwAHpa8TmKPRnravcE+bBWOw4RTWl7fSNoos7oyamfKGG20Ya2YzkNA6ZoZH+n3PDnJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721488591; c=relaxed/simple;
	bh=kfJhmIRALU8QYxEfFhTI427PXPyLkPMXQmlkVpyhi9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ge0jQGY9mnZzrKJiWPmbGRuEHxpNvuZtRSerQPLbx/vQ5eg6BalmE8gssVRY6DTVuevgMTy+ZT+oU4yXiXk4+r+oVPZbx42cfCOafWMhUvmPzW3dFXNE/fZi87QdkruE4KFjLfuFSlfytNszO3oYdpEE9slIej+RXXNOulYXmZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxWRKtIY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxWRKtIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721488591; x=1753024591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kfJhmIRALU8QYxEfFhTI427PXPyLkPMXQmlkVpyhi9c=;
  b=cxWRKtIYuxPlc1BNNQdzzKgYvDUKF6a/pIM8NBMg2HRNMPcRXw/MjNLg
   07NftOsh/4zFA1NefPN7ut55ZB2aEy4hfk5H+Fj3uXkBGOHN47qcaXLTf
   FSxmbJ5LujdwmciF1kmmpa5VoJVaLOMSeeETWWdi4JgCdVZG3ntuL0Xvt
   EL4Ee6Sr3S7RMMhsXlQNyghODW4fpI9oqlQAZXsQr1w5NUCaXMcjoyla5
   2cWIC2QaQHguqG6W+3bG9pxBAwkyZVE97GAE8sHb+4cxyFJVXn/UooDH0
   m1iQJQLkNGdhQfH+HJtFcU4AQRv+CR1qorbhGprU648LmBxKdbzCcTvOV
   g==;
X-CSE-ConnectionGUID: XTKQQ2mfTWG0lV9jGyZ29g==
X-CSE-MsgGUID: iiywosD8TbGTLJEk3IWZBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19063707"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="19063707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:16:28 -0700
X-CSE-ConnectionGUID: VzM4JlvDTZWLc97a4gbDIw==
X-CSE-MsgGUID: RxWx443JQoK57ytA/cQfOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="56531460"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jul 2024 08:16:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVBou-000jKW-1C;
	Sat, 20 Jul 2024 15:16:24 +0000
Date: Sat, 20 Jul 2024 23:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 41/42] include/linux/mm_types.h:510:51: error:
 '_Generic' selector of type 'struct ptdesc *' is not compatible with any
 association
Message-ID: <202407202319.sCU7QUdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 934c05f8c50fed91942a8aa9db46a0feae38594c [41/42] use ptdesc in free_pte_range and pte_free_tlb series functions
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407202319.sCU7QUdF-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202319.sCU7QUdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202319.sCU7QUdF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'free_pte_range':
   mm/memory.c:192:32: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'pfn_ptdesc'? [-Wimplicit-function-declaration]
     192 |         struct ptdesc *token = pmd_ptdesc(pmd);
         |                                ^~~~~~~~~~
         |                                pfn_ptdesc
   mm/memory.c:192:32: error: initialization of 'struct ptdesc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/openrisc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'struct ptdesc *' is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   arch/openrisc/include/asm/pgalloc.h:71:28: note: in expansion of macro 'page_ptdesc'
      71 |         pagetable_pte_dtor(page_ptdesc(pte));                   \
         |                            ^~~~~~~~~~~
   include/asm-generic/tlb.h:706:17: note: in expansion of macro '__pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'struct ptdesc *' is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   arch/openrisc/include/asm/pgalloc.h:72:40: note: in expansion of macro 'page_ptdesc'
      72 |         tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
         |                                        ^~~~~~~~~~~
   include/asm-generic/tlb.h:706:17: note: in expansion of macro '__pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~
   mm/memory.c: In function 'pmd_install':
   mm/memory.c:440:39: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
   In file included from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20:
   arch/openrisc/include/asm/pgalloc.h:32:46: note: expected 'struct page *' but argument is of type 'struct ptdesc *'
      32 |                                 struct page *pte)
         |                                 ~~~~~~~~~~~~~^~~


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
