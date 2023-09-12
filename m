Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183824436
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694538931; x=1726074931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVjL5O78ScIjBF6AWWdd3IM9oFqYRe1cxDHaXSIb7Lg=;
  b=X9G8EXfEG4OuVlfjpJp8XZLUPkK3SE6lLF3V8BUd2TgW18WNTJ+e7nWq
   EASlu3InNogm5suAg6ZnJvV8ucnscGoU0IB77LvG4AjuPunuz3AsyKibn
   GK+H8Ej3N2t91hbVrcMS+/w6bhs1HkDS8fylsEvY7jui3imsX4WM2yLj/
   EjmgsJ7OQ7I7gNhudMj2Rcw2F+d5L6RgwQ3t+S+rJBuZn4rVGMiPR6KjW
   0NBwgza0QrgoKx8f3P0YeU+9ptEohX7cscUB5aK5ClZ3PlElqrJDBrylL
   M0STfzigmUXZQeGz9EUY7iJ0QxLAwZWwyW7Aw8sY1TyUOgfCOG+H89hpX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368712632"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="368712632"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 10:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990572621"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="990572621"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 10:15:29 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg6yz-00001s-02;
	Tue, 12 Sep 2023 17:15:25 +0000
Date: Wed, 13 Sep 2023 01:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6186/25021]
 include/linux/module.h:131:49: error: redefinition of '__inittest'
Message-ID: <202309130116.w0tP3usG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: df2cf48a1a65a19f1cc6031103da7395847c995f [6186/25021] Merge branch 'rpmsg/next' into next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309130116.w0tP3usG-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130116.w0tP3usG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130116.w0tP3usG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from drivers/regulator/pf1550-regulator-rpmsg.c:21:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from drivers/regulator/pf1550-regulator-rpmsg.c:24:
   drivers/regulator/pf1550-regulator-rpmsg.c: At top level:
>> include/linux/module.h:131:49: error: redefinition of '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:546:1: note: in expansion of macro 'module_init'
     546 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:131:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:263:1: note: in expansion of macro 'module_init'
     263 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:252:9: note: in expansion of macro 'module_driver'
     252 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:545:1: note: in expansion of macro 'module_platform_driver'
     545 | module_platform_driver(pf1550_regulator_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:133:13: error: redefinition of 'init_module'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:546:1: note: in expansion of macro 'module_init'
     546 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:133:13: note: previous definition of 'init_module' with type 'int(void)'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:263:1: note: in expansion of macro 'module_init'
     263 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:252:9: note: in expansion of macro 'module_driver'
     252 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:545:1: note: in expansion of macro 'module_platform_driver'
     545 | module_platform_driver(pf1550_regulator_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RPMSG_VIRTIO
   Depends on [n]: HAS_DMA [=n]
   Selected by [m]:
   - HAVE_IMX_RPMSG [=y] && IMX_MBOX [=m]
   WARNING: unmet direct dependencies detected for UIO
   Depends on [n]: MMU [=n]
   Selected by [m]:
   - FEC_UIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y]


vim +/__inittest +131 include/linux/module.h

0fd972a7d91d6e Paul Gortmaker 2015-05-01  128  
0fd972a7d91d6e Paul Gortmaker 2015-05-01  129  /* Each module must use one module_init(). */
0fd972a7d91d6e Paul Gortmaker 2015-05-01  130  #define module_init(initfn)					\
1f318a8bafcfba Arnd Bergmann  2017-02-01 @131  	static inline initcall_t __maybe_unused __inittest(void)		\
0fd972a7d91d6e Paul Gortmaker 2015-05-01  132  	{ return initfn; }					\
cf68fffb66d60d Sami Tolvanen  2021-04-08 @133  	int init_module(void) __copy(initfn)			\
cf68fffb66d60d Sami Tolvanen  2021-04-08  134  		__attribute__((alias(#initfn)));		\
cf68fffb66d60d Sami Tolvanen  2021-04-08  135  	__CFI_ADDRESSABLE(init_module, __initdata);
0fd972a7d91d6e Paul Gortmaker 2015-05-01  136  

:::::: The code at line 131 was first introduced by commit
:::::: 1f318a8bafcfba9f0d623f4870c4e890fd22e659 modules: mark __inittest/__exittest as __maybe_unused

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Jessica Yu <jeyu@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
