Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1950E200CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732161400; cv=none; b=H+tAbFMRx+H3YoP0GPT9+bYdHSG2nQuEHJZ7Y+pUIu70ltySnsfl8SJjvn3RcImMMsXIpFfe16UE9T5TN55cELvUQboVnNGTotljXxGiO6Ulqv+e1EWGk+yNoo2nP35IAYMZfsjOFkKlPctmV3cEG8YibH76dH2+BwWv2gZqdOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732161400; c=relaxed/simple;
	bh=T+qppsl4HXwofUoC6jDAxNOpDADcc5OSIeg4xAydDsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3iY/I7ptQpmsqhNwLmgj8zwhrnvF055euBAvXyS6RceGkgdo/+Eq69wKG1QbkhAznIZow6HzI1E5j5JHoNDdsv9KWd5ciaQq3lNnZcbX+IIspKo/pzBMZbOyWmTU6T+FKganvsdEKVaI+ZwwcxBOmcnpd/535Tv4n7T0/hIXic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dB8Fs45P; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dB8Fs45P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732161397; x=1763697397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+qppsl4HXwofUoC6jDAxNOpDADcc5OSIeg4xAydDsc=;
  b=dB8Fs45P+FM5smmHxYAa4fkAt9ntvDNvmytrBJxYBMqdjlthCLr3K1wZ
   PDZCBnei2TEvY+s6/ds1cSy5zQxd5J80KVGx2bjpEYxLKR8ZhwsxX33oP
   5UBzz+15k2h+q4Mw3+qnFEwcnnMvK1u/8RIYpLfVkeagBZsRU5bhvmcpM
   VlmxLwxnhNa5ZdlQ/Q3uPV5dlVcbZGgcSnbOzPR+4r5XuqY4axz3MwZt1
   kedTOY6mku3mVyPdiz17uUvAVASAUiopQneNaoRn/Uo9hIi7/deNR1usH
   SvacyQVsaoVpFBuHFsasKtl7lqZ2ZrFk7SYAb4RKGu+UcRTZusRYYizCz
   g==;
X-CSE-ConnectionGUID: y5+J/Pv8TgmQN9rmJQCQ+g==
X-CSE-MsgGUID: bt64iFxHRKaPq2KWChNOXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31999358"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="31999358"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 19:56:37 -0800
X-CSE-ConnectionGUID: hL215RGTThSCFZ9gfla9MQ==
X-CSE-MsgGUID: ug/nZy72QLy4XmpaTnBchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="90241922"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2024 19:56:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDyIz-0001gd-2Q;
	Thu, 21 Nov 2024 03:56:33 +0000
Date: Thu, 21 Nov 2024 11:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15249/24476]
 drivers/media/pci/intel/ipu6/../ipu-bus.c:169:12: error: no member named
 'dma_ops' in 'struct device'
Message-ID: <202411211130.2arvO6sR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   dcb22c65d3166899f42ea70a7705c5bff529ad33
commit: 60e566f1ebecf5c38e7718cc52e5a482505b6742 [15249/24476] CHROMIUM: media: add Intel IPU6 drivers
config: x86_64-randconfig-102-20241121 (https://download.01.org/0day-ci/archive/20241121/202411211130.2arvO6sR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211130.2arvO6sR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211130.2arvO6sR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/pci/intel/ipu6/../ipu-bus.c:5:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2222:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/pci/intel/ipu6/../ipu-bus.c:169:12: error: no member named 'dma_ops' in 'struct device'
     169 |         adev->dev.dma_ops = &ipu_dma_ops;
         |         ~~~~~~~~~ ^
   1 warning and 1 error generated.
--
   In file included from drivers/media/pci/intel/ipu6/../ipu-psys.c:6:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2222:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/pci/intel/ipu6/../ipu-psys.c:1526:6: warning: unused variable 'r' [-Wunused-variable]
    1526 |         int r;
         |             ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=m] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


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
