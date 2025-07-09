Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B72EFC1D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752082261; cv=none; b=cpppebMvC3FV4CtyCMXy3o2eQmalxPquIZk86v+3aA7weFdZxoRjdgLsKdN9zMUSatfYKfAgpzEh3QC/mVe2HObyxank8HPOoL6ehBt4PA4pRx+r+j+U+K8mF2QtB7yZeTjdI8a8dmYKrLXOA3k8zIKJDdxSDustV5UYiVKDWLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752082261; c=relaxed/simple;
	bh=/N4oC7ppCXzzFGHyWDhTE6mKkNUrrwvLus9Un2qASUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/DQj8Nnrr3RzH9uJLML+MzMzxHWF4vKNCKxUozHZ6hyIv6/1iZtot6Gv5I24KzDEfi/0ziVu9rtlZ+dJDvHgfDeZF7hz2getdYuR9pTN1x/1eSmuhUuwrHaxpqSIUM318yJyhMIBHWseu/GGZ2BrnzVy1aaYdLfGuulGR46574=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJyNbZrX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJyNbZrX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752082259; x=1783618259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/N4oC7ppCXzzFGHyWDhTE6mKkNUrrwvLus9Un2qASUM=;
  b=fJyNbZrX+q+JyzgsUCpmJdtk4xCkyp5TXk2IhMDSuv1EQYHizqZXXqHF
   /Y4GTvxQnt03mWo0RosgV5u5QDXUgjb3NGHspjjGzEO01XDTJJ8SbsDmr
   sA1HJs4FQ+E6XweamWaXP9eAjJy3V4MTi88R67jboGgE8urSZ2rHNGkM7
   ZjbuLPcIgZNINe7Wivqbm2+HN1abmIMNzaucAkBXv5lG558xyEOJKsbSs
   XAsLVb1HNonBUFYLEwfNh9LVF+RSnNFDsbTBR4D6DIiMg25/ndpOhzagz
   ds7ItX5RqhY5gtzONw741Bmodg6KYPVezMvmYNRN32eF5Qof+oJ/pfra5
   g==;
X-CSE-ConnectionGUID: 4BB+t7UTSIGK6AoVUEHvSg==
X-CSE-MsgGUID: jHw/Bw2VSk2yWeckSOeAdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64931114"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="64931114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 10:30:58 -0700
X-CSE-ConnectionGUID: QONZjPcmR7uYP7ln3Td7MQ==
X-CSE-MsgGUID: L0d/F03kSveZwjfTRgyoQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="159861314"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jul 2025 10:30:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZYdD-0003pH-08;
	Wed, 09 Jul 2025 17:30:55 +0000
Date: Thu, 10 Jul 2025 01:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 12/16] drivers/pci/p2pdma.c:341:11: error:
 'struct pci_p2pdma_pagemap' has no member named 'addr'
Message-ID: <202507100119.a7hqn6hS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   76398694a39d0be3b1e8a107e4dd025cfd1448fd
commit: 12cdda11c042a82ada440f3b90c9546c0eea8c27 [12/16] PCI/P2PDMA: Rely on physical address to check p2p state
config: arm64-randconfig-004-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100119.a7hqn6hS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100119.a7hqn6hS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100119.a7hqn6hS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/p2pdma.c: In function 'pci_p2pdma_add_resource':
>> drivers/pci/p2pdma.c:341:11: error: 'struct pci_p2pdma_pagemap' has no member named 'addr'
     341 |  p2p_pgmap->addr = addr;
         |           ^~
>> drivers/pci/p2pdma.c:371:8: error: passing argument 4 of 'gen_pool_free_owner' from incompatible pointer type [-Werror=incompatible-pointer-types]
     371 |        &pgmap->ref);
         |        ^~~~~~~~~~~
         |        |
         |        struct percpu_ref *
   In file included from drivers/pci/p2pdma.c:17:
   include/linux/genalloc.h:168:23: note: expected 'void **' but argument is of type 'struct percpu_ref *'
     168 |   size_t size, void **owner);
         |                ~~~~~~~^~~~~
>> drivers/pci/p2pdma.c:372:22: error: incompatible type for argument 1 of 'percpu_ref_put'
     372 |  percpu_ref_put(pgmap->ref);
         |                 ~~~~~^~~~~
         |                      |
         |                      struct percpu_ref
   In file included from include/linux/slab.h:21,
                    from include/linux/fs.h:46,
                    from arch/arm64/include/asm/elf.h:141,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-map-ops.h:9,
                    from drivers/pci/p2pdma.c:13:
   include/linux/percpu-refcount.h:349:54: note: expected 'struct percpu_ref *' but argument is of type 'struct percpu_ref'
     349 | static inline void percpu_ref_put(struct percpu_ref *ref)
         |                                   ~~~~~~~~~~~~~~~~~~~^~~
   drivers/pci/p2pdma.c: In function 'pci_free_p2pmem':
   drivers/pci/p2pdma.c:883:16: error: 'struct pci_p2pdma_pagemap' has no member named 'addr'
     883 |   if (p2p_pgmap->addr == addr) {
         |                ^~
   drivers/pci/p2pdma.c: At top level:
   drivers/pci/p2pdma.c:998:28: warning: 'struct pci_Dev' declared inside parameter list will not be visible outside of this definition or declaration
     998 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^~~~~~~
   In file included from include/linux/radix-tree.h:18,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-map-ops.h:9,
                    from drivers/pci/p2pdma.c:13:
   drivers/pci/p2pdma.c: In function 'pci_p2pdma_map_type':
   drivers/pci/p2pdma.c:1005:31: error: invalid use of undefined type 'struct pci_Dev'
    1005 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/rcupdate.h:532:10: note: in definition of macro '__rcu_dereference_check'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |          ^
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:1005:11: note: in expansion of macro 'rcu_dereference'
    1005 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:1005:31: error: invalid use of undefined type 'struct pci_Dev'
    1005 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/rcupdate.h:532:31: note: in definition of macro '__rcu_dereference_check'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                               ^
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:1005:11: note: in expansion of macro 'rcu_dereference'
    1005 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
   In file included from <command-line>:
   drivers/pci/p2pdma.c:1005:31: error: invalid use of undefined type 'struct pci_Dev'
    1005 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
     548 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:532:43: note: in expansion of macro 'READ_ONCE'
     532 |  typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                           ^~~~~~~~~
   include/linux/rcupdate.h:680:2: note: in expansion of macro '__rcu_dereference_check'
     680 |  __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:752:28: note: in expansion of macro 'rcu_dereference_check'
     752 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:1005:11: note: in expansion of macro 'rcu_dereference'
    1005 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |           ^~~~~~~~~~~~~~~
   drivers/pci/p2pdma.c:1005:31: error: invalid use of undefined type 'struct pci_Dev'
    1005 |  p2pdma = rcu_dereference(pdev->p2pdma);
         |                               ^~
   include/linux/compiler_types.h:548:9: note: in definition of macro '__compiletime_assert'
     548 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     568 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~


vim +341 drivers/pci/p2pdma.c

   286	
   287	/**
   288	 * pci_p2pdma_add_resource - add memory for use as p2p memory
   289	 * @pdev: the device to add the memory to
   290	 * @bar: PCI BAR to add
   291	 * @size: size of the memory to add, may be zero to use the whole BAR
   292	 * @offset: offset into the PCI BAR
   293	 *
   294	 * The memory will be given ZONE_DEVICE struct pages so that it may
   295	 * be used with any DMA request.
   296	 */
   297	int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
   298				    u64 offset)
   299	{
   300		struct pci_p2pdma_pagemap *p2p_pgmap;
   301		struct dev_pagemap *pgmap;
   302		struct pci_p2pdma *p2pdma;
   303		void *addr;
   304		int error;
   305	
   306		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
   307			return -EINVAL;
   308	
   309		if (offset >= pci_resource_len(pdev, bar))
   310			return -EINVAL;
   311	
   312		if (!size)
   313			size = pci_resource_len(pdev, bar) - offset;
   314	
   315		if (size + offset > pci_resource_len(pdev, bar))
   316			return -EINVAL;
   317	
   318		if (!pdev->p2pdma) {
   319			error = pci_p2pdma_setup(pdev);
   320			if (error)
   321				return error;
   322		}
   323	
   324		p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
   325		if (!p2p_pgmap)
   326			return -ENOMEM;
   327	
   328		pgmap = &p2p_pgmap->pgmap;
   329		pgmap->range.start = pci_resource_start(pdev, bar) + offset;
   330		pgmap->range.end = pgmap->range.start + size - 1;
   331		pgmap->nr_range = 1;
   332		pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
   333		pgmap->ops = &p2pdma_pgmap_ops;
   334	
   335		addr = devm_memremap_pages(&pdev->dev, pgmap);
   336		if (IS_ERR(addr)) {
   337			error = PTR_ERR(addr);
   338			goto pgmap_free;
   339		}
   340	
 > 341		p2p_pgmap->addr = addr;
   342		p2p_pgmap->mem.owner = &pdev->dev;
   343		p2p_pgmap->mem.bus_offset =
   344			pci_bus_address(pdev, bar) - pci_resource_start(pdev, bar);
   345	
   346		error = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_unmap_mappings,
   347						 p2p_pgmap);
   348		if (error)
   349			goto pages_free;
   350	
   351		p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
   352		error = gen_pool_add_owner(p2pdma->pool, (unsigned long)addr,
   353				pci_bus_address(pdev, bar) + offset,
   354				range_len(&pgmap->range), dev_to_node(&pdev->dev),
   355				&pgmap->ref);
   356		if (error)
   357			goto pages_free;
   358	
   359		error = mtree_store_range(&p2pdma_phys, pgmap->range.start,
   360					  pgmap->range.end, p2p_pgmap, GFP_KERNEL);
   361		if (error)
   362			goto pool_free;
   363	
   364		pci_info(pdev, "added peer-to-peer DMA memory %#llx-%#llx\n",
   365			 pgmap->range.start, pgmap->range.end);
   366	
   367		return 0;
   368	
   369	pool_free:
   370		gen_pool_free_owner(p2pdma->pool, (unsigned long)addr, size,
 > 371				    &pgmap->ref);
 > 372		percpu_ref_put(pgmap->ref);
   373	pages_free:
   374		devm_memunmap_pages(&pdev->dev, pgmap);
   375	pgmap_free:
   376		devm_kfree(&pdev->dev, pgmap);
   377		return error;
   378	}
   379	EXPORT_SYMBOL_GPL(pci_p2pdma_add_resource);
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
