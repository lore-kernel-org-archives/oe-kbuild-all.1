Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220034DCC7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 21:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778536585; cv=none; b=qhIgJ+mQfgqmFoT6i6h35ZAchE98jCViyIr4LZrXTzZDSFSYMS5LawZebX2twyd/Kl17JFzVSJPIJpV8jf0DhuKZ7ND5EWPEDmYjn7PS8HbjN5QMWXt56t0KtjvUNWu4h3TSnwjx/5Gg6L945tuvMiNQ3iWkffwXDqnM2FWfzM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778536585; c=relaxed/simple;
	bh=8luyVzbpy4LMfUi1WGtkrhrWGFAPBEUrgXIrd6GMnTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OriXOVyZxt0l15B0xW0kjkxJl4RYjCo0ZaO6b32HVcBBsr3TjT+9IVGdWYgLDyk2AZwlboqsjj+ZEEFEVKNy4KKKBu1C2NRjiXiY5XZmqnObaQ46qfe/IOt/QMbEI7a6zwVUJJi7mlOLF/44uC+Riwt3f9BWhX9tHtCjFkWMrMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nm/mDV+m; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nm/mDV+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778536584; x=1810072584;
  h=date:from:to:cc:subject:message-id;
  bh=8luyVzbpy4LMfUi1WGtkrhrWGFAPBEUrgXIrd6GMnTQ=;
  b=nm/mDV+mym1euWxumJquy3WNwFacNilJzGxI54F6q+jYWbV+/aouye93
   PR6cTv6j4HEpm8iJTu1JraUGnsAa89wwA9GYMyTfJkCQEsDlaLwDVfHI1
   JxVXCWwfdLY9QmJVVK+zBuUOjPDCBVSSWYx5aFyfWhbs1biSdiO6Ah1mx
   ynwxzCg9ubKIZfs/HdgCX2Zyx3zQpBNa+m12h9m4ViR2dKuzFnMF3xohI
   krNggQIZqNzro61VdCgzbhNXYQZ8iNQYTArRbZB0mkxVXwPZZ2eFGjPUb
   CU9Fio90eZU9gftIIMwSCWqtSj3ot2ubpwREc3fqHEtfLRBHff3nwk/i1
   A==;
X-CSE-ConnectionGUID: r9iCPe8OQS6JjOVU6k+Lhg==
X-CSE-MsgGUID: NmGjRst+R+KAURsW20RsFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79421406"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79421406"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 14:56:23 -0700
X-CSE-ConnectionGUID: mhTvprFxT22T6ElkypElmg==
X-CSE-MsgGUID: qrfEy5yGSRyGwbmbWyYlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="234909092"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 14:56:16 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMYbm-000000001Cr-191w;
	Mon, 11 May 2026 21:56:14 +0000
Date: Tue, 12 May 2026 05:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate 9/12] block/fops.c:963:31: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202605120529.SvTsMoDA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   60f90e5dd34dee9854f698e50e111a7a953a3516
commit: 2596670a53e80bf99d7793cafc90e33db3899192 [9/12] swap: push down setting sis->bdev into ->swap_activate
config: nios2-randconfig-r132-20260511 (https://download.01.org/0day-ci/archive/20260512/202605120529.SvTsMoDA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120529.SvTsMoDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120529.SvTsMoDA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/fops.c:963:31: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long nr_pages @@     got struct block_device * @@
   block/fops.c:963:31: sparse:     expected unsigned long nr_pages
   block/fops.c:963:31: sparse:     got struct block_device *

vim +963 block/fops.c

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
