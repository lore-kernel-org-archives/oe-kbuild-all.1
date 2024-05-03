Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20352156869
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714746279; cv=none; b=rMt4E5ThCd/XTE7TACrrVXNtTHaiC92NLo2ax/RDtMwHvOsU1Y/OG29He0/4FD6Kb8vF3FlYdQlen68bMRz72Y1DFKDnv8UZ0UCYQuNQdtSLXOOstOIf3RzBMell8yVysxPMNkDoa6t9fCxcD7Ymtah4ZgiYY7ZZ26eEzbGKLtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714746279; c=relaxed/simple;
	bh=jj0bNz5kpge2Lvpqb87KD+FFuxCYxJX5/4lsSiUSPx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5JRXuUWtFbs/ZHbLaiuG/2vx/C/0FYe+rZ3X531mbgAN7B5iTALF5ptxS3s2a0YAN6sDKGb3C60FFDF0f11OL8myBve57+lE5w2jRTSB3/pTHvl4pJCw6y+qLHqcZ5sfUGmv30JpCI4ZCxKPCFGU9cLxmKwUxpGWeohLQSpgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6RM29TG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6RM29TG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714746277; x=1746282277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jj0bNz5kpge2Lvpqb87KD+FFuxCYxJX5/4lsSiUSPx4=;
  b=b6RM29TGIt9mpWEf51jXkxamB36LLNqaYrznWvqgOallR4JlJQS0QJET
   1Cxaf6QNSk3NUGDNbAHeDRIABIHD5uTrMsPGrUr3DxN7gdHgB9c0ZayvD
   FqdVd/xIm1rvRK+xf/dj38kLFMTkeZkJyF0gm5V1yhe9Iv9aiXd6TEOJj
   ngnH2DR2a+M8QyknJiUNLuVQFEPe63ZrTtli/6QMjx9Kh1fF+pwkULTsN
   zivzQExR5zJkWzmDTA1W+31nHBHp7lL12yc12tB4brvTLEUrWPkK4bSTa
   ZsKOGO9Uzsv6Mk5bwgqcHcQkvpbyMYs5pDZ3qR2EhXTE14ctvmZ2mCCDN
   Q==;
X-CSE-ConnectionGUID: XzMpD5y3QK2NTcbZI9HV9Q==
X-CSE-MsgGUID: h0fUdT9YSm26b/sBmCpoIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21705580"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21705580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 07:24:36 -0700
X-CSE-ConnectionGUID: 0C7Se0fvQ1mmRKLOB1gBOg==
X-CSE-MsgGUID: QShyh9kbRoqimLogv3lV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="58662122"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 May 2024 07:24:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2tpx-000Bl6-0V;
	Fri, 03 May 2024 14:24:33 +0000
Date: Fri, 3 May 2024 22:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1014/1143]
 drivers/soc/aspeed/rvas/video_main.c:1547:18: warning: 'ast2400_dram_table'
 defined but not used
Message-ID: <202405032225.dE15C2zw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: f778d27331abc1655c4425fcdee0086a7b81464e [1014/1143] RVAS: add rvas driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240503/202405032225.dE15C2zw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032225.dE15C2zw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032225.dE15C2zw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/aspeed/rvas/video_main.c: In function 'video_drv_get_irqs':
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1288:9: note: in expansion of macro 'VIDEO_DBG'
    1288 |         VIDEO_DBG("irq_fge: %#x\n", pAstRVAS->irq_fge);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1294:9: note: in expansion of macro 'VIDEO_DBG'
    1294 |         VIDEO_DBG("irq_vga: %#x\n", pAstRVAS->irq_vga);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1300:9: note: in expansion of macro 'VIDEO_DBG'
    1300 |         VIDEO_DBG("irq_video: %#x\n", pAstRVAS->irq_video);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c: In function 'video_drv_map_irqs':
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1340:9: note: in expansion of macro 'VIDEO_DBG'
    1340 |         VIDEO_DBG("Requesting IRQs, irq_fge: %d, irq_vga: %d, irq_video: %d\n",
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c: In function 'video_drv_probe':
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1386:9: note: in expansion of macro 'VIDEO_DBG'
    1386 |         VIDEO_DBG("pAstRVAS: 0x%p\n", pAstRVAS);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1449:9: note: in expansion of macro 'VIDEO_DBG'
    1449 |         VIDEO_DBG("sdram_scu: 0x%p\n", sdram_scu);
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1468:9: note: in expansion of macro 'VIDEO_DBG'
    1468 |         VIDEO_DBG("Disabling interrupts...\n");
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1485:9: note: in expansion of macro 'VIDEO_DBG'
    1485 |         VIDEO_DBG("After IRQ registration\n");
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1489:9: note: in expansion of macro 'VIDEO_DBG'
    1489 |         VIDEO_DBG("pdev: 0x%p dev: 0x%p pAstRVAS: 0x%p rvas_dev: 0x%p\n", pdev,
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c: In function 'rvas_init':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_main.c:1503:9: note: in expansion of macro 'VIDEO_ENG_DBG'
    1503 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c: In function 'video_engine_init':
   drivers/soc/aspeed/rvas/video_debug.h:26:39: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      26 | #define VIDEO_ENG_DBG(fmt, args...) do; while (0)
         |                                       ^
   drivers/soc/aspeed/rvas/video_main.c:1514:9: note: in expansion of macro 'VIDEO_ENG_DBG'
    1514 |         VIDEO_ENG_DBG("\n");
         |         ^~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c: In function 'video_drv_remove':
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1528:9: note: in expansion of macro 'VIDEO_DBG'
    1528 |         VIDEO_DBG("\n");
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1531:9: note: in expansion of macro 'VIDEO_DBG'
    1531 |         VIDEO_DBG("disable_grce_tse_interrupt...\n");
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1537:9: note: in expansion of macro 'VIDEO_DBG'
    1537 |         VIDEO_DBG("misc_deregister...\n");
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_debug.h:20:35: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      20 | #define VIDEO_DBG(fmt, args...) do; while (0)
         |                                   ^
   drivers/soc/aspeed/rvas/video_main.c:1540:9: note: in expansion of macro 'VIDEO_DBG'
    1540 |         VIDEO_DBG("Releasing OSRes...\n");
         |         ^~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c: At top level:
   drivers/soc/aspeed/rvas/video_main.c:1554:18: warning: 'ast2500_dram_table' defined but not used [-Wunused-const-variable=]
    1554 | static const u32 ast2500_dram_table[] = {
         |                  ^~~~~~~~~~~~~~~~~~
>> drivers/soc/aspeed/rvas/video_main.c:1547:18: warning: 'ast2400_dram_table' defined but not used [-Wunused-const-variable=]
    1547 | static const u32 ast2400_dram_table[] = {
         |                  ^~~~~~~~~~~~~~~~~~


vim +/ast2400_dram_table +1547 drivers/soc/aspeed/rvas/video_main.c

  1546	
> 1547	static const u32 ast2400_dram_table[] = {
  1548		0x04000000,     //64MB
  1549		0x08000000,     //128MB
  1550		0x10000000,     //256MB
  1551		0x20000000,     //512MB
  1552	};
  1553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
