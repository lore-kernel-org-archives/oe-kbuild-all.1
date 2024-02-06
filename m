Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435017984
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707248782; cv=none; b=Rnj6SyGZHOueqMAZ7zBRXghDQ3d2JvvYacjGS4aLDrPW+dgIK1lCY1ovA9GK5SPGNfbddYmta3cfy53VuSdUmpc3w+Zft7ta3gelQ9vevwdh6frriWo+5+Z+/kkIfquqTAFzXMHWnS4XfyuxCOMrAsFEAZi4VVyR7oMt/CQn3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707248782; c=relaxed/simple;
	bh=yTF8iJVW0ai7q6rMRk2LhdTNGcLYjFnkaXwxZg/zYtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gF8cUlNBh02JtzAc5svVyGLSJKPUE+pziiZSmXNL1pH/iF2h/bCjyhd1PIVrufYNdrJOF7WGxEWv1deNg75H3mHWb3EDnijJ6so3Q2R8E/fDkDJhccCviOhqnTIxRkt/CSAgnwfrj9cH1VPeRs33DQBKDjIlopE9aTqNcPayApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoWjZkJE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoWjZkJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707248779; x=1738784779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yTF8iJVW0ai7q6rMRk2LhdTNGcLYjFnkaXwxZg/zYtI=;
  b=VoWjZkJESBOFHRAyV3AN5gOnR9fqDfnMkYCobMtJYmk9E03qFA8eTpRA
   48FYiZjh1F87RW/DnnmDhphFLeq9X7HFn4iSvK9RW1iSHXbXCPi4N+rlb
   G0ROzs+TD2FIvVMmWtROlP3VELlgLs2JGaXezxKVlDuHDtdA0aLLCJ0hH
   P8UJYxvXL+VzGeG2ySFR8O7Vx6oDmMkSbmtixvovOJ/aMzFol0u0+oxRq
   Pg50TEp+RwTWcWarbjLcb1ja2dK15RnneZTLIhgSh07nTbfy5YOBVgmC+
   19dB/ui2kJcGBiTQlKL2TJmQQjby2XI0C0VjyH5YtAIXIRpVYJSFmG+Ep
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="973763"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="973763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 11:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1103526"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Feb 2024 11:46:17 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXROZ-0001jf-2Z;
	Tue, 06 Feb 2024 19:46:15 +0000
Date: Wed, 7 Feb 2024 03:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/sdhi/tmio-simplification 3/5]
 drivers/mmc/host/tmio_mmc_core.c:1087:6: error: implicit declaration of
 function 'of_property_read_bool' is invalid in C99
Message-ID: <202402070323.JpYfFtkQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/tmio-simplification
head:   cccb4dda1ee496a1baabb6283db1e5f52808b706
commit: a01061a0afbd18bce634e772e050c78ce6bd8fdc [3/5] mfd: tmio: update include files
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240207/202402070323.JpYfFtkQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070323.JpYfFtkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070323.JpYfFtkQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/tmio_mmc_core.c:1087:6: error: implicit declaration of function 'of_property_read_bool' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (of_property_read_bool(np, "toshiba,mmc-wrprotect-disable"))
               ^
   1 error generated.
--
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:459:26: error: use of undeclared identifier 'pm_runtime_force_suspend'
           SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
                                   ^
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:460:5: error: use of undeclared identifier 'pm_runtime_force_resume'
                                   pm_runtime_force_resume)
                                   ^
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:459:26: error: use of undeclared identifier 'pm_runtime_force_suspend'
           SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
                                   ^
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:460:5: error: use of undeclared identifier 'pm_runtime_force_resume'
                                   pm_runtime_force_resume)
                                   ^
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:459:26: error: use of undeclared identifier 'pm_runtime_force_suspend'
           SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
                                   ^
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:460:5: error: use of undeclared identifier 'pm_runtime_force_resume'
                                   pm_runtime_force_resume)
                                   ^
   6 errors generated.
--
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:598:26: error: use of undeclared identifier 'pm_runtime_force_suspend'
           SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
                                   ^
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:599:5: error: use of undeclared identifier 'pm_runtime_force_resume'
                                   pm_runtime_force_resume)
                                   ^
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:598:26: error: use of undeclared identifier 'pm_runtime_force_suspend'
           SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
                                   ^
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:599:5: error: use of undeclared identifier 'pm_runtime_force_resume'
                                   pm_runtime_force_resume)
                                   ^
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:598:26: error: use of undeclared identifier 'pm_runtime_force_suspend'
           SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
                                   ^
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:599:5: error: use of undeclared identifier 'pm_runtime_force_resume'
                                   pm_runtime_force_resume)
                                   ^
   6 errors generated.


vim +/of_property_read_bool +1087 drivers/mmc/host/tmio_mmc_core.c

b958a67c6bbe0a drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2012-06-20  1073  
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1074  static void tmio_mmc_of_parse(struct platform_device *pdev,
7c53b79766a463 drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1075  			      struct mmc_host *mmc)
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1076  {
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1077  	const struct device_node *np = pdev->dev.of_node;
f2218db8154854 drivers/mmc/host/tmio_mmc_core.c Simon Horman          2017-06-16  1078  
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1079  	if (!np)
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1080  		return;
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1081  
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1082  	/*
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1083  	 * DEPRECATED:
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1084  	 * For new platforms, please use "disable-wp" instead of
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1085  	 * "toshiba,mmc-wrprotect-disable"
788778b0d21a6d drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1086  	 */
ca6b5fe277e91e drivers/mmc/host/tmio_mmc_core.c Rob Herring           2023-03-10 @1087  	if (of_property_read_bool(np, "toshiba,mmc-wrprotect-disable"))
7c53b79766a463 drivers/mmc/host/tmio_mmc_core.c Masahiro Yamada       2018-01-18  1088  		mmc->caps2 |= MMC_CAP2_NO_WRITE_PROTECT;
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1089  }
5a00a971a2b12e drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2013-02-15  1090  

:::::: The code at line 1087 was first introduced by commit
:::::: ca6b5fe277e91ebca5101dc00c0e26755f0ed6c4 mmc: Use of_property_read_bool() for boolean properties

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
