Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338911;
	b=HA+oYLT/GXhwmp509kKDC0zVuKyBU0Nx+dSR2EZi7VeIIpqYVcNRUAwgAS75Q1aZNmHk
	 FVONZKi9cofOfO75FLqJRM9Ni/6ubGgnSglHIbW8mNeZ8bbqgsq+r5FF0/VM6LPAdH8Bd
	 O03s8nHvI3rSmCNXvKxNpBLpIOo/Dm2+BipUYQwelFJQPP0UoTfoHhelGSF7Ye/gp0vki
	 kXVZFVcnr3YP6dklEt4b8LqegKbyhzMZRlQuLU12oa25qXBWh5EGm+KlZQl4mlbR9A7Pj
	 JSGI7145yBn57PnAArq+9a3n//E9YVoCnGHTH6HnfAtH9df+ZvGR1BLkO9rY85uz4Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338911;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ngJoqECAuSsMDK3dt74sgCOVvPLwmMk4Q0rAck1B/GM=;
	b=LmKuon8O4nw8eYqvKom3CyX9ZLkNZQL45B2LO8fddG+f0Vwp/b94QgZxUVIRMxiibkee
	 Ar8nqXsJqF9WR0xhM1H7dGc0g8ZnPfjgScsfm4XUDZafPDmd6oG8cP0BELHJbF/MqCPa0
	 Ao2mq2sEHj2H38cwQYiObECC7K+oTfAqXe4hWWQJziCnsl728qhnuuGrZRsbCRGf6xZry
	 km4s9iVwK7AJNF+8SVw1aZVSf8ihgZaPzXzFw8We7/GuRH0YeW2KSOsVwdEszfsYM0m5E
	 etIVLeuaiargdRzVxwpp8HsaRiJNAXir6njm5JOh5kMCCEXeSZV/KPZLFFLJVd4h3jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LuizSIRu;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E845C606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 19:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E845C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LuizSIRu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794338910; x=1825874910;
  h=date:from:to:cc:subject:message-id;
  bh=o4pwxxOYUfEjOKeKmmtBGadtIdBoPiwlYBE/z2qQMU4=;
  b=LuizSIRuFpNFl2qACyrdVWbJ/9zXSbcojr2TL45GeHIF4d8kwdAmwfQU
   4NZj0aOVGBgzOXrGG2ayuSXiwprF5b56NDPUp2u+wCnPkhnLfUYFpiPXD
   fOLqLV99DHwdNksIvxWJGh1QHqzwNLxuJ2Pi+yruUdyENA8jFejkTZdML
   nhQTCm0XHoBQu6IMHeWMIp7Y4J4CUW9EBfCbut3fbWe+klTxlrZyN4yls
   Dwrkx0fmcPn0Pr9dtXQYmJg2cCnG+GDAs+3B2jTBCOn7fYgALDKRknE9Z
   6i4TXTXtmEbMrIklxI/nOXP7CrLGZ69/QwKCUXzePoGU65osE6onAKnNI
   Q==;
X-CSE-ConnectionGUID: 7E8Pg8/cSqaabvG4HbbFjw==
X-CSE-MsgGUID: Ci2PldOkReKwP0ITDrLhfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3104995"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3104995"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 11:28:29 -0800
X-CSE-ConnectionGUID: UP2JrmjXT5Cf423g7U8DPA==
X-CSE-MsgGUID: Av2vF3d0RPK6Ykp03V3Yig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="10016376"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 10 Nov 2026 11:28:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQrW5-000000000LB-3MoP;
	Tue, 10 Nov 2026 19:28:25 +0000
Date: Tue, 10 Nov 2026 20:28:21 +0100
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:fixes 1/3] drivers/pmdomain/imx/gpc.c:554:1: error:
 function definition is not allowed here
Message-ID: <202611102018.l5VdXY77-lkp@intel.com>
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
config: arm-randconfig-r2106-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102018.l5VdXY77-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 053b4a894ceaebc2eed76a7fa09f58cf7e313a69)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102018.l5VdXY77-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102018.l5VdXY77-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/imx/gpc.c:554:1: error: function definition is not allowed here
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^
   include/linux/device/driver.h:294:41: note: expanded from macro 'builtin_driver'
     294 | static int __init __driver##_init(void) \
         |                                         ^
>> drivers/pmdomain/imx/gpc.c:554:1: error: use of undeclared identifier 'imx_gpc_driver_init'; did you mean 'imx_gpc_driver'?
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:298:17: note: expanded from macro 'builtin_driver'
     298 | device_initcall(__driver##_init);
         |                 ^~~~~~~~~~~~~~~
   <scratch space>:39:1: note: expanded from here
      39 | imx_gpc_driver_init
         | ^~~~~~~~~~~~~~~~~~~
   drivers/pmdomain/imx/gpc.c:546:31: note: 'imx_gpc_driver' declared here
     546 | static struct platform_driver imx_gpc_driver = {
         |                               ^
>> drivers/pmdomain/imx/gpc.c:554:1: error: initializing 'initcall_t' (aka 'int (*)(void)') with an expression of incompatible type 'struct platform_driver'
     554 | builtin_platform_driver(imx_gpc_driver)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:345:2: note: expanded from macro 'builtin_platform_driver'
     345 |         builtin_driver(__platform_driver, platform_driver_register)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:297:3: note: expanded from macro 'builtin_driver'
     297 | } \
         |   ^
     298 | device_initcall(__driver##_init);
         |                 ~~~~~~~~~~~~~~~
   include/linux/init.h:306:30: note: expanded from macro '\
   device_initcall'
     306 | #define device_initcall(fn)             __define_initcall(fn, 6)
         |                                         ^                 ~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:53:1: note: expanded from here
      53 | __initcall__kmod_gpc__439_554_imx_gpc_driver_init6
         | ^
   include/linux/init.h:264:20: note: expanded from macro '____define_initcall'
     264 |         static initcall_t __name __used                         \
         |                           ^
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ~~
>> drivers/pmdomain/imx/gpc.c:554:40: error: expected '}'
     554 | builtin_platform_driver(imx_gpc_driver)
         |                                        ^
   drivers/pmdomain/imx/gpc.c:504:1: note: to match this '{'
     504 | {
         | ^
   4 errors generated.


vim +554 drivers/pmdomain/imx/gpc.c

721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  545  
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  546  static struct platform_driver imx_gpc_driver = {
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  547  	.driver = {
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  548  		.name = "imx-gpc",
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  549  		.of_match_table = imx_gpc_dt_ids,
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  550  	},
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  551  	.probe = imx_gpc_probe,
e70140ba0d2b1a3 drivers/pmdomain/imx/gpc.c Linus Torvalds 2024-12-01  552  	.remove = imx_gpc_remove,
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17  553  };
721cabf6c6600db drivers/soc/imx/gpc.c      Lucas Stach    2017-02-17 @554  builtin_platform_driver(imx_gpc_driver)

:::::: The code at line 554 was first introduced by commit
:::::: 721cabf6c6600dbe689ee2782bc087270e97e652 soc: imx: move PGC handling to a new GPC driver

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Shawn Guo <shawnguo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
