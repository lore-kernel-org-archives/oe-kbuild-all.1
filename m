Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BC2395
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 01:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCS1Wls0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699233897; x=1730769897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=emwDhGFwAcR/TkYDjsqb3lDZBQMFnV5WPFX6PaRArd0=;
  b=QCS1Wls0igOrERpFzzvk9XR7FIiCm7wyg2IbT0PemhYj2xYWRp7QyAkl
   xw5JuwlqbRIHCO76Clwha1udVHGhkx25CCQynij0EHvPl1d4deL1uoYf+
   siWRbFP5j1NEARE7QKDAS0vBo+wq4jxJtR1iO+4WIWeGV04btB0MEqyeN
   XD8u27PI/TWTar9MI7hAubZ3mAekCXBfa9T5lEwPNpefqmdLqo2LJDu8/
   DFtFW7yK2LpSw+uFo/jlf18xD/uvKZWfjwRNzGQHLYgyZr1YurZokNQDh
   vaLMWRJg356m8hpNeG7sayc4izthqIMOJSJsJeP1Ma4veWa7KelS4ci9o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="7822689"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="7822689"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 17:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="712056932"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="712056932"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2023 17:24:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzoMG-0005xW-1u;
	Mon, 06 Nov 2023 01:24:52 +0000
Date: Mon, 6 Nov 2023 09:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/pmdomain/apple/pmgr-pwrstate.c:180:32: sparse: sparse:
 symbol 'apple_pmgr_reset_ops' was not declared. Should it be static?
Message-ID: <202311060916.WwbD4jNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: e2ad626f8f409899baf1bf192d0533a851128b19 pmdomain: Rename the genpd subsystem to pmdomain
date:   8 weeks ago
config: arm64-randconfig-r122-20231102 (https://download.01.org/0day-ci/archive/20231106/202311060916.WwbD4jNN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060916.WwbD4jNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060916.WwbD4jNN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pmdomain/apple/pmgr-pwrstate.c:180:32: sparse: sparse: symbol 'apple_pmgr_reset_ops' was not declared. Should it be static?

vim +/apple_pmgr_reset_ops +180 drivers/pmdomain/apple/pmgr-pwrstate.c

6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  179  
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24 @180  const struct reset_control_ops apple_pmgr_reset_ops = {
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  181  	.assert		= apple_pmgr_reset_assert,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  182  	.deassert	= apple_pmgr_reset_deassert,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  183  	.reset		= apple_pmgr_reset_reset,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  184  	.status		= apple_pmgr_reset_status,
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  185  };
6df9d38f9146e8 drivers/soc/apple/apple-pmgr-pwrstate.c Hector Martin 2021-11-24  186  

:::::: The code at line 180 was first introduced by commit
:::::: 6df9d38f9146e83b473f0c9e57fb5fdf3fcc93e2 soc: apple: Add driver for Apple PMGR power state controls

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
