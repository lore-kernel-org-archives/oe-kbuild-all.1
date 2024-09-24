Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC11EAD7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727147159; cv=none; b=MxK0S271qOk0ZZf7vFojwYv6x7bwEZ/HHWUoW+2Wd33ABo2wo1bL3B/6E+UH6baFw1Y3FkkBcTqouB7kSEllduu0RBuaeel0KyigjlDkJZo61i8Q7g9lWWv+7aBBpmXm3WH8sjwxOG337kcSudKSfAlFRgO2yl9eQ6O977bdiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727147159; c=relaxed/simple;
	bh=sx8gd2xd9G5vsbSQhwa6sSmp2NuAgCQpHWcqJ6upiyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKZc9Batef0Ah1LVGA3iUFeTLgTtpN0jMvxCC4+IxcYX5ZoHrmffQi3vhpMx78vjjhpvGcp+JZAF24Piw6TUMg8Zmy6BlZUy5wq6U0gpZ462usKt8TSGXZ0bmXC5tKOYcDf3RRdkjeVZ/lLEutmhe/HxVlNUZwWthkd4jKGlVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2NDtdXL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2NDtdXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727147158; x=1758683158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sx8gd2xd9G5vsbSQhwa6sSmp2NuAgCQpHWcqJ6upiyI=;
  b=b2NDtdXLLe9nd2/38gH/OHBImNIJzxQKJCYxxHjnl0WHgN/KJcjVtnBD
   O8Tt2FGKtsn1QQxp5ROumPRnByTIe+lLbcjO4ZoSZHUFDqVIAbzrFK1Ed
   vr8hyrWmr3h2gN6bIzaptcbF3Xo+7FSTe8TCniAIfoiLl2dkGmi1awaYz
   B/QbBnw3YEugxb2Tbud8Jblpz/Mod9LrQRYrYkBoO2MyP9FyFt4RMCBjB
   GOD7+BoZ2eRm4VIzhR/dA1zKhrRRgD+j/HK1fo1//B96EolvXD8Y7znmV
   JEgC1FxxZHpxXr4jybiN03PfAtfZ+2+0yYpbB68S9EKm3+6hujvfA6Xgm
   w==;
X-CSE-ConnectionGUID: 7soW6wX8Q/yfgmEpNpjT3g==
X-CSE-MsgGUID: crosMSqYReKgMARb7BoPPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25987587"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="25987587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 20:05:57 -0700
X-CSE-ConnectionGUID: yxT0wPpET4amn4oEcGFciA==
X-CSE-MsgGUID: fL7zndHMSv2E9DvVJZwzDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="75663859"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2024 20:05:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvsA-000Hqe-0L;
	Tue, 24 Sep 2024 03:05:54 +0000
Date: Tue, 24 Sep 2024 11:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/5] ERROR: modpost:
 "devm_usb_get_phy" [drivers/power/supply/bq25890_charger.ko] undefined!
Message-ID: <202409241144.15Rp5Uu5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   7f51114c2879c4730ce6b1a58b261e06ca22b1f7
commit: 558762106d6e6e046ab9af372b9cadf4222893d7 [2/5] Merge 8afc66e8d43b ("Merge tag 'kbuild-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm64-randconfig-002-20240924 (https://download.01.org/0day-ci/archive/20240924/202409241144.15Rp5Uu5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241144.15Rp5Uu5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241144.15Rp5Uu5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/bq25890_charger.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
