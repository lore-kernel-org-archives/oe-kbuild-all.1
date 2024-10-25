Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409901862AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876223; cv=none; b=ErvVpUWMnuA0FCnG90UHfT++U+1YURmZT9jxeLySzLds4FgFcTSeTfITlis4Xhrbwz8hnSQvVKc9ozPvUUcFhuk7ggy7JD6rzMFHSCIDfULFHWoit99o/LGhwyjqmEGUESbkGlvc90vgKxbtrEYpAxMURCUjJjUZo3gYbSs7tqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876223; c=relaxed/simple;
	bh=VEH1hAhwjFiznvGzJ/8mRJVJDgTf7wSr0TXfqBg6Pcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EYDDsSx2OCEi6oJ5tt/f3qaBm7NAUzL7ma4W/2edPYAbZ/s3P0v2zorS2sPvs/UBWNvxCi/bhphXcUgBxZsV8N0pmV/ZhNkRIlHh4zvq3yEZ+4vLzTW9MuL7+DzVElopC5bc6f7glPKTaGf/ZaaqrVT7HU8iWQsddnG+6j5gCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9v5Zff4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9v5Zff4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729876221; x=1761412221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEH1hAhwjFiznvGzJ/8mRJVJDgTf7wSr0TXfqBg6Pcc=;
  b=F9v5Zff4R9tcVRrliboP0cU2DsUOPJlOkAaVws28mJul5h5jrr7Ic61L
   JbdjwshhnfmaK/1Tptsc93jyX0ubDaetbWtHKs9TRi3kcPC5gDs+vK1UJ
   XEV0zMRfuI+XtaiA29el7o419bPRUhG79uHG/eZp/WZlm91mc8jj5W4TJ
   /2lo/xYZuGPGii3AFn9fZ0NbGpMmVTmdCUPFS7vlua8bVfbVD/P33oige
   zd6HglLzepLLrgNt3b/G46yDKGtTFyRafVwIuVwO9ZaN0qY0+sgcd+jw+
   iy0Ys6QcMGYDRu1fURX/n3JaqfyyUK/PG6I3nF7crYHNuB0HGsbQ3FEP7
   Q==;
X-CSE-ConnectionGUID: dqIE+6zARGucZySOzcgyLA==
X-CSE-MsgGUID: rHqaMSnmQeSrcucjrTaPWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40656861"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40656861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:10:21 -0700
X-CSE-ConnectionGUID: lN220RYUTuSCJB0WNSvGjg==
X-CSE-MsgGUID: H82iusdjReS+LBFnxnLy2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="111800015"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2024 10:10:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4NpJ-000Yee-0v;
	Fri, 25 Oct 2024 17:10:17 +0000
Date: Sat, 26 Oct 2024 01:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15249/23047]
 drivers/media/pci/intel/ipu6/../ipu-bus.c:169:18: error: 'struct device' has
 no member named 'dma_ops'
Message-ID: <202410260113.OiqYbdTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tianshu,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   8db7166ce5617f362617549c34e49c02491c3167
commit: 60e566f1ebecf5c38e7718cc52e5a482505b6742 [15249/23047] CHROMIUM: media: add Intel IPU6 drivers
config: x86_64-buildonly-randconfig-006-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260113.OiqYbdTm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260113.OiqYbdTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260113.OiqYbdTm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/../ipu-bus.c: In function 'ipu_bus_initialize_device':
>> drivers/media/pci/intel/ipu6/../ipu-bus.c:169:18: error: 'struct device' has no member named 'dma_ops'
     169 |         adev->dev.dma_ops = &ipu_dma_ops;
         |                  ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
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
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +169 drivers/media/pci/intel/ipu6/../ipu-bus.c

   152	
   153	struct ipu_bus_device *ipu_bus_initialize_device(struct pci_dev *pdev,
   154							 struct device *parent,
   155							 void *pdata,
   156							 struct ipu_buttress_ctrl *ctrl,
   157							 char *name, unsigned int nr)
   158	{
   159		struct ipu_bus_device *adev;
   160		struct ipu_device *isp = pci_get_drvdata(pdev);
   161	
   162		adev = kzalloc(sizeof(*adev), GFP_KERNEL);
   163		if (!adev)
   164			return ERR_PTR(-ENOMEM);
   165	
   166		adev->dev.parent = parent;
   167		adev->dev.bus = &ipu_bus;
   168		adev->dev.release = ipu_bus_release;
 > 169		adev->dev.dma_ops = &ipu_dma_ops;
   170		adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ?
   171					      IPU_MMU_ADDRESS_BITS :
   172					      IPU_MMU_ADDRESS_BITS_NON_SECURE);
   173		adev->dev.dma_mask = &adev->dma_mask;
   174		adev->dev.dma_parms = pdev->dev.dma_parms;
   175		adev->dev.coherent_dma_mask = adev->dma_mask;
   176		adev->ctrl = ctrl;
   177		adev->pdata = pdata;
   178		adev->isp = isp;
   179		mutex_init(&adev->resume_lock);
   180		dev_set_name(&adev->dev, "%s%d", name, nr);
   181	
   182		device_initialize(&adev->dev);
   183		pm_runtime_forbid(&adev->dev);
   184		pm_runtime_enable(&adev->dev);
   185	
   186		return adev;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
