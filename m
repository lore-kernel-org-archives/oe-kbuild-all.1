Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1FB18C25
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 18:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689879556; x=1721415556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eUyf+VxjeiKe/O6+VRvbMNs0+f2nPzVWfPsE/iXgCvs=;
  b=QKgmvlJ3Kss9KAQFM0vIhlCXh3k4b1o6eRfdwZ6l9+BhAL7I1AMkN7yx
   zVJtYpOA1udgVXRHXON2x7TNK3pc4YsJzOlg2qjiGrBQ0FY3n33gWoGkY
   2sQs5LW0FeWztobXZecR+gjEm3xo/GfznUAoBM9hEOy9HDxSxSLoROxsG
   0URkoDPnfG4+ywYq1V6rHmhNTYCXXeJfxbjifuvwv0TZZ+Mzjid2AiHqe
   Th7lnqf6QwD3dZ0JdxGo9bNMhwNv6Qcd43qpjPoHqDYVSVKLtK/PI5TXu
   PIhWKBGuYNeQSupi8cB8b46ny/1Z458T6vwfInFBVJNAFJfUOeyaYd947
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364302344"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="364302344"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 11:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701765442"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="701765442"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 11:59:14 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMYrp-0006PS-1y;
	Thu, 20 Jul 2023 18:59:13 +0000
Date: Fri, 21 Jul 2023 02:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 4863/12470]
 include/linux/module.h:130:49: error: redefinition of '__inittest'
Message-ID: <202307210256.PyM4JNZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   b872b1170fc8843b55e9f8838dd373ff43bb7552
commit: d76441df9683065e8b622bc0cdf725ba3b2db0fd [4863/12470] Merge branch 'rpmsg/next' into next
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230721/202307210256.PyM4JNZg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210256.PyM4JNZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210256.PyM4JNZg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from arch/powerpc/include/asm/io.h:27,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/regulator/pf1550-regulator-rpmsg.c:23:
>> include/linux/module.h:130:49: error: redefinition of '__inittest'
     130 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:553:1: note: in expansion of macro 'module_init'
     553 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:130:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     130 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_init'
     267 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:552:1: note: in expansion of macro 'module_platform_driver'
     552 | module_platform_driver(pf1550_regulator_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:132:13: error: redefinition of 'init_module'
     132 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:553:1: note: in expansion of macro 'module_init'
     553 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:132:13: note: previous definition of 'init_module' with type 'int(void)'
     132 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:267:1: note: in expansion of macro 'module_init'
     267 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:264:9: note: in expansion of macro 'module_driver'
     264 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:552:1: note: in expansion of macro 'module_platform_driver'
     552 | module_platform_driver(pf1550_regulator_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/__inittest +130 include/linux/module.h

0fd972a7d91d6e Paul Gortmaker 2015-05-01  127  
0fd972a7d91d6e Paul Gortmaker 2015-05-01  128  /* Each module must use one module_init(). */
0fd972a7d91d6e Paul Gortmaker 2015-05-01  129  #define module_init(initfn)					\
1f318a8bafcfba Arnd Bergmann  2017-02-01 @130  	static inline initcall_t __maybe_unused __inittest(void)		\
0fd972a7d91d6e Paul Gortmaker 2015-05-01  131  	{ return initfn; }					\
cf68fffb66d60d Sami Tolvanen  2021-04-08 @132  	int init_module(void) __copy(initfn)			\
cf68fffb66d60d Sami Tolvanen  2021-04-08  133  		__attribute__((alias(#initfn)));		\
92efda8eb15295 Sami Tolvanen  2022-09-08  134  	___ADDRESSABLE(init_module, __initdata);
0fd972a7d91d6e Paul Gortmaker 2015-05-01  135  

:::::: The code at line 130 was first introduced by commit
:::::: 1f318a8bafcfba9f0d623f4870c4e890fd22e659 modules: mark __inittest/__exittest as __maybe_unused

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Jessica Yu <jeyu@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
