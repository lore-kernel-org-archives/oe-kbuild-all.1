Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187A5239E9A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769092328; cv=none; b=XO96PuO+EPJj65kKxejAt8HlQq50oQ0SHYD+mHulxK3qtpGkJyX3g0KlRt0QhwgHkkuRwsJAmekk/uTuxdT+Q33kDgG2Aup1W+wavnOTQUC0HdJVPxSUeE1nUlbm8F/HhItB3yv7JW6pZmLM5OJ49Q96gYBlO5KcCkfK1DpXNuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769092328; c=relaxed/simple;
	bh=NaV9XOtY6yrjAVzsm2lWcc7qBn2DzRfMWEsJw9enLWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tWYc6OOEJN1j15SU4Kp/ATmIo3FPcQdyCAXfZMFcyEwlcFv0kiVoNWtGWPOHKVTmA7nUZjYE0puDZ/2ZnE5cJAlU2ASWzZ0avG2KNf2k5lwrp1eZwKi8eKdx/TYlI3e+Q4mZO0U1DI2yO0cOjlpfJYMfRmPaehVIlhdTMqv3IJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5bwskxB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5bwskxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769092327; x=1800628327;
  h=date:from:to:cc:subject:message-id;
  bh=NaV9XOtY6yrjAVzsm2lWcc7qBn2DzRfMWEsJw9enLWE=;
  b=H5bwskxB7qbMDb+YnkkERbt4Vzw5Uucc3o+O9u1rme28Rz693b5TvqjI
   Q4aXoWCTP+Qkhh139CUg9fVxL3M9/338V42MYPLdk/OIvZU4olhzJWJLX
   A7XZMgAAz5ZE4292mD7AbaICkhgBntVnZhJqFbriXUCF+n0I6n63SvHwQ
   Q4JatVXutb6By5MBN5j6TbpRPfqgcRQ8k3YCmQ9VsvfmpJfOJePJkUxgE
   zonHI0wWVeaoBSr1kB20Wmk+tCYslqJRVwyvgCiethbecgCSPJgZwFgCG
   5/Ag0tIDA3wqsrEbRQTSdwny9Dg9Xgj33vOD4CnPP9l2jraKx+TO9IL4t
   w==;
X-CSE-ConnectionGUID: X9QpTw+YST2ZNyPpubLnew==
X-CSE-MsgGUID: 1v6+hDNcS4qpRoEFhoyw6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="72927479"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="72927479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 06:32:07 -0800
X-CSE-ConnectionGUID: MW+vJpAiRtODmgnt6Jdplg==
X-CSE-MsgGUID: pbBF/mpPRnCdd8oAnttDDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="237416359"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jan 2026 06:32:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vivj8-00000000Sv7-1dbS;
	Thu, 22 Jan 2026 14:32:02 +0000
Date: Thu, 22 Jan 2026 22:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:zero-page/v0.1 1/1] kernel/vmcore_info.c:169:27:
 error: 'mem_map' undeclared; did you mean 'memcmp'?
Message-ID: <202601222257.ZF4jS89o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git zero-page/v0.1
head:   874cd89abfe244f25de9694abe17c68fd93c0f91
commit: 874cd89abfe244f25de9694abe17c68fd93c0f91 [1/1] dev: arch, mm: consolidate empty_zero_page
config: i386-buildonly-randconfig-002-20260122 (https://download.01.org/0day-ci/archive/20260122/202601222257.ZF4jS89o-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222257.ZF4jS89o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222257.ZF4jS89o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kexec.h:18,
                    from kernel/vmcore_info.c:12:
   kernel/vmcore_info.c: In function 'crash_save_vmcoreinfo_init':
>> kernel/vmcore_info.c:169:27: error: 'mem_map' undeclared (first use in this function); did you mean 'memcmp'?
     169 |         VMCOREINFO_SYMBOL(mem_map);
         |                           ^~~~~~~
   include/linux/vmcore_info.h:52:74: note: in definition of macro 'VMCOREINFO_SYMBOL'
      52 |         vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)&name)
         |                                                                          ^~~~
   kernel/vmcore_info.c:169:27: note: each undeclared identifier is reported only once for each function it appears in
     169 |         VMCOREINFO_SYMBOL(mem_map);
         |                           ^~~~~~~
   include/linux/vmcore_info.h:52:74: note: in definition of macro 'VMCOREINFO_SYMBOL'
      52 |         vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned long)&name)
         |                                                                          ^~~~


vim +169 kernel/vmcore_info.c

3fa805c37dd4d3 Breno Leitao            2025-10-10  137  
443cbaf9e2fdbe Baoquan He              2024-01-24  138  static int __init crash_save_vmcoreinfo_init(void)
443cbaf9e2fdbe Baoquan He              2024-01-24  139  {
443cbaf9e2fdbe Baoquan He              2024-01-24  140  	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);
443cbaf9e2fdbe Baoquan He              2024-01-24  141  	if (!vmcoreinfo_data) {
443cbaf9e2fdbe Baoquan He              2024-01-24  142  		pr_warn("Memory allocation for vmcoreinfo_data failed\n");
443cbaf9e2fdbe Baoquan He              2024-01-24  143  		return -ENOMEM;
443cbaf9e2fdbe Baoquan He              2024-01-24  144  	}
443cbaf9e2fdbe Baoquan He              2024-01-24  145  
443cbaf9e2fdbe Baoquan He              2024-01-24  146  	vmcoreinfo_note = alloc_pages_exact(VMCOREINFO_NOTE_SIZE,
443cbaf9e2fdbe Baoquan He              2024-01-24  147  						GFP_KERNEL | __GFP_ZERO);
443cbaf9e2fdbe Baoquan He              2024-01-24  148  	if (!vmcoreinfo_note) {
443cbaf9e2fdbe Baoquan He              2024-01-24  149  		free_page((unsigned long)vmcoreinfo_data);
443cbaf9e2fdbe Baoquan He              2024-01-24  150  		vmcoreinfo_data = NULL;
443cbaf9e2fdbe Baoquan He              2024-01-24  151  		pr_warn("Memory allocation for vmcoreinfo_note failed\n");
443cbaf9e2fdbe Baoquan He              2024-01-24  152  		return -ENOMEM;
443cbaf9e2fdbe Baoquan He              2024-01-24  153  	}
443cbaf9e2fdbe Baoquan He              2024-01-24  154  
443cbaf9e2fdbe Baoquan He              2024-01-24  155  	VMCOREINFO_OSRELEASE(init_uts_ns.name.release);
443cbaf9e2fdbe Baoquan He              2024-01-24  156  	VMCOREINFO_BUILD_ID();
443cbaf9e2fdbe Baoquan He              2024-01-24  157  	VMCOREINFO_PAGESIZE(PAGE_SIZE);
443cbaf9e2fdbe Baoquan He              2024-01-24  158  
443cbaf9e2fdbe Baoquan He              2024-01-24  159  	VMCOREINFO_SYMBOL(init_uts_ns);
443cbaf9e2fdbe Baoquan He              2024-01-24  160  	VMCOREINFO_OFFSET(uts_namespace, name);
443cbaf9e2fdbe Baoquan He              2024-01-24  161  	VMCOREINFO_SYMBOL(node_online_map);
443cbaf9e2fdbe Baoquan He              2024-01-24  162  #ifdef CONFIG_MMU
443cbaf9e2fdbe Baoquan He              2024-01-24  163  	VMCOREINFO_SYMBOL_ARRAY(swapper_pg_dir);
443cbaf9e2fdbe Baoquan He              2024-01-24  164  #endif
443cbaf9e2fdbe Baoquan He              2024-01-24  165  	VMCOREINFO_SYMBOL(_stext);
443cbaf9e2fdbe Baoquan He              2024-01-24  166  	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", (unsigned long) VMALLOC_START);
443cbaf9e2fdbe Baoquan He              2024-01-24  167  
443cbaf9e2fdbe Baoquan He              2024-01-24  168  #ifndef CONFIG_NUMA
443cbaf9e2fdbe Baoquan He              2024-01-24 @169  	VMCOREINFO_SYMBOL(mem_map);
443cbaf9e2fdbe Baoquan He              2024-01-24  170  	VMCOREINFO_SYMBOL(contig_page_data);
443cbaf9e2fdbe Baoquan He              2024-01-24  171  #endif
d3246b6ee42a15 Huang Shijie            2024-02-27  172  #ifdef CONFIG_SPARSEMEM_VMEMMAP
d3246b6ee42a15 Huang Shijie            2024-02-27  173  	VMCOREINFO_SYMBOL_ARRAY(vmemmap);
d3246b6ee42a15 Huang Shijie            2024-02-27  174  #endif
443cbaf9e2fdbe Baoquan He              2024-01-24  175  #ifdef CONFIG_SPARSEMEM
443cbaf9e2fdbe Baoquan He              2024-01-24  176  	VMCOREINFO_SYMBOL_ARRAY(mem_section);
443cbaf9e2fdbe Baoquan He              2024-01-24  177  	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
443cbaf9e2fdbe Baoquan He              2024-01-24  178  	VMCOREINFO_STRUCT_SIZE(mem_section);
443cbaf9e2fdbe Baoquan He              2024-01-24  179  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
443cbaf9e2fdbe Baoquan He              2024-01-24  180  	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
443cbaf9e2fdbe Baoquan He              2024-01-24  181  	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
443cbaf9e2fdbe Baoquan He              2024-01-24  182  #endif
443cbaf9e2fdbe Baoquan He              2024-01-24  183  	VMCOREINFO_STRUCT_SIZE(page);
443cbaf9e2fdbe Baoquan He              2024-01-24  184  	VMCOREINFO_STRUCT_SIZE(pglist_data);
443cbaf9e2fdbe Baoquan He              2024-01-24  185  	VMCOREINFO_STRUCT_SIZE(zone);
443cbaf9e2fdbe Baoquan He              2024-01-24  186  	VMCOREINFO_STRUCT_SIZE(free_area);
443cbaf9e2fdbe Baoquan He              2024-01-24  187  	VMCOREINFO_STRUCT_SIZE(list_head);
443cbaf9e2fdbe Baoquan He              2024-01-24  188  	VMCOREINFO_SIZE(nodemask_t);
443cbaf9e2fdbe Baoquan He              2024-01-24  189  	VMCOREINFO_OFFSET(page, flags);
443cbaf9e2fdbe Baoquan He              2024-01-24  190  	VMCOREINFO_OFFSET(page, _refcount);
443cbaf9e2fdbe Baoquan He              2024-01-24  191  	VMCOREINFO_OFFSET(page, mapping);
443cbaf9e2fdbe Baoquan He              2024-01-24  192  	VMCOREINFO_OFFSET(page, lru);
443cbaf9e2fdbe Baoquan He              2024-01-24  193  	VMCOREINFO_OFFSET(page, _mapcount);
443cbaf9e2fdbe Baoquan He              2024-01-24  194  	VMCOREINFO_OFFSET(page, private);
443cbaf9e2fdbe Baoquan He              2024-01-24  195  	VMCOREINFO_OFFSET(page, compound_head);
443cbaf9e2fdbe Baoquan He              2024-01-24  196  	VMCOREINFO_OFFSET(pglist_data, node_zones);
443cbaf9e2fdbe Baoquan He              2024-01-24  197  	VMCOREINFO_OFFSET(pglist_data, nr_zones);
443cbaf9e2fdbe Baoquan He              2024-01-24  198  #ifdef CONFIG_FLATMEM
443cbaf9e2fdbe Baoquan He              2024-01-24  199  	VMCOREINFO_OFFSET(pglist_data, node_mem_map);
443cbaf9e2fdbe Baoquan He              2024-01-24  200  #endif
443cbaf9e2fdbe Baoquan He              2024-01-24  201  	VMCOREINFO_OFFSET(pglist_data, node_start_pfn);
443cbaf9e2fdbe Baoquan He              2024-01-24  202  	VMCOREINFO_OFFSET(pglist_data, node_spanned_pages);
443cbaf9e2fdbe Baoquan He              2024-01-24  203  	VMCOREINFO_OFFSET(pglist_data, node_id);
443cbaf9e2fdbe Baoquan He              2024-01-24  204  	VMCOREINFO_OFFSET(zone, free_area);
443cbaf9e2fdbe Baoquan He              2024-01-24  205  	VMCOREINFO_OFFSET(zone, vm_stat);
443cbaf9e2fdbe Baoquan He              2024-01-24  206  	VMCOREINFO_OFFSET(zone, spanned_pages);
443cbaf9e2fdbe Baoquan He              2024-01-24  207  	VMCOREINFO_OFFSET(free_area, free_list);
443cbaf9e2fdbe Baoquan He              2024-01-24  208  	VMCOREINFO_OFFSET(list_head, next);
443cbaf9e2fdbe Baoquan He              2024-01-24  209  	VMCOREINFO_OFFSET(list_head, prev);
443cbaf9e2fdbe Baoquan He              2024-01-24  210  	VMCOREINFO_LENGTH(zone.free_area, NR_PAGE_ORDERS);
443cbaf9e2fdbe Baoquan He              2024-01-24  211  	log_buf_vmcoreinfo_setup();
443cbaf9e2fdbe Baoquan He              2024-01-24  212  	VMCOREINFO_LENGTH(free_area.free_list, MIGRATE_TYPES);
443cbaf9e2fdbe Baoquan He              2024-01-24  213  	VMCOREINFO_NUMBER(NR_FREE_PAGES);
443cbaf9e2fdbe Baoquan He              2024-01-24  214  	VMCOREINFO_NUMBER(PG_lru);
443cbaf9e2fdbe Baoquan He              2024-01-24  215  	VMCOREINFO_NUMBER(PG_private);
443cbaf9e2fdbe Baoquan He              2024-01-24  216  	VMCOREINFO_NUMBER(PG_swapcache);
443cbaf9e2fdbe Baoquan He              2024-01-24  217  	VMCOREINFO_NUMBER(PG_swapbacked);
4ffca5a96678c9 Matthew Wilcox (Oracle  2024-08-21  218) #define PAGE_SLAB_MAPCOUNT_VALUE	(PGTY_slab << 24)
46df8e73a4a3f1 Matthew Wilcox (Oracle  2024-03-21  219) 	VMCOREINFO_NUMBER(PAGE_SLAB_MAPCOUNT_VALUE);
443cbaf9e2fdbe Baoquan He              2024-01-24  220  #ifdef CONFIG_MEMORY_FAILURE
443cbaf9e2fdbe Baoquan He              2024-01-24  221  	VMCOREINFO_NUMBER(PG_hwpoison);
443cbaf9e2fdbe Baoquan He              2024-01-24  222  #endif
443cbaf9e2fdbe Baoquan He              2024-01-24  223  	VMCOREINFO_NUMBER(PG_head_mask);
4ffca5a96678c9 Matthew Wilcox (Oracle  2024-08-21  224) #define PAGE_BUDDY_MAPCOUNT_VALUE	(PGTY_buddy << 24)
443cbaf9e2fdbe Baoquan He              2024-01-24  225  	VMCOREINFO_NUMBER(PAGE_BUDDY_MAPCOUNT_VALUE);
4ffca5a96678c9 Matthew Wilcox (Oracle  2024-08-21  226) #define PAGE_HUGETLB_MAPCOUNT_VALUE	(PGTY_hugetlb << 24)
d99e3140a4d33e Matthew Wilcox (Oracle  2024-03-21  227) 	VMCOREINFO_NUMBER(PAGE_HUGETLB_MAPCOUNT_VALUE);
4ffca5a96678c9 Matthew Wilcox (Oracle  2024-08-21  228) #define PAGE_OFFLINE_MAPCOUNT_VALUE	(PGTY_offline << 24)
443cbaf9e2fdbe Baoquan He              2024-01-24  229  	VMCOREINFO_NUMBER(PAGE_OFFLINE_MAPCOUNT_VALUE);
247021624a99a3 Zhiquan Li              2025-04-03  230  #ifdef CONFIG_UNACCEPTED_MEMORY
247021624a99a3 Zhiquan Li              2025-04-03  231  #define PAGE_UNACCEPTED_MAPCOUNT_VALUE	(PGTY_unaccepted << 24)
247021624a99a3 Zhiquan Li              2025-04-03  232  	VMCOREINFO_NUMBER(PAGE_UNACCEPTED_MAPCOUNT_VALUE);
247021624a99a3 Zhiquan Li              2025-04-03  233  #endif
443cbaf9e2fdbe Baoquan He              2024-01-24  234  

:::::: The code at line 169 was first introduced by commit
:::::: 443cbaf9e2fdbef7d7cae457434a6cb8a679441b crash: split vmcoreinfo exporting code out from crash_core.c

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
