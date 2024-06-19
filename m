Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C52558B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718819257; cv=none; b=p8IP8DG+1m+jwVghMfPOuzkm1/WwVDT+jWKCBPRiWQWwLXFgIHmPPww04Kv1+LLrqowtf/IaU+b83FHhWtQQw4ZkPjg9c4ALmsmh87vfAC3fgIGTAEVEsBxZYmAy7qkuBx/j6LpW43WJev5nh3BUYTa/gNnerFwhCens03miR7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718819257; c=relaxed/simple;
	bh=L+LR/ZZdS5QRNrePlEPdcYxXv5OLTk5L345uYwt15zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7SoQFUCW2HlbWLUf/Ib/PNw8uStS+eJPjX1vA0RM9wM5Ns6+XputlvSxR4ThBHTypHGnOBAsHLphw5/eCL5J3gtiUpsa3C1qNaqhaikNmZVsv1wHWjwxp1eLjrmp6ef0SWgPs5ieBbyzrLYDchjC9mg3Ij4C+k+bbUfWif+2Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1QB7lgp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1QB7lgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718819256; x=1750355256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+LR/ZZdS5QRNrePlEPdcYxXv5OLTk5L345uYwt15zk=;
  b=N1QB7lgp5TxkG0BGRwlE/sloxxGzvn03FDWc8QzQ0iW+ErK7O1ZdolDb
   GaZXtpCbFItFfIEnHUcHdgRGJ+Rj3lRjq0gWOtDsfbyCU6cgJ43kLR/Lk
   Y9gRWaXuG+Vk6PNABNZFZuWCu/QXEvIhV960OwZZXiE3nGUdP9DEULJtN
   gx1C+2Zsu9mxNVjPPs8Ys6oUOx+vk0JZ+nPqCuWr+48DxoFyoOTunLmwt
   1r2YY9mWZhPavXHOnfCzQrNiwCrlhuaGDGWSLF/OLKAbzWPQt8UUGlD5v
   hLmGSDGMwQRNApS8jOpCKFYK2AUc9Mzt/QF7TuyMk+HWAQ3UE1C+vX7sA
   w==;
X-CSE-ConnectionGUID: bHUhKUUDTVyGxam67NeTiQ==
X-CSE-MsgGUID: 6PoVxg68S+CMtj2RBerxsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15901808"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15901808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 10:47:35 -0700
X-CSE-ConnectionGUID: wPZuGXJzSVicze8Zb5eT3w==
X-CSE-MsgGUID: HhbD/v8kSTWDHRt0Kr1YJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="72739101"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jun 2024 10:47:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJzP9-0006pi-0l;
	Wed, 19 Jun 2024 17:47:31 +0000
Date: Thu, 20 Jun 2024 01:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] nvdimm/pmem: Flush to memory before machine
 restart
Message-ID: <202406200157.cl4DjMkB-lkp@intel.com>
References: <20240618154157.334602-3-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618154157.334602-3-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on nvdimm/libnvdimm-for-next]
[also build test ERROR on arm64/for-next/core linus/master v6.10-rc4 next-20240618]
[cannot apply to nvdimm/dax-misc tip/x86/core rostedt-trace/for-next rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/kernel-reboot-Introduce-pre_restart-notifiers/20240618-235520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-for-next
patch link:    https://lore.kernel.org/r/20240618154157.334602-3-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH 2/4] nvdimm/pmem: Flush to memory before machine restart
config: x86_64-buildonly-randconfig-003-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200157.cl4DjMkB-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200157.cl4DjMkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200157.cl4DjMkB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvdimm/pmem.c: In function 'pmem_release_disk':
>> drivers/nvdimm/pmem.c:430:9: error: implicit declaration of function 'unregister_pre_restart_notifier'; did you mean 'unregister_pre_restart_handler'? [-Werror=implicit-function-declaration]
     430 |         unregister_pre_restart_notifier(&pmem->pre_restart_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         unregister_pre_restart_handler
   drivers/nvdimm/pmem.c: In function 'pmem_attach_disk':
>> drivers/nvdimm/pmem.c:585:14: error: implicit declaration of function 'register_pre_restart_notifier'; did you mean 'register_pre_restart_handler'? [-Werror=implicit-function-declaration]
     585 |         rc = register_pre_restart_notifier(&pmem->pre_restart_notifier);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |              register_pre_restart_handler
>> drivers/nvdimm/pmem.c:602:1: warning: label 'out_unregister_pre_restart' defined but not used [-Wunused-label]
     602 | out_unregister_pre_restart:
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvdimm/pmem.c:590:17: error: label 'out_unregister_reboot' used but not defined
     590 |                 goto out_unregister_reboot;
         |                 ^~~~
   cc1: some warnings being treated as errors


vim +430 drivers/nvdimm/pmem.c

   425	
   426	static void pmem_release_disk(void *__pmem)
   427	{
   428		struct pmem_device *pmem = __pmem;
   429	
 > 430		unregister_pre_restart_notifier(&pmem->pre_restart_notifier);
   431		dax_remove_host(pmem->disk);
   432		kill_dax(pmem->dax_dev);
   433		put_dax(pmem->dax_dev);
   434		del_gendisk(pmem->disk);
   435	
   436		put_disk(pmem->disk);
   437	}
   438	
   439	static int pmem_pagemap_memory_failure(struct dev_pagemap *pgmap,
   440			unsigned long pfn, unsigned long nr_pages, int mf_flags)
   441	{
   442		struct pmem_device *pmem =
   443				container_of(pgmap, struct pmem_device, pgmap);
   444		u64 offset = PFN_PHYS(pfn) - pmem->phys_addr - pmem->data_offset;
   445		u64 len = nr_pages << PAGE_SHIFT;
   446	
   447		return dax_holder_notify_failure(pmem->dax_dev, offset, len, mf_flags);
   448	}
   449	
   450	static const struct dev_pagemap_ops fsdax_pagemap_ops = {
   451		.memory_failure		= pmem_pagemap_memory_failure,
   452	};
   453	
   454	static int pmem_attach_disk(struct device *dev,
   455			struct nd_namespace_common *ndns)
   456	{
   457		struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
   458		struct nd_region *nd_region = to_nd_region(dev->parent);
   459		struct queue_limits lim = {
   460			.logical_block_size	= pmem_sector_size(ndns),
   461			.physical_block_size	= PAGE_SIZE,
   462			.max_hw_sectors		= UINT_MAX,
   463		};
   464		int nid = dev_to_node(dev), fua;
   465		struct resource *res = &nsio->res;
   466		struct range bb_range;
   467		struct nd_pfn *nd_pfn = NULL;
   468		struct dax_device *dax_dev;
   469		struct nd_pfn_sb *pfn_sb;
   470		struct pmem_device *pmem;
   471		struct request_queue *q;
   472		struct gendisk *disk;
   473		void *addr;
   474		int rc;
   475	
   476		pmem = devm_kzalloc(dev, sizeof(*pmem), GFP_KERNEL);
   477		if (!pmem)
   478			return -ENOMEM;
   479	
   480		rc = devm_namespace_enable(dev, ndns, nd_info_block_reserve());
   481		if (rc)
   482			return rc;
   483	
   484		/* while nsio_rw_bytes is active, parse a pfn info block if present */
   485		if (is_nd_pfn(dev)) {
   486			nd_pfn = to_nd_pfn(dev);
   487			rc = nvdimm_setup_pfn(nd_pfn, &pmem->pgmap);
   488			if (rc)
   489				return rc;
   490		}
   491	
   492		/* we're attaching a block device, disable raw namespace access */
   493		devm_namespace_disable(dev, ndns);
   494	
   495		dev_set_drvdata(dev, pmem);
   496		pmem->phys_addr = res->start;
   497		pmem->size = resource_size(res);
   498		fua = nvdimm_has_flush(nd_region);
   499		if (!IS_ENABLED(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) || fua < 0) {
   500			dev_warn(dev, "unable to guarantee persistence of writes\n");
   501			fua = 0;
   502		}
   503	
   504		if (!devm_request_mem_region(dev, res->start, resource_size(res),
   505					dev_name(&ndns->dev))) {
   506			dev_warn(dev, "could not reserve region %pR\n", res);
   507			return -EBUSY;
   508		}
   509	
   510		disk = blk_alloc_disk(&lim, nid);
   511		if (IS_ERR(disk))
   512			return PTR_ERR(disk);
   513		q = disk->queue;
   514	
   515		pmem->disk = disk;
   516		pmem->pgmap.owner = pmem;
   517		pmem->pfn_flags = PFN_DEV;
   518		if (is_nd_pfn(dev)) {
   519			pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
   520			pmem->pgmap.ops = &fsdax_pagemap_ops;
   521			addr = devm_memremap_pages(dev, &pmem->pgmap);
   522			pfn_sb = nd_pfn->pfn_sb;
   523			pmem->data_offset = le64_to_cpu(pfn_sb->dataoff);
   524			pmem->pfn_pad = resource_size(res) -
   525				range_len(&pmem->pgmap.range);
   526			pmem->pfn_flags |= PFN_MAP;
   527			bb_range = pmem->pgmap.range;
   528			bb_range.start += pmem->data_offset;
   529		} else if (pmem_should_map_pages(dev)) {
   530			pmem->pgmap.range.start = res->start;
   531			pmem->pgmap.range.end = res->end;
   532			pmem->pgmap.nr_range = 1;
   533			pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
   534			pmem->pgmap.ops = &fsdax_pagemap_ops;
   535			addr = devm_memremap_pages(dev, &pmem->pgmap);
   536			pmem->pfn_flags |= PFN_MAP;
   537			bb_range = pmem->pgmap.range;
   538		} else {
   539			addr = devm_memremap(dev, pmem->phys_addr,
   540					pmem->size, ARCH_MEMREMAP_PMEM);
   541			bb_range.start =  res->start;
   542			bb_range.end = res->end;
   543		}
   544	
   545		if (IS_ERR(addr)) {
   546			rc = PTR_ERR(addr);
   547			goto out;
   548		}
   549		pmem->virt_addr = addr;
   550	
   551		blk_queue_write_cache(q, true, fua);
   552		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
   553		blk_queue_flag_set(QUEUE_FLAG_SYNCHRONOUS, q);
   554		if (pmem->pfn_flags & PFN_MAP)
   555			blk_queue_flag_set(QUEUE_FLAG_DAX, q);
   556	
   557		disk->fops		= &pmem_fops;
   558		disk->private_data	= pmem;
   559		nvdimm_namespace_disk_name(ndns, disk->disk_name);
   560		set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
   561				/ 512);
   562		if (devm_init_badblocks(dev, &pmem->bb))
   563			return -ENOMEM;
   564		nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
   565		disk->bb = &pmem->bb;
   566	
   567		dax_dev = alloc_dax(pmem, &pmem_dax_ops);
   568		if (IS_ERR(dax_dev)) {
   569			rc = PTR_ERR(dax_dev);
   570			if (rc != -EOPNOTSUPP)
   571				goto out;
   572		} else {
   573			set_dax_nocache(dax_dev);
   574			set_dax_nomc(dax_dev);
   575			if (is_nvdimm_sync(nd_region))
   576				set_dax_synchronous(dax_dev);
   577			pmem->dax_dev = dax_dev;
   578			rc = dax_add_host(dax_dev, disk);
   579			if (rc)
   580				goto out_cleanup_dax;
   581			dax_write_cache(dax_dev, nvdimm_has_cache(nd_region));
   582		}
   583		pmem->pre_restart_notifier.notifier_call = pmem_pre_restart_handler;
   584		pmem->pre_restart_notifier.priority = 0;
 > 585		rc = register_pre_restart_notifier(&pmem->pre_restart_notifier);
   586		if (rc)
   587			goto out_remove_host;
   588		rc = device_add_disk(dev, disk, pmem_attribute_groups);
   589		if (rc)
 > 590			goto out_unregister_reboot;
   591		if (devm_add_action_or_reset(dev, pmem_release_disk, pmem))
   592			return -ENOMEM;
   593	
   594		nvdimm_check_and_set_ro(disk);
   595	
   596		pmem->bb_state = sysfs_get_dirent(disk_to_dev(disk)->kobj.sd,
   597						  "badblocks");
   598		if (!pmem->bb_state)
   599			dev_warn(dev, "'badblocks' notification disabled\n");
   600		return 0;
   601	
 > 602	out_unregister_pre_restart:
   603		unregister_pre_restart_notifier(&pmem->pre_restart_notifier);
   604	out_remove_host:
   605		dax_remove_host(pmem->disk);
   606	out_cleanup_dax:
   607		kill_dax(pmem->dax_dev);
   608		put_dax(pmem->dax_dev);
   609	out:
   610		put_disk(pmem->disk);
   611		return rc;
   612	}
   613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
