Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF68BE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 01:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722387852; cv=none; b=TiLVFi6OPJc3SS8TIqGZchHr3TA9e/PBtNMWRAjRqGiiRaf/hVeSCqPpaJ4xXHI3ncX7ZlUz55fN36gnUqkIGk2mH//UAw0slbo25LqfNSsFCKiVi3+DnyVJIy7yFiRAKAKKbO/9MkSyfsMQaKdDFKBSRe6XRm4TZz8nzXQ69rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722387852; c=relaxed/simple;
	bh=kj5bwQzeBKE9CpSa+mNzKy2SIZBKPKtCuibdrtT1kHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHvFqCPuoeMAGF6s+LDg7esTSy7NlP4eStvjAUYfUlw1qll+rexYLOvWvwbSNWtlQfB/yv2vWis0TCyFaumfFLwZKMXg79Y3ddmTulu0tOPi/kuItlIkOWtbQpkjmfcDG1rzwqu8T+oUf7Celao02XO6IIad8lL+H/k6ivF5oNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOqFxI4G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOqFxI4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722387850; x=1753923850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kj5bwQzeBKE9CpSa+mNzKy2SIZBKPKtCuibdrtT1kHk=;
  b=HOqFxI4GCokBHHVs4t6+EzeroV0UYM293QhvCfvd9ie7wGy2S+ad7wen
   Tv7aMD9lqQp3wpoF6sio5sKy2vsIcdZzzPFzFlZbc9IwmEqmbuLID13sv
   wDXz3/mgk+WuMmVx3LP/y49Drn1UOqlM4ESYq3L/043K9Sr4RPo21ljfe
   Fxj8ZT7/JM3LlPk05VptW0/ZbYwV3u7XjzbIYKd6hLFyktaAVeFNSIFr8
   IGj3pE5eCTX/HP6uMkt9Ia/ZqT+gxJCsEdR/54wNNeKZ273jymIRaXsJC
   Z5Xqmlf6kyqit1yzV8orXg/AQh4PmVHzIKlH6NlBDGM/giPIFI5DisZ5t
   Q==;
X-CSE-ConnectionGUID: rnFEoJUyQriOIy2FErtA2w==
X-CSE-MsgGUID: OQJ6N5t2R4aaMxNLxgMxZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="45658484"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="45658484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 18:04:09 -0700
X-CSE-ConnectionGUID: jihIKJ60TDifl1nZDXzCCw==
X-CSE-MsgGUID: a4O4e/T2Tju9hIhlnsRSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54437199"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jul 2024 18:04:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYxl6-000tYo-2h;
	Wed, 31 Jul 2024 01:04:04 +0000
Date: Wed, 31 Jul 2024 09:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 15/17] include/linux/mm_types.h:509:41: error:
 passing argument 2 of 'pmd_set' from incompatible pointer type
Message-ID: <202407311151.72AedzJG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   e9eb6331a5abf0a71cf90c2d7d349fc32e12ae2e
commit: 91aef8fb59bf6f8e0c5966caac5813139c10e818 [15/17] mm/pgtable: pass ptdesc to pmd_populate
config: m68k-mvme147_defconfig (https://download.01.org/0day-ci/archive/20240731/202407311151.72AedzJG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311151.72AedzJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311151.72AedzJG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   arch/m68k/include/asm/motorola_pgalloc.h: In function 'pmd_populate':
>> include/linux/mm_types.h:509:41: error: passing argument 2 of 'pmd_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
     507 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     508 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     509 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   arch/m68k/include/asm/motorola_pgalloc.h:89:22: note: in expansion of macro 'ptdesc_page'
      89 |         pmd_set(pmd, ptdesc_page(page));
         |                      ^~~~~~~~~~~
   In file included from arch/m68k/include/asm/pgtable_mm.h:157,
                    from arch/m68k/include/asm/pgtable.h:10,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from include/linux/dax.h:6:
   arch/m68k/include/asm/motorola_pgtable.h:96:48: note: expected 'pte_t *' but argument is of type 'struct page *'
      96 | static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
         |                                         ~~~~~~~^~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from mm/memory.c:43:
   arch/m68k/include/asm/motorola_pgalloc.h: In function 'pmd_populate':
>> include/linux/mm_types.h:509:41: error: passing argument 2 of 'pmd_set' from incompatible pointer type [-Werror=incompatible-pointer-types]
     507 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     508 |         const struct ptdesc *:          (const struct page *)(pt),      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     509 |         struct ptdesc *:                (struct page *)(pt)))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct page *
   arch/m68k/include/asm/motorola_pgalloc.h:89:22: note: in expansion of macro 'ptdesc_page'
      89 |         pmd_set(pmd, ptdesc_page(page));
         |                      ^~~~~~~~~~~
   In file included from arch/m68k/include/asm/pgtable_mm.h:157,
                    from arch/m68k/include/asm/pgtable.h:10,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/memory.c:44:
   arch/m68k/include/asm/motorola_pgtable.h:96:48: note: expected 'pte_t *' but argument is of type 'struct page *'
      96 | static inline void pmd_set(pmd_t *pmdp, pte_t *ptep)
         |                                         ~~~~~~~^~~~
   mm/memory.c: In function '__pte_alloc':
   mm/memory.c:449:33: error: initialization of 'struct ptdesc *' from incompatible pointer type 'pgtable_t' {aka 'pte_t *'} [-Werror=incompatible-pointer-types]
     449 |         struct ptdesc *ptdesc = pte_alloc_one(mm);
         |                                 ^~~~~~~~~~~~~
   mm/memory.c: In function '__do_fault':
   include/linux/mm_types.h:507:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     507 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:4651:37: note: in expansion of macro 'ptdesc_page'
    4651 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault_around':
   include/linux/mm_types.h:507:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     507 | #define ptdesc_page(pt)                 (_Generic((pt),                 \
         |                                                   ^
   mm/memory.c:5014:37: note: in expansion of macro 'ptdesc_page'
    5014 |                 vmf->prealloc_pte = ptdesc_page(pte_alloc_one(vmf->vma->vm_mm));
         |                                     ^~~~~~~~~~~
   mm/memory.c: In function 'do_fault':
   include/linux/mm_types.h:515:51: error: '_Generic' selector of type 'pte_t *' is not compatible with any association
     515 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   mm/memory.c:5200:33: note: in expansion of macro 'page_ptdesc'
    5200 |                 pte_free(vm_mm, page_ptdesc(vmf->prealloc_pte));
         |                                 ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pmd_set +509 include/linux/mm_types.h

9a35de4ffc209b Vishal Moola (Oracle  2023-08-07  506) 
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  507) #define ptdesc_page(pt)			(_Generic((pt),			\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  508) 	const struct ptdesc *:		(const struct page *)(pt),	\
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07 @509) 	struct ptdesc *:		(struct page *)(pt)))
bf2d4334f72e4e Vishal Moola (Oracle  2023-08-07  510) 

:::::: The code at line 509 was first introduced by commit
:::::: bf2d4334f72e4e033166c5a3bf1331a7238eab9d mm: add utility functions for ptdesc

:::::: TO: Vishal Moola (Oracle) <vishal.moola@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
