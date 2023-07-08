Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC41855
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688806526; x=1720342526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8nHOj9CXVU2KroETkVCD/WhHKciD2B15exKd+q5Ijk=;
  b=VACxhdNaAj7qvuE3guNrKi2cF1a4Ao75l+XkLRK/3y3BB67NAOlIM9B3
   D6t9uITfsiSjESTjb7SudWqr5CfmMTiqidH0sAny6nZgrtfVAMNqeAMaG
   86XVGF/JcLJUsMmSEIm8tBFkAjB6P1VitfPhXgyImLmKelKsUalwWRmlu
   4bD3OK9FkS2GTwe+CCCwsgu5KYs56ruPiv03BVxIoypjHArJguQ/7yvmi
   4EYP+Pwvnp0qoMGXSTMzMPXiPgBYhPqS2+fF9LXgEB97ENusZw6i5dpL9
   GcddO/JI7iGhyRmJa3y5SbufFiXRG50SSljVFkqBzXu/ZUvk1j2lyfPvQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394820463"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="394820463"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 01:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="810290332"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="810290332"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2023 01:55:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI3it-0002dy-30;
	Sat, 08 Jul 2023 08:55:23 +0000
Date: Sat, 8 Jul 2023 16:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 18/38] arch/nios2/mm/cacheflush.c:92:39:
 warning: suggest parentheses around '+' inside '<<'
Message-ID: <202307081602.CVdNM41g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   22fbf134ccc05ced10ef4638c97474c2cdd64ff8
commit: 887ff59d60d248d8ea816d162179a7ad314da838 [18/38] nios2: Implement the new page table range API
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230708/202307081602.CVdNM41g-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081602.CVdNM41g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307081602.CVdNM41g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/nios2/mm/cacheflush.c: In function 'flush_aliases':
>> arch/nios2/mm/cacheflush.c:92:39: warning: suggest parentheses around '+' inside '<<' [-Wparentheses]
      92 |                 start = vma->vm_start + (pgoff - vma->vm_pgoff) << PAGE_SHIFT;
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/nios2/mm/cacheflush.c:93:55: error: 'n' undeclared (first use in this function); did you mean 'nr'?
      93 |                 flush_cache_range(vma, start, start + n * PAGE_SIZE);
         |                                                       ^
         |                                                       nr
   arch/nios2/mm/cacheflush.c:93:55: note: each undeclared identifier is reported only once for each function it appears in
   arch/nios2/mm/cacheflush.c: At top level:
   arch/nios2/mm/cacheflush.c:162:6: warning: no previous prototype for '__flush_dcache_folio' [-Wmissing-prototypes]
     162 | void __flush_dcache_folio(struct address_space *mapping, struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +92 arch/nios2/mm/cacheflush.c

    73	
    74	static void flush_aliases(struct address_space *mapping, struct folio *folio)
    75	{
    76		struct mm_struct *mm = current->active_mm;
    77		struct vm_area_struct *vma;
    78		pgoff_t pgoff;
    79		unsigned long nr = folio_nr_pages(folio);
    80	
    81		pgoff = folio->index;
    82	
    83		flush_dcache_mmap_lock(mapping);
    84		vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff + nr - 1) {
    85			unsigned long start;
    86	
    87			if (vma->vm_mm != mm)
    88				continue;
    89			if (!(vma->vm_flags & VM_MAYSHARE))
    90				continue;
    91	
  > 92			start = vma->vm_start + (pgoff - vma->vm_pgoff) << PAGE_SHIFT;
    93			flush_cache_range(vma, start, start + n * PAGE_SIZE);
    94		}
    95		flush_dcache_mmap_unlock(mapping);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
