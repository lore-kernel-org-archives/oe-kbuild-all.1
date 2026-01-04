Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2F6FBF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 00:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767486659; cv=none; b=r73To/CDS8wjAfVgcmj2Uswyeh9T1GidADttXmz14NlcKwwW84LqxAUGj2cq8VcomzCIn8Qh0t+6VP77YRTaEGsll+sS/m1AdCrcku8r2z3CgQfOI9Rmoag4B4BBF1bvB7L1ykWIc53+9wW3RvdAfnp5MerB/XGR7L3Ppx0d/UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767486659; c=relaxed/simple;
	bh=MvhHa903KYejCK11koQ1ni2DXgxpX6+bFUcxitamFOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OOimLdExYgBqSvapepK+h4PJrTf7AGPQ16r5MACBxa3SjX/88DYII81wXRqoQSPetKYml4DAJG1XnOVUWNSeIA++gPy9/QohbJvOIzhiQ0QKVCYqCYZRv35rkAYGn34DuLW9af3SNgaCoaLMZR3GBIv+jKrPluKF+pzCOedWgbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lbt5H3AJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lbt5H3AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767486657; x=1799022657;
  h=date:from:to:cc:subject:message-id;
  bh=MvhHa903KYejCK11koQ1ni2DXgxpX6+bFUcxitamFOQ=;
  b=Lbt5H3AJT46l/ZpyBjpyNEV+IQUV35yAWysgHB0n23IdAfziuxINGG2+
   jRnsKAAm6+g0IT5Y87DjYnr/n7NQacanzwIaNdnhRsevSjHv3QSrdcoxv
   1M/TpV7M+XOyDXIEuTLSeaXDzsl3K5EqTIp7Trdk5U1R7J+FImbLIyVxN
   CTgjl6i6oa9tR5oDq74EJjGnjoKDGBPG0u9ZhRwmRB3FozxXMRQaxdyAi
   kTYe4CYARvdjCktplUwxMAkEV5IIOYL4cDbpE8xsg6go5SfZHoP6BdUZ7
   6j0WHF5uJQ5/2etI9qWAYnimCFrs94ZDlv4yj/GvM25cjQi4hLRF0bd+a
   A==;
X-CSE-ConnectionGUID: CZYQyQAHRYucjP9AbxaHow==
X-CSE-MsgGUID: jlsWgkE9SVySAuOjWUTUyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68844867"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68844867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 16:30:57 -0800
X-CSE-ConnectionGUID: kCZBIRmySg+oJNkbZuexpg==
X-CSE-MsgGUID: wQQhJT43QseoIthMgtXuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="203037588"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jan 2026 16:30:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcC1F-000000000Ir-0dMp;
	Sun, 04 Jan 2026 00:30:53 +0000
Date: Sun, 04 Jan 2026 08:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning: unused variable
 'tc_dwc_g210_pltfm_match'
Message-ID: <202601040829.BAm4otA2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   03ef8a82a9f3d7c58e5cb57e8d786ac07424572b
commit: 2d74ff4319d1c8a4254635d7a611562571a8e39f [0/1] UPSTREAM: scsi: ufs: Split the drivers/scsi/ufs directory
config: x86_64-buildonly-randconfig-003-20260104 (https://download.01.org/0day-ci/archive/20260104/202601040829.BAm4otA2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040829.BAm4otA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040829.BAm4otA2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning: unused variable 'tc_dwc_g210_pltfm_match' [-Wunused-const-variable]
      36 | static const struct of_device_id tc_dwc_g210_pltfm_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/tc_dwc_g210_pltfm_match +36 drivers/ufs/host/tc-dwc-g210-pltfrm.c

fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  35  
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11 @36  static const struct of_device_id tc_dwc_g210_pltfm_match[] = {
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  37  	{
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  38  		.compatible = "snps,g210-tc-6.00-20bit",
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  39  		.data = &tc_dwc_g210_20bit_pltfm_hba_vops,
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  40  	},
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  41  	{
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  42  		.compatible = "snps,g210-tc-6.00-40bit",
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  43  		.data = &tc_dwc_g210_40bit_pltfm_hba_vops,
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  44  	},
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  45  	{ },
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  46  };
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  47  MODULE_DEVICE_TABLE(of, tc_dwc_g210_pltfm_match);
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  48  

:::::: The code at line 36 was first introduced by commit
:::::: fc040a3fc47cad038f774275ea61fe6d5b57d7cc ufs: add TC G210 platform driver

:::::: TO: Joao Pinto <Joao.Pinto@synopsys.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
