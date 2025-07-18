Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860013597E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 20:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752870416; cv=none; b=L2Q1HLivRKkX5JGDg45GryRSjY2OAjX/LKOK1Hiwj7bTQOsC35JWnWRoNmsUogKvfzasvcrhTKvpwHPeiGrpEFWWaZNDdzx81rav0I6yafBr/phRxSp9PaV+vz0C29yn0fJh6szBAG7I4Z71dBU2bjnH8p8iECLlCGQqXmy6iUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752870416; c=relaxed/simple;
	bh=4dj7+YE/KjD4uZoCZ4Cf+034NpLMo1jb0hZtLbyDP+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W8SMfPeu2LFeaHCPpesxk89D8US0SERb4g1ifRtJZi9S8nztW+FBoRTEyolbRsD1rWsBqIqTG4E9BWm/qalK4gfxSeZaxzxunT8zSDqg7J43hO5+moag6z37nIAaw4VwEY6tG5QKQKoMPVvC7BznJwANa0IJBxNnHNsfuHL6e9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce5tYgWY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce5tYgWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752870414; x=1784406414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4dj7+YE/KjD4uZoCZ4Cf+034NpLMo1jb0hZtLbyDP+c=;
  b=Ce5tYgWYunRkQDMtZ5mdkmtXsT7l1AUKePHCiR4zla0DzkLKN+OFVTSn
   NZGYOdNc9DC8MnuPGWsYtiOuTUq0qPmxerZgTLyCNEWUUvpRimYOVlT4O
   6jeIOsQnxCjN5dUuu/BtxcnzmvDmwzJ4u/fwrO04GVB0HjQHJxuxJxRxF
   v/0dKSs1Puzln4mYMG2LZGJIPMkGBQK4IInetdxz+rXi2BYXaySVQwJsH
   nW/0LlqmiY6Qmd7ITEk2lEpny0GMeZTSmbZu0IihRKuvtWPMndI6iiL1G
   xL0L2Sohhvh9kYY/ozSdGR27ZlDCZg7AJ3KtNHpRGg1yIwonw6qA1xO7e
   g==;
X-CSE-ConnectionGUID: S4tzenvyTxah+ca+E92d8w==
X-CSE-MsgGUID: 3ZcfSEWqR/ObHcgK4vb74A==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="65739069"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="65739069"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 13:26:54 -0700
X-CSE-ConnectionGUID: PIUbHf+pR9ucs0MDCsoe7A==
X-CSE-MsgGUID: R6JZsoyaQqKvlcbgbv7rrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="162451319"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jul 2025 13:26:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucrfO-000F1L-1M;
	Fri, 18 Jul 2025 20:26:50 +0000
Date: Sat, 19 Jul 2025 04:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 18/24] drivers/pci/p2pdma.c:362:24: error:
 'free_pool' undeclared; did you mean 'gen_pool'?
Message-ID: <202507190446.ui51y84X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   e39fa86301634c35591b37be2607abe30ea9c82b
commit: 9147f5bd68db2266f9aedb6441dba4c0d0463da5 [18/24] PCI/P2PDMA: Separate global to device p2p initialization logic
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250719/202507190446.ui51y84X-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190446.ui51y84X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190446.ui51y84X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pci/p2pdma.c: In function 'pci_p2pdma_add_resource':
>> drivers/pci/p2pdma.c:362:24: error: 'free_pool' undeclared (first use in this function); did you mean 'gen_pool'?
     362 |                 return free_pool;
         |                        ^~~~~~~~~
         |                        gen_pool
   drivers/pci/p2pdma.c:362:24: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/pci/p2pdma.c:400:9: error: implicit declaration of function 'sysfs_rmeove_group'; did you mean 'sysfs_remove_group'? [-Wimplicit-function-declaration]
     400 |         sysfs_rmeove_group(&pdev->dev.kobj, &p2pmem_group);
         |         ^~~~~~~~~~~~~~~~~~
         |         sysfs_remove_group
>> drivers/pci/p2pdma.c:401:26: error: 'p2p' undeclared (first use in this function)
     401 |         gen_pool_destroy(p2p->pool);
         |                          ^~~
>> drivers/pci/p2pdma.c:399:1: warning: label 'free_pool' defined but not used [-Wunused-label]
     399 | free_pool:
         | ^~~~~~~~~


vim +362 drivers/pci/p2pdma.c

   316	
   317	/**
   318	 * pci_p2pdma_add_resource - add memory for use as p2p memory
   319	 * @pdev: the device to add the memory to
   320	 * @bar: PCI BAR to add
   321	 * @size: size of the memory to add, may be zero to use the whole BAR
   322	 * @offset: offset into the PCI BAR
   323	 *
   324	 * The memory will be given ZONE_DEVICE struct pages so that it may
   325	 * be used with any DMA request.
   326	 */
   327	int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
   328				    u64 offset)
   329	{
   330		struct pci_p2pdma_pagemap *p2p_pgmap;
   331		struct p2pdma_provider *mem;
   332		struct dev_pagemap *pgmap;
   333		struct pci_p2pdma *p2pdma;
   334		void *addr;
   335		int error;
   336	
   337		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
   338			return -EINVAL;
   339	
   340		if (offset >= pci_resource_len(pdev, bar))
   341			return -EINVAL;
   342	
   343		if (!size)
   344			size = pci_resource_len(pdev, bar) - offset;
   345	
   346		if (size + offset > pci_resource_len(pdev, bar))
   347			return -EINVAL;
   348	
   349		p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
   350		if (!p2pdma) {
   351			mem = pci_p2pdma_enable(pdev);
   352			if (IS_ERR(mem))
   353				return PTR_ERR(mem);
   354	
   355			error = pci_p2pdma_setup_pool(pdev);
   356			if (error)
   357				return error;
   358		}
   359	
   360		p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
   361		if (!p2p_pgmap)
 > 362			return free_pool;
   363	
   364		pgmap = &p2p_pgmap->pgmap;
   365		pgmap->range.start = pci_resource_start(pdev, bar) + offset;
   366		pgmap->range.end = pgmap->range.start + size - 1;
   367		pgmap->nr_range = 1;
   368		pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
   369		pgmap->ops = &p2pdma_pgmap_ops;
   370		p2p_pgmap->mem = mem;
   371	
   372		addr = devm_memremap_pages(&pdev->dev, pgmap);
   373		if (IS_ERR(addr)) {
   374			error = PTR_ERR(addr);
   375			goto pgmap_free;
   376		}
   377	
   378		error = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_unmap_mappings,
   379						 p2p_pgmap);
   380		if (error)
   381			goto pages_free;
   382	
   383		error = gen_pool_add_owner(p2pdma->pool, (unsigned long)addr,
   384				pci_bus_address(pdev, bar) + offset,
   385				range_len(&pgmap->range), dev_to_node(&pdev->dev),
   386				&pgmap->ref);
   387		if (error)
   388			goto pages_free;
   389	
   390		pci_info(pdev, "added peer-to-peer DMA memory %#llx-%#llx\n",
   391			 pgmap->range.start, pgmap->range.end);
   392	
   393		return 0;
   394	
   395	pages_free:
   396		devm_memunmap_pages(&pdev->dev, pgmap);
   397	pgmap_free:
   398		devm_kfree(&pdev->dev, p2p_pgmap);
 > 399	free_pool:
 > 400		sysfs_rmeove_group(&pdev->dev.kobj, &p2pmem_group);
 > 401		gen_pool_destroy(p2p->pool);
   402		return error;
   403	}
   404	EXPORT_SYMBOL_GPL(pci_p2pdma_add_resource);
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
