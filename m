Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7D158DB2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721828729; cv=none; b=smsQiRJrQYBGHto/PB/Vtwo4jcWsO2cJwUPXpmgGqqFe6pELwVlJlinH+hPuTfM+NvSncsiroZyyIFqi3BfOCHeOOW6yOynZD5DoRai65UfW+suZDIwgi69nuGf6pUMaHvwhuvpxgSRIW7zTDzLrJXxF9SZFeotiVOSZarpt+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721828729; c=relaxed/simple;
	bh=roRPAbS/1YQjiCH8WK8QVJ3T2z8Pj2Zy0ZmLiwJnrkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2DXAxChAnTQpUQe0Q4XXlk8eVC1lUa2aDahOhstQyDf7jAEfVXMF1Z+y2kgMZjftRdhXhkuFUEdWtD6STqW9cWzLJq8RL8SmaRZ8Vtlv15JvwQ5U4iAvzwwNhVDfauQ7a8YRUJhcBigBzeV7c1QtErbDdrBrCq+dQQElsfPVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfYDa1bi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfYDa1bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721828728; x=1753364728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=roRPAbS/1YQjiCH8WK8QVJ3T2z8Pj2Zy0ZmLiwJnrkQ=;
  b=RfYDa1biibCUhpEkn/b8oVOgUczCR39NzgvKpuIkaKRkh3IF8NhimTaO
   dDOiHueHidKcgG2m+y7kGjj2Ms0NeigTmF6r/vLKeLnZYonhny2zmwZw3
   E1uuaFZKamKK14uC3X5f9EALfJhc8LZteJszmbzxwCOZQ0xxwOAW2hsas
   0wiOUyLGd1drwJBqpdgdMdpzPidUZBGpZd+SxFr2X5XDqEIMoE5iwtrQW
   FH02Jpf4zVoKn1odEZCOxgLoRjFYPJy9FPgkZkKhqA0BAaUDjxPG0rGnL
   9pgYWhPm5gnrHArazvYbLFG6E4NKTj9CugGW4MJRYcgQF4yLuRBSvEJln
   Q==;
X-CSE-ConnectionGUID: sR0WqCRvR9OOhHMDSCU0dQ==
X-CSE-MsgGUID: HMQBJ4i/Tc+tNXkZd5/KFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30897340"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30897340"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:45:24 -0700
X-CSE-ConnectionGUID: eEkOjT7qTXiCGR7SdyP6TA==
X-CSE-MsgGUID: UJNRSmZUStaUx+N28SrDeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52284227"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2024 06:45:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWcIw-000n2Q-0B;
	Wed, 24 Jul 2024 13:45:18 +0000
Date: Wed, 24 Jul 2024 21:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 37/41] include/linux/mm_types.h:512:41: error:
 passing argument 3 of 'pmd_populate' from incompatible pointer type
Message-ID: <202407242136.DN0aW8Ti-lkp@intel.com>
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
commit: 5f711d4ecc7f0a6cf15ad4c1bd3eba8224c7dca0 [37/41] mm/pgtable: introduce ptdesc_pfn and pass ptdesc to pmd_populate
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242136.DN0aW8Ti-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242136.DN0aW8Ti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242136.DN0aW8Ti-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/tlb.h:32,
                    from arch/riscv/include/asm/pgalloc.h:12,
                    from mm/memory.c:86:
   mm/memory.c: In function 'free_pte_range':
   mm/memory.c:194:27: error: passing argument 2 of '__pte_free_tlb' from incompatible pointer type [-Wincompatible-pointer-types]
     194 |         pte_free_tlb(tlb, token, addr);
         |                           ^~~~~
         |                           |
         |                           struct ptdesc *
   include/asm-generic/tlb.h:706:37: note: in definition of macro 'pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                                     ^~~~
   arch/riscv/include/asm/pgalloc.h:186:69: note: expected 'pgtable_t' {aka 'struct page *'} but argument is of type 'struct ptdesc *'
     186 | static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
         |                                                           ~~~~~~~~~~^~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   mm/memory.c: In function 'pmd_install':
>> include/linux/mm_types.h:512:41: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     511 |         const struct page *:            (const struct ptdesc *)(p),     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     512 |         struct page *:                  (struct ptdesc *)(p)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct ptdesc *
   mm/memory.c:440:39: note: in expansion of macro 'page_ptdesc'
     440 |                 pmd_populate(mm, pmd, page_ptdesc(*pte));
         |                                       ^~~~~~~~~~~
   arch/riscv/include/asm/pgalloc.h:36:31: note: expected 'pgtable_t' {aka 'struct page *'} but argument is of type 'struct ptdesc *'
      36 |         pmd_t *pmd, pgtable_t pte)
         |                     ~~~~~~~~~~^~~
--
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/mremap.c:11:
   mm/mremap.c: In function 'move_normal_pmd':
>> include/linux/mm_types.h:512:41: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     511 |         const struct page *:            (const struct ptdesc *)(p),     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     512 |         struct page *:                  (struct ptdesc *)(p)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct ptdesc *
   mm/mremap.c:286:35: note: in expansion of macro 'page_ptdesc'
     286 |         pmd_populate(mm, new_pmd, page_ptdesc(pmd_pgtable(pmd)));
         |                                   ^~~~~~~~~~~
   In file included from mm/mremap.c:31:
   arch/riscv/include/asm/pgalloc.h:36:31: note: expected 'pgtable_t' {aka 'struct page *'} but argument is of type 'struct ptdesc *'
      36 |         pmd_t *pmd, pgtable_t pte)
         |                     ~~~~~~~~~~^~~


vim +/pmd_populate +512 include/linux/mm_types.h

9a35de4ffc209b Vishal Moola (Oracle  2023-08-07  501) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  502) #define ptdesc_page(pt)			(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  503) 	const struct ptdesc *:		(const struct page *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  504) 	struct ptdesc *:		(struct page *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  505) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  506) #define ptdesc_folio(pt)		(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  507) 	const struct ptdesc *:		(const struct folio *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  508) 	struct ptdesc *:		(struct folio *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  509) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  510) #define page_ptdesc(p)			(_Generic((p),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  511) 	const struct page *:		(const struct ptdesc *)(p),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07 @512) 	struct page *:			(struct ptdesc *)(p)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  513) 

:::::: The code at line 512 was first introduced by commit
:::::: bf2d4334f72e4e033166c5a3bf1331a7238eab9d mm: add utility functions for ptdesc

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
