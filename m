Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE26371895
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 22:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194552; cv=none; b=iL5V1XX+NdV+BLn2fsO2+TsPzrh2xmmMfbc4NjU3nCFys9zOKeXjJ1cTWnu1rPx8r2Kk1VV3GnXzN+Qbe0I3O3InfJkeBhXGOJ4DKYWL6SRIyJSTztPcHQcH8ojNBbKNONMShx//wPBc9ns1SCab04NFWAavRiyWfnrwpQjgAc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194552; c=relaxed/simple;
	bh=I23vh+SQc+3AjmoaX5B4ydTXwv2yLrFIuSUVygkH9Y8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NrnLLaWGa6C39DC0aMZfuySVN5b0l0ckKCSSJgTEJZTiHVJF1vLHhqcZkp6XlNrlmHett9+dzeG9c8KyGwkCE5aMzxdMmv7AI/rbUYlFITioETcv7v6myW25NGr+qjv1jLDXT2ISlXIPIrzYsdOiKZCJEGn7wAd+w6OmT6LHphk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5QNS6XX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5QNS6XX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778194551; x=1809730551;
  h=date:from:to:cc:subject:message-id;
  bh=I23vh+SQc+3AjmoaX5B4ydTXwv2yLrFIuSUVygkH9Y8=;
  b=a5QNS6XX6zzTYn3See/VNWtFvMWPTvnNPhhRuJbfRiL6NdvrpGPm8Jy1
   dY/IODWi00LYac6GOf2KNffPokAIZsap0qZ5m0Lb3Er5Wk5ySktb1r8nH
   uI/6Jjy/mcaBOg7xr/KrwKlyQQlTdE2Q0rsNRW9jhxOMNFY8XufSjX7v7
   LyhDnfYC3j7wFLWpmHpuygMHthhaJflKGq1tK70huLtoV/V+P9QhqFD+5
   lgyMBgFLt6ZvXkt05SxPJkafsKHSNylJsOU0c2MhqFaxui3AVSk/bOPK6
   DSGjnCS8GPJSRyS+coUC5um+apec02L0CVTYLO1/tzkOBMBDqT7eA4Yoj
   A==;
X-CSE-ConnectionGUID: zwRDzR5qRGiDPcN+WiN3vA==
X-CSE-MsgGUID: XerjiPxERT+lpWQKMts6gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="81724472"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="81724472"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 15:55:50 -0700
X-CSE-ConnectionGUID: DZzq8aECTDmBLlPisL0cBQ==
X-CSE-MsgGUID: kRenyageTXu3AB0LHNRt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="233944536"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 15:55:48 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL7dC-000000000XR-11ar;
	Thu, 07 May 2026 22:55:46 +0000
Date: Fri, 08 May 2026 06:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 3/3]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype
 for 'pkvm_smc_filter_hyp_init'
Message-ID: <202605080609.0bFtoJnL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   b90618a659382d39b7e8ea450f55bec936a7a389
commit: 55d5ad26bfd2c81f8dc9e232ee7f77021cd1814c [3/3] ANDROID: misc: pkvm_smc: Add pKVM SMC filter driver
config: arm64-randconfig-003-20260508 (https://download.01.org/0day-ci/archive/20260508/202605080609.0bFtoJnL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080609.0bFtoJnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080609.0bFtoJnL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype for 'pkvm_smc_filter_hyp_init' [-Wmissing-prototypes]
      10 | int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]


vim +/pkvm_smc_filter_hyp_init +10 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

     9	
  > 10	int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
