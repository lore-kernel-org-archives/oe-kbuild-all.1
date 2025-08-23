Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF251C8621
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 04:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755924319; cv=none; b=eNgpDZB+jB70cKY+ECsRnrv7PLsL1aBw1MKh0jvV9q075QHx42tMm6+EGCsL04q6MwaBzvyOa7i3rCjqK/UX/qK/FuNVLwJH8lWONS2kndGZdd9RBCq6RSyfmbR2t3dxb1NQdHwCC9NG/jAdsXr+N1ZBmUH2gdon/mXros1xbvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755924319; c=relaxed/simple;
	bh=Cj+lVWmw9aOd7Oncv2KJWIrafSqny1E6ugAqg8tpZrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpCtQbtHBkHIKfNWH4/5LNiHAdAOS2wGG4ZN64ykdGAMcGavWqSvbOi6FUh2NFnTA5nnRAD+489s5U7SXo0k+1wwf57I+vS5RgLkmmVJC5akpZ128xb8U7JQQBvnnOl6dTi9kmF0SpNI7yXakPO9W//EXqy8cAlD7bleBdUB4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNY71uqD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNY71uqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755924317; x=1787460317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cj+lVWmw9aOd7Oncv2KJWIrafSqny1E6ugAqg8tpZrU=;
  b=TNY71uqDwEv0LLy9Z/vbF6/Fxoi5piJU9lGXrIvo9VUx7Mpg0EEWAQCm
   PTFrBXOsUfVS3JEU3EIoBLrODUc3u2sDEOoaF5J34ilZ4vBxXIDI2ZKht
   rHkLhrnKwMM7AL0WXPF16lZY2RqPJN0LH5kxYWIRH6qgCsKHbWdDWUNT8
   +5aKQL/+J4Y10pqWwHLFaHiTHQYjRjQ7a4z0kZHNYrx9b77dlXOvtkM/W
   kiT8h2JTqZBAMD0tQw3rwuDUXlJYmQ2kEGew905xVaZ8nNsoVF3/9gJYi
   Szv8r1Xa03FE2UU0sBe5YXXgHvVUZ5IIllnSbWTvjw9ci0HvTGNaHbf4k
   Q==;
X-CSE-ConnectionGUID: gCFCLIhlRI6q/c6ddjXbcQ==
X-CSE-MsgGUID: QJmIpjcOTAWBk3Sev+A6Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75814184"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75814184"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 21:45:17 -0700
X-CSE-ConnectionGUID: 5EUvfl5xQvWVwzcCm+cy/w==
X-CSE-MsgGUID: lVy+m2BWT36GdMJx6bP8uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168364151"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Aug 2025 21:45:15 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upg5U-000M5J-2L;
	Sat, 23 Aug 2025 04:44:12 +0000
Date: Sat, 23 Aug 2025 12:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:nth_page 32/34] mm/kfence/core.c:605:9: error:
 'end_pfn' undeclared; did you mean 'pgd_pfn'?
Message-ID: <202508231257.6M4lQ8pw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   6604ef076c5814154b00afdb7ea9ce90fd598b08
commit: b3b19208275e3734547a36882aac0c175d70bc78 [32/34] kfence: drop nth_page() usage
config: x86_64-buildonly-randconfig-002-20250823 (https://download.01.org/0day-ci/archive/20250823/202508231257.6M4lQ8pw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231257.6M4lQ8pw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231257.6M4lQ8pw-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/kfence/core.c: In function 'kfence_init_pool':
>> mm/kfence/core.c:605:9: error: 'end_pfn' undeclared (first use in this function); did you mean 'pgd_pfn'?
     605 |         end_pfn = start_pfn + KFENCE_POOL_SIZE / PAGE_SIZE;
         |         ^~~~~~~
         |         pgd_pfn
   mm/kfence/core.c:605:9: note: each undeclared identifier is reported only once for each function it appears in


vim +605 mm/kfence/core.c

   589	
   590	/*
   591	 * Initialization of the KFENCE pool after its allocation.
   592	 * Returns 0 on success; otherwise returns the address up to
   593	 * which partial initialization succeeded.
   594	 */
   595	static unsigned long kfence_init_pool(void)
   596	{
   597		unsigned long addr, start_pfn;
   598		int i;
   599	
   600		if (!arch_kfence_init_pool())
   601			return (unsigned long)__kfence_pool;
   602	
   603		addr = (unsigned long)__kfence_pool;
   604		start_pfn = PHYS_PFN(virt_to_phys(__kfence_pool));
 > 605		end_pfn = start_pfn + KFENCE_POOL_SIZE / PAGE_SIZE;
   606	
   607		/*
   608		 * Set up object pages: they must have PGTY_slab set to avoid freeing
   609		 * them as real pages.
   610		 *
   611		 * We also want to avoid inserting kfence_free() in the kfree()
   612		 * fast-path in SLUB, and therefore need to ensure kfree() correctly
   613		 * enters __slab_free() slow-path.
   614		 */
   615		for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
   616			struct slab *slab;
   617	
   618			if (!i || (i % 2))
   619				continue;
   620	
   621			slab = page_slab(pfn_to_page(start_pfn + i));
   622			__folio_set_slab(slab_folio(slab));
   623	#ifdef CONFIG_MEMCG
   624			slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
   625					 MEMCG_DATA_OBJEXTS;
   626	#endif
   627		}
   628	
   629		/*
   630		 * Protect the first 2 pages. The first page is mostly unnecessary, and
   631		 * merely serves as an extended guard page. However, adding one
   632		 * additional page in the beginning gives us an even number of pages,
   633		 * which simplifies the mapping of address to metadata index.
   634		 */
   635		for (i = 0; i < 2; i++) {
   636			if (unlikely(!kfence_protect(addr)))
   637				return addr;
   638	
   639			addr += PAGE_SIZE;
   640		}
   641	
   642		for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
   643			struct kfence_metadata *meta = &kfence_metadata_init[i];
   644	
   645			/* Initialize metadata. */
   646			INIT_LIST_HEAD(&meta->list);
   647			raw_spin_lock_init(&meta->lock);
   648			meta->state = KFENCE_OBJECT_UNUSED;
   649			meta->addr = addr; /* Initialize for validation in metadata_to_pageaddr(). */
   650			list_add_tail(&meta->list, &kfence_freelist);
   651	
   652			/* Protect the right redzone. */
   653			if (unlikely(!kfence_protect(addr + PAGE_SIZE)))
   654				goto reset_slab;
   655	
   656			addr += 2 * PAGE_SIZE;
   657		}
   658	
   659		/*
   660		 * Make kfence_metadata visible only when initialization is successful.
   661		 * Otherwise, if the initialization fails and kfence_metadata is freed,
   662		 * it may cause UAF in kfence_shutdown_cache().
   663		 */
   664		smp_store_release(&kfence_metadata, kfence_metadata_init);
   665		return 0;
   666	
   667	reset_slab:
   668		for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
   669			struct slab *slab;
   670	
   671			if (!i || (i % 2))
   672				continue;
   673	
   674			slab = page_slab(pfn_to_page(start_pfn + i));
   675	#ifdef CONFIG_MEMCG
   676			slab->obj_exts = 0;
   677	#endif
   678			__folio_clear_slab(slab_folio(slab));
   679		}
   680	
   681		return addr;
   682	}
   683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
