Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B27299931
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772832419; cv=none; b=Ch9gkzT56/k7UbT+IXSo07hxqK6DngSZfSWD86qidFwq7Ug1XMsx4Y5bFEPa6Y/jtKt0CNd5/AnZbhMP0br+3lZ8hktWRWFP2ZWopCMYbhsyhTgPTicWziTwzixAhr/fpBso57q97T5VtEEdHmBVYLpk8YJp5NPAadhScmBZRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772832419; c=relaxed/simple;
	bh=ArOiI866cwwN4U0rPj98rD6fCiVizEqBDGdmR0BPEbw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lSl88J0ncmcE7z1x40kqZddKC7LAZXhQDw6nVKp4CF3Yaj1R5JmMdzHzrRBgCwI7mNhICXgJWkAP3Sbdu6uNEtHjp04v9SHm7ETcCoAUNrQREZzhUvTmvutQr+neFX5nVggr6wsR42LGGrmFFcuTPosVTmw3aR6wzzFXhBchsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoEEBZyR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoEEBZyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772832418; x=1804368418;
  h=date:from:to:cc:subject:message-id;
  bh=ArOiI866cwwN4U0rPj98rD6fCiVizEqBDGdmR0BPEbw=;
  b=eoEEBZyR9GXUunpOxSIVcoPLgc0F2QgRdvYF/RHsq3nVmRJdE8U9qHzR
   1rrhUqJs/IfKaBlcCjTaheW7xcgAgYdlSryoUz+PFUh5LpHEEPKsFhEiM
   xhu6miwMugvONbQoBImTe5NKru7hiUeywm+FHt8n/RIq6V7if6H+fXc/r
   fYyyK1kiUuBh8XNdLWPgy5+9JLTM7DGXv3CCYtybXVpL6qr2Vc2Q5Y2AM
   Vgcyt4fmQG6autEGAsuVq2U3tjaofr8vsjKsvVVoVntnamC9cOINAi0O3
   v1i79uWCYc6bXfx8cjrg2oC8QUQKinxRjaPpjLTir1ZwAtraC93d8wPoN
   A==;
X-CSE-ConnectionGUID: PNZ9jWhXQXqdNOh8vqAA1w==
X-CSE-MsgGUID: RcxOLGhhQPG7gOiYJFL7ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73143132"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73143132"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 13:26:57 -0800
X-CSE-ConnectionGUID: XzO7zQlRSQCmjlr1++70Fg==
X-CSE-MsgGUID: tCz/UaKVQFi5VQCvP9iDQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="242132663"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 13:26:56 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vychC-000000001Ob-0YSP;
	Fri, 06 Mar 2026 21:26:54 +0000
Date: Sat, 07 Mar 2026 05:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1]
 arch/arm64/mm/dma-mapping-noalias.c:562:33: error: 'arm64_iommu_ops'
 undeclared; did you mean 'arm64_noalias_ops'?
Message-ID: <202603070522.eJWKBP9r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Robin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   2fa386e94ce07aeb64438dcb7652d51a0dfd6609
commit: 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782 [1/1] ANDROID: arm64: Work around Cortex-A510 erratum 2454944
config: arm64-randconfig-r051-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070522.eJWKBP9r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070522.eJWKBP9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070522.eJWKBP9r-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for 'arm64_noalias_setup_dma_ops' [-Wmissing-prototypes]
     550 | void arm64_noalias_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/dma-mapping-noalias.c: In function 'arm64_noalias_setup_dma_ops':
>> arch/arm64/mm/dma-mapping-noalias.c:562:33: error: 'arm64_iommu_ops' undeclared (first use in this function); did you mean 'arm64_noalias_ops'?
     562 |                 dev->dma_ops = &arm64_iommu_ops;
         |                                 ^~~~~~~~~~~~~~~
         |                                 arm64_noalias_ops
   arch/arm64/mm/dma-mapping-noalias.c:562:33: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/mm/dma-mapping-noalias.c:563:21: error: 'iommu_dma_ops' undeclared (first use in this function); did you mean 'iommu_map'?
     563 |                 if (iommu_dma_ops)
         |                     ^~~~~~~~~~~~~
         |                     iommu_map

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +562 arch/arm64/mm/dma-mapping-noalias.c

   549	
   550	void arm64_noalias_setup_dma_ops(struct device *dev)
   551	{
   552		if (dev_is_dma_coherent(dev))
   553			return;
   554	
   555		dev_info(dev, "applying no-alias DMA workaround\n");
   556		if (!dev->dma_ops) {
   557			dev->dma_ops = &arm64_noalias_ops;
   558			goto done;
   559		}
   560	
   561		if (IS_ENABLED(CONFIG_IOMMU_DMA)) {
 > 562			dev->dma_ops = &arm64_iommu_ops;
 > 563			if (iommu_dma_ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
