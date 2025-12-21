Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBB215055
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766300098; cv=none; b=tFFBoFIziE7mncDEj1cxOHy1DLx+GZW9xzGOgPIDBEHPcUfQVyMn967EM8h+3JvYnb1BAUtnMNX9IRBm0FM1BwIa+xq3vUsvs3fohz7lh3Uv9G/GxJY+40zR4TN3/FCdTBTQxMZJdTcfd7x69A8tMI4XHOr7nyKOR68xRgJ8Kgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766300098; c=relaxed/simple;
	bh=QvzpevCXO8Ea0KH+8YlDKNfnWLh+cip/LmrRVaW6Ekk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tc0rOLdcSz95cCKKB8bnzOSfijIXEP2aYZRyxwbnvVay62/7cuEWOsriVpBwBI86OfL4wkL+qwKhTMDallA6wsMyAHUIKf2ZdJZNGTXbjktAQCl6crRWo3bLEEaXuNxM28SAjBOCtvvoxcWbAnT+FEvZuwmYbDu22HG3jNCqnl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuX5nAeM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuX5nAeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766300098; x=1797836098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QvzpevCXO8Ea0KH+8YlDKNfnWLh+cip/LmrRVaW6Ekk=;
  b=GuX5nAeMvqTQnke50j+jwXhZOsZz3cY23zbBwjeaCcO6FfLRw6M4j1ku
   D9pGrONlx7rfWm47hxdHaSLyxBpPVky8knCzv6hryTtFNmJmV1g5OLcxK
   C/veYa0n0GTmTh6x1Re/8cXdjBVo6+jBbBlnKEf1eX5lc8qMdydPEopKK
   +piGaegigzmvOJp0zGEJzuNu1+pdanDTVg1VMyvPaUSUlp1QZdYqjENwD
   q+twNtgP29cu+qvKbTpG1m9NknW4eUt6M+pWQEYRMELJtG3+NUvxkXLY3
   UwhCuwTZNDs2StclYSzs01PgeDMdEu9oRbfIviVXSuKEcaxuljPqQA7KT
   w==;
X-CSE-ConnectionGUID: yY2JvdhbRbutJ/2RCp5lCA==
X-CSE-MsgGUID: gN0Bh/jGQMGGAjhGcTLpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78516654"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78516654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 22:54:57 -0800
X-CSE-ConnectionGUID: kbNNGALHQv2zhSbuFzFPpg==
X-CSE-MsgGUID: L5cHGctUQxu9nGmFB5FB6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203372257"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2025 22:54:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXDLB-000000004xQ-1YMa;
	Sun, 21 Dec 2025 06:54:53 +0000
Date: Sun, 21 Dec 2025 07:53:57 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DMA_ENGINE_RAID when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202512210729.sehpkLLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 89542310160d3b0ff963cc8fd23186d5acd231df [12/12] ANDROID: dma: Select CONFIG_DMA_ENGINE_RAID in Kconfig.gki
config: x86_64-kismet-CONFIG_DMA_ENGINE_RAID-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210729.sehpkLLc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210729.sehpkLLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210729.sehpkLLc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ENGINE
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - GKI_HIDDEN_CRYPTO_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
