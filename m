Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779CC282F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 01:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729300113; cv=none; b=ThjBo0ZXa4jNJ2M7GVUdHrD2p+c28/24GhIP4pNf8ssbYDbEhLeVHHv/+MOYP7lbhOgZkueV9c9jNOVq6bTG0WRr2vLiXg/ozOgwE8n32nk5AHtvj657/QRd1O5Nqp+NafDoLtImUmQ1sPxi1tDw8HoG1n34F7UksJvLS0/yoxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729300113; c=relaxed/simple;
	bh=NpqOX94lq42m+Wk+eHHGPavFXYRmVkyYvTy1BKXYR/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzGkrNRCeOvoKMDpKl9VGNRIknJQpMC8oASTQ4cZYu7ZNYazmyPlpjFn/Npg9zUiREgZv2vr4G5brv4CS+yFDWfMyWqWgSsLlr0Cyi9oGUXJ0Nj61kq3mCKTZevms8c2PZa16ECapSan7UeFg9WUUyDUJrIm/MaquaPFEClrNHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV/A5vsq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV/A5vsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729300111; x=1760836111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpqOX94lq42m+Wk+eHHGPavFXYRmVkyYvTy1BKXYR/w=;
  b=hV/A5vsq5WdO7n6oSbyb5lESb5HF4O/h3nWnI52pLhZJVGD8SRv/sygj
   Rox8A0p+0G9jNuWKljX6VAAKD1T3n5sR4qvERRH8ZNGj5FdgT2P+H/FXk
   cASrFpqhK7f6r55aVZCRx3pzji+RHw2mMahyJU0lM6EUGfFk/A6XULG8p
   yRdqyrq4ejBSEgvHflkm92811xM5UUlc0gjdL/0RYJfujdfg+9L8MbF2O
   yhQHMuOcwfKaxAHqeDYo/KCrKmc9iy2xXf1gEw04cQy+Cb92Ze1IOBzNg
   DpTGNJjNNJz7hSYRLRAV4C7DgLgb5ia1qGEr1c0allU+PnecMd55q1jyd
   w==;
X-CSE-ConnectionGUID: EILp4TYnQoWbFZD7etS4dA==
X-CSE-MsgGUID: YI3/u64oRze1rpfgQbeGaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="32645646"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="32645646"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 18:08:31 -0700
X-CSE-ConnectionGUID: PXlUbVlbSdK3v2RmKwmd2g==
X-CSE-MsgGUID: aqzK1LxtSRCnVhUchKh/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79077966"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2024 18:08:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1xwx-000OVR-34;
	Sat, 19 Oct 2024 01:08:11 +0000
Date: Sat, 19 Oct 2024 09:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 5904/17818]
 include/linux/module.h:131:49: error: redefinition of '__inittest'
Message-ID: <202410190956.IMqTwb2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   096cd0432b03805f49c86684dafb9ced4511a714
commit: 1d17a88e61fdfb2e93f6a78def034b53fc021b0f [5904/17818] Merge branch 'rpmsg/next' into next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241019/202410190956.IMqTwb2V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190956.IMqTwb2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190956.IMqTwb2V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/pf1550-regulator-rpmsg.c:24:
>> include/linux/module.h:131:49: error: redefinition of '__inittest'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:553:1: note: in expansion of macro 'module_init'
     553 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:131:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:303:9: note: in expansion of macro 'module_driver'
     303 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:552:1: note: in expansion of macro 'module_platform_driver'
     552 | module_platform_driver(pf1550_regulator_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:133:13: error: redefinition of 'init_module'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:553:1: note: in expansion of macro 'module_init'
     553 | module_init(pf1550_rpmsg_init);
         | ^~~~~~~~~~~
   include/linux/module.h:133:13: note: previous definition of 'init_module' with type 'int(void)'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/device/driver.h:262:1: note: in expansion of macro 'module_init'
     262 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:303:9: note: in expansion of macro 'module_driver'
     303 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/regulator/pf1550-regulator-rpmsg.c:552:1: note: in expansion of macro 'module_platform_driver'
     552 | module_platform_driver(pf1550_regulator_driver);
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
