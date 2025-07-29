Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB031A4F12
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753802565; cv=none; b=ZIKelWD95TRvkqLqcQMu74W1QqX1lAN7B/euKfqQWnxC7u7Umki5kHLnJ+r/ODA5idCtoFwSD9DkDpBHFuwkK2eIjvjTJCNjbfx4+H/DS4djcZSFWdtPdPOJgUe+VZuaGz8pxaw+QMXtMD0DS+cGESxgu7g9aw0SF6pwkrjPBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753802565; c=relaxed/simple;
	bh=+c1xXMbWa/Jv9s19tjNZBlLlmeuVH5QFkgVAMPekiBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BiIEtrlPY8amozG6+Pp7WSqIRXFSE+S/7WsEZylNn/c3P5MvHVAVdN20fgCnWVKqjA42hIwupm5/t3q5UsQGE3h5HcCTHFKmVwAPb3IR63k/WdT92zmnqSBKmG865mz5J9Z65VHSoyPTrN82sxRh7amdyeYtSbgXCcPdf3DlHnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/iuJhfK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/iuJhfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753802564; x=1785338564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+c1xXMbWa/Jv9s19tjNZBlLlmeuVH5QFkgVAMPekiBs=;
  b=N/iuJhfKpzUJldio541JBx+lJDB5XKGmRiKHYHTUV2UDz+PKVUR2tPQI
   TmS0hlLD56kgCHwXdGytJRQ1Yq6Pic51RkoawKQ/da4djA2O4NhhsTvUI
   jiXbqvT5907TSQuismlPSmi5lSn1UWJ5BW3GObJw+BrNkiy7bJkMLmq28
   hStUXINkRkbZdEUo9vxhVYBQXvmRF/xfOHO5ykQMn7cHX+ZGpy6TVhdMS
   Qdzkr7f38mzvQ00sZn8dxbZMyPQPtyPffkj9J/dZug5pc4U4qlLrUzjwP
   1ZX+xS16wWqu5GlHTxLuXyXErgnTaI6Q9Cj4EbAz+uF9uvOF/3F4kDtyn
   A==;
X-CSE-ConnectionGUID: fK8hBfMDRSiNm6KjhCTs3g==
X-CSE-MsgGUID: lO3WIma5Rxa5Ap1DhUGn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59888033"
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="59888033"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 08:21:35 -0700
X-CSE-ConnectionGUID: Qnp+Lk9xT+i6syDgK/VLgw==
X-CSE-MsgGUID: cDqD59EyQleUt34GTnmkRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="163175048"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Jul 2025 08:21:33 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugm8w-0001PX-3A;
	Tue, 29 Jul 2025 15:21:30 +0000
Date: Tue, 29 Jul 2025 23:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] mm/sparse-vmemmap.c:310:8:
 warning: variable 'entry' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202507292333.KT2j6JOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zhongjiang-ali,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8b2d4607375adcbd520a2b7c4aaf0030228ff409
commit: 39dbfa37de5e4321e403a48914319dc98efa260b [0/9] anolis: virtio-mem: make memmap on movable memory can be offlined
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250729/202507292333.KT2j6JOu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507292333.KT2j6JOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507292333.KT2j6JOu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/sparse-vmemmap.c:310:8: warning: variable 'entry' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     310 |                         if (virtio_memmap_copy(walk->reuse_addr)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:328:34: note: uninitialized use occurs here
     328 |         set_pte_at(&init_mm, addr, pte, entry);
         |                                         ^~~~~
   mm/sparse-vmemmap.c:310:4: note: remove the 'if' if its condition is always true
     310 |                         if (virtio_memmap_copy(walk->reuse_addr)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:293:2: note: variable 'entry' is declared here
     293 |         pte_t entry;
         |         ^
   1 warning generated.
--
>> mm/sparse-vmemmap.c:430: warning: Function parameter or member 'altmap_pages' not described in 'vmemmap_remap_alloc'


vim +310 mm/sparse-vmemmap.c

   285	
   286	static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
   287					struct vmemmap_remap_walk *walk)
   288	{
   289		pgprot_t pgprot = PAGE_KERNEL;
   290		struct page *page;
   291		void *to, *src;
   292		unsigned long pfn;
   293		pte_t entry;
   294	
   295		if (!virtio_is_use_memmap(walk->reuse_addr))
   296			BUG_ON(pte_page(*pte) != walk->reuse_page);
   297	
   298		page = list_first_entry(walk->vmemmap_pages, struct page, lru);
   299		list_del(&page->lru);
   300		to = page_to_virt(page);
   301		if (!virtio_is_use_memmap(walk->reuse_addr)) {
   302			copy_page(to, (void *)walk->reuse_addr);
   303			reset_struct_pages(to);
   304			entry = mk_pte(page, pgprot);
   305		} else {
   306			if (virtio_memmap_restore(walk->reuse_addr)) {
   307				pfn = __pa(to) >> PAGE_SHIFT;
   308				entry = pfn_pte(pfn, pgprot);
   309			} else {
 > 310				if (virtio_memmap_copy(walk->reuse_addr)) {
   311					pfn = pte_pfn(*pte);
   312					src = __va(__pfn_to_phys(pfn));
   313	
   314					copy_page(to, src);
   315					list_add_tail(&page->lru, walk->vmemmap_pages);
   316					return;
   317				}
   318				/* trigger an warnning when walk in here now */
   319				WARN_ON(1);
   320			}
   321		}
   322	
   323		/*
   324		 * Makes sure that preceding stores to the page contents become visible
   325		 * before the set_pte_at() write.
   326		 */
   327		smp_wmb();
   328		set_pte_at(&init_mm, addr, pte, entry);
   329	}
   330	
   331	/**
   332	 * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
   333	 *			to the page which @reuse is mapped to, then free vmemmap
   334	 *			which the range are mapped to.
   335	 * @start:	start address of the vmemmap virtual address range that we want
   336	 *		to remap.
   337	 * @end:	end address of the vmemmap virtual address range that we want to
   338	 *		remap.
   339	 * @reuse:	reuse address.
   340	 *
   341	 * Return: %0 on success, negative error code otherwise.
   342	 */
   343	int vmemmap_remap_free(unsigned long start, unsigned long end,
   344			       unsigned long reuse)
   345	{
   346		int ret;
   347		LIST_HEAD(vmemmap_pages);
   348		struct vmemmap_remap_walk walk = {
   349			.remap_pte	= vmemmap_remap_pte,
   350			.reuse_addr	= reuse,
   351			.vmemmap_pages	= &vmemmap_pages,
   352		};
   353	
   354		/*
   355		 * In order to make remapping routine most efficient for the huge pages,
   356		 * the routine of vmemmap page table walking has the following rules
   357		 * (see more details from the vmemmap_pte_range()):
   358		 *
   359		 * - The range [@start, @end) and the range [@reuse, @reuse + PAGE_SIZE)
   360		 *   should be continuous.
   361		 * - The @reuse address is part of the range [@reuse, @end) that we are
   362		 *   walking which is passed to vmemmap_remap_range().
   363		 * - The @reuse address is the first in the complete range.
   364		 *
   365		 * So we need to make sure that @start and @reuse meet the above rules.
   366		 */
   367		BUG_ON(start - reuse != PAGE_SIZE);
   368	
   369		mmap_read_lock(&init_mm);
   370		ret = vmemmap_remap_range(reuse, end, &walk);
   371		if (ret && walk.nr_walked) {
   372			end = reuse + walk.nr_walked * PAGE_SIZE;
   373			/*
   374			 * vmemmap_pages contains pages from the previous
   375			 * vmemmap_remap_range call which failed.  These
   376			 * are pages which were removed from the vmemmap.
   377			 * They will be restored in the following call.
   378			 */
   379			walk = (struct vmemmap_remap_walk) {
   380				.remap_pte	= vmemmap_restore_pte,
   381				.reuse_addr	= reuse,
   382				.vmemmap_pages	= &vmemmap_pages,
   383			};
   384	
   385			vmemmap_remap_range(reuse, end, &walk);
   386		}
   387		mmap_read_unlock(&init_mm);
   388	
   389		free_vmemmap_page_list(&vmemmap_pages);
   390	
   391		return ret;
   392	}
   393	
   394	static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
   395					   gfp_t gfp_mask, struct list_head *list)
   396	{
   397		unsigned long nr_pages = (end - start) >> PAGE_SHIFT;
   398		int nid = page_to_nid((struct page *)start);
   399		struct page *page, *next;
   400	
   401		while (nr_pages--) {
   402			page = alloc_pages_node(nid, gfp_mask, 0);
   403			if (!page)
   404				goto out;
   405			list_add_tail(&page->lru, list);
   406		}
   407	
   408		return 0;
   409	out:
   410		list_for_each_entry_safe(page, next, list, lru)
   411			__free_pages(page, 0);
   412		return -ENOMEM;
   413	}
   414	
   415	/**
   416	 * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
   417	 *			 to the page which is from the @vmemmap_pages
   418	 *			 respectively.
   419	 * @start:	start address of the vmemmap virtual address range that we want
   420	 *		to remap.
   421	 * @end:	end address of the vmemmap virtual address range that we want to
   422	 *		remap.
   423	 * @reuse:	reuse address.
   424	 * @gfp_mask:	GFP flag for allocating vmemmap pages.
   425	 *
   426	 * Return: %0 on success, negative error code otherwise.
   427	 */
   428	int vmemmap_remap_alloc(unsigned long start, unsigned long end,
   429				unsigned long reuse, gfp_t gfp_mask, struct list_head *altmap_pages)
 > 430	{
   431		LIST_HEAD(vmemmap_pages);
   432		struct vmemmap_remap_walk walk = {
   433			.remap_pte	= vmemmap_restore_pte,
   434			.reuse_addr	= reuse,
   435			.vmemmap_pages	= &vmemmap_pages,
   436		};
   437	
   438		/* See the comment in the vmemmap_remap_free(). */
   439		if (!virtio_is_use_memmap(reuse))
   440			BUG_ON(start - reuse != PAGE_SIZE);
   441	
   442		if (virtio_is_use_memmap(reuse))
   443			walk.vmemmap_pages = altmap_pages;
   444	
   445		if (list_empty(walk.vmemmap_pages) && alloc_vmemmap_page_list(start,
   446				end, gfp_mask, walk.vmemmap_pages))
   447			return -ENOMEM;
   448	
   449		mmap_read_lock(&init_mm);
   450		if (virtio_is_use_memmap(reuse))
   451			vmemmap_remap_range(start, end, &walk);
   452		else
   453			vmemmap_remap_range(reuse, end, &walk);
   454		mmap_read_unlock(&init_mm);
   455	
   456		return 0;
   457	}
   458	EXPORT_SYMBOL(vmemmap_remap_alloc);
   459	#endif /* CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP */
   460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
