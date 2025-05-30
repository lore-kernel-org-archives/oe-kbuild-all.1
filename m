Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A4120326
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609286; cv=none; b=RNygYJl1z8/6BgH/6sohU8mDxSDqarRUK0s/7B16RGzbC2bbqoRLmyA94EJpD9fxBXf1KhctqlqkO8I3k2DQg9Jro396DeD9Bui47nYc8Xx8jQ/mezPVVeeaT5XrqJtPJsgNHirsm6CuCT9koHTYOu7ZRrjdAPsPVgDyD2/Ozhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609286; c=relaxed/simple;
	bh=gKg7cUgO0axjahw3c+7odDeUiwAbazcH0PJN8PZIzKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMZBCF/EVm6vXrMFwkPQKMXOQQrv/wipuiZsRNqkcNnAqk34lqqVbBpwpGOVMgO0VTTbYM/MOvtUtV7q+GdGqW0LbGsrcqc3CF12vGkfPD7JsCzP0SGo2KweQoxjHnT2YVOS1zFjcJAKufa4vd3coEQHdP3d1tuAkb8whluWzyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8Pn64oG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8Pn64oG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748609285; x=1780145285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKg7cUgO0axjahw3c+7odDeUiwAbazcH0PJN8PZIzKk=;
  b=X8Pn64oGWZMc03Ur6hwNYkUaWgFbs6TKL9z78YkCF4unstQnx9481M0l
   t5HiQL31TBEEQMYMLZnZMGCoF+AxYGw1Tl4YP3kRh6hzfJR/evMN6WLod
   tIE2oDaW5T/aAr/NiLWspGbNYpG/sy5pTHJSc0il8VXf1Q6T7kfpbMcKD
   3eUsi+62JZLu33JvwVh4rXJeu33pkjx4ym8QU5+axnI/VGVl2QIq0bPcV
   VVyBA+pyrmompN/lelClddByNDRQP6TnvxnPuFBu7mRofnXtjDYFM1CQM
   d5Qbc+DdUVwTTojBaIHqxunhya76JxcYbm6HJ88euqsO9Gwt2CSptHk8M
   Q==;
X-CSE-ConnectionGUID: FzrNz1nNRo+NkqdoEfZsdw==
X-CSE-MsgGUID: +S35nyAFRl+I0sIB6iKHlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68124654"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="68124654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 05:48:05 -0700
X-CSE-ConnectionGUID: faMQK0Y8QXaidQBWIi7nMg==
X-CSE-MsgGUID: K4KPM+IIRS2Z0q5UirypeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="143832874"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2025 05:48:04 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKz9U-0000tW-2g;
	Fri, 30 May 2025 12:48:00 +0000
Date: Fri, 30 May 2025 20:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-05 1/1] ld.lld: error: undefined
 symbol: phy_ethtool_ksettings_set
Message-ID: <202505302036.UCNYusE4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-05
head:   b97c62c4e7d1e80fb6a2cb0cb381f03bbcd26a4e
commit: 79f44ef795b53207d9b368728a66c45259bb159a [1/1] ANDROID: GKI: Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
config: x86_64-buildonly-randconfig-2004-20250503 (https://download.01.org/0day-ci/archive/20250530/202505302036.UCNYusE4-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302036.UCNYusE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505302036.UCNYusE4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_ethtool_ksettings_set
   >>> referenced by phylink.c
   >>>               net/phy/phylink.o:(phylink_ethtool_ksettings_set) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: phy_restart_aneg
   >>> referenced by phylink.c
   >>>               net/phy/phylink.o:(phylink_ethtool_nway_reset) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: linkmode_set_pause
   >>> referenced by phylink.c
   >>>               net/phy/phylink.o:(phylink_ethtool_set_pauseparam) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: phy_set_asym_pause
   >>> referenced by phylink.c
   >>>               net/phy/phylink.o:(phylink_ethtool_set_pauseparam) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
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
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
