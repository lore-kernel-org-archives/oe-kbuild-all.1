Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E5338398B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582195; cv=none; b=Cr9R+L2R+ZcgejWF1ZRAB74e/82ArQ+HzLJBC0twl54A5rnErKvF1M+SfXBpkYWNW3QmhX2w+UtLVIq3PqBXgTMO70OhRPFdNREkoIkDXhJ4VEbSCjqDIJwX1/1YkCAQW6VHlHX4cRReEBkcYg4DLkrjfztgYCMjYrU/LvniiII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582195; c=relaxed/simple;
	bh=Bm8SrZwyB81thCrBjD5exA+SpB9RrltC6xsoc4Vlp9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=srEl5g30VRTiXq1LlrPpuxBCsnx97yhHITBU7hHMgVRZFGGYN1YyqmCSp5Uoq+2zhHHiyZQvgbkJmLC2fpbGO7WhMUnEwXCy7lpjQdCKJGPCcP2/q7AfcXt85Dv+Y3qf/D4HF7ZkJgDBDjgNcFwIcpUlu03AFN1jb80DZx8ByvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNUHieto; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNUHieto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778582194; x=1810118194;
  h=date:from:to:cc:subject:message-id;
  bh=Bm8SrZwyB81thCrBjD5exA+SpB9RrltC6xsoc4Vlp9s=;
  b=eNUHietokZZEFWwVU1yq+zJqszeZRZexDLrskMaKivmlt25lVh4KvDoz
   KY3oLP2/A5q7WMIcc4Wk8Fva2fSmoSxtbFiDk7uuNkeNGMPDt0yXGWoxH
   tt3WMh+ETMNbMeHLV7c8y6BLPueSbYtWlT2qUIY/hjKFf0Jr77xlMSMgm
   sV2W8m5eiwvDnHDBlaLm0oxp4VRoWJMegi92KKPXTIXmSlpwOE1tC3pD1
   eIee3kno8sJPdJN4iPy2u4rWdISRyIii0qe41DXFqf+6OsZYzb5cnjHmQ
   2nzCO9hMeJspOla5J1m7gxu7DYmqyPH5zhSbGPhjE5DnKDcRP0d8Roske
   Q==;
X-CSE-ConnectionGUID: 0uFItKp0RF2DhqGNAzQJWg==
X-CSE-MsgGUID: +Whm5jh1RLqOdVu+OFEIvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="96910958"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="96910958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 03:36:33 -0700
X-CSE-ConnectionGUID: TyclgzHhSzuxpzw2LMRdrA==
X-CSE-MsgGUID: 9BQIYo32Qsai0LWYB296+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="237973343"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 May 2026 03:36:32 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMkTV-000000001zC-30yO;
	Tue, 12 May 2026 10:36:29 +0000
Date: Tue, 12 May 2026 18:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate /12] block/fops.c:963:25: error:
 passing argument 3 of 'add_swap_extent' makes integer from pointer without a
 cast
Message-ID: <202605121802.seSugOoh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   7414a67e6a700a2e9fef1fcd2ccce5592290e575
commit: 2596670a53e80bf99d7793cafc90e33db3899192 [/12] swap: push down setting sis->bdev into ->swap_activate
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20260512/202605121802.seSugOoh-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121802.seSugOoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121802.seSugOoh-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/fops.c: In function 'blkdev_swap_activate':
>> block/fops.c:963:25: error: passing argument 3 of 'add_swap_extent' makes integer from pointer without a cast [-Wint-conversion]
     963 |                         I_BDEV(file->f_mapping->host), 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         struct block_device *
   In file included from include/linux/suspend.h:5,
                    from block/fops.c:17:
   include/linux/swap.h:531:49: note: expected 'long unsigned int' but argument is of type 'struct block_device *'
     531 |                                   unsigned long nr_pages, sector_t start_block)
         |                                   ~~~~~~~~~~~~~~^~~~~~~~


vim +/add_swap_extent +963 block/fops.c

   951	
   952	static int blkdev_swap_activate(struct file *file, struct swap_info_struct *sis)
   953	{
   954		loff_t isize = i_size_read(bdev_file_inode(file));
   955	
   956		/*
   957		 * The swap code performs arbitrary overwrites, which are not supported
   958		 * on zones with sequential write constraints.
   959		 */
   960		if (bdev_is_zoned(I_BDEV(file->f_mapping->host)))
   961			return -EINVAL;
   962		return add_swap_extent(sis, div_u64(isize, PAGE_SIZE),
 > 963				I_BDEV(file->f_mapping->host), 0);
   964	}
   965	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
