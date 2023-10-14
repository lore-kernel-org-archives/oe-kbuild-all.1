Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DC110F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 00:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aACknwcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697244639; x=1728780639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3kooTyDVsszY/1AHAIhKM2Mx149xi4trhMuQ1vaqdsU=;
  b=aACknwcKrDga4MF923b5pBN+NRYKoKw7ommEqu1qYbvrUsZaxrEJS02X
   jzRbXiHStclGXryqgca5jKHEg/LZW8i8TEBCUYKTLEItDxdnaxDKtrZst
   qTDBUkm/fEiynoDWzrP2mH3sbSQY0d27KmqUUuv5xsiIrGfFipXkmbPPa
   5/AoGK7acadPuHvyk3a+VwDvbwvop7gUvfHKPFp+6WM3+0qj8Q0Ssu8GX
   aM2POLCeXKBfkM++Ps1pyQWKT1L2Hp37vHJJIu+nmxmR+GbFTygXyVUL6
   apcsT1RJkeDLQFUqUZftKpTnCU4aVDxCfQ8OJz8ocSOmj3Jk57l7VmEai
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365556227"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="365556227"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754905016"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="754905016"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 17:50:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrSrR-0005Z5-0V;
	Sat, 14 Oct 2023 00:50:33 +0000
Date: Sat, 14 Oct 2023 08:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2707/30000] include/linux/module.h:128:49:
 error: redefinition of '__inittest'
Message-ID: <202310140842.QbCTzeSn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: d02c20ba627337e72954b6300ee893649f35c4b9 [2707/30000] Merge branch 'rpmsg/next' into next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310140842.QbCTzeSn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140842.QbCTzeSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140842.QbCTzeSn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from drivers/regulator/pf1550-regulator-rpmsg.c:21:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1242:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1242 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1228:27: note: 'mem_section' declared here
    1228 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from drivers/regulator/pf1550-regulator-rpmsg.c:24:
   drivers/regulator/pf1550-regulator-rpmsg.c: At top level:
>> include/linux/module.h:128:49: error: redefinition of '__inittest'
     128 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:546:1: note: in expansion of macro 'module_init'
     546 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:128:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     128 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device.h:1903:1: note: in expansion of macro 'module_init'
    1903 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:238:9: note: in expansion of macro 'module_driver'
     238 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:545:1: note: in expansion of macro 'module_platform_driver'
     545 | module_platform_driver(pf1550_regulator_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:130:13: error: redefinition of 'init_module'
     130 |         int init_module(void) __copy(initfn) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:546:1: note: in expansion of macro 'module_init'
     546 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:130:13: note: previous definition of 'init_module' with type 'int(void)'
     130 |         int init_module(void) __copy(initfn) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1903:1: note: in expansion of macro 'module_init'
    1903 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:238:9: note: in expansion of macro 'module_driver'
     238 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:545:1: note: in expansion of macro 'module_platform_driver'
     545 | module_platform_driver(pf1550_regulator_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/__inittest +128 include/linux/module.h

0fd972a7d91d6e Paul Gortmaker 2015-05-01  125  
0fd972a7d91d6e Paul Gortmaker 2015-05-01  126  /* Each module must use one module_init(). */
0fd972a7d91d6e Paul Gortmaker 2015-05-01  127  #define module_init(initfn)					\
1f318a8bafcfba Arnd Bergmann  2017-02-01 @128  	static inline initcall_t __maybe_unused __inittest(void)		\
0fd972a7d91d6e Paul Gortmaker 2015-05-01  129  	{ return initfn; }					\
a6e60d84989fa0 Miguel Ojeda   2019-01-19 @130  	int init_module(void) __copy(initfn) __attribute__((alias(#initfn)));
0fd972a7d91d6e Paul Gortmaker 2015-05-01  131  

:::::: The code at line 128 was first introduced by commit
:::::: 1f318a8bafcfba9f0d623f4870c4e890fd22e659 modules: mark __inittest/__exittest as __maybe_unused

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Jessica Yu <jeyu@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
