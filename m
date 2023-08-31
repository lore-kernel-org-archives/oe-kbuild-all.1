Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A688A8F57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 18:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693506424; x=1725042424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rr3KykED+j6yAOqREadn5G4lYpKWakRXQ4FaXNI04s=;
  b=SDBFZtdP8cGGhQHMEkeFLjEqW+21u3oikLnYmCXIzUgxdhg55wRyGxhE
   CxE0OlGKecIqRm69u/D+ghmGpLHgt9qf6Yu9ykwt+LaPoSRAP6UpjKARC
   H/8iZnN5xRzk77VwPQyd4RD32z7KwH6AiizXY0B7TFhpQujZgk1kNnS4A
   JAidRs7B2WgVYmPQM4anwiKxSIe5KTSoZXErBQYq84vtC2HGHR7xdprAq
   bhiku9W3d81m1Sv6H4Ut0JXCfqa6e0lmwvDAcmuLUOBPAPrh/gvmStvZn
   zHHieK32l9HFuk7fTlMUhUVpT04wGVNZuuMRO9RlELuCrAiliyx7eyST+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375967375"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="375967375"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689453477"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="689453477"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Aug 2023 11:27:02 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbmNf-0000Rd-2f;
	Thu, 31 Aug 2023 18:26:59 +0000
Date: Fri, 1 Sep 2023 02:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6157/24603] include/linux/module.h:131:49:
 error: redefinition of '__inittest'
Message-ID: <202309010209.L7QVXYJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: afbf4e009ee7f83d492eabf1144fed73e9112a42 [6157/24603] Merge branch 'clock/next' into next
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20230901/202309010209.L7QVXYJZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010209.L7QVXYJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010209.L7QVXYJZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/imx/clk-imx8mm.c:12:
>> include/linux/module.h:131:49: error: redefinition of '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:124:41: note: in expansion of macro 'module_init'
     124 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/clk/imx/clk-imx8mm.c:755:1: note: in expansion of macro 'late_initcall'
     755 | late_initcall(pll_debug_init);
         | ^~~~~~~~~~~~~
   include/linux/module.h:131:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:263:1: note: in expansion of macro 'module_init'
     263 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:252:9: note: in expansion of macro 'module_driver'
     252 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/clk/imx/clk-imx8mm.c:681:1: note: in expansion of macro 'module_platform_driver'
     681 | module_platform_driver(imx8mm_clk_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:133:13: error: redefinition of 'init_module'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/module.h:124:41: note: in expansion of macro 'module_init'
     124 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/clk/imx/clk-imx8mm.c:755:1: note: in expansion of macro 'late_initcall'
     755 | late_initcall(pll_debug_init);
         | ^~~~~~~~~~~~~
   include/linux/module.h:133:13: note: previous definition of 'init_module' with type 'int(void)'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:263:1: note: in expansion of macro 'module_init'
     263 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:252:9: note: in expansion of macro 'module_driver'
     252 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/clk/imx/clk-imx8mm.c:681:1: note: in expansion of macro 'module_platform_driver'
     681 | module_platform_driver(imx8mm_clk_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/__inittest +131 include/linux/module.h

0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  128  
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  129  /* Each module must use one module_init(). */
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  130  #define module_init(initfn)					\
1f318a8bafcfba9 Arnd Bergmann  2017-02-01 @131  	static inline initcall_t __maybe_unused __inittest(void)		\
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  132  	{ return initfn; }					\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08 @133  	int init_module(void) __copy(initfn)			\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  134  		__attribute__((alias(#initfn)));		\
cf68fffb66d60d9 Sami Tolvanen  2021-04-08  135  	__CFI_ADDRESSABLE(init_module, __initdata);
0fd972a7d91d6e1 Paul Gortmaker 2015-05-01  136  

:::::: The code at line 131 was first introduced by commit
:::::: 1f318a8bafcfba9f0d623f4870c4e890fd22e659 modules: mark __inittest/__exittest as __maybe_unused

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Jessica Yu <jeyu@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
