Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7A1799F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Sep 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789919169; cv=none; b=Fm+quD31+lVguLa45swJoxPDz91IrJQTGsA4o8iy1S379o366zVpFcMTuzx+n1BMSdSosBif/YKJBSpD/ifUppCZdZBmMy0vdvxOHiOtpWqb9fmhcgLAqmi+OVZIecqL83TiT+Q+QGv4gzHnSjip4nUEUBMbMbtp6fbAmIwE9Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789919169; c=relaxed/simple;
	bh=4aDf8CRbdZ2TpOEJPbg0LelX0vyP7vywZD1wdTNWgUQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nOSqC0Dw9e47dcKXWZkdDbuwuqz9/5MvphSBqFGUv14WGa2nP8+pnNegNXWlje3iwPuS6kni5eT9U7GSn8U6xHxf2P1yj9zFkDyvYm26OawtheHH5S3+E19QRNtrG3vZn/KLRkrIhYYT6iwUzkUxehZkoLHhmaiy6VOCvMq4AAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1gNioub; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1gNioub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789919166; x=1821455166;
  h=date:from:to:cc:subject:message-id;
  bh=4aDf8CRbdZ2TpOEJPbg0LelX0vyP7vywZD1wdTNWgUQ=;
  b=m1gNioub/OvBxVKgLTDWvb+UysvSniWtu30hvrwdy7ZNu436yRjcM6eo
   Tb867OmGSL0wFM70ZJz3X+GZvNIP/uP6mULxse6OBiv5wGb/eMZ8AXn6f
   i4HG+N6Vfb7Dnq1THOfScOFIypRWII4+6IBmANrspPzb0AnXEtndL6nj1
   3+AkwAa1m7wdM1BEQAH6APSXyh2cw1HrjvlvL0FTdD+MK1ZtSXuEzDDvB
   z0pgNCWYEv+NglRijYoV/mK9o5VL5W2n/VAgETbZY/D3uwNKHc6L+VyzP
   IZ9YTwJNZi7xghg7SEQCXYpayyUH8cal316/e86uvAQnoe7akWSalKLVE
   A==;
X-CSE-ConnectionGUID: CwW0fIqJRQGFzbqGyHwzCg==
X-CSE-MsgGUID: TWgmN5SmQbeOBRJ/cft49A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101766818"
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="101766818"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 08:46:06 -0700
X-CSE-ConnectionGUID: 7PMlZphPRY2CrCBdIt6lFQ==
X-CSE-MsgGUID: bd8epvFiRVyLg5IijDFjig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,112,1787036400"; 
   d="scan'208";a="271448530"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2026 08:46:04 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8Jju-00000000CXf-1C1a;
	Sun, 20 Sep 2026 15:46:02 +0000
Date: Sun, 20 Sep 2026 23:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype
 for 'pkvm_smc_filter_hyp_init'
Message-ID: <202609202302.xU6EFP5z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb15c16e04b24c94825fe17e483d325c4ac239a8
commit: 55d5ad26bfd2c81f8dc9e232ee7f77021cd1814c [1/1] ANDROID: misc: pkvm_smc: Add pKVM SMC filter driver
config: arm64-randconfig-r1301-20260919 (https://download.01.org/0day-ci/archive/20260920/202609202302.xU6EFP5z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609202302.xU6EFP5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609202302.xU6EFP5z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/pkvm-smc/pkvm/pkvm-smc.c:10:5: warning: no previous prototype for 'pkvm_smc_filter_hyp_init' [-Wmissing-prototypes]
    int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)
        ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]


vim +/pkvm_smc_filter_hyp_init +10 drivers/misc/pkvm-smc/pkvm/pkvm-smc.c

     9	
  > 10	int pkvm_smc_filter_hyp_init(const struct pkvm_module_ops *ops)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
