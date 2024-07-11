Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC415B14C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701631; cv=none; b=Rj05R98SivgEJH5Am5zhRNTMlfpafBzka+zi1gPDu61PDJt4ro024yRbFBcfnBhsS4MsRC+WazeossttQC2y3X3aCh50CZlaru6Z33A/xhD7ZcO1zR++MQoZinhM1ZhxgbhQV0Geh8+ZjwwmlBKRix74uD1gxgA+wdcS1Co72ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701631; c=relaxed/simple;
	bh=IELg8uOZk5n6977n5C8XAPw2WSAmJnQg0lEHnT3ZxgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kt5Kl4fFEDcvgypqgnd6CfG+ptgucE8MjGjaBouW+qBPC06b1cVkoTYTe/UFq/z56P4bgQJg9yphln8yd63VPqgsLUbdYNs7ueRyk5evpgbXichrKWeKOQUDPzVM5pMuAD7WfYBTFKMuVyWetqm5ykSx2jBdqC22BCS7wcs7OSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgcoGIAz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgcoGIAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720701629; x=1752237629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IELg8uOZk5n6977n5C8XAPw2WSAmJnQg0lEHnT3ZxgU=;
  b=NgcoGIAz8h4we7KG71Y9jFxIJns54saKDDiDW2PTvtFCY1fruBsCOb7K
   3F9l+yegrpOuRKByidyg0ACuCu9ErMNcaa6Xw0Tykbc7e0Gj6XiAH+h0N
   k1f1J0if3M7hbD2xgG9ASsBotM9P2l5MSkUfwfhMomq7fqEwfGlo4JhOx
   l7aoaG2Pi6djpnkNI0DFsA49LzZ6Ha/93sdaN8UYPuKct+F5ewwcQD+s7
   ucvVoYtsNUg77ekGGx/UiCpxuEeHFm8h8EEpQMq3vSEJbEQeCSCqNhUrU
   QgyBE+AMZrsmK5/eeq5slDVL+8inIKOEzILECazjrG3ikyY/+b4qPABKY
   A==;
X-CSE-ConnectionGUID: 5hobl2oHTwCq7z3wTqThyw==
X-CSE-MsgGUID: juV+rbN0RYGYqu9MF8nRYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12498271"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="12498271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 05:40:26 -0700
X-CSE-ConnectionGUID: OMXbYEoyTrOf4ax0ltFmlw==
X-CSE-MsgGUID: J1DhtcBHSKqEk891E4U28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="79257737"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2024 05:40:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRt5y-000ZGg-0z;
	Thu, 11 Jul 2024 12:40:22 +0000
Date: Thu, 11 Jul 2024 20:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:memcg_data-test 3/3] mm/kfence/core.c:606:23: error:
 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
Message-ID: <202407112045.0y9GnTUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git memcg_data-test
head:   5dcc94a488cb36b012dde4bb0679dff25478cb1c
commit: 5dcc94a488cb36b012dde4bb0679dff25478cb1c [3/3] mm/memcg: alignment memcg_data define condition
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240711/202407112045.0y9GnTUT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112045.0y9GnTUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112045.0y9GnTUT-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/kfence/core.c: In function 'kfence_init_pool':
>> mm/kfence/core.c:606:23: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     606 |                 slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
         |                       ^~~~~~~~
         |                       objects
   mm/kfence/core.c:656:23: error: 'struct slab' has no member named 'obj_exts'; did you mean 'objects'?
     656 |                 slab->obj_exts = 0;
         |                       ^~~~~~~~
         |                       objects


vim +606 mm/kfence/core.c

0ce20dd840897b1 Alexander Potapenko 2021-02-25  572  
b33f778bba5ef3f Tianchen Ding       2022-03-22  573  /*
b33f778bba5ef3f Tianchen Ding       2022-03-22  574   * Initialization of the KFENCE pool after its allocation.
b33f778bba5ef3f Tianchen Ding       2022-03-22  575   * Returns 0 on success; otherwise returns the address up to
b33f778bba5ef3f Tianchen Ding       2022-03-22  576   * which partial initialization succeeded.
b33f778bba5ef3f Tianchen Ding       2022-03-22  577   */
b33f778bba5ef3f Tianchen Ding       2022-03-22  578  static unsigned long kfence_init_pool(void)
0ce20dd840897b1 Alexander Potapenko 2021-02-25  579  {
ec9fee79d48f2f0 Enze Li             2023-09-06  580  	unsigned long addr;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  581  	struct page *pages;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  582  	int i;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  583  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  584  	if (!arch_kfence_init_pool())
ec9fee79d48f2f0 Enze Li             2023-09-06  585  		return (unsigned long)__kfence_pool;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  586  
ec9fee79d48f2f0 Enze Li             2023-09-06  587  	addr = (unsigned long)__kfence_pool;
9e7ee421ac1f8d7 Linus Walleij       2022-06-30  588  	pages = virt_to_page(__kfence_pool);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  589  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  590  	/*
0ce20dd840897b1 Alexander Potapenko 2021-02-25  591  	 * Set up object pages: they must have PG_slab set, to avoid freeing
0ce20dd840897b1 Alexander Potapenko 2021-02-25  592  	 * these as real pages.
0ce20dd840897b1 Alexander Potapenko 2021-02-25  593  	 *
0ce20dd840897b1 Alexander Potapenko 2021-02-25  594  	 * We also want to avoid inserting kfence_free() in the kfree()
0ce20dd840897b1 Alexander Potapenko 2021-02-25  595  	 * fast-path in SLUB, and therefore need to ensure kfree() correctly
0ce20dd840897b1 Alexander Potapenko 2021-02-25  596  	 * enters __slab_free() slow-path.
0ce20dd840897b1 Alexander Potapenko 2021-02-25  597  	 */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  598  	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
1f2803b2660f4b0 Muchun Song         2023-03-23  599  		struct slab *slab = page_slab(nth_page(pages, i));
8f0b36497303487 Muchun Song         2022-04-01  600  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  601  		if (!i || (i % 2))
0ce20dd840897b1 Alexander Potapenko 2021-02-25  602  			continue;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  603  
8f0b36497303487 Muchun Song         2022-04-01  604  		__folio_set_slab(slab_folio(slab));
4977351270ff83a Johannes Weiner     2024-07-01  605  #ifdef CONFIG_MEMCG
21c690a349baab8 Suren Baghdasaryan  2024-03-21 @606  		slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
21c690a349baab8 Suren Baghdasaryan  2024-03-21  607  				 MEMCG_DATA_OBJEXTS;
8f0b36497303487 Muchun Song         2022-04-01  608  #endif
0ce20dd840897b1 Alexander Potapenko 2021-02-25  609  	}
0ce20dd840897b1 Alexander Potapenko 2021-02-25  610  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  611  	/*
0ce20dd840897b1 Alexander Potapenko 2021-02-25  612  	 * Protect the first 2 pages. The first page is mostly unnecessary, and
0ce20dd840897b1 Alexander Potapenko 2021-02-25  613  	 * merely serves as an extended guard page. However, adding one
0ce20dd840897b1 Alexander Potapenko 2021-02-25  614  	 * additional page in the beginning gives us an even number of pages,
0ce20dd840897b1 Alexander Potapenko 2021-02-25  615  	 * which simplifies the mapping of address to metadata index.
0ce20dd840897b1 Alexander Potapenko 2021-02-25  616  	 */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  617  	for (i = 0; i < 2; i++) {
0ce20dd840897b1 Alexander Potapenko 2021-02-25  618  		if (unlikely(!kfence_protect(addr)))
b33f778bba5ef3f Tianchen Ding       2022-03-22  619  			return addr;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  620  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  621  		addr += PAGE_SIZE;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  622  	}
0ce20dd840897b1 Alexander Potapenko 2021-02-25  623  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  624  	for (i = 0; i < CONFIG_KFENCE_NUM_OBJECTS; i++) {
cabdf74e6b319c9 Peng Zhang          2023-07-18  625  		struct kfence_metadata *meta = &kfence_metadata_init[i];
0ce20dd840897b1 Alexander Potapenko 2021-02-25  626  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  627  		/* Initialize metadata. */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  628  		INIT_LIST_HEAD(&meta->list);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  629  		raw_spin_lock_init(&meta->lock);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  630  		meta->state = KFENCE_OBJECT_UNUSED;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  631  		meta->addr = addr; /* Initialize for validation in metadata_to_pageaddr(). */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  632  		list_add_tail(&meta->list, &kfence_freelist);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  633  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  634  		/* Protect the right redzone. */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  635  		if (unlikely(!kfence_protect(addr + PAGE_SIZE)))
3ee2d7471fa4963 Muchun Song         2023-03-20  636  			goto reset_slab;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  637  
0ce20dd840897b1 Alexander Potapenko 2021-02-25  638  		addr += 2 * PAGE_SIZE;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  639  	}
0ce20dd840897b1 Alexander Potapenko 2021-02-25  640  
cabdf74e6b319c9 Peng Zhang          2023-07-18  641  	/*
cabdf74e6b319c9 Peng Zhang          2023-07-18  642  	 * Make kfence_metadata visible only when initialization is successful.
cabdf74e6b319c9 Peng Zhang          2023-07-18  643  	 * Otherwise, if the initialization fails and kfence_metadata is freed,
cabdf74e6b319c9 Peng Zhang          2023-07-18  644  	 * it may cause UAF in kfence_shutdown_cache().
cabdf74e6b319c9 Peng Zhang          2023-07-18  645  	 */
cabdf74e6b319c9 Peng Zhang          2023-07-18  646  	smp_store_release(&kfence_metadata, kfence_metadata_init);
b33f778bba5ef3f Tianchen Ding       2022-03-22  647  	return 0;
3ee2d7471fa4963 Muchun Song         2023-03-20  648  
3ee2d7471fa4963 Muchun Song         2023-03-20  649  reset_slab:
3ee2d7471fa4963 Muchun Song         2023-03-20  650  	for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
1f2803b2660f4b0 Muchun Song         2023-03-23  651  		struct slab *slab = page_slab(nth_page(pages, i));
3ee2d7471fa4963 Muchun Song         2023-03-20  652  
3ee2d7471fa4963 Muchun Song         2023-03-20  653  		if (!i || (i % 2))
3ee2d7471fa4963 Muchun Song         2023-03-20  654  			continue;
4977351270ff83a Johannes Weiner     2024-07-01  655  #ifdef CONFIG_MEMCG
21c690a349baab8 Suren Baghdasaryan  2024-03-21  656  		slab->obj_exts = 0;
3ee2d7471fa4963 Muchun Song         2023-03-20  657  #endif
3ee2d7471fa4963 Muchun Song         2023-03-20  658  		__folio_clear_slab(slab_folio(slab));
3ee2d7471fa4963 Muchun Song         2023-03-20  659  	}
3ee2d7471fa4963 Muchun Song         2023-03-20  660  
3ee2d7471fa4963 Muchun Song         2023-03-20  661  	return addr;
b33f778bba5ef3f Tianchen Ding       2022-03-22  662  }
b33f778bba5ef3f Tianchen Ding       2022-03-22  663  

:::::: The code at line 606 was first introduced by commit
:::::: 21c690a349baab895dc68ab70d291e1598d7109d mm: introduce slabobj_ext to support slab object extensions

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
