Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5FA2F44
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688808327; x=1720344327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyFgA5E3ykwOYZ3pfSIHmgYcRAtm60MdPcRRxkGW43U=;
  b=OEC6wS5vdiAtVFoLa8Rgg6VERYBwn14wI97SDLPTzHydxsqvzMqW3+YD
   JDHTGb2Ip5r5OXf7xnLiPfzKx+Aj5C3n6DWZJr83GeKIu5wkLUdA/LgI6
   xrrUwGRDoNlbZXLBhTXcIT0xaDNaPHZ4kGQtB0wjyDkDPpPlEYFcSltM4
   jaMng9KIF6pcLFOzz3G2Sp2Svu3vzISALKbmYnKiiyz4WWx7dKzHqF3PA
   hYlZedug2KHtp0yCEOtnw9nnxdj+2da0UeJEXrusL4JyUJ7JWQWYOuga7
   YnzOFS1+56akf5Gccbfzw+pd8LH9EzvXNnF1vWCQWAJ668/PkNBbjl2aQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="364090026"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="364090026"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 02:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="697473651"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="697473651"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jul 2023 02:25:25 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI4Bw-0002f2-1T;
	Sat, 08 Jul 2023 09:25:24 +0000
Date: Sat, 8 Jul 2023 17:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 18/38] arch/nios2/mm/cacheflush.c:93:55:
 error: 'n' undeclared; did you mean 'nr'?
Message-ID: <202307081753.vpwrce9x-lkp@intel.com>
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
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230708/202307081753.vpwrce9x-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081753.vpwrce9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307081753.vpwrce9x-lkp@intel.com/

Note: the willy-pagecache/set_ptes HEAD 22fbf134ccc05ced10ef4638c97474c2cdd64ff8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/nios2/mm/cacheflush.c: In function 'flush_aliases':
   arch/nios2/mm/cacheflush.c:92:39: warning: suggest parentheses around '+' inside '<<' [-Wparentheses]
      92 |                 start = vma->vm_start + (pgoff - vma->vm_pgoff) << PAGE_SHIFT;
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/nios2/mm/cacheflush.c:93:55: error: 'n' undeclared (first use in this function); did you mean 'nr'?
      93 |                 flush_cache_range(vma, start, start + n * PAGE_SIZE);
         |                                                       ^
         |                                                       nr
   arch/nios2/mm/cacheflush.c:93:55: note: each undeclared identifier is reported only once for each function it appears in
   arch/nios2/mm/cacheflush.c: At top level:
   arch/nios2/mm/cacheflush.c:162:6: warning: no previous prototype for '__flush_dcache_folio' [-Wmissing-prototypes]
     162 | void __flush_dcache_folio(struct address_space *mapping, struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +93 arch/nios2/mm/cacheflush.c

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
    92			start = vma->vm_start + (pgoff - vma->vm_pgoff) << PAGE_SHIFT;
  > 93			flush_cache_range(vma, start, start + n * PAGE_SIZE);
    94		}
    95		flush_dcache_mmap_unlock(mapping);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
