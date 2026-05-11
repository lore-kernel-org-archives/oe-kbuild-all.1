Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1638A478851
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525817; cv=none; b=fxKSVY37yRcUkZrVPisybnFEVcoZqM0uIDFPGQBlJxo0dW7a7EyCQObJyJr5Qvp0Q19pOK687mUZeWPr5QGPo7Ngo/JMOIiiqMabupkOnCkVAbJU5DZ7XodvmPHj+WiY3RnZImKHXK/vBk4jNnvW7gWaB1LEUSo6tqOS9Akf7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525817; c=relaxed/simple;
	bh=dprjWoOMGvoYckV28LxiKbVPY2SO3hThlNRHYM6jfJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tm57QkXfMftWaZgDBzLzNRC16CaPH23+PXg8Lo/BC9c3KMcuxJG99lF4DxsxqVYL+6swGt9hW5pYgfLEwf95M6FNLPRD1rVloEpKNXnqJhcxaNGJEYKaMSg2Ta6mjdIAtInwK5f79tK/Bp/qHG53T17SvNAoboNYblFuAuquVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbcRblYI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbcRblYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778525816; x=1810061816;
  h=date:from:to:cc:subject:message-id;
  bh=dprjWoOMGvoYckV28LxiKbVPY2SO3hThlNRHYM6jfJ4=;
  b=dbcRblYIH5bgHDz4zXvNXahU+Heyefn0S/jxNUfTur9jDJu1SdSFGKzI
   64zyHEIPVE2LNPHlabKb66yegWiJSQBId8jJgUo+J27MxBSSQvtosscWy
   3SJScM+TWTjiROjyGKxzDvpcW1FaZLpZHH4dj4mSp8x8TUP7S3LTe4kAb
   vCGuWW99p2e24frwydv1PcqaFOoqSkfyDfrM8aIlocVc/XSQyaTkyAqh1
   HaYvBT4wmiFVmHxEAL3SckRK64RWDWLfJZszQ5e5HivzzzVd8fuPhMeZE
   jyXU3cu2zoUBkV7JyOz9BDACHapQEsfMTja0DMWhsGK3J/lwycFbc6a+F
   A==;
X-CSE-ConnectionGUID: HO//nFXwT+yTgO2Pn1BaCg==
X-CSE-MsgGUID: evcODyPOSj6tHpGXu9pHHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102088426"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="102088426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 11:56:55 -0700
X-CSE-ConnectionGUID: RaU8tCy4SLCqOMqHusYRbA==
X-CSE-MsgGUID: 6yeLvr4JSf2LP0dNj2VyyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="233062200"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 May 2026 11:56:53 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMVoB-00000000121-12db;
	Mon, 11 May 2026 18:56:51 +0000
Date: Tue, 12 May 2026 02:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate 9/12] block/fops.c:963:25: warning:
 passing argument 3 of 'add_swap_extent' makes integer from pointer without a
 cast
Message-ID: <202605120253.qII4Bwb5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   60f90e5dd34dee9854f698e50e111a7a953a3516
commit: 2596670a53e80bf99d7793cafc90e33db3899192 [9/12] swap: push down setting sis->bdev into ->swap_activate
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20260512/202605120253.qII4Bwb5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120253.qII4Bwb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120253.qII4Bwb5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/fops.c: In function 'blkdev_swap_activate':
>> block/fops.c:963:25: warning: passing argument 3 of 'add_swap_extent' makes integer from pointer without a cast [-Wint-conversion]
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
