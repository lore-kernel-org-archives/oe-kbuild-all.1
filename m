Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEF222540A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740597515; cv=none; b=kRY5rhdOjkEjtb7MUjL/dSbybsXC/MVZXRntMirr/V44hAyKczwFn+DtukqvyG/uAwtawwl9kGJB/q13JEI9LBj7r9i8eoFx0M8geajqT6t+1KIIhg6dmX5FuO1wKQ9TJPuJDr9G5lSwYl+kIzzfEaq9FbwTCdOoYoOll7HVn7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740597515; c=relaxed/simple;
	bh=1rGNvRlWVGHuKDA/jU+oygaj2DG0vZSOcZNy61B4H5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDq41cyJPSQg+xBz9Pl868WDbedomK8uIRJirXLdbj6e01g4iKaNNhh+YoEISYNwIlOrngNsdw4QQ7kOx0G+ZwwjoeQYrNG6kkXxnBTiCyR9NR3z10gCZAOJ0ms7oqb5vCjl0GCDLiGvXVVzecWlY5o8bc+uEVoSBWdZvkkU580=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEfk0uP5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEfk0uP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740597514; x=1772133514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rGNvRlWVGHuKDA/jU+oygaj2DG0vZSOcZNy61B4H5g=;
  b=LEfk0uP5cn69IfyN0Lyo9AwAmn4EMwauj7WNXSSVKTafyWlaSW2eQgmO
   viWInu/2p2NHQsxSENZiLioF5yLc4+qdSfZgjVDYjHQC+T4QF2340mHSF
   bPvxifQxwgK3+GKtN6/ob57aajTA9qstRDHm3wcQJNJEpuKrErCTFU8TS
   3+JRAR1V9xu8H4/HYXcxUqwvggT5DjGlDMOruec+ge7q6sugwTqcvsOF5
   jG9cqHuUP/19sq4N7gCcGiByjejwbMjgszA54cU6DR6+uzcKZbYxThGdU
   eliIxrpPpnAg/I89Qf0JgK/Q/Fq15nMsCxjTFWQxU1ACVCxZsB6askUyE
   w==;
X-CSE-ConnectionGUID: VvAQXQbLTsSoMkwI8YvISg==
X-CSE-MsgGUID: q1K9Br4oRcKtiBCf2ub29w==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52453401"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="52453401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 11:18:33 -0800
X-CSE-ConnectionGUID: 2BFfB1unTyaSmMdzERY+IA==
X-CSE-MsgGUID: iDqROpNtSiG9FKJ6oq69MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="121739702"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2025 11:18:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnMvN-000CI3-2e;
	Wed, 26 Feb 2025 19:18:29 +0000
Date: Thu, 27 Feb 2025 03:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] kismet: WARNING: unmet direct
 dependencies detected for DMA_ENGINE_RAID when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202502270300.7ydqCOIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f3bf53034dc763062b5163cf6ffff93d4be3dd27
commit: 89542310160d3b0ff963cc8fd23186d5acd231df [2/2] ANDROID: dma: Select CONFIG_DMA_ENGINE_RAID in Kconfig.gki
config: x86_64-kismet-CONFIG_DMA_ENGINE_RAID-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250227/202502270300.7ydqCOIR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250227/202502270300.7ydqCOIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270300.7ydqCOIR-lkp@intel.com/

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
   
   WARNING: unmet direct dependencies detected for PHYLINK
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_CORE
     Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_SPY
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PROC
     Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PRIV
     Depends on [n]: NET [=y] && WIRELESS [=n]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
