Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258A0238D27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 23:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520546; cv=none; b=Evc7gUxuQ5Jfx546RwC1inPJuzVW5i0tMHX5P7ebp2R+01KDwyq7e7JN2xIs5/QqZxRTyrpxLqCTbGl6yvKC8W80LF5Ni9ZRgZOMLIlzjyR5m7gipAh8eSfu+SVasi1XkF/VXTIl2mqNCdA0gqidMoR/4obCi0Ytbl9e4IeVROU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520546; c=relaxed/simple;
	bh=XKzEf3Wm2kYupqSm3p0dAizOq0RaokxyZurMZD5J6Dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FzDyfU5JAaaqDTZVq49I0cmIV9evg9rDr/NisgZ/fkAbqj993pWuAzwkvC0XzPE5ihktHoi2sB0kA4Uz12jKNCCSNFF2dyf4/MxkiRX24Zd8+oiSajLOEKRWrSpOLT5QlHTtdR6vhptPptt5cQF9Gb7wMFGNTjvxDSxhz9CoRq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mf0s235T; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mf0s235T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768520544; x=1800056544;
  h=date:from:to:cc:subject:message-id;
  bh=XKzEf3Wm2kYupqSm3p0dAizOq0RaokxyZurMZD5J6Dw=;
  b=mf0s235TqKat+NJHKnIjHRnSXh8zDZx1OxwylrE1dYl6pjf8czy9oOtY
   zYgjIwzIsGFuz0DlC7+LPac+miHeOzmm9d1zOEKg3iItmbp7SBloUXjZm
   LzQo9XY4M4iAKA4LNF9XoOBz9lP3uwSs+qtwff9uqCbr1nZwCGZNOmlkA
   3L+Qqn8WczAmxYkZ2U4CjIBRI0pm4ZpWTvCcFU8V5kGd7eiQ9uqorQHxu
   ridiZCCr20XQ5O9ywqgjeoXsT+yrNxuZf4I/1UPCBdUcC+tFRQfzdXXtY
   ufB3hOc7OrmAYWfOJ9GnOXrqlHJpNLDtrko0SrvMRLTeem2TZ/HLmU5GL
   A==;
X-CSE-ConnectionGUID: 68hhzDTwQEuDjcHLe1oEBQ==
X-CSE-MsgGUID: eXXuuPdBS4uudaOepG8MbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69734480"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69734480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 15:42:24 -0800
X-CSE-ConnectionGUID: frcI64yYSHiTX1butvRAxA==
X-CSE-MsgGUID: DZeCBPOPQ8W8VT8HwDgozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209951982"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 15:42:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgWyq-00000000K7U-07Ec;
	Thu, 15 Jan 2026 23:42:20 +0000
Date: Fri, 16 Jan 2026 07:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 19/19]
 drivers/mtd/maps/solutionengine.c:22:17: sparse: sparse: symbol
 'soleng_eprom_map' was not declared. Should it be static?
Message-ID: <202601160727.nT10NNec-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   e5a4b798e710861426579bea24f769032504de8b
commit: e5a4b798e710861426579bea24f769032504de8b [19/19] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sh-randconfig-r121-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160727.nT10NNec-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160727.nT10NNec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160727.nT10NNec-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/maps/solutionengine.c:22:17: sparse: sparse: symbol 'soleng_eprom_map' was not declared. Should it be static?
>> drivers/mtd/maps/solutionengine.c:28:17: sparse: sparse: symbol 'soleng_flash_map' was not declared. Should it be static?
>> drivers/mtd/maps/solutionengine.c:52:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *[addressable] [assigned] [toplevel] virt @@     got void * @@
   drivers/mtd/maps/solutionengine.c:52:39: sparse:     expected void [noderef] __iomem *[addressable] [assigned] [toplevel] virt
   drivers/mtd/maps/solutionengine.c:52:39: sparse:     got void *
   drivers/mtd/maps/solutionengine.c:54:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *[addressable] [assigned] [toplevel] virt @@     got void * @@
   drivers/mtd/maps/solutionengine.c:54:39: sparse:     expected void [noderef] __iomem *[addressable] [assigned] [toplevel] virt
   drivers/mtd/maps/solutionengine.c:54:39: sparse:     got void *

vim +/soleng_eprom_map +22 drivers/mtd/maps/solutionengine.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  21  
^1da177e4c3f41 Linus Torvalds   2005-04-16 @22  struct map_info soleng_eprom_map = {
^1da177e4c3f41 Linus Torvalds   2005-04-16  23  	.name = "Solution Engine EPROM",
^1da177e4c3f41 Linus Torvalds   2005-04-16  24  	.size = 0x400000,
^1da177e4c3f41 Linus Torvalds   2005-04-16  25  	.bankwidth = 4,
^1da177e4c3f41 Linus Torvalds   2005-04-16  26  };
^1da177e4c3f41 Linus Torvalds   2005-04-16  27  
^1da177e4c3f41 Linus Torvalds   2005-04-16 @28  struct map_info soleng_flash_map = {
^1da177e4c3f41 Linus Torvalds   2005-04-16  29  	.name = "Solution Engine FLASH",
^1da177e4c3f41 Linus Torvalds   2005-04-16  30  	.size = 0x400000,
^1da177e4c3f41 Linus Torvalds   2005-04-16  31  	.bankwidth = 4,
^1da177e4c3f41 Linus Torvalds   2005-04-16  32  };
^1da177e4c3f41 Linus Torvalds   2005-04-16  33  
0984c891042637 Artem Bityutskiy 2013-03-12  34  static const char * const probes[] = { "RedBoot", "cmdlinepart", NULL };
^1da177e4c3f41 Linus Torvalds   2005-04-16  35  
^1da177e4c3f41 Linus Torvalds   2005-04-16  36  static int __init init_soleng_maps(void)
^1da177e4c3f41 Linus Torvalds   2005-04-16  37  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  38  	/* First probe at offset 0 */
^1da177e4c3f41 Linus Torvalds   2005-04-16  39  	soleng_flash_map.phys = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  40  	soleng_flash_map.virt = (void __iomem *)P2SEGADDR(0);
^1da177e4c3f41 Linus Torvalds   2005-04-16  41  	soleng_eprom_map.phys = 0x01000000;
^1da177e4c3f41 Linus Torvalds   2005-04-16  42  	soleng_eprom_map.virt = (void __iomem *)P1SEGADDR(0x01000000);
^1da177e4c3f41 Linus Torvalds   2005-04-16  43  	simple_map_init(&soleng_eprom_map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  44  	simple_map_init(&soleng_flash_map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  45  
^1da177e4c3f41 Linus Torvalds   2005-04-16  46  	printk(KERN_NOTICE "Probing for flash chips at 0x00000000:\n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  47  	flash_mtd = do_map_probe("cfi_probe", &soleng_flash_map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  48  	if (!flash_mtd) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  49  		/* Not there. Try swapping */
^1da177e4c3f41 Linus Torvalds   2005-04-16  50  		printk(KERN_NOTICE "Probing for flash chips at 0x01000000:\n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  51  		soleng_flash_map.phys = 0x01000000;
^1da177e4c3f41 Linus Torvalds   2005-04-16 @52  		soleng_flash_map.virt = P2SEGADDR(0x01000000);
^1da177e4c3f41 Linus Torvalds   2005-04-16  53  		soleng_eprom_map.phys = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  54  		soleng_eprom_map.virt = P1SEGADDR(0);
^1da177e4c3f41 Linus Torvalds   2005-04-16  55  		flash_mtd = do_map_probe("cfi_probe", &soleng_flash_map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  56  		if (!flash_mtd) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  57  			/* Eep. */
^1da177e4c3f41 Linus Torvalds   2005-04-16  58  			printk(KERN_NOTICE "Flash chips not detected at either possible location.\n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  59  			return -ENXIO;
^1da177e4c3f41 Linus Torvalds   2005-04-16  60  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  61  	}
1d25e3eeed1d98 Randy Dunlap     2018-07-24  62  	printk(KERN_NOTICE "Solution Engine: Flash at 0x%pap, EPROM at 0x%pap\n",
1d25e3eeed1d98 Randy Dunlap     2018-07-24  63  	       &soleng_flash_map.phys,
1d25e3eeed1d98 Randy Dunlap     2018-07-24  64  	       &soleng_eprom_map.phys);
^1da177e4c3f41 Linus Torvalds   2005-04-16  65  	flash_mtd->owner = THIS_MODULE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  66  
^1da177e4c3f41 Linus Torvalds   2005-04-16  67  	eprom_mtd = do_map_probe("map_rom", &soleng_eprom_map);
^1da177e4c3f41 Linus Torvalds   2005-04-16  68  	if (eprom_mtd) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  69  		eprom_mtd->owner = THIS_MODULE;
ee0e87b174bb41 Jamie Iles       2011-05-23  70  		mtd_device_register(eprom_mtd, NULL, 0);
^1da177e4c3f41 Linus Torvalds   2005-04-16  71  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  72  
390e9eacf1dcec Paul Bolle       2014-05-23  73  	mtd_device_parse_register(flash_mtd, probes, NULL, NULL, 0);
^1da177e4c3f41 Linus Torvalds   2005-04-16  74  
^1da177e4c3f41 Linus Torvalds   2005-04-16  75  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  76  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  77  

:::::: The code at line 22 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
