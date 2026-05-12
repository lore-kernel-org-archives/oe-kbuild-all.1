Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9C39903B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576181; cv=none; b=QKM7tUOYdqiK3QLfBIvJ+q4DbKZ9d8yQbIfvF3hoBepPfjDCtwdmNeXFDTNkPj0Ky8deh4I8hc7S7ELgmofuNbuOAhdUIGF//2j88JmvJo6IZw2czrlaug2w1HWuc5vVXlOfrHkOVX/FHWw1PP5KeijK9dFQ7h5SB75wXtg45hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576181; c=relaxed/simple;
	bh=QiLMOjmbAF4i5jsgeYtnZz2QbO3FqRDwxCzp+YwU+K0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YtOHHCbigSof04VLUACuOfw0jY5opUNouOycz44DlEx7m37PVzSkYmNwqNbqtEN8S0pBrgs3AE5iiZGbcMgLon5/GuVVu8wiQ9yxREUs/pdeDMeLbjW/W8Jrk93S++JM50upjErV+sGiJWARsk/7B1fj7849gQP6ldxWAlNbP0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjy7qF5k; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjy7qF5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778576167; x=1810112167;
  h=date:from:to:cc:subject:message-id;
  bh=QiLMOjmbAF4i5jsgeYtnZz2QbO3FqRDwxCzp+YwU+K0=;
  b=kjy7qF5k0Z2OP9UZFPW/LUMuBYr90eGe1D879DwdqJnyAgR3red+tEEr
   5MfzChwjgmIrBZifCWGPc3JybyN8cmZikpiqyRM/EOuNuL50of5hYmpI0
   DtKvvvDE8wBu4CLfYb6KxH7rPMAAMWx5q3y61n3liwgh2yfveBfLTYowy
   zFXC5lCuq560TgjesKorLQs61upEmuGUArCEpWa5QNjOKXoeFQUHw4k1p
   Ova/sLZAXhsYjqYUR9tXyAX684l6TmmFfaPvK3US91elJRzn7NONYDt+P
   Sl5yeFzx97YEPbrKqsEcMtvXhglPgx9KP8j/r4g4kcAe8+jTkZfTZJsge
   Q==;
X-CSE-ConnectionGUID: /TF2f1vbTcKqjcXb2EWBHA==
X-CSE-MsgGUID: DqoVC8yvRsmm9NNGAyuIxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83094660"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83094660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:56:06 -0700
X-CSE-ConnectionGUID: UfbITLbGRD6E+SbIAh9nlA==
X-CSE-MsgGUID: Eo6eupX0TLei4TdPYh1uxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233231144"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 01:56:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMiuH-000000001tY-3lD0;
	Tue, 12 May 2026 08:56:01 +0000
Date: Tue, 12 May 2026 16:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate 6/12] block/fops.c:954:41: error:
 too few arguments to function call, expected 4, have 3
Message-ID: <202605121609.8AZFmNC2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   7414a67e6a700a2e9fef1fcd2ccce5592290e575
commit: a6dced0d47f7bb6e1a86b11007c47874e50c7370 [6/12] swap,block: move the block device swapon code into block/fops.c
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260512/202605121609.8AZFmNC2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121609.8AZFmNC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121609.8AZFmNC2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/fops.c:954:41: error: too few arguments to function call, expected 4, have 3
     954 |         return add_swap_extent(sis, sis->max, 0);
         |                ~~~~~~~~~~~~~~~                 ^
   include/linux/swap.h:529:19: note: 'add_swap_extent' declared here
     529 | static inline int add_swap_extent(struct swap_info_struct *sis,
         |                   ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     530 |                 unsigned long start_page, unsigned long nr_pages,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     531 |                 sector_t start_block)
         |                 ~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +954 block/fops.c

   951	
   952	static int blkdev_swap_activate(struct file *file, struct swap_info_struct *sis)
   953	{
 > 954		return add_swap_extent(sis, sis->max, 0);
   955	}
   956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
