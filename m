Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E6A5A0E3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709493005; cv=none; b=CruVMysxelZUKrMR93Ti9r7mbZz34rg9xRm5hDv4yO1GV8jzwsd4WgaaurnFHDJy8OFuzERbpGknZ2Fmf9nZAsaCfrMjdShd1x18YBI+TAdxqxb4lHI4pWReR03GS6c7hcunYOGj5/RD/YhLsuubINT0wtYbPIXFwRHJXRAicG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709493005; c=relaxed/simple;
	bh=IQmJfskUiS0zJC1e6wIuG0vzwWRUIINQmAB+ie1WcW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SdxrCzoi/b4XfpfkwPRKO5eTOj/HM/eKzkxeDQYh15OJFwLqLLTqFPOUGiQShidSGzYekmm22Ixvo84s9UtN7SsUlowtMvd1iI3JZBsXt3nhTQeHDOJ0dq4ZbJpejPLJID4AubnLqLUGqT2AfImXsgYE86Np3H/1TP7VNpfe6W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdsLxL4z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdsLxL4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709493004; x=1741029004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQmJfskUiS0zJC1e6wIuG0vzwWRUIINQmAB+ie1WcW0=;
  b=BdsLxL4zhfBEeL8nEhqBaAeRi4JMbdGr1dZZ6AdAFMgnd1T923upubjr
   3XRpuFRidY+l2b9bQCZFK5Im7aNut+W5yYixDVJ4UMeVPy4sneruxiSh9
   WDrVDKoywImntNjyrlqyJqV4I5ph19SRnL0qqAsxFmBGnUed2J9J1sp3y
   dC1BOWeZ08xyPDhK/oSBisBbe7PCHtIRxOS82xDBQC+2ZhU++R0K5YT0j
   cD+kNBu43cvp/70zdkU3PRwz+OwkpXKf+iKnBoCIwWemPvq93KIeyG3ic
   ZPtqsONfiBTzXwBjSeKAk+UilljperQKcbsiFD8gPo5o2zTy3+85iCphy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7795071"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7795071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 11:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13441949"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2024 11:09:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgrDg-00022M-14;
	Sun, 03 Mar 2024 19:09:56 +0000
Date: Mon, 4 Mar 2024 03:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:notmuch-cover.1708709155.git.john@groves.net 7/23]
 drivers/dax/device.c:442:30: warning: cast from pointer to integer of
 different size
Message-ID: <202403040302.aklsscmv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux notmuch-cover.1708709155.git.john@groves.net
head:   c8318dd2a63c230e5e731bc14750a466d7891ddc
commit: 952408f51254a8e03583e0eb6079079b13ccf78f [7/23] dev_dax_iomap: Save the kva from memremap
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040302.aklsscmv-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040302.aklsscmv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040302.aklsscmv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dax/device.c: In function 'dev_dax_probe':
>> drivers/dax/device.c:442:30: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     442 |         dev_dax->virt_addr = (u64)addr + data_offset;
         |                              ^


vim +442 drivers/dax/device.c

   369	
   370	static int dev_dax_probe(struct dev_dax *dev_dax)
   371	{
   372		struct dax_device *dax_dev = dev_dax->dax_dev;
   373		struct device *dev = &dev_dax->dev;
   374		struct dev_pagemap *pgmap;
   375		u64 data_offset = 0;
   376		struct inode *inode;
   377		struct cdev *cdev;
   378		void *addr;
   379		int rc, i;
   380	
   381		if (static_dev_dax(dev_dax))  {
   382			if (dev_dax->nr_range > 1) {
   383				dev_warn(dev,
   384					"static pgmap / multi-range device conflict\n");
   385				return -EINVAL;
   386			}
   387	
   388			pgmap = dev_dax->pgmap;
   389		} else {
   390			if (dev_dax->pgmap) {
   391				dev_warn(dev,
   392					 "dynamic-dax with pre-populated page map\n");
   393				return -EINVAL;
   394			}
   395	
   396			pgmap = devm_kzalloc(dev,
   397	                       struct_size(pgmap, ranges, dev_dax->nr_range - 1),
   398	                       GFP_KERNEL);
   399			if (!pgmap)
   400				return -ENOMEM;
   401	
   402			pgmap->nr_range = dev_dax->nr_range;
   403			dev_dax->pgmap = pgmap;
   404	
   405			for (i = 0; i < dev_dax->nr_range; i++) {
   406				struct range *range = &dev_dax->ranges[i].range;
   407				pgmap->ranges[i] = *range;
   408			}
   409		}
   410	
   411		for (i = 0; i < dev_dax->nr_range; i++) {
   412			struct range *range = &dev_dax->ranges[i].range;
   413	
   414			if (!devm_request_mem_region(dev, range->start,
   415						range_len(range), dev_name(dev))) {
   416				dev_warn(dev, "mapping%d: %#llx-%#llx could not reserve range\n",
   417						i, range->start, range->end);
   418				return -EBUSY;
   419			}
   420		}
   421	
   422		pgmap->type = MEMORY_DEVICE_GENERIC;
   423		if (dev_dax->align > PAGE_SIZE)
   424			pgmap->vmemmap_shift =
   425				order_base_2(dev_dax->align >> PAGE_SHIFT);
   426		addr = devm_memremap_pages(dev, pgmap);
   427		if (IS_ERR(addr))
   428			return PTR_ERR(addr);
   429	
   430		/* Detect whether the data is at a non-zero offset into the memory */
   431		if (pgmap->range.start != dev_dax->ranges[0].range.start) {
   432			u64 phys = (u64)dev_dax->ranges[0].range.start;
   433			u64 pgmap_phys = (u64)dev_dax->pgmap[0].range.start;
   434			u64 vmemmap_shift = (u64)dev_dax->pgmap[0].vmemmap_shift;
   435	
   436			if (!WARN_ON(pgmap_phys > phys))
   437				data_offset = phys - pgmap_phys;
   438	
   439			pr_notice("%s: offset detected phys=%llx pgmap_phys=%llx offset=%llx shift=%llx\n",
   440			       __func__, phys, pgmap_phys, data_offset, vmemmap_shift);
   441		}
 > 442		dev_dax->virt_addr = (u64)addr + data_offset;
   443	
   444		inode = dax_inode(dax_dev);
   445		cdev = inode->i_cdev;
   446		cdev_init(cdev, &dax_fops);
   447		cdev->owner = dev->driver->owner;
   448		cdev_set_parent(cdev, &dev->kobj);
   449		rc = cdev_add(cdev, dev->devt, 1);
   450		if (rc)
   451			return rc;
   452	
   453		rc = devm_add_action_or_reset(dev, dev_dax_cdev_del, cdev);
   454		if (rc)
   455			return rc;
   456	
   457		run_dax(dax_dev);
   458		return devm_add_action_or_reset(dev, dev_dax_kill, dev_dax);
   459	}
   460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
