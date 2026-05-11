Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E1A2FE56A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520767; cv=none; b=HnFGLRcRsbE4F34XgqG3+lj/DFyonjnxFTnNG8Lw+5wvMxpFh7HZECtMPhqQi5XjMiy5Yy0nJOQjR8kAAoXbhaH92SykvST2tsD8JlC92sgWcHLIOQ84lIoNSElpNsJYitWsTmE+tDfw9gGPyjimGdOjfyGzdaX6hKYhKC0yAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520767; c=relaxed/simple;
	bh=WFXRXc5NdVS2cKXz35hZEvUDn7tN0XYuzzTNn6IhGUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OvokYO0OuV3hnBQltPWY72kdxsQ9V+Jrujhad72XcGGhT6TyanP87acDkJ1rtPgYt2a6+PoIJUGamFgaPPq8elBPjJP+OXN3LVQiLbvHV4VapJmwUukYj5e6Zb9zT64T5Q6fIBwfg02O//t/0WpETkkYz6fqlYrubamjBw+TjmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm8rv5QX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm8rv5QX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778520765; x=1810056765;
  h=date:from:to:cc:subject:message-id;
  bh=WFXRXc5NdVS2cKXz35hZEvUDn7tN0XYuzzTNn6IhGUA=;
  b=jm8rv5QXgODKzaF0PR2+MI5Jkk9YJlXIc/7AX9xOGfz2uhhSGi8WprNN
   QyBHvSMxUDqB7T8aAPO3HvwcMlQKd8k7+dzKc0tIEIlGYeRjGgv12/5PL
   VRmJxYiL7YO6LWtGtMDj4qjYtSq3ZEFJFsOpKyXSl9UmmaCXaC0dKwIre
   JuUnD589W4RceCZTmU74NuxHkteyAFAMmp6URRvnqm/fWxIZO4HKmnZqA
   zQmWzOFKrT5hOfM1wLtbfjXO5/f/uuebLhgRWm4gkn5TJGYffGFUduhwk
   Q+Wz+Bdq0UdzE3Z97qmJnt06jnfxdKFGPJt55tm/j+zZaFbR1lLrgZxhR
   A==;
X-CSE-ConnectionGUID: cu5dnukAQKaGgwkOylHAzg==
X-CSE-MsgGUID: 7dOfHx9cTPa18lVOpyCFFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90882854"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90882854"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:32:45 -0700
X-CSE-ConnectionGUID: nU6LvCecTYWVa2LDJV/Png==
X-CSE-MsgGUID: g1vgcRiWQV+OMkaIQIMGhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="261258850"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 May 2026 10:32:43 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMUUj-000000000xT-2jo7;
	Mon, 11 May 2026 17:32:41 +0000
Date: Tue, 12 May 2026 01:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate 9/12] block/fops.c:963:4: error:
 incompatible pointer to integer conversion passing 'struct block_device *' to
 parameter of type 'unsigned long'
Message-ID: <202605120114.XhMQeB5T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   60f90e5dd34dee9854f698e50e111a7a953a3516
commit: 2596670a53e80bf99d7793cafc90e33db3899192 [9/12] swap: push down setting sis->bdev into ->swap_activate
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260512/202605120114.XhMQeB5T-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120114.XhMQeB5T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120114.XhMQeB5T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/fops.c:963:4: error: incompatible pointer to integer conversion passing 'struct block_device *' to parameter of type 'unsigned long' [-Wint-conversion]
     963 |                         I_BDEV(file->f_mapping->host), 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swap.h:531:21: note: passing argument to parameter 'nr_pages' here
     531 |                                   unsigned long nr_pages, sector_t start_block)
         |                                                 ^
   1 error generated.


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
