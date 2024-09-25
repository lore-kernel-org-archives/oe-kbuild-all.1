Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047E77E574
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253375; cv=none; b=CpR/KgCcx7AjpGaV9vl+x86A9prK3nMIsEYC08AxpZk1R9qlUKbAoLv+eDgTs4Zsy5ecojkWlTgcu+STBhOqPcNlA5W3QNROoqUsU+RNtRpKs47LVFcZSjixFaH7RDTWDA7XJnYDo2yAxz1/0AHJdvq5TZzUF51ufxeJFiuf3KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253375; c=relaxed/simple;
	bh=9/YFdWEfv00VlbYDB2Y6uDzdhY27njym0pr3EUL5Lko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uywfwWuqORSvgPHKnfmKj5Q2TNm3ZQqyEzLxkH/SwpqEo1DfSZyFxPgmJl0IIC8ARHTRtHVs3aob4C6j3snK5Oa3ICeMDYNNn8zcQ+beNJBqVpFMMcKDmE99/MwXe5cPrNy86YEkeMoGIQqqjuLr2k2WN5z4ny8Yu1RrSasj6/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avB88WC2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avB88WC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727253373; x=1758789373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/YFdWEfv00VlbYDB2Y6uDzdhY27njym0pr3EUL5Lko=;
  b=avB88WC2bn8C4engjTEoey5atTiGp65lh/fNOnilnDy+CqH0cMBQHTQ4
   OP1+mGILr+lsKR9yjV21f2n85J3b0DIkU1qyagXCPqtTIhQBzdMqAH0qA
   Tnr/IsXCsTwrKHZg14ff7RbPu79iv/VYI9c1Mc9Ixnd/dklb6vDcmLE/h
   +JdsYSN2+5Xy5duSve2bhzdQ+4wEQWkpcU3cYDbsJrqBcfGcr6TpUgKnX
   L4G1gBNt0pyXnrZ1xNCvd+eYiQMy8/NwFpzKns1Zb1n9EBOmNIUztx5uj
   qld5aBkszZixou+CkB/5duH3UxEWwD5y+syApn7MNpQ5qLd3/M7iVs+bb
   w==;
X-CSE-ConnectionGUID: cZAUlZj8QNefFECpdYdQMA==
X-CSE-MsgGUID: f3HCftJYS9u++NmCLyj89g==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26440102"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26440102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 01:36:12 -0700
X-CSE-ConnectionGUID: k7C1meW/TDmic4kQw/toEg==
X-CSE-MsgGUID: Twn/f0MfS/aHUvymObD1dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71846618"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2024 01:36:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stNVI-000JN3-0U;
	Wed, 25 Sep 2024 08:36:08 +0000
Date: Wed, 25 Sep 2024 16:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 15922/30000] ld.lld: error: undefined
 symbol: __dynamic_netdev_dbg
Message-ID: <202409251646.3y9u724r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   3f3f8db26edc00f7bad9ceaa99d50d2325c42f3b
commit: 25483dc0e6ef060f2be67c531ce2e48e710e7597 [15922/30000] UPSTREAM: kasan: improve stack frame info in reports
config: x86_64-buildonly-randconfig-006-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251646.3y9u724r-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251646.3y9u724r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251646.3y9u724r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __dynamic_netdev_dbg
   >>> referenced by phylink.c
   >>>               net/phy/phylink.o:(phylink_bringup_phy) in archive drivers/built-in.a
   >>> referenced by phylink.c
   >>>               net/phy/phylink.o:(phylink_mac_change) in archive drivers/built-in.a
   >>> referenced by phylink.c
   >>>               net/phy/phylink.o:(phylink_major_config) in archive drivers/built-in.a
   >>> referenced 3 more times

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
