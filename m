Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901151CA81
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753017134; cv=none; b=IXiH8JwpYuLC/1yDuDQ+ThWFd0cAesVSY6vY5+vvwvN474NReZK52QHlW+X4lBAq6rpdsxzuBr3Fz7nIU0mhsr7WBZheJk/wps0HDwXgqkKse6yUAGaArWn4avq0rBT1ziaAjnTNPPadf3VEb8ATZ61L5bhChRBfaP83a9MDcuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753017134; c=relaxed/simple;
	bh=6Tmbfn1P8+fkL3T+wXySqtSJd+47kjTHUG6q5ws8cu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXKKbvGgtNZ6DNch5e40vdd4zeVvXABw8SvldnHEuWScz4Cf8IQwCp77R90c8kYQtv5MPD7qgh7iL39m3CAVoUBmR6naRFO4JnAM2SSdm7ohwEARjvvkpzICIxftdjaUpgm8Ai5pwBsaoUjLhuRUCioQdQ9maogH8+d03nqrKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxMVl54P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxMVl54P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753017133; x=1784553133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Tmbfn1P8+fkL3T+wXySqtSJd+47kjTHUG6q5ws8cu4=;
  b=CxMVl54POJDyxhpgdZC2CcR1TGzfAG2HDnv1sY17fpXfDWtVTpQSKYQg
   Eok4VkTIpss8jq4NRDMByVcne5Hba7LILeqml1gxV4E+kYYzW2X/VarwH
   DkPWd7eKMHTFhvafxV8FNiABdjhiBjHln6NA70owmuHKtFVgo4nzmkZd7
   p50/z5hIOL1xrYyIlCfCjPg4RQPn9f8k2Q99SwvMuNo/7RFBipBnq1M0Y
   rAfbdyg66UcQB34CQLH9cJGl5WkPX57F1mVlz/SqSEMuPm4lDpIFN0dBP
   wxKZtcGFKE2lbFr4NuSIpIBsblknkENEX4tkIITzjiyqj41RgmoKwM4E2
   g==;
X-CSE-ConnectionGUID: xOtVY3rxQJi3xoeKY6N84w==
X-CSE-MsgGUID: 0BaluZe1Sza87rqQrPIXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="57863122"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="57863122"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 06:12:12 -0700
X-CSE-ConnectionGUID: EjNTZoHeT/eVd88pp4kwsw==
X-CSE-MsgGUID: xbveaBTlSmSRzJi5jkjVrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="159323001"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jul 2025 06:12:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udTpo-000G73-2n;
	Sun, 20 Jul 2025 13:12:08 +0000
Date: Sun, 20 Jul 2025 21:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-dualmmc 79/79]
 include/linux/module.h:131:49: error: redefinition of '__inittest'
Message-ID: <202507202109.EfQo7mT7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-dualmmc
head:   61605f260a207bbe9994a325ea9b2d33e29d62de
commit: 61605f260a207bbe9994a325ea9b2d33e29d62de [79/79] msdc: driver changes for multi-slot mmc
config: x86_64-buildonly-randconfig-003-20250720 (https://download.01.org/0day-ci/archive/20250720/202507202109.EfQo7mT7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507202109.EfQo7mT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507202109.EfQo7mT7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/mtk-sd.c:8:
>> include/linux/module.h:131:49: error: redefinition of '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:131:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:133:13: error: redefinition of 'init_module'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:133:13: note: previous definition of 'init_module' with type 'int(void)'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:139:49: error: redefinition of '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:139:49: note: previous definition of '__exittest' with type 'void (*(void))(void)'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:141:14: error: redefinition of 'cleanup_module'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:141:14: note: previous definition of 'cleanup_module' with type 'void(void)'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mtk-sd.c:8:
>> include/linux/module.h:131:49: error: redefinition of '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:131:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:133:13: error: redefinition of 'init_module'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:133:13: note: previous definition of 'init_module' with type 'int(void)'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:139:49: error: redefinition of '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:139:49: note: previous definition of '__exittest' with type 'void (*(void))(void)'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:141:14: error: redefinition of 'cleanup_module'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3352:1: note: in expansion of macro 'module_platform_driver'
    3352 | module_platform_driver(mt_msdc_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:141:14: note: previous definition of 'cleanup_module' with type 'void(void)'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3341:1: note: in expansion of macro 'module_platform_driver'
    3341 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/__inittest +131 include/linux/module.h

0fd972a7d91d6e Paul Gortmaker 2015-05-01  128  
0fd972a7d91d6e Paul Gortmaker 2015-05-01  129  /* Each module must use one module_init(). */
0fd972a7d91d6e Paul Gortmaker 2015-05-01  130  #define module_init(initfn)					\
1f318a8bafcfba Arnd Bergmann  2017-02-01 @131  	static inline initcall_t __maybe_unused __inittest(void)		\
0fd972a7d91d6e Paul Gortmaker 2015-05-01  132  	{ return initfn; }					\
cf68fffb66d60d Sami Tolvanen  2021-04-08 @133  	int init_module(void) __copy(initfn)			\
cf68fffb66d60d Sami Tolvanen  2021-04-08  134  		__attribute__((alias(#initfn)));		\
92efda8eb15295 Sami Tolvanen  2022-09-08  135  	___ADDRESSABLE(init_module, __initdata);
0fd972a7d91d6e Paul Gortmaker 2015-05-01  136  
0fd972a7d91d6e Paul Gortmaker 2015-05-01  137  /* This is only required if you want to be unloadable. */
0fd972a7d91d6e Paul Gortmaker 2015-05-01  138  #define module_exit(exitfn)					\
1f318a8bafcfba Arnd Bergmann  2017-02-01 @139  	static inline exitcall_t __maybe_unused __exittest(void)		\
0fd972a7d91d6e Paul Gortmaker 2015-05-01  140  	{ return exitfn; }					\
cf68fffb66d60d Sami Tolvanen  2021-04-08 @141  	void cleanup_module(void) __copy(exitfn)		\
cf68fffb66d60d Sami Tolvanen  2021-04-08  142  		__attribute__((alias(#exitfn)));		\
92efda8eb15295 Sami Tolvanen  2022-09-08  143  	___ADDRESSABLE(cleanup_module, __exitdata);
0fd972a7d91d6e Paul Gortmaker 2015-05-01  144  

:::::: The code at line 131 was first introduced by commit
:::::: 1f318a8bafcfba9f0d623f4870c4e890fd22e659 modules: mark __inittest/__exittest as __maybe_unused

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Jessica Yu <jeyu@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
