Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC963BB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 11:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmNZvyj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697282420; x=1728818420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+SNkQ7w5a5nma2klZkUcL7w8QsbvnZrtlgKdihpWy8=;
  b=jmNZvyj6pGr86/6sE/KqGX5L5Uei2nUu0lJ+QlMOYNzHI4EAnkQUiNXV
   DFVE5kI6pQmk+KzUOgBhXRa4iW30Pf6ofOxdeumeHuSUrAlfrPJ1a1qzI
   U8RgtXdH4Vk6nM0b1l0dgMzwr6ibJwls0UXHQcElhM8qOpiKrzDUiG1tW
   MOwaL4QvcBBbawKSDFqpGrtdCVVG7v12gLqa9XXPYXOks8igMM79nMq6I
   bgUr2al32xEaDjQpua57fGKXNthvksm1/mnJJHFtASIAlCFBkSrp3oFiI
   lSgTmMU+w6/evM8gjMde4EmxTAPuJ5EzbkA6i8LG0q7OdNsx/MwF5ynoU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389178796"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389178796"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 04:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748651415"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748651415"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 04:20:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrcgp-000677-2X;
	Sat, 14 Oct 2023 11:20:15 +0000
Date: Sat, 14 Oct 2023 19:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 114/15768]
 include/linux/module.h:243:21: error:
 '__mod_of__imx8m_blk_ctrl_of_match_device_table' aliased to undefined symbol
 'imx8m_blk_ctrl_of_match'
Message-ID: <202310141907.A1OiKFKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jindong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 245075cb7098e00517c3362f7d6a8e13d1e83120 [114/15768] MA-18464 soc: imx: Support building imx8m soc driver as module
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310141907.A1OiKFKs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141907.A1OiKFKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141907.A1OiKFKs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from drivers/soc/imx/imx8mp-blk-ctrl.c:8:
>> drivers/soc/imx/imx8mp-blk-ctrl.c:746:25: error: 'imx8m_blk_ctrl_of_match' undeclared here (not in a function); did you mean 'imx8mp_blk_ctrl_of_match'?
     746 | MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:243:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:243:21: error: '__mod_of__imx8m_blk_ctrl_of_match_device_table' aliased to undefined symbol 'imx8m_blk_ctrl_of_match'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/soc/imx/imx8mp-blk-ctrl.c:746:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     746 | MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +243 include/linux/module.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  239  
cff26a51da5d20 Rusty Russell     2014-02-03  240  #ifdef MODULE
cff26a51da5d20 Rusty Russell     2014-02-03  241  /* Creates an alias so file2alias.c can find device table. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  #define MODULE_DEVICE_TABLE(type, name)					\
0bf8bf50eddc75 Matthias Kaehlcke 2017-07-24 @243  extern typeof(name) __mod_##type##__##name##_device_table		\
cff26a51da5d20 Rusty Russell     2014-02-03  244    __attribute__ ((unused, alias(__stringify(name))))
cff26a51da5d20 Rusty Russell     2014-02-03  245  #else  /* !MODULE */
cff26a51da5d20 Rusty Russell     2014-02-03  246  #define MODULE_DEVICE_TABLE(type, name)
cff26a51da5d20 Rusty Russell     2014-02-03  247  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  248  

:::::: The code at line 243 was first introduced by commit
:::::: 0bf8bf50eddc7511b52461bae798cbfaa0157a34 module: Remove const attribute from alias for MODULE_DEVICE_TABLE

:::::: TO: Matthias Kaehlcke <mka@chromium.org>
:::::: CC: Jessica Yu <jeyu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
