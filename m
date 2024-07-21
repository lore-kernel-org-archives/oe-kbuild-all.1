Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC172BB13
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721562260; cv=none; b=agxg31MaucWxprTc43KRXkFpP8vTwsp2eY3h2Odda7sYlBMqCAGG1NLLtjD56dTHl3Ue/YhRh1/W9HKtGLJFEuXc/wDs3OvK55x0h6B/TKJX7p2TDkIJtRl1ujMNV4G8ySuTHhJgGd7GnIT0Ct2f3o7Lf/ES5Jm/eJvY8/6Bb6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721562260; c=relaxed/simple;
	bh=7tVr12Cl0inbaKwu9XyH7xQ97i6C5GWbgvXwB8dRVpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCmCju5AvJVgn2iPjbgp7LdSP/JOrgjtGfJJCiWApG8uZdqwpRtiiFYvPDUChvjgJwPfAeJXRfrAGM4tmVeCGaKlPWLo8ApeV7mVM3RNHyjLUQnpLqnLpNNPPBxZ71W6RpRGMjGO7Kz0LU5GmGDRJx2/jDfFdxYofPDZINlb/Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aImc2nkW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aImc2nkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721562259; x=1753098259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tVr12Cl0inbaKwu9XyH7xQ97i6C5GWbgvXwB8dRVpQ=;
  b=aImc2nkWdfm7yI6z5j1Rn2452xAZ01doip4p8T5WEkzkvQfSzFVUxiqi
   diUx/LBw9aUMRgcYTPnsezZM538P+oCNeCXAOC59yV3xENAUDsb4P96QL
   zH5hKwkfBHkNBVjCdX7ijtBouMVk+ZXpagkxOr2VJmxGj4ojst8xze8cg
   6w5K1x//OeRJE/HTD3DnQxmPY8pgJdJAH2NmjnildMSbGi4orvjltyLN5
   d1QJ+YvhuTecmKBcWiWaeQ0YUHTIdFuZTkdnvCYW8zFNngftVJo/yfOoY
   SUe0b1y9XAYIzrJF8ZWsrgdCgiqN+OnJfWUIk2bUMJveKTMk5F38HBNDV
   w==;
X-CSE-ConnectionGUID: 2Ubk1g94SXSx0im/9K/lXg==
X-CSE-MsgGUID: d2YmE+n2QgyeFeRTQPo8mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="22999539"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="22999539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 04:44:18 -0700
X-CSE-ConnectionGUID: /vjKdN7pTQGYIIh2uQf4Pw==
X-CSE-MsgGUID: Plk5+l9iTkCqLrkyAoP9Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51857628"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2024 04:44:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVUz8-000kEs-1C;
	Sun, 21 Jul 2024 11:44:14 +0000
Date: Sun, 21 Jul 2024 19:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 31/43] mm/memory.c:448:33: error: initialization
 of 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t
 *'}
Message-ID: <202407211929.yQRUGmt5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6c298a18633e397b8be4d6f48fc8cd1f860dd896
commit: 53c2d4c2474a65f7230634db0fcb86df8bc9250e [31/43] mm/pgtable: fully use ptdesc in pte_alloc_one series functions
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240721/202407211929.yQRUGmt5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211929.yQRUGmt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211929.yQRUGmt5-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__pte_alloc':
>> mm/memory.c:448:33: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Wincompatible-pointer-types]
     448 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
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
   mm/memory.c: In function '__do_fault':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:4650:37: note: in expansion of macro 'ptdesc_page'
    4650 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault_around':
   include/linux/mm_types.h:502:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     502 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:5013:37: note: in expansion of macro 'ptdesc_page'
    5013 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ^~~~~~~~~~~


vim +448 mm/memory.c

   445	
   446	int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
   447	{
 > 448		struct ptdesc *ptdesc = pte_alloc_one(mm);
   449		if (!ptdesc)
   450			return -ENOMEM;
   451	
   452		pmd_install(mm, pmd, (pgtable_t *)&ptdesc);
   453		if (ptdesc)
   454			pte_free(mm, ptdesc_page(ptdesc));
   455		return 0;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
