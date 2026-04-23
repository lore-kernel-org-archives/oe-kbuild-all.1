Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468083E4C9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Apr 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942421; cv=none; b=MRyAo3tzwiS8GeOxwPiM+oPIa2Fsei3hqUTPok6XMY829053x89ZlZypBEMJtvQ8DJgq3EsjL9KJxLm+mBu2M/+a7+G56zgV1OAxSIBhiHbdCxQlTw92WcZ5a3c+5622vtNqrogZiZ2JlRjxHBCe0x4jps6F6C8MMfo4+dCpQdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942421; c=relaxed/simple;
	bh=7vPzcp2wc0F01vC2jvWEDV7rGkuS87DZVOrXQg2YJb0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sSay1WjEtiJ4jwgmM6WWk/FyqYLpYzGKe76SvdzTJSSCIObnTeQYX8JpIYsMmjP6T8mik++ynfm9aDWvvXUmavE0eqQzVbKDuzphprVtEdeqhQrJbulyTB2Tc9lyPsb8NYYv4MyfyLy0GwzMg90QDzunaRxxzqVNFiSauVwVAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pbuyj66L; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pbuyj66L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776942420; x=1808478420;
  h=date:from:to:cc:subject:message-id;
  bh=7vPzcp2wc0F01vC2jvWEDV7rGkuS87DZVOrXQg2YJb0=;
  b=Pbuyj66L7hJoL0JPz4gzDOsR57Ed4mAlA+TmqHw2xHO0B+RF5mZFLyHq
   X9XEa2usCCHhvnTVbb6qb8CDPyuxVIXAASSLKo0loB4xpm4s7WL+1O4QM
   7FjfR2g2RSnk7XhnboFRLhtfnOoQtjdvhBEapx7YZK97XruYhzLmbX1O/
   USj7sTXz4RQ5rmTv7DsAFv1ONe90PKEwNxS2Q8xskYswFHfpD1wTovbTk
   xOGMomvpfbKmnv/2HGVb6pbCXhJnWxJdrHtBs5cv7KzxyittCix2P5s07
   ulUzNTl/dd6Uu/cacH0Qx3uSVCh4XqDpm/K8eqM/ab5z5NwxDQ5CUbtZu
   A==;
X-CSE-ConnectionGUID: KsGNJ8o0Q+Ko8IUK/MoUiQ==
X-CSE-MsgGUID: SgzHQEt0QWOJ9pHuV1cqDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81516512"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="81516512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 04:07:00 -0700
X-CSE-ConnectionGUID: r8FOuN/SRBmUGOG+fwwxCA==
X-CSE-MsgGUID: xWiPjQMuTO+fYlcZ47P5Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="236996713"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Apr 2026 04:06:58 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFrtX-000000002fZ-17dV;
	Thu, 23 Apr 2026 11:06:55 +0000
Date: Thu, 23 Apr 2026 19:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] ERROR: modpost:
 "register_fips140_lib_funcs" [crypto/fips140.ko] undefined!
Message-ID: <202604231934.GPQvygmL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9d923a8ee28fa36f28abf98ae2fdea88b1c13d2b
commit: 672c5aa4f124939029d3c4b462be8b7f85bc03aa [2/2] ANDROID: fips140: move lib override support into kconfig option
config: arm64-randconfig-002-20260423 (https://download.01.org/0day-ci/archive/20260423/202604231934.GPQvygmL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604231934.GPQvygmL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604231934.GPQvygmL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/fips140.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma-buf/heaps/system_heap.o
>> ERROR: modpost: "register_fips140_lib_funcs" [crypto/fips140.ko] undefined!
ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/rt9455_charger.ko] undefined!
ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/isp1704_charger.ko] undefined!
ERROR: modpost: "devm_usb_get_phy_by_phandle" [drivers/power/supply/isp1704_charger.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
