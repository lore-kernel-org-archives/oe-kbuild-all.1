Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87642F746D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 23:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766360474; cv=none; b=QXYwpaQd9bBF6AsIPrNraMqz1UxUTihlLbvQFlYgLIAGBfvTvz5FuINPd6a0rKjlw3seyskSTRRm6Ha5d90N4liE4z+GeJHNBQWb11ouQMJXRAcT8QDa9VIBkzWGfjG8xy+rS/n6tT0tHyltxDGXS4wffydNQ+KmTT707s31Cxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766360474; c=relaxed/simple;
	bh=bHh5YYTdyagiCZ24lHEZH37Pt2di46QveLH+mx4w4dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WvoRh/7hCWcV6xcu7Wzyr/IOdK9YVbgcfBca9exZccD0ad3a8uAbzQJ5AVTGceeXkZHVcSlsQ6s7/OZRwuj6Dbav6NRSmPr497kKQd696szY2fUO1ZaPiIVGwZDp90s/P3q4xZWjM30kDkjfc2l/U1fLf/haKfe+Yx0/dUtoTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCbV9qsv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCbV9qsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766360472; x=1797896472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bHh5YYTdyagiCZ24lHEZH37Pt2di46QveLH+mx4w4dg=;
  b=XCbV9qsvafX2bZo1zAMZWnL6n2qdFPe8gjBdui3AK8t/pPuundYcQquU
   vRYuwztVU54cpeThghxiQxe30QWA5K8OZNIi2W8300sJ6AQXVZZrixYxs
   65O3KvmFoMBGoyiYpqmXWdLw7HNX6X91IJEeoroH2sOc/uG9KRaAl/rFU
   zk5HlT3bGcHULRoKrcpsmjKQFUzxPyAA7yJ+4HxKPBBxJ6uxLSJNzNzGy
   UVzIMal2DGz3E7BQo4og+fIC6rzPYdHNrdXBwUw9fSxARmbBAaO+XVLo2
   hpm7ZIwL1Ez/YMcquZle8GOFWVTz85Lsp2I06tLFNcjADLSb6fCyHEJcb
   g==;
X-CSE-ConnectionGUID: usm4LGUGSlOfLXhPvSflJw==
X-CSE-MsgGUID: o5UPfEixR0u8h+MIRztgVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68271099"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68271099"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 15:41:10 -0800
X-CSE-ConnectionGUID: jloUQWAtQDqKMYUYcLuGhA==
X-CSE-MsgGUID: u7M1WkckQgmbNz6DwBa2Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198537701"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 15:41:10 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXT2x-000000005HA-2FLC;
	Sun, 21 Dec 2025 23:41:07 +0000
Date: Mon, 22 Dec 2025 00:40:56 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for DMA_ENGINE_RAID when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202512220041.zLBzr08M-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_DMA_ENGINE_RAID-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220041.zLBzr08M-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220041.zLBzr08M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220041.zLBzr08M-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
