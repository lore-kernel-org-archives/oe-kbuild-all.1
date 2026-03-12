Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0DB37AA73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 04:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773290982; cv=none; b=CPKjXdymLD7VGdMZkwUkYS6di7l+++BGTYmFKmgELY1IFedaug2QJ0U1rwu+534EUC2BpwmwjMpOtFztCEN7kCxbwLIRYi6VFn3iydpW2gjbmv7hmjAf8GknpV+hoxqRGWXfmxjXG0w8dqKQf3r5B7AxAiZfG9H2UuMOS4VcFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773290982; c=relaxed/simple;
	bh=JnkGxOeccsXbmecI3WcPRsFPIoe5iihDYj6oEV3LzL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oswg2pxcWWLeR+ECb2TJDNlEx+Kh6xVB3jyT338OsPWJIzHlP0ZuwhOKgbwm8GHiwxCGJYX/ld8tIn2OTsqczT8hWTlHc5r7XJNMkTcJV6cMZy49BnIo/+0BIZzR6BDX0HCwE1yoa1qWqSGF6AzZfe4jFN2yitpHYx+7JpQ9ybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkF5D8Ni; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkF5D8Ni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773290980; x=1804826980;
  h=date:from:to:cc:subject:message-id;
  bh=JnkGxOeccsXbmecI3WcPRsFPIoe5iihDYj6oEV3LzL8=;
  b=jkF5D8NidCPPfR8jQku+D6cznG5WBdas+Es8l7O6XAY/zcwyaenAdIfN
   0fe1P7nGpVXxy65dylJu4RtjEIg0rEGm9QGqeqk5WBHJleeBz2eDb9MtJ
   czOpJyMeld41v39mjjFh9xr3FpYUhsy9YCrByPL9kfXjj5C+yiKqm4yRT
   V6WIuFeMBtq9+mLq9/eF3PlkNry+NmafWtJKzz3FgeZVzzAxccLKSpcIk
   VvQt0yfqiAoXJUun8jqYDSdRoWUqzsCMEw/HhL98DAjD3rLmUtB7oO+7W
   A7lD6WIwVlX3QoGy9ZHaLbrGHL81CxiVujiWuUSIIHjigKHZqNawNleof
   g==;
X-CSE-ConnectionGUID: eq2gtFL8R56h4lNWg/vEbQ==
X-CSE-MsgGUID: vFplafruTi+laL7gO7b6Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78225350"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="78225350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:49:38 -0700
X-CSE-ConnectionGUID: DQa6egRxQ0uPuNdckRwcWQ==
X-CSE-MsgGUID: l7WTOw9PQ461F1fHi5ZWig==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2026 21:49:35 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XzJ-0000000025V-0VJd;
	Thu, 12 Mar 2026 04:49:33 +0000
Date: Thu, 12 Mar 2026 12:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [mtd:mtd/next 4/9] drivers/mtd/maps/physmap-core.c:367:9:
 error: call to undeclared function 'of_flash_probe_bt1_rom'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202603121229.PPSg4X8q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
head:   ca19808bc6fac7e29420d8508df569b346b3e339
commit: 16d68d10f5b934db7ee02a1e28cbc539905c64b8 [4/9] mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC
config: hexagon-randconfig-r072-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121229.PPSg4X8q-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121229.PPSg4X8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121229.PPSg4X8q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/maps/physmap-core.c:367:9: error: call to undeclared function 'of_flash_probe_bt1_rom'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |                 err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
         |                       ^
   1 error generated.


vim +/of_flash_probe_bt1_rom +367 drivers/mtd/maps/physmap-core.c

642b1e8dbed7bbb Boris Brezillon 2018-10-19  326  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  327  static int physmap_flash_of_init(struct platform_device *dev)
642b1e8dbed7bbb Boris Brezillon 2018-10-19  328  {
642b1e8dbed7bbb Boris Brezillon 2018-10-19  329  	struct physmap_flash_info *info = platform_get_drvdata(dev);
642b1e8dbed7bbb Boris Brezillon 2018-10-19  330  	struct device_node *dp = dev->dev.of_node;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  331  	const char *mtd_name = NULL;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  332  	int err, swap = 0;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  333  	bool map_indirect;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  334  	unsigned int i;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  335  	u32 bankwidth;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  336  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  337  	if (!dp)
642b1e8dbed7bbb Boris Brezillon 2018-10-19  338  		return -EINVAL;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  339  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  340  	info->probe_type = of_select_probe_type(dev);
642b1e8dbed7bbb Boris Brezillon 2018-10-19  341  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  342  	info->part_types = of_get_part_probes(dev);
642b1e8dbed7bbb Boris Brezillon 2018-10-19  343  	if (!info->part_types)
642b1e8dbed7bbb Boris Brezillon 2018-10-19  344  		return -ENOMEM;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  345  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  346  	of_property_read_string(dp, "linux,mtd-name", &mtd_name);
642b1e8dbed7bbb Boris Brezillon 2018-10-19  347  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  348  	map_indirect = of_property_read_bool(dp, "no-unaligned-direct-access");
642b1e8dbed7bbb Boris Brezillon 2018-10-19  349  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  350  	err = of_property_read_u32(dp, "bank-width", &bankwidth);
642b1e8dbed7bbb Boris Brezillon 2018-10-19  351  	if (err) {
642b1e8dbed7bbb Boris Brezillon 2018-10-19  352  		dev_err(&dev->dev, "Can't get bank width from device tree\n");
642b1e8dbed7bbb Boris Brezillon 2018-10-19  353  		return err;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  354  	}
642b1e8dbed7bbb Boris Brezillon 2018-10-19  355  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  356  	if (of_property_read_bool(dp, "big-endian"))
642b1e8dbed7bbb Boris Brezillon 2018-10-19  357  		swap = CFI_BIG_ENDIAN;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  358  	else if (of_property_read_bool(dp, "little-endian"))
642b1e8dbed7bbb Boris Brezillon 2018-10-19  359  		swap = CFI_LITTLE_ENDIAN;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  360  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  361  	for (i = 0; i < info->nmaps; i++) {
642b1e8dbed7bbb Boris Brezillon 2018-10-19  362  		info->maps[i].name = mtd_name;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  363  		info->maps[i].swap = swap;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  364  		info->maps[i].bankwidth = bankwidth;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  365  		info->maps[i].device_node = dp;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  366  
b3e79e7682e0753 Serge Semin     2020-09-20 @367  		err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
b3e79e7682e0753 Serge Semin     2020-09-20  368  		if (err)
b3e79e7682e0753 Serge Semin     2020-09-20  369  			return err;
b3e79e7682e0753 Serge Semin     2020-09-20  370  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  371  		err = of_flash_probe_gemini(dev, dp, &info->maps[i]);
642b1e8dbed7bbb Boris Brezillon 2018-10-19  372  		if (err)
642b1e8dbed7bbb Boris Brezillon 2018-10-19  373  			return err;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  374  
2aba2f2a704d368 Linus Walleij   2019-10-21  375  		err = of_flash_probe_ixp4xx(dev, dp, &info->maps[i]);
2aba2f2a704d368 Linus Walleij   2019-10-21  376  		if (err)
2aba2f2a704d368 Linus Walleij   2019-10-21  377  			return err;
2aba2f2a704d368 Linus Walleij   2019-10-21  378  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  379  		err = of_flash_probe_versatile(dev, dp, &info->maps[i]);
642b1e8dbed7bbb Boris Brezillon 2018-10-19  380  		if (err)
642b1e8dbed7bbb Boris Brezillon 2018-10-19  381  			return err;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  382  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  383  		/*
642b1e8dbed7bbb Boris Brezillon 2018-10-19  384  		 * On some platforms (e.g. MPC5200) a direct 1:1 mapping
642b1e8dbed7bbb Boris Brezillon 2018-10-19  385  		 * may cause problems with JFFS2 usage, as the local bus (LPB)
642b1e8dbed7bbb Boris Brezillon 2018-10-19  386  		 * doesn't support unaligned accesses as implemented in the
642b1e8dbed7bbb Boris Brezillon 2018-10-19  387  		 * JFFS2 code via memcpy(). By setting NO_XIP, the
642b1e8dbed7bbb Boris Brezillon 2018-10-19  388  		 * flash will not be exposed directly to the MTD users
642b1e8dbed7bbb Boris Brezillon 2018-10-19  389  		 * (e.g. JFFS2) any more.
642b1e8dbed7bbb Boris Brezillon 2018-10-19  390  		 */
642b1e8dbed7bbb Boris Brezillon 2018-10-19  391  		if (map_indirect)
642b1e8dbed7bbb Boris Brezillon 2018-10-19  392  			info->maps[i].phys = NO_XIP;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  393  	}
642b1e8dbed7bbb Boris Brezillon 2018-10-19  394  
642b1e8dbed7bbb Boris Brezillon 2018-10-19  395  	return 0;
642b1e8dbed7bbb Boris Brezillon 2018-10-19  396  }
642b1e8dbed7bbb Boris Brezillon 2018-10-19  397  #else /* IS_ENABLED(CONFIG_MTD_PHYSMAP_OF) */
642b1e8dbed7bbb Boris Brezillon 2018-10-19  398  #define of_flash_match NULL
642b1e8dbed7bbb Boris Brezillon 2018-10-19  399  

:::::: The code at line 367 was first introduced by commit
:::::: b3e79e7682e075326df8041b826b03453acacd0a mtd: physmap: Add Baikal-T1 physically mapped ROM support

:::::: TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
