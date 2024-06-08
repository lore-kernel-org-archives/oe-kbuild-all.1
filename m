Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E612143891
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717861025; cv=none; b=q/10r93h3agnDffQszjDvNngEuLo4H1+eFBEs0Sozor+Gaz+idrx/kd9QqRwfmUwQY5EiCgiPVNyQf9mxOtdTCfNxkYJNkfnaig3gLp97QBq6jNZR/0lAJRYs2/0t+TxU3yVioqOQ4+iO+8cfpOdjVOuk1B7ZRvvKiMcJS84aQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717861025; c=relaxed/simple;
	bh=aPqODxCKfmI0MdzjJCFLLObX5U6kW5fqIBoMf5dIOLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVB0YmA15aAcb4eASxT1NlcaMjgm8gjX555riaN54z2ZDPkYmvdchGs7m+9yT0MZbgMCnaGFK+ACFjiVcRHB1dAGsJAleEaCzW0aESu3u/mMfLxXucjWxswZGMJVodUYZDwTIW+Ia2DbJ891kj4Kzm9Py7Sv3guCqPsL7qshnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzsm2ZWP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzsm2ZWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717861023; x=1749397023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPqODxCKfmI0MdzjJCFLLObX5U6kW5fqIBoMf5dIOLU=;
  b=kzsm2ZWP3MbTs2cq48S6teWhRv/KBIJebbyFau42tTRPmi8ekjxIm2le
   cTW/EHnuqw8l1HEpz3z8vXocRx97Jv2JTYOsF0o5DaoSAyRCosqi0Ny+w
   XRpakmT3AdKLHs2+PBic95Y63BCgu4QlpucuIUmpmkNxLMu7p04bVdau1
   sUpVlbXGBMPLXcyE9TFmzFLOa6zxv3RkEG+kWmEncdM06qXGGTL3EEB8Y
   UkSwCize8kYCCptScnv1qcruF87dKcpTZngpLpqqB8T4sI2JcFX90IDaP
   aGmj8oaiPjXheqhy4ZLU4P2Hoagh1ctDzcPJ7enA4hngyuh7bFgIR2ryD
   w==;
X-CSE-ConnectionGUID: hOCeHvK5RGOOQe+RBwPJvg==
X-CSE-MsgGUID: 2vE9E2f3S3ilewRjTFU/SQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="11976789"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="11976789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 08:37:02 -0700
X-CSE-ConnectionGUID: 2XmtTxbcTUKQZyDVJnGBxA==
X-CSE-MsgGUID: lO/tGolETG+uYBajJXXf9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="43742909"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jun 2024 08:37:01 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFy7n-00007r-0R;
	Sat, 08 Jun 2024 15:36:59 +0000
Date: Sat, 8 Jun 2024 23:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-limit-flags 46/52] drivers/nvdimm/pmem.c:468:24:
 warning: variable 'q' set but not used
Message-ID: <202406082337.8FgSPrgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-limit-flags
head:   b8da03a6bf6868bc22e344df8b888a805a34d7fa
commit: 78f8ca809954e3ae1574d732175298fcf9d70391 [46/52] block: move the dax flag to queue_limits
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240608/202406082337.8FgSPrgv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406082337.8FgSPrgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406082337.8FgSPrgv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvdimm/pmem.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/nvdimm/pmem.c:468:24: warning: variable 'q' set but not used [-Wunused-but-set-variable]
     468 |         struct request_queue *q;
         |                               ^
   2 warnings generated.


vim +/q +468 drivers/nvdimm/pmem.c

33a8f7f2b3a343 drivers/nvdimm/pmem.c Shiyang Ruan      2022-06-03  448  
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  449  static int pmem_attach_disk(struct device *dev,
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  450  		struct nd_namespace_common *ndns)
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  451  {
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  452  	struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
f284a4f23752d0 drivers/nvdimm/pmem.c Dan Williams      2016-07-07  453  	struct nd_region *nd_region = to_nd_region(dev->parent);
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  454  	struct queue_limits lim = {
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  455  		.logical_block_size	= pmem_sector_size(ndns),
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  456  		.physical_block_size	= PAGE_SIZE,
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  457  		.max_hw_sectors		= UINT_MAX,
643e4cf59e2375 drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  458  		.features		= BLK_FEAT_WRITE_CACHE |
643e4cf59e2375 drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  459  					  BLK_FEAT_SYNCHRONOUS,
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  460  	};
ce7f11a230d5b7 drivers/nvdimm/pmem.c Ross Zwisler      2018-06-06  461  	int nid = dev_to_node(dev), fua;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  462  	struct resource *res = &nsio->res;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  463  	struct range bb_range;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  464  	struct nd_pfn *nd_pfn = NULL;
c1d6e828a35df5 drivers/nvdimm/pmem.c Dan Williams      2017-01-24  465  	struct dax_device *dax_dev;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  466  	struct nd_pfn_sb *pfn_sb;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  467  	struct pmem_device *pmem;
468ded03c07e0f drivers/nvdimm/pmem.c Dan Williams      2016-01-15 @468  	struct request_queue *q;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  469  	struct gendisk *disk;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  470  	void *addr;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  471  	int rc;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  472  
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  473  	pmem = devm_kzalloc(dev, sizeof(*pmem), GFP_KERNEL);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  474  	if (!pmem)
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  475  		return -ENOMEM;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  476  
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  477  	rc = devm_namespace_enable(dev, ndns, nd_info_block_reserve());
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  478  	if (rc)
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  479  		return rc;
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  480  
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  481  	/* while nsio_rw_bytes is active, parse a pfn info block if present */
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  482  	if (is_nd_pfn(dev)) {
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  483  		nd_pfn = to_nd_pfn(dev);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  484  		rc = nvdimm_setup_pfn(nd_pfn, &pmem->pgmap);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  485  		if (rc)
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  486  			return rc;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  487  	}
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  488  
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  489  	/* we're attaching a block device, disable raw namespace access */
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  490  	devm_namespace_disable(dev, ndns);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  491  
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  492  	dev_set_drvdata(dev, pmem);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  493  	pmem->phys_addr = res->start;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  494  	pmem->size = resource_size(res);
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  495  	fua = nvdimm_has_flush(nd_region);
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  496  	if (!IS_ENABLED(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) || fua < 0) {
61031952f4c89d drivers/nvdimm/pmem.c Ross Zwisler      2015-06-25  497  		dev_warn(dev, "unable to guarantee persistence of writes\n");
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  498  		fua = 0;
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  499  	}
517fa191cf3c4d drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-05  500  	if (fua)
517fa191cf3c4d drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-05  501  		lim.features |= BLK_FEAT_FUA;
78f8ca809954e3 drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  502  	if (is_nd_pfn(dev))
78f8ca809954e3 drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  503  		lim.features |= BLK_FEAT_DAX;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  504  
947df02d255a6a drivers/nvdimm/pmem.c Dan Williams      2016-03-21  505  	if (!devm_request_mem_region(dev, res->start, resource_size(res),
450c6633e874c4 drivers/nvdimm/pmem.c Dan Williams      2016-11-28  506  				dev_name(&ndns->dev))) {
947df02d255a6a drivers/nvdimm/pmem.c Dan Williams      2016-03-21  507  		dev_warn(dev, "could not reserve region %pR\n", res);
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  508  		return -EBUSY;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  509  	}
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  510  
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  511  	disk = blk_alloc_disk(&lim, nid);
74fa8f9c553f7b drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  512  	if (IS_ERR(disk))
74fa8f9c553f7b drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  513  		return PTR_ERR(disk);
87eb73b2ca7c1b drivers/nvdimm/pmem.c Christoph Hellwig 2021-05-21  514  	q = disk->queue;
468ded03c07e0f drivers/nvdimm/pmem.c Dan Williams      2016-01-15  515  
87eb73b2ca7c1b drivers/nvdimm/pmem.c Christoph Hellwig 2021-05-21  516  	pmem->disk = disk;
a624eb520390ce drivers/nvdimm/pmem.c Dan Williams      2021-06-07  517  	pmem->pgmap.owner = pmem;
34c0fd540e79fb drivers/nvdimm/pmem.c Dan Williams      2016-01-15  518  	pmem->pfn_flags = PFN_DEV;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  519  	if (is_nd_pfn(dev)) {
f6a55e1a3fe6b3 drivers/nvdimm/pmem.c Christoph Hellwig 2019-06-26  520  		pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
33a8f7f2b3a343 drivers/nvdimm/pmem.c Shiyang Ruan      2022-06-03  521  		pmem->pgmap.ops = &fsdax_pagemap_ops;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  522  		addr = devm_memremap_pages(dev, &pmem->pgmap);
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  523  		pfn_sb = nd_pfn->pfn_sb;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  524  		pmem->data_offset = le64_to_cpu(pfn_sb->dataoff);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  525  		pmem->pfn_pad = resource_size(res) -
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  526  			range_len(&pmem->pgmap.range);
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  527  		pmem->pfn_flags |= PFN_MAP;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  528  		bb_range = pmem->pgmap.range;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  529  		bb_range.start += pmem->data_offset;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  530  	} else if (pmem_should_map_pages(dev)) {
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  531  		pmem->pgmap.range.start = res->start;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  532  		pmem->pgmap.range.end = res->end;
b7b3c01b191596 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  533  		pmem->pgmap.nr_range = 1;
f6a55e1a3fe6b3 drivers/nvdimm/pmem.c Christoph Hellwig 2019-06-26  534  		pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
33a8f7f2b3a343 drivers/nvdimm/pmem.c Shiyang Ruan      2022-06-03  535  		pmem->pgmap.ops = &fsdax_pagemap_ops;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  536  		addr = devm_memremap_pages(dev, &pmem->pgmap);
34c0fd540e79fb drivers/nvdimm/pmem.c Dan Williams      2016-01-15  537  		pmem->pfn_flags |= PFN_MAP;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  538  		bb_range = pmem->pgmap.range;
91ed7ac444ef74 drivers/nvdimm/pmem.c Dan Williams      2018-10-04  539  	} else {
32b2397c1e56f3 drivers/nvdimm/pmem.c sumiyawang        2021-08-22  540  		addr = devm_memremap(dev, pmem->phys_addr,
32b2397c1e56f3 drivers/nvdimm/pmem.c sumiyawang        2021-08-22  541  				pmem->size, ARCH_MEMREMAP_PMEM);
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  542  		bb_range.start =  res->start;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  543  		bb_range.end = res->end;
91ed7ac444ef74 drivers/nvdimm/pmem.c Dan Williams      2018-10-04  544  	}
b36f47617f6ce7 drivers/nvdimm/pmem.c Dan Williams      2015-09-15  545  
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  546  	if (IS_ERR(addr)) {
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  547  		rc = PTR_ERR(addr);
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  548  		goto out;
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  549  	}
7a9eb206663177 drivers/nvdimm/pmem.c Dan Williams      2016-06-03  550  	pmem->virt_addr = addr;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  551  
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  552  	disk->fops		= &pmem_fops;
6ec26b8b2d70b4 drivers/nvdimm/pmem.c Christoph Hellwig 2020-05-08  553  	disk->private_data	= pmem;
5212e11fde4d40 drivers/nvdimm/pmem.c Vishal Verma      2015-06-25  554  	nvdimm_namespace_disk_name(ndns, disk->disk_name);
cfe30b872058f2 drivers/nvdimm/pmem.c Dan Williams      2016-03-03  555  	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
cfe30b872058f2 drivers/nvdimm/pmem.c Dan Williams      2016-03-03  556  			/ 512);
b95f5f4391fad6 drivers/nvdimm/pmem.c Dan Williams      2016-01-04  557  	if (devm_init_badblocks(dev, &pmem->bb))
b95f5f4391fad6 drivers/nvdimm/pmem.c Dan Williams      2016-01-04  558  		return -ENOMEM;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  559  	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
57f7f317abdd07 drivers/nvdimm/pmem.c Dan Williams      2016-01-06  560  	disk->bb = &pmem->bb;
f02716db951c5e drivers/nvdimm/pmem.c Dan Williams      2016-06-15  561  
30c6828a17a572 drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  562  	dax_dev = alloc_dax(pmem, &pmem_dax_ops);
4e4ced93794acb drivers/nvdimm/pmem.c Vivek Goyal       2020-04-01  563  	if (IS_ERR(dax_dev)) {
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  564  		rc = PTR_ERR(dax_dev);
f4d373ddd69956 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-15  565  		if (rc != -EOPNOTSUPP)
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  566  			goto out;
f4d373ddd69956 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-15  567  	} else {
7ac5360cd4d02c drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  568  		set_dax_nocache(dax_dev);
7ac5360cd4d02c drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  569  		set_dax_nomc(dax_dev);
30c6828a17a572 drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  570  		if (is_nvdimm_sync(nd_region))
30c6828a17a572 drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  571  			set_dax_synchronous(dax_dev);
f6932a275461e3 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-08  572  		pmem->dax_dev = dax_dev;
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  573  		rc = dax_add_host(dax_dev, disk);
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  574  		if (rc)
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  575  			goto out_cleanup_dax;
ce7f11a230d5b7 drivers/nvdimm/pmem.c Ross Zwisler      2018-06-06  576  		dax_write_cache(dax_dev, nvdimm_has_cache(nd_region));
f4d373ddd69956 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-15  577  	}
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  578  	rc = device_add_disk(dev, disk, pmem_attribute_groups);
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  579  	if (rc)
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  580  		goto out_remove_host;
c1d6e828a35df5 drivers/nvdimm/pmem.c Dan Williams      2017-01-24  581  	if (devm_add_action_or_reset(dev, pmem_release_disk, pmem))
f02716db951c5e drivers/nvdimm/pmem.c Dan Williams      2016-06-15  582  		return -ENOMEM;
f02716db951c5e drivers/nvdimm/pmem.c Dan Williams      2016-06-15  583  
32f61d67570db0 drivers/nvdimm/pmem.c Christoph Hellwig 2020-09-01  584  	nvdimm_check_and_set_ro(disk);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  585  
975750a98c2676 drivers/nvdimm/pmem.c Toshi Kani        2017-06-12  586  	pmem->bb_state = sysfs_get_dirent(disk_to_dev(disk)->kobj.sd,
975750a98c2676 drivers/nvdimm/pmem.c Toshi Kani        2017-06-12  587  					  "badblocks");
6aa734a2f38e2e drivers/nvdimm/pmem.c Dan Williams      2017-06-30  588  	if (!pmem->bb_state)
6aa734a2f38e2e drivers/nvdimm/pmem.c Dan Williams      2017-06-30  589  		dev_warn(dev, "'badblocks' notification disabled\n");
8c2f7e8658df1d drivers/nvdimm/pmem.c Dan Williams      2015-06-25  590  	return 0;
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  591  
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  592  out_remove_host:
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  593  	dax_remove_host(pmem->disk);
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  594  out_cleanup_dax:
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  595  	kill_dax(pmem->dax_dev);
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  596  	put_dax(pmem->dax_dev);
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  597  out:
8b9ab62662048a drivers/nvdimm/pmem.c Christoph Hellwig 2022-06-19  598  	put_disk(pmem->disk);
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  599  	return rc;
8c2f7e8658df1d drivers/nvdimm/pmem.c Dan Williams      2015-06-25  600  }
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  601  

:::::: The code at line 468 was first introduced by commit
:::::: 468ded03c07e0f2b5f05332bc255add47b1b0dee libnvdimm, pmem: move request_queue allocation earlier in probe

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
