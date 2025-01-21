Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614661F8EEA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 21:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737493710; cv=none; b=HAdnrMyc78XQNK+jZpDXJhIBEPs+wzc4fX+6j6GfBUu7h4/F0ieYsPGgNj/Y7/MV1Xpz95Blgi+5j9fZ58irHqtGnz0ozqGPWTXhrjDls0u8SO3R9A7TmeXELn9nM1mcvntMLJXwW5aAuOaChxdCtGXMjFQmyOFI/wSwI4YeO1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737493710; c=relaxed/simple;
	bh=4rihsEeLilDxsIjDrezt7/AZSKMD+u8K9ULFOU6dOdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+rPu+Niban4gDtfb9rSBj+XVTlOLV9cvaVCzgDpBVYLJKvgP7kxpreMt9iHxH4JVzsiiwHAk791+SVoF+A6WLWVyMwPl9vvqkQmdl/VCZgBSerzHnJNNtuU9ZuxYSEY7YHhGDpozEHEU6R/cZ3ivSxIGsMQzKACgkRDMpjciWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwH2N30D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwH2N30D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737493709; x=1769029709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4rihsEeLilDxsIjDrezt7/AZSKMD+u8K9ULFOU6dOdg=;
  b=nwH2N30DpjE6fxG+gf6sh7XmV526DKjJlzrH2uJWjdVV4XAGpoKCvfMw
   zcPEbhP9kOYm6HwNG5M3etK+GgUw/GBQ2k5fLSLP5fdltVRbpEjEaOxla
   2h6Cmg24v85iYBMAPys95CTuJklUgb+D6A6WJdvLZMk6e6dWjUwpaANlY
   +bJzF5rtNiQrqCqSm3uumtd9fmABRHHIhaPzVaJUQ9UgQsxS6tTPMei65
   +HNeoYqSDTokxgO/fViRqtmvuI8wh0Hd9A/M39TUIuwFkJcaaSPAiyT3J
   mvLa9DSmrtu7+CugP4Uck5pQ+9JMBYDVodGtMB5eIek+sA8wuX8HwxEWa
   Q==;
X-CSE-ConnectionGUID: Ttzqy2ODTJ+ZeUjuHIrAYw==
X-CSE-MsgGUID: wW0TjD/GQYmRTmZKpp2Qmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38082190"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="38082190"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 13:08:26 -0800
X-CSE-ConnectionGUID: CJNzKQs1QZ6ckecRxqPgpQ==
X-CSE-MsgGUID: u6kpP2CcQQmRviv17MBAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112012051"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 13:08:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taLTy-000YzR-0n;
	Tue, 21 Jan 2025 21:08:22 +0000
Date: Wed, 22 Jan 2025 05:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9672/10009]
 drivers/cpufreq/s3c64xx-cpufreq.c:27:28: warning: 's3c64xx_dvfs_table'
 defined but not used
Message-ID: <202501220532.ct9mqw2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f066b5a6c7a06adfb666b7652cc99b4ff264f4ed
commit: 76b218721e5fd5ac2fc03e1340595c9a56c1613d [9672/10009] cpufreq: s3c64xx: Fix compilation warning
config: sparc64-randconfig-r112-20250121 (https://download.01.org/0day-ci/archive/20250122/202501220532.ct9mqw2F-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250122/202501220532.ct9mqw2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220532.ct9mqw2F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/s3c64xx-cpufreq.c:27:28: warning: 's3c64xx_dvfs_table' defined but not used [-Wunused-variable]
      27 | static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
         |                            ^~~~~~~~~~~~~~~~~~


vim +/s3c64xx_dvfs_table +27 drivers/cpufreq/s3c64xx-cpufreq.c

b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15  26  
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15 @27  static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  28  	[0] = { 1000000, 1150000 },
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  29  	[1] = { 1050000, 1150000 },
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  30  	[2] = { 1100000, 1150000 },
e9c08f0d5737a9 arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-11-03  31  	[3] = { 1200000, 1350000 },
c6e2d68558b612 drivers/cpufreq/s3c64xx-cpufreq.c Mark Brown 2011-06-08  32  	[4] = { 1300000, 1350000 },
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15  33  };
b3748ddd80569e arch/arm/plat-s3c64xx/cpufreq.c   Mark Brown 2009-06-15  34  

:::::: The code at line 27 was first introduced by commit
:::::: b3748ddd80569ec753f62e709629b8c639143222 [ARM] S3C64XX: Initial support for DVFS

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
