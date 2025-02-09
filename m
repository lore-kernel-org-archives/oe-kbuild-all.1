Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D524339E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739085796; cv=none; b=KdGWqUGEFWnexC/yfi/u7RzfFVy9FzfVx1gFiiDNvKmH8HcXfcQ2VYj92c7BMVVh+WME2RCA8woDD5rLLrz4lz6oRJMboAxenmsgcTkqtePUp3NmTxzwKzkxwXTG5Xz+CXkqIOQY6FKnrXU25zYcT8buGpzV09S6B4sfncWcYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739085796; c=relaxed/simple;
	bh=vEcGKx2Q5TVUgHI7McwYzPwMWDpvl61YLP8c+AcAWqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=diAGu3PPrkpKeC8iHbMPup44h5rWcTATBibDF4cuOAvZ7OnePL90VZ39k9knVJkvmG/9mUVYoDj+3KFlAILGYHDpYD7y3MmiWBFV/1qVr4sFpWY2z3YMlE5aLPoNZUv1Qj7la2IeI55vRfW08I8ZbUaShi66GjTf0yQT60ZxR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyO/mjTi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyO/mjTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739085794; x=1770621794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vEcGKx2Q5TVUgHI7McwYzPwMWDpvl61YLP8c+AcAWqs=;
  b=eyO/mjTiEy/vl66aRYBL8YfIpVNkkw/1FgmsVTVzQBB+VHwyeYntH+ZC
   SVmKBigreFDRJirL029YSavWc8ARtM5I2u6Ne31WsWtrnZB7PG9dIW5lW
   h+YLW5fJkiHLGxr8v+tzoCOmpQ+E+p06Fs81Onlg7cNBYKLSO+THAsghw
   04qusxWVtzr+JwNxEzVTB5HVNzl0K++9rAP8ta2ZCYKkoN5WsQPXT866Z
   KdNz1VDu1EeKxQK8WBybk/enDD1TaCxY6KZMY0yxTkXeED+sk2dP1AMpd
   zg5LPXLO4rMwjOuhAGKSeZJZbVp+Bb4mMSJoRFmE3CTlOWpkdWlmejo9q
   g==;
X-CSE-ConnectionGUID: NqVsZNA+RYifPm4gHZ+f9w==
X-CSE-MsgGUID: 13TJ0FwPTOyt25g1bZnwhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="57100458"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="57100458"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 23:23:14 -0800
X-CSE-ConnectionGUID: 5XkHMzVrSuKiqOBzZrQxaA==
X-CSE-MsgGUID: dXF3HTPjTWi724FO8PnGhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="111727257"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 23:23:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th1eo-0011Cq-02;
	Sun, 09 Feb 2025 07:23:10 +0000
Date: Sun, 9 Feb 2025 15:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro 110/110]
 include/linux/module.h:131:49: error: redefinition of '__inittest'
Message-ID: <202502091551.ifBO3IWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro
head:   cb6612a57bbcc77b70a9fc1c521c14c48303714d
commit: cb6612a57bbcc77b70a9fc1c521c14c48303714d [110/110] msdc: multi-slot support
config: x86_64-buildonly-randconfig-005-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091551.ifBO3IWV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091551.ifBO3IWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091551.ifBO3IWV-lkp@intel.com/

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
   drivers/mmc/host/mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   drivers/mmc/host/mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
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
   drivers/mmc/host/mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   drivers/mmc/host/mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:139:49: error: redefinition of '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   drivers/mmc/host/mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:141:14: error: redefinition of 'cleanup_module'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   drivers/mmc/host/mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
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
   mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
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
   mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:139:49: error: redefinition of '__exittest'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:141:14: error: redefinition of 'cleanup_module'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^~~~~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_exit'
     267 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:292:9: note: in expansion of macro 'module_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   mtk-sd.c:3249:1: note: in expansion of macro 'module_platform_driver'
    3249 | module_platform_driver(mt_msdc_driver);
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
   mtk-sd.c:3238:1: note: in expansion of macro 'module_platform_driver'
    3238 | module_platform_driver(mt_msdc_slot_driver);
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

:::::: The code at line 131 was first introduced by commit
:::::: 1f318a8bafcfba9f0d623f4870c4e890fd22e659 modules: mark __inittest/__exittest as __maybe_unused

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Jessica Yu <jeyu@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
