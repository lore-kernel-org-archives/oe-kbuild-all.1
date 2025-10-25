Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC1450FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761386763; cv=none; b=M7jrv0Z9B5x4sOiNrg2pqhDvotW3JNVN5IIvWb7EKOzpifyr7AGNAro51ln3o0nCSc/MaVFLrFxAKy5AGUG6SyU6VxmhAhJXb3KwDdeMES9HQSA4i7ZCyDB2aM38hmp6RsJoOyO2ZWZi0xoPi/EUEvtKWK6lkpnKGFHQ5EJLtaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761386763; c=relaxed/simple;
	bh=5888GIYYu4cPcUGRnpKIMnaxtRqGx8QfvCaYwZWiRQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT6AO3nOCQktu9QISdQYHljFneaHchJGJKw0j1gosNaZ3WYwIy0r39YElBViZxV3Wn/jUeyEovpF9vTihCFcGQEDnr9aEvfjQ95YdvAR7mv3syz+jtXaoQ93ebxhUs0YkCmSEEgwqm5w1WTCBYDRH4AcOQO3kHtzOjMyOO9LIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0tq51l2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0tq51l2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761386761; x=1792922761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5888GIYYu4cPcUGRnpKIMnaxtRqGx8QfvCaYwZWiRQw=;
  b=X0tq51l2qArP2vdgYtJWcAs9MnJtzyNvBGzMEmp30tSJIrsCXx9iMOZ4
   J6NXyfRsRrTsXThyVlSZoOax7KtfmvNOsQkFZ6LWc50xaGLwKWWEOKqF0
   FbJ+xsNLEyTivBjIZ6VW+ItYXR++XD9MfGNIwfsKvkw4JQf0o8kn48cks
   vd5d5VLIPXhMFpR5jlUgvXN9udMnPRxE1BoOWx2zLTZDrTm+iwgXuUPWk
   704y/48tgRqZ2Ml8+hqzJZj3//NG91syVqHElt/jZ/XegGHgYOD9KpNEJ
   IhqfA1MO4ITWqDtpf0pdkTe4Rlc0Nhf2XOdQAjX73uXtzNj3Ly+5WeFDj
   w==;
X-CSE-ConnectionGUID: NzIingEgSG6+VhIYtmnwxg==
X-CSE-MsgGUID: HZgpRPLeT7yK5L/lLHmdaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74224362"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="74224362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 03:05:59 -0700
X-CSE-ConnectionGUID: AS81opSaSoa9DrFNwNnP7w==
X-CSE-MsgGUID: 3btqaUs/T3uTJmOv+qxiyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="188934450"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2025 03:05:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCb9n-000FEz-30;
	Sat, 25 Oct 2025 10:05:55 +0000
Date: Sat, 25 Oct 2025 18:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 01/17] slab: Reimplement page_slab()
Message-ID: <202510251718.QnJZ4Jct-lkp@intel.com>
References: <20251024204434.2461319-2-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024204434.2461319-2-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.18-rc2 next-20251024]
[cannot apply to vbabka-slab/for-next vbabka/slab-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/slab-Reimplement-page_slab/20251025-044902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251024204434.2461319-2-willy%40infradead.org
patch subject: [PATCH v3 01/17] slab: Reimplement page_slab()
config: s390-randconfig-002-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251718.QnJZ4Jct-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251718.QnJZ4Jct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251718.QnJZ4Jct-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kfence/core.c: In function 'kfence_init_pool':
>> mm/kfence/core.c:616:16: warning: variable 'slab' set but not used [-Wunused-but-set-variable]
      struct slab *slab;
                   ^~~~
   mm/kfence/core.c:671:16: warning: variable 'slab' set but not used [-Wunused-but-set-variable]
      struct slab *slab;
                   ^~~~


vim +/slab +616 mm/kfence/core.c

0ce20dd840897b1 Alexander Potapenko     2021-02-25  589  
b33f778bba5ef3f Tianchen Ding           2022-03-22  590  /*
b33f778bba5ef3f Tianchen Ding           2022-03-22  591   * Initialization of the KFENCE pool after its allocation.
b33f778bba5ef3f Tianchen Ding           2022-03-22  592   * Returns 0 on success; otherwise returns the address up to
b33f778bba5ef3f Tianchen Ding           2022-03-22  593   * which partial initialization succeeded.
b33f778bba5ef3f Tianchen Ding           2022-03-22  594   */
b33f778bba5ef3f Tianchen Ding           2022-03-22  595  static unsigned long kfence_init_pool(void)
0ce20dd840897b1 Alexander Potapenko     2021-02-25  596  {
56531761d4b04ea David Hildenbrand       2025-09-01  597  	unsigned long addr, start_pfn;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  598  	int i;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  599  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  600  	if (!arch_kfence_init_pool())
ec9fee79d48f2f0 Enze Li                 2023-09-06  601  		return (unsigned long)__kfence_pool;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  602  
ec9fee79d48f2f0 Enze Li                 2023-09-06  603  	addr = (unsigned long)__kfence_pool;
56531761d4b04ea David Hildenbrand       2025-09-01  604  	start_pfn = PHYS_PFN(virt_to_phys(__kfence_pool));
0ce20dd840897b1 Alexander Potapenko     2021-02-25  605  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  606  	/*
97189f84a1b3c80 Matthew Wilcox (Oracle  2025-06-11  607) 	 * Set up object pages: they must have PGTY_slab set to avoid freeing
97189f84a1b3c80 Matthew Wilcox (Oracle  2025-06-11  608) 	 * them as real pages.
0ce20dd840897b1 Alexander Potapenko     2021-02-25  609  	 *
0ce20dd840897b1 Alexander Potapenko     2021-02-25  610  	 * We also want to avoid inserting kfence_free() in the kfree()
0ce20dd840897b1 Alexander Potapenko     2021-02-25  611  	 * fast-path in SLUB, and therefore need to ensure kfree() correctly
0ce20dd840897b1 Alexander Potapenko     2021-02-25  612  	 * enters __slab_free() slow-path.
0ce20dd840897b1 Alexander Potapenko     2021-02-25  613  	 */
0ce20dd840897b1 Alexander Potapenko     2021-02-25  614  	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  615) 		struct page *page;
56531761d4b04ea David Hildenbrand       2025-09-01 @616  		struct slab *slab;
8f0b36497303487 Muchun Song             2022-04-01  617  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  618  		if (!i || (i % 2))
0ce20dd840897b1 Alexander Potapenko     2021-02-25  619  			continue;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  620  
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  621) 		page = pfn_to_page(start_pfn + i);
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  622) 		__SetPageSlab(page);
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  623) 		slab = page_slab(page);
3a3b7fec3974f95 Johannes Weiner         2024-07-01  624  #ifdef CONFIG_MEMCG
21c690a349baab8 Suren Baghdasaryan      2024-03-21  625  		slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
21c690a349baab8 Suren Baghdasaryan      2024-03-21  626  				 MEMCG_DATA_OBJEXTS;
8f0b36497303487 Muchun Song             2022-04-01  627  #endif
0ce20dd840897b1 Alexander Potapenko     2021-02-25  628  	}
0ce20dd840897b1 Alexander Potapenko     2021-02-25  629  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  630  	/*
0ce20dd840897b1 Alexander Potapenko     2021-02-25  631  	 * Protect the first 2 pages. The first page is mostly unnecessary, and
0ce20dd840897b1 Alexander Potapenko     2021-02-25  632  	 * merely serves as an extended guard page. However, adding one
0ce20dd840897b1 Alexander Potapenko     2021-02-25  633  	 * additional page in the beginning gives us an even number of pages,
0ce20dd840897b1 Alexander Potapenko     2021-02-25  634  	 * which simplifies the mapping of address to metadata index.
0ce20dd840897b1 Alexander Potapenko     2021-02-25  635  	 */
0ce20dd840897b1 Alexander Potapenko     2021-02-25  636  	for (i = 0; i < 2; i++) {
0ce20dd840897b1 Alexander Potapenko     2021-02-25  637  		if (unlikely(!kfence_protect(addr)))
b33f778bba5ef3f Tianchen Ding           2022-03-22  638  			return addr;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  639  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  640  		addr += PAGE_SIZE;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  641  	}
0ce20dd840897b1 Alexander Potapenko     2021-02-25  642  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  643  	for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
cabdf74e6b319c9 Peng Zhang              2023-07-18  644  		struct kfence_metadata *meta = &kfence_metadata_init[i];
0ce20dd840897b1 Alexander Potapenko     2021-02-25  645  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  646  		/* Initialize metadata. */
0ce20dd840897b1 Alexander Potapenko     2021-02-25  647  		INIT_LIST_HEAD(&meta->list);
0ce20dd840897b1 Alexander Potapenko     2021-02-25  648  		raw_spin_lock_init(&meta->lock);
0ce20dd840897b1 Alexander Potapenko     2021-02-25  649  		meta->state = KFENCE_OBJECT_UNUSED;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  650  		meta->addr = addr; /* Initialize for validation in metadata_to_pageaddr(). */
0ce20dd840897b1 Alexander Potapenko     2021-02-25  651  		list_add_tail(&meta->list, &kfence_freelist);
0ce20dd840897b1 Alexander Potapenko     2021-02-25  652  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  653  		/* Protect the right redzone. */
0ce20dd840897b1 Alexander Potapenko     2021-02-25  654  		if (unlikely(!kfence_protect(addr + PAGE_SIZE)))
3ee2d7471fa4963 Muchun Song             2023-03-20  655  			goto reset_slab;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  656  
0ce20dd840897b1 Alexander Potapenko     2021-02-25  657  		addr += 2 * PAGE_SIZE;
0ce20dd840897b1 Alexander Potapenko     2021-02-25  658  	}
0ce20dd840897b1 Alexander Potapenko     2021-02-25  659  
cabdf74e6b319c9 Peng Zhang              2023-07-18  660  	/*
cabdf74e6b319c9 Peng Zhang              2023-07-18  661  	 * Make kfence_metadata visible only when initialization is successful.
cabdf74e6b319c9 Peng Zhang              2023-07-18  662  	 * Otherwise, if the initialization fails and kfence_metadata is freed,
cabdf74e6b319c9 Peng Zhang              2023-07-18  663  	 * it may cause UAF in kfence_shutdown_cache().
cabdf74e6b319c9 Peng Zhang              2023-07-18  664  	 */
cabdf74e6b319c9 Peng Zhang              2023-07-18  665  	smp_store_release(&kfence_metadata, kfence_metadata_init);
b33f778bba5ef3f Tianchen Ding           2022-03-22  666  	return 0;
3ee2d7471fa4963 Muchun Song             2023-03-20  667  
3ee2d7471fa4963 Muchun Song             2023-03-20  668  reset_slab:
3ee2d7471fa4963 Muchun Song             2023-03-20  669  	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  670) 		struct page *page;
56531761d4b04ea David Hildenbrand       2025-09-01  671  		struct slab *slab;
3ee2d7471fa4963 Muchun Song             2023-03-20  672  
3ee2d7471fa4963 Muchun Song             2023-03-20  673  		if (!i || (i % 2))
3ee2d7471fa4963 Muchun Song             2023-03-20  674  			continue;
56531761d4b04ea David Hildenbrand       2025-09-01  675  
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  676) 		page = pfn_to_page(start_pfn + i);
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  677) 		slab = page_slab(page);
3a3b7fec3974f95 Johannes Weiner         2024-07-01  678  #ifdef CONFIG_MEMCG
21c690a349baab8 Suren Baghdasaryan      2024-03-21  679  		slab->obj_exts = 0;
3ee2d7471fa4963 Muchun Song             2023-03-20  680  #endif
e188a9ce7697cde Matthew Wilcox (Oracle  2025-10-24  681) 		__ClearPageSlab(page);
3ee2d7471fa4963 Muchun Song             2023-03-20  682  	}
3ee2d7471fa4963 Muchun Song             2023-03-20  683  
3ee2d7471fa4963 Muchun Song             2023-03-20  684  	return addr;
b33f778bba5ef3f Tianchen Ding           2022-03-22  685  }
b33f778bba5ef3f Tianchen Ding           2022-03-22  686  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
