Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F4202F79
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736370054; cv=none; b=HvJ3QiOwZJUK5rNpoLlHpqtRe1ceEMNyjYeBIRUzYvvjIuxCGUTlig/kLXFMisYiQ/CxVqIpTwc5hx/Gir2teSUpcBUYPmzsAjvcfa0M5X+blQ949YfOQk1coiae2Uh0aLB+UWKWlenJrXHN4+blTs2NHrNiHBNdbUfy5xKkFew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736370054; c=relaxed/simple;
	bh=Bckhgd/O3t0bQ7yQyWFVDoAiieZJnXyLPv+9lAEeYwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRXSlm5EOhaXbWCR76skDr5QPLcH6WZPnmazL1WdVuatXizzsZWau4pVWgFy/bciqgbqrFVJsGBoLYiP7RB4GgDEOLjrBNTFYAXDhRj1nDlR8fzfqaDCWfkC/cr+lD0OV3N+lMHiDgzAjuGvqzCBSV5UxfYWFLYy3ejS3X2uHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/lSfCI0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/lSfCI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736370053; x=1767906053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bckhgd/O3t0bQ7yQyWFVDoAiieZJnXyLPv+9lAEeYwc=;
  b=h/lSfCI0Bei0KKvGbRmFDvoi7V1//hqT0csIjr6VdkIIqgsHxMcFak5X
   oAxdUmAa0htUELf3eE3TqlbKedc70czBNGJw9KU+kpgkVJRkyCczeajYI
   bz/s81gzHxQquOCSdfV3+W1Al5mkRXDci5Shasd6krSplgjd4XlTK2dTU
   UsB57VEQWJAE5fg+KwGzsgLqR654UVPoulu/GTdKz9WHjDXe3hUiS2UUq
   tAwHuBOaLiICDIMz/CeU/HArlM+MmXmVWvoH/4MXnZlBPde8JT4SL+BQT
   8nBR/HQup6I9NBlM4GD8MT7+rUTndWOaeNhMk7riZs5Ncqu6cJgTLsAwo
   A==;
X-CSE-ConnectionGUID: g7jrJ9pgTrWTI5y3zL38ZQ==
X-CSE-MsgGUID: r7wFJhi8Req+2TAZI+z7Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36497469"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36497469"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 13:00:53 -0800
X-CSE-ConnectionGUID: g725FWPNR2CiFrgCOtDIhQ==
X-CSE-MsgGUID: 5htNaU0SRCOF10S2CiqYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103072060"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jan 2025 13:00:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVdAW-000GgV-27;
	Wed, 08 Jan 2025 21:00:48 +0000
Date: Thu, 9 Jan 2025 05:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-08 2/2]
 arch/arm64/mm/dma-mapping-noalias.c:556:17: error: 'struct device' has no
 member named 'dma_ops'
Message-ID: <202501090451.5fZWl7H9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-08
head:   5659b677bcebcb4d4c5616f07ce817fadf62afa5
commit: 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782 [2/2] ANDROID: arm64: Work around Cortex-A510 erratum 2454944
config: arm64-randconfig-003-20250109 (https://download.01.org/0day-ci/archive/20250109/202501090451.5fZWl7H9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090451.5fZWl7H9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090451.5fZWl7H9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for 'arm64_noalias_setup_dma_ops' [-Wmissing-prototypes]
     550 | void arm64_noalias_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/dma-mapping-noalias.c: In function 'arm64_noalias_setup_dma_ops':
>> arch/arm64/mm/dma-mapping-noalias.c:556:17: error: 'struct device' has no member named 'dma_ops'
     556 |         if (!dev->dma_ops) {
         |                 ^~
   arch/arm64/mm/dma-mapping-noalias.c:557:20: error: 'struct device' has no member named 'dma_ops'
     557 |                 dev->dma_ops = &arm64_noalias_ops;
         |                    ^~
   arch/arm64/mm/dma-mapping-noalias.c:562:20: error: 'struct device' has no member named 'dma_ops'
     562 |                 dev->dma_ops = &arm64_iommu_ops;
         |                    ^~
>> arch/arm64/mm/dma-mapping-noalias.c:562:33: error: 'arm64_iommu_ops' undeclared (first use in this function); did you mean 'arm64_noalias_ops'?
     562 |                 dev->dma_ops = &arm64_iommu_ops;
         |                                 ^~~~~~~~~~~~~~~
         |                                 arm64_noalias_ops
   arch/arm64/mm/dma-mapping-noalias.c:562:33: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm64/mm/dma-mapping-noalias.c:563:21: error: 'iommu_dma_ops' undeclared (first use in this function); did you mean 'iommu_map'?
     563 |                 if (iommu_dma_ops)
         |                     ^~~~~~~~~~~~~
         |                     iommu_map
   arch/arm64/mm/dma-mapping-noalias.c:566:36: error: 'struct device' has no member named 'dma_ops'
     566 |                 iommu_dma_ops = dev->dma_ops;
         |                                    ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
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
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +556 arch/arm64/mm/dma-mapping-noalias.c

   549	
 > 550	void arm64_noalias_setup_dma_ops(struct device *dev)
   551	{
   552		if (dev_is_dma_coherent(dev))
   553			return;
   554	
   555		dev_info(dev, "applying no-alias DMA workaround\n");
 > 556		if (!dev->dma_ops) {
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
