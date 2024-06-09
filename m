Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B711865C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717932069; cv=none; b=nbASnabgPBpk9Tel2zMgG8+d8dROhurX40FQOlXN703ehjn/0lkuxlJf57UV2ef0Zl+wCKIHEMWTJlnNUGLej07SunE3TbQw4bpfu42/nOEeOqgSEv+pvF35mr7b2a/AMmUYQD92C8UbdjVfR/TO//6kB+f34blqAK3nr89xo3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717932069; c=relaxed/simple;
	bh=IuSy1nb6t1J3e+s6GNJ0DW14AnbD1oeLdq50SEjE/ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQ3WZR2CtezjSuVzhymopDUvW4yVZF61tXflHhN5QhpjLnM1878EhiUCfP0ejKvKV2CFQ4gsD1dmXeOLgcNG2DrOHQ3WiITn7R/fA5LNYn1998YsrTWDI3ESvJ74/OaxGTQmTpqJPYrRhWGQ7mnL93sBlQycEtIErKeAKPETsCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBBVnFL4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBBVnFL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717932067; x=1749468067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuSy1nb6t1J3e+s6GNJ0DW14AnbD1oeLdq50SEjE/ok=;
  b=UBBVnFL4X4iiMG+PAeCKAeoxIfHcs+h6zgHW+bjTJrkaCJ22iN21jM8x
   6MbTgMuJ448ZSGjmsCU8nsryIQ0K2mkRoP68NE6Zo3fzwfLm6PMFSmiPe
   ZmdB7uN7rueaNWJsK819KFd2OupfCTECX7+fbLt0gBa+AqPS9KGEQshU8
   uhIleAY4q8DGEPndhfXZGYuGOvjsV1CrqhsDTaDArjvtXI0EWprHqu90J
   Awnb5ZMInJUfz9g+mMMG1PXDMSZwU3fIAdzYhJuwwL3TQcuDT9qMtkgCD
   cK9b73VuNDIg1KqrAR0LAiDQdm/EnsW82A7HCmGssf5DgpcTB3wokSVAw
   Q==;
X-CSE-ConnectionGUID: ORnMAlE7SaC/zA8YvauKGw==
X-CSE-MsgGUID: 5yM/5WqXQpeKgjKPSeCV0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14737610"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14737610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 04:21:06 -0700
X-CSE-ConnectionGUID: WszM46XrRV6KHy0chKRI4A==
X-CSE-MsgGUID: 9KEx8nX/QtCS7d2e9caY7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="38868139"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2024 04:21:06 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGGbe-00018I-2W;
	Sun, 09 Jun 2024 11:21:02 +0000
Date: Sun, 9 Jun 2024 19:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-limit-flags 48/54] drivers/nvdimm/pmem.c:513:2:
 error: use of undeclared identifier 'q'
Message-ID: <202406091944.JEduf2Qw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-limit-flags
head:   f3e39b28e8a18718507cd40cc944a5111c3c95d9
commit: fea4de779ac3c3cdb565d1ad13f8eb0b285ea0a0 [48/54] block: move the dax flag to queue_limits
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240609/202406091944.JEduf2Qw-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091944.JEduf2Qw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091944.JEduf2Qw-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> drivers/nvdimm/pmem.c:513:2: error: use of undeclared identifier 'q'
     513 |         q = disk->queue;
         |         ^
   1 warning and 1 error generated.


vim +/q +513 drivers/nvdimm/pmem.c

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
d82aa10f38895c drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  458  		.features		= BLK_FEAT_WRITE_CACHE |
d82aa10f38895c drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  459  					  BLK_FEAT_SYNCHRONOUS,
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  460  	};
ce7f11a230d5b7 drivers/nvdimm/pmem.c Ross Zwisler      2018-06-06  461  	int nid = dev_to_node(dev), fua;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  462  	struct resource *res = &nsio->res;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  463  	struct range bb_range;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  464  	struct nd_pfn *nd_pfn = NULL;
c1d6e828a35df5 drivers/nvdimm/pmem.c Dan Williams      2017-01-24  465  	struct dax_device *dax_dev;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  466  	struct nd_pfn_sb *pfn_sb;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  467  	struct pmem_device *pmem;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  468  	struct gendisk *disk;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  469  	void *addr;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  470  	int rc;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  471  
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  472  	pmem = devm_kzalloc(dev, sizeof(*pmem), GFP_KERNEL);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  473  	if (!pmem)
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  474  		return -ENOMEM;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  475  
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  476  	rc = devm_namespace_enable(dev, ndns, nd_info_block_reserve());
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  477  	if (rc)
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  478  		return rc;
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  479  
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  480  	/* while nsio_rw_bytes is active, parse a pfn info block if present */
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  481  	if (is_nd_pfn(dev)) {
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  482  		nd_pfn = to_nd_pfn(dev);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  483  		rc = nvdimm_setup_pfn(nd_pfn, &pmem->pgmap);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  484  		if (rc)
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  485  			return rc;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  486  	}
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  487  
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  488  	/* we're attaching a block device, disable raw namespace access */
8f4b01fcded2dc drivers/nvdimm/pmem.c Aneesh Kumar K.V  2019-10-31  489  	devm_namespace_disable(dev, ndns);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  490  
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  491  	dev_set_drvdata(dev, pmem);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  492  	pmem->phys_addr = res->start;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  493  	pmem->size = resource_size(res);
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  494  	fua = nvdimm_has_flush(nd_region);
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  495  	if (!IS_ENABLED(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) || fua < 0) {
61031952f4c89d drivers/nvdimm/pmem.c Ross Zwisler      2015-06-25  496  		dev_warn(dev, "unable to guarantee persistence of writes\n");
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  497  		fua = 0;
0b277961f4484f drivers/nvdimm/pmem.c Dan Williams      2017-06-09  498  	}
c1f56c404a65ba drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-05  499  	if (fua)
c1f56c404a65ba drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-05  500  		lim.features |= BLK_FEAT_FUA;
fea4de779ac3c3 drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  501  	if (is_nd_pfn(dev))
fea4de779ac3c3 drivers/nvdimm/pmem.c Christoph Hellwig 2024-06-08  502  		lim.features |= BLK_FEAT_DAX;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  503  
947df02d255a6a drivers/nvdimm/pmem.c Dan Williams      2016-03-21  504  	if (!devm_request_mem_region(dev, res->start, resource_size(res),
450c6633e874c4 drivers/nvdimm/pmem.c Dan Williams      2016-11-28  505  				dev_name(&ndns->dev))) {
947df02d255a6a drivers/nvdimm/pmem.c Dan Williams      2016-03-21  506  		dev_warn(dev, "could not reserve region %pR\n", res);
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  507  		return -EBUSY;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  508  	}
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  509  
c3d9c3031e18f1 drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  510  	disk = blk_alloc_disk(&lim, nid);
74fa8f9c553f7b drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  511  	if (IS_ERR(disk))
74fa8f9c553f7b drivers/nvdimm/pmem.c Christoph Hellwig 2024-02-15  512  		return PTR_ERR(disk);
87eb73b2ca7c1b drivers/nvdimm/pmem.c Christoph Hellwig 2021-05-21 @513  	q = disk->queue;
468ded03c07e0f drivers/nvdimm/pmem.c Dan Williams      2016-01-15  514  
87eb73b2ca7c1b drivers/nvdimm/pmem.c Christoph Hellwig 2021-05-21  515  	pmem->disk = disk;
a624eb520390ce drivers/nvdimm/pmem.c Dan Williams      2021-06-07  516  	pmem->pgmap.owner = pmem;
34c0fd540e79fb drivers/nvdimm/pmem.c Dan Williams      2016-01-15  517  	pmem->pfn_flags = PFN_DEV;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  518  	if (is_nd_pfn(dev)) {
f6a55e1a3fe6b3 drivers/nvdimm/pmem.c Christoph Hellwig 2019-06-26  519  		pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
33a8f7f2b3a343 drivers/nvdimm/pmem.c Shiyang Ruan      2022-06-03  520  		pmem->pgmap.ops = &fsdax_pagemap_ops;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  521  		addr = devm_memremap_pages(dev, &pmem->pgmap);
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  522  		pfn_sb = nd_pfn->pfn_sb;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  523  		pmem->data_offset = le64_to_cpu(pfn_sb->dataoff);
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  524  		pmem->pfn_pad = resource_size(res) -
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  525  			range_len(&pmem->pgmap.range);
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  526  		pmem->pfn_flags |= PFN_MAP;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  527  		bb_range = pmem->pgmap.range;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  528  		bb_range.start += pmem->data_offset;
200c79da824c97 drivers/nvdimm/pmem.c Dan Williams      2016-03-22  529  	} else if (pmem_should_map_pages(dev)) {
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  530  		pmem->pgmap.range.start = res->start;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  531  		pmem->pgmap.range.end = res->end;
b7b3c01b191596 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  532  		pmem->pgmap.nr_range = 1;
f6a55e1a3fe6b3 drivers/nvdimm/pmem.c Christoph Hellwig 2019-06-26  533  		pmem->pgmap.type = MEMORY_DEVICE_FS_DAX;
33a8f7f2b3a343 drivers/nvdimm/pmem.c Shiyang Ruan      2022-06-03  534  		pmem->pgmap.ops = &fsdax_pagemap_ops;
e8d5134833006a drivers/nvdimm/pmem.c Christoph Hellwig 2017-12-29  535  		addr = devm_memremap_pages(dev, &pmem->pgmap);
34c0fd540e79fb drivers/nvdimm/pmem.c Dan Williams      2016-01-15  536  		pmem->pfn_flags |= PFN_MAP;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  537  		bb_range = pmem->pgmap.range;
91ed7ac444ef74 drivers/nvdimm/pmem.c Dan Williams      2018-10-04  538  	} else {
32b2397c1e56f3 drivers/nvdimm/pmem.c sumiyawang        2021-08-22  539  		addr = devm_memremap(dev, pmem->phys_addr,
32b2397c1e56f3 drivers/nvdimm/pmem.c sumiyawang        2021-08-22  540  				pmem->size, ARCH_MEMREMAP_PMEM);
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  541  		bb_range.start =  res->start;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  542  		bb_range.end = res->end;
91ed7ac444ef74 drivers/nvdimm/pmem.c Dan Williams      2018-10-04  543  	}
b36f47617f6ce7 drivers/nvdimm/pmem.c Dan Williams      2015-09-15  544  
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  545  	if (IS_ERR(addr)) {
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  546  		rc = PTR_ERR(addr);
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  547  		goto out;
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  548  	}
7a9eb206663177 drivers/nvdimm/pmem.c Dan Williams      2016-06-03  549  	pmem->virt_addr = addr;
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  550  
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  551  	disk->fops		= &pmem_fops;
6ec26b8b2d70b4 drivers/nvdimm/pmem.c Christoph Hellwig 2020-05-08  552  	disk->private_data	= pmem;
5212e11fde4d40 drivers/nvdimm/pmem.c Vishal Verma      2015-06-25  553  	nvdimm_namespace_disk_name(ndns, disk->disk_name);
cfe30b872058f2 drivers/nvdimm/pmem.c Dan Williams      2016-03-03  554  	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
cfe30b872058f2 drivers/nvdimm/pmem.c Dan Williams      2016-03-03  555  			/ 512);
b95f5f4391fad6 drivers/nvdimm/pmem.c Dan Williams      2016-01-04  556  	if (devm_init_badblocks(dev, &pmem->bb))
b95f5f4391fad6 drivers/nvdimm/pmem.c Dan Williams      2016-01-04  557  		return -ENOMEM;
a4574f63edc6f7 drivers/nvdimm/pmem.c Dan Williams      2020-10-13  558  	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
57f7f317abdd07 drivers/nvdimm/pmem.c Dan Williams      2016-01-06  559  	disk->bb = &pmem->bb;
f02716db951c5e drivers/nvdimm/pmem.c Dan Williams      2016-06-15  560  
30c6828a17a572 drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  561  	dax_dev = alloc_dax(pmem, &pmem_dax_ops);
4e4ced93794acb drivers/nvdimm/pmem.c Vivek Goyal       2020-04-01  562  	if (IS_ERR(dax_dev)) {
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  563  		rc = PTR_ERR(dax_dev);
f4d373ddd69956 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-15  564  		if (rc != -EOPNOTSUPP)
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  565  			goto out;
f4d373ddd69956 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-15  566  	} else {
7ac5360cd4d02c drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  567  		set_dax_nocache(dax_dev);
7ac5360cd4d02c drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  568  		set_dax_nomc(dax_dev);
30c6828a17a572 drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  569  		if (is_nvdimm_sync(nd_region))
30c6828a17a572 drivers/nvdimm/pmem.c Christoph Hellwig 2021-12-15  570  			set_dax_synchronous(dax_dev);
f6932a275461e3 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-08  571  		pmem->dax_dev = dax_dev;
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  572  		rc = dax_add_host(dax_dev, disk);
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  573  		if (rc)
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  574  			goto out_cleanup_dax;
ce7f11a230d5b7 drivers/nvdimm/pmem.c Ross Zwisler      2018-06-06  575  		dax_write_cache(dax_dev, nvdimm_has_cache(nd_region));
f4d373ddd69956 drivers/nvdimm/pmem.c Mathieu Desnoyers 2024-02-15  576  	}
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  577  	rc = device_add_disk(dev, disk, pmem_attribute_groups);
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  578  	if (rc)
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  579  		goto out_remove_host;
c1d6e828a35df5 drivers/nvdimm/pmem.c Dan Williams      2017-01-24  580  	if (devm_add_action_or_reset(dev, pmem_release_disk, pmem))
f02716db951c5e drivers/nvdimm/pmem.c Dan Williams      2016-06-15  581  		return -ENOMEM;
f02716db951c5e drivers/nvdimm/pmem.c Dan Williams      2016-06-15  582  
32f61d67570db0 drivers/nvdimm/pmem.c Christoph Hellwig 2020-09-01  583  	nvdimm_check_and_set_ro(disk);
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  584  
975750a98c2676 drivers/nvdimm/pmem.c Toshi Kani        2017-06-12  585  	pmem->bb_state = sysfs_get_dirent(disk_to_dev(disk)->kobj.sd,
975750a98c2676 drivers/nvdimm/pmem.c Toshi Kani        2017-06-12  586  					  "badblocks");
6aa734a2f38e2e drivers/nvdimm/pmem.c Dan Williams      2017-06-30  587  	if (!pmem->bb_state)
6aa734a2f38e2e drivers/nvdimm/pmem.c Dan Williams      2017-06-30  588  		dev_warn(dev, "'badblocks' notification disabled\n");
8c2f7e8658df1d drivers/nvdimm/pmem.c Dan Williams      2015-06-25  589  	return 0;
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  590  
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  591  out_remove_host:
fb08a1908cb119 drivers/nvdimm/pmem.c Christoph Hellwig 2021-11-29  592  	dax_remove_host(pmem->disk);
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  593  out_cleanup_dax:
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  594  	kill_dax(pmem->dax_dev);
5a192ccc32e298 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  595  	put_dax(pmem->dax_dev);
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  596  out:
8b9ab62662048a drivers/nvdimm/pmem.c Christoph Hellwig 2022-06-19  597  	put_disk(pmem->disk);
accf58afb689f8 drivers/nvdimm/pmem.c Luis Chamberlain  2021-11-03  598  	return rc;
8c2f7e8658df1d drivers/nvdimm/pmem.c Dan Williams      2015-06-25  599  }
9e853f2313e5eb drivers/block/pmem.c  Ross Zwisler      2015-04-01  600  

:::::: The code at line 513 was first introduced by commit
:::::: 87eb73b2ca7c1b913e84d6efe46810fd301e7a66 nvdimm-pmem: convert to blk_alloc_disk/blk_cleanup_disk

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
