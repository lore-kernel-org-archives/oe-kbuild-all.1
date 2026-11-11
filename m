Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422861;
	b=PNSxCLrCZOjel3Lld2EONESdLUXADV0ZPc8o/CWHttmVuzvGTgSa2dlf/BqNPEg4fcy0
	 BGd4pk+eYZVrLZvaipbQPv8KYNmqbP3XDATsedHl2leE0tcWJWsdxKyxsjhURznI9R9ZZ
	 2CfxibOyZDTsw5baFSfhvxESShjJrYeo023EyW7kjePs2qbIQ+T9PHivQc6lYAU+be0iE
	 FsaiB9LvlUypMSyh9x8KhuGv6Zr1g65uE6+lWkc6dIOaiYqL+tGh121f+fAbJTjpaEQss
	 vbhaMFy4Uan8if+i1wJ8IQ4gMPFs5y2zb1i5Dc/+4B8E3/zdV6E4T/iSRuxtXWrdBKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422861;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uewg4MVncXCmGCyiuGA+WVIpnyjxwGcuRvg2zn8htwE=;
	b=sqZQeEWYOnA2b/TmhPlEdQOh2zJst16HerP4ENeWf19X+W1UsNx9z9SQmL1AOYBlUUB5
	 0Roi0HYIfv+hOeJ06NcXsn1GrX42njKZwwpiQ4caftdby/Lw56j8DJLas/vgtnTFPTtg7
	 xq0Cqscw6r0cg/YBPMwd20s2SFPhw8mL7mjcZjua86xQZ++0GjRLnv+SdLRbnxTzJrl18
	 lrSmpuTajg4Js4ak2dbaSrcFUfI3ygfLgdIXU2tG6+hMNYxMt856HUU1+hFdQLxLTojab
	 f+V1uROi9Ug1YIC8wSXzqeFhz1LJk5MuSgzIwxYT2NjdbxIo6WHoMEbr5iMmy1gzjFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GtLBuz86;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43731606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 18:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43731606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GtLBuz86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422861; x=1825958861;
  h=date:from:to:cc:subject:message-id;
  bh=nNLwXxcngzGHLPyp76J8SwiOsdzii6hfD4WtOBv5ZF8=;
  b=GtLBuz86XybCERKWaxQ3XHHyvOnUTMXg0dstdWuvpceomyy0kijq5e5P
   D+nzIdD3iIgFGkiDiTBlT5/PHRjdXSZhqnWvo2vc0Vtww2w5LPz9Z0vIg
   P1HYyZgq4YAE2ND3zrVOvKVukGU+NC1v4NAon9d6BoM+gtfzctaRIHU8S
   dxyV475hLy6N5nb4iPKXghRaKofpwx135Uu8KA5mtt28i25upmWQgPwG/
   NDKOAxlyxjPqNvo7DhSbpq68Ntodirdt9AmbNWcgEkW3bx/sRkD6JVIAD
   O2gx+5Af9uw+C1/V+PdkKznvbY9XzPuQE+ccxr3G2DWJWBCmkk3kCw0nS
   A==;
X-CSE-ConnectionGUID: QNEV3QHJR+SlOPymV8pU8g==
X-CSE-MsgGUID: ChecnQbaRLGgCMZQ8up2uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3284887"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3284887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:47:41 -0800
X-CSE-ConnectionGUID: qwhdMtwHRLmqmP/ZftWGLg==
X-CSE-MsgGUID: 6L7QypFGQ2upl0qFdCKW0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8479121"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Nov 2026 10:47:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRDM9-00000000zVR-2T0h;
	Wed, 11 Nov 2026 18:47:37 +0000
Date: Thu, 12 Nov 2026 02:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:fixes 1/3] drivers/pmdomain/imx/gpc.c:554:25:
 error: invalid storage class for function 'imx_gpc_driver_init'
Message-ID: <202611120226.QgNvQpnd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git fixes
head:   29030cd58b1e7e788728bc5bf4ae3c44881b7bbc
commit: d7262971a2acc2a835d8727d6833a6f764f56124 [1/3] pmdomain: imx: gpc: remove all initialized power domains
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261112/202611120226.QgNvQpnd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120226.QgNvQpnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120226.QgNvQpnd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:32,
                    from include/linux/platform_device.h:13,
                    from drivers/pmdomain/imx/gpc.c:11:
   drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove':
>> drivers/pmdomain/imx/gpc.c:554:25: error: invalid storage class for function 'imx_gpc_driver_init'
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/device/driver.h:294:19: note: in definition of macro 'builtin_driver'
     294 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/pmdomain/imx/gpc.c:7:
>> drivers/pmdomain/imx/gpc.c:554:25: error: initializer element is not constant
     554 | builtin_platform_driver(imx_gpc_driver)
         |                         ^~~~~~~~~~~~~~
   include/linux/init.h:265:55: note: in definition of macro '____define_initcall'
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:306:41: note: in expansion of macro '__define_initcall'
     306 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:298:1: note: in expansion of macro 'device_initcall'
     298 | device_initcall(__driver##_init);
         | ^~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/init.h:176:30: error: expected declaration or statement at end of input
     176 | #define THIS_MODULE ((struct module *)0)
         |                              ^~~~~~
   include/linux/platform_device.h:304:41: note: in expansion of macro 'THIS_MODULE'
     304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MODNAME)
         |                                         ^~~~~~~~~~~
   include/linux/device/driver.h:296:16: note: in expansion of macro 'platform_driver_register'
     296 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                ^~~~~~~~~~
   include/linux/platform_device.h:345:9: note: in expansion of macro 'builtin_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of macro 'builtin_platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c: At top level:
   drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_remove' defined but not used [-Wunused-function]
     503 | static void imx_gpc_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~


vim +/imx_gpc_driver_init +554 drivers/pmdomain/imx/gpc.c

721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  545  
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  546  static struct platform_driver imx_gpc_driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  547  	.driver = {
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  548  		.name = "imx-gpc",
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  549  		.of_match_table = imx_gpc_dt_ids,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  550  	},
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  551  	.probe = imx_gpc_probe,
e70140ba0d2b1a drivers/pmdomain/imx/gpc.c Linus Torvalds 2024-12-01  552  	.remove = imx_gpc_remove,
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  553  };
721cabf6c6600d drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17 @554  builtin_platform_driver(imx_gpc_driver)

:::::: The code at line 554 was first introduced by commit
:::::: 721cabf6c6600dbe689ee2782bc087270e97e652 soc: imx: move PGC handling to a new GPC driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
