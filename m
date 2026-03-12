Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822CE38D002
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288640; cv=none; b=I9aLl+/X+d0yNH60XCmZwrvljiY0/1iJmHR81IMheyTMqAw1ZFY2avo56KIhlvc8tu1prklpfMDEY8EeFXGqPPahAnusQAb4bTDLAOFO8EDpX5B2F4QlV1m6Rah2AwSEeqFPA+rc0pwPY+bcOD7fdujN7Lt/ZPGmsCH5ibQcF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288640; c=relaxed/simple;
	bh=MFaK9zCmilWSxmbXVcOjAWGTnDw9o50T7uTISnvnIAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DEMEAvSnZR1rg3BSxubkSVy3oewNlUQ5X+iL42oMklKVop+2KWfGDGkc4aDFgsy0zDBuAuYr7ZE939poajpNRkD0jxhjJfppBUCcu628t55YGBEEKoOSxz5k5wjf0SwtR5Rn6tcxRfflAs7CDk1hOYny9XSQ78hB9DMcRMghZ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVWTiFTX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVWTiFTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773288638; x=1804824638;
  h=date:from:to:cc:subject:message-id;
  bh=MFaK9zCmilWSxmbXVcOjAWGTnDw9o50T7uTISnvnIAc=;
  b=IVWTiFTXvq4Z+RD/knhO99XJ06ZsyuGe1qlEkeRSPWZqk6Sbtzj6d66i
   EwUF5xWe2m+TIyJpzfp+cT912YVF+zOEAFguOoO3UUwFnCX2da0h/qQhc
   zDUrtuLZ1Y/EToaYfuse2S3RshGoemrxHZqoz2eYPdumdOPIvZ1mG+4gL
   omcwMD4Qv7sxhiE64oVwdN3OCQ6+Et6i+ifIXttG7fkTn7WQUu5YzYiMr
   uC7krLvSSk8zSXnuK54SLD/eyftJBgSx16SdBOJvOB1fLZRtPnYlWF6Ch
   z+05Ta0WsXsY9xv6Mgzkp3sJAB9Jj+cJ/67UU9L5yzI4kFJ65NotW8fcV
   w==;
X-CSE-ConnectionGUID: XRC+F+p7SvOMvIL1HgDItQ==
X-CSE-MsgGUID: JsDZwZsCTQuUH+N3r4NMpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84689872"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="84689872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:10:34 -0700
X-CSE-ConnectionGUID: XY/AEXASRhCmxHc/P7kJsQ==
X-CSE-MsgGUID: RSZzVHQpRsqIMGYJTuA1Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="246144308"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 21:10:32 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XNV-0000000023h-3arB;
	Thu, 12 Mar 2026 04:10:29 +0000
Date: Thu, 12 Mar 2026 12:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [mtd:mtd/next 4/9] drivers/mtd/maps/physmap-core.c:367:23:
 error: implicit declaration of function 'of_flash_probe_bt1_rom'; did you
 mean 'of_flash_probe_ixp4xx'?
Message-ID: <202603121256.ni7PW4dW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
head:   ca19808bc6fac7e29420d8508df569b346b3e339
commit: 16d68d10f5b934db7ee02a1e28cbc539905c64b8 [4/9] mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC
config: i386-buildonly-randconfig-002-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121256.ni7PW4dW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121256.ni7PW4dW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121256.ni7PW4dW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/maps/physmap-core.c: In function 'physmap_flash_of_init':
>> drivers/mtd/maps/physmap-core.c:367:23: error: implicit declaration of function 'of_flash_probe_bt1_rom'; did you mean 'of_flash_probe_ixp4xx'? [-Wimplicit-function-declaration]
     367 |                 err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       of_flash_probe_ixp4xx


vim +367 drivers/mtd/maps/physmap-core.c

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
