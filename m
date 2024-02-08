Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260AE50A81
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707436748; cv=none; b=W6ex7dT8EICOTrCmcsQixVMEPaWLCnuh6aZjX7Hl7fKOvccnKsGzb0qWcpx4cLsWI37cnBnRlmV9kEemnYwUdJIvAmNnJSw4RugQt7/KfpiiLcPOB/lJzZ9NksGMA0WxxbPweEHWJZjQxzQFaSs1PXjQgdepQd2E5IBDl6/YYVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707436748; c=relaxed/simple;
	bh=yH/Oy5krEOL/3r66pcRb0Vwkc7rpOBWwKFcPvpj/e9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ztlk+cSYQ978XdpzMO5ljNLHNmZDi/TdO37YMwvi2SgvzQoIfW/J16Kkys7nGbsTVzssNG+g2xz9oFT+35IkzxTJYAz6pamz4CWiwBaKEjW/1iTx7DdKFeTRUNcxNnvNFrMiG1mFkcRhFokBziNcFNGXz/Pwo6WW/5kPk1pAjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYCzCNIY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYCzCNIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707436746; x=1738972746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yH/Oy5krEOL/3r66pcRb0Vwkc7rpOBWwKFcPvpj/e9E=;
  b=fYCzCNIY5w3UulJms1eO7zYIRJZv20lrnvBau2648Uldssnh0ZzzP62u
   jUKoQjn8nqB/ArtabaisCOg8cl9hKYMRtlXFuhyBRju4dC/lM/hBY4bvp
   JVPGlmEPq1JHzweAA+0ramM0vQlbVWO3UPJiOHgIghZwSJj4ZJs5Hid9G
   dFFKORghqwS8oF1oENfgUHsK2ffea1gSyAB6MHMULIJyGJo6w8A+XJ0OS
   DEkQTnI3VBqdhXYdxd0/PJ/44n3gUincUI7tSFN0BoYMjrXWPvQkdPevh
   Bj45LN5YEapCul+pHfagMT3UMEYGr1ebyHviB0Mf0pDZb0PCRImGDud4U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1231510"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1231510"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 15:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1787935"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Feb 2024 15:59:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYEII-0004Di-1L;
	Thu, 08 Feb 2024 23:59:02 +0000
Date: Fri, 9 Feb 2024 07:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4863/17898]
 include/linux/module.h:130:49: error: redefinition of '__inittest'
Message-ID: <202402090726.1UQW6NnD-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: d76441df9683065e8b622bc0cdf725ba3b2db0fd [4863/17898] Merge branch 'rpmsg/next' into next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240209/202402090726.1UQW6NnD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090726.1UQW6NnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090726.1UQW6NnD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/pf1550-regulator-rpmsg.c:24:
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
