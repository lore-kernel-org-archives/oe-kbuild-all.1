Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843854774
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 03:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774151442; cv=none; b=MfkMdNNuSyZwfpzDe9a+gvZT+ZDQnsZWvLRzSSDgdc+LZBtwOY5ggvUXHo68RROMnSgst3eHlJQDYIoMn5Mc+bvinRQejz8mGcOe6w1NReGTeuOCFCgrHKUANZmj25rhFjrigE/McgBhdZYk+u3QYHtRAA4rWudQVeyzXyxbu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774151442; c=relaxed/simple;
	bh=o9QAvp7UPIoug/l7DJXIC29rOjSHRMH2VSDrSDOFdhs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cY8cRiEGQV+3j3F5jU7xjpAJXHp9UgT/GyyJzO8iU18gIAzeBsh2d7dQBLz439MJi2GsJnLMk4zIxaqp0QQzzaeKxygX47YN+Z2uP6Xz9OVfZQKwmgu/rIkzKOsMoSadVabUW8/sol1SKEuoV7g0nAVLlbbSHfvtRrkIuNUBmUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiSGjQmj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiSGjQmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774151437; x=1805687437;
  h=date:from:to:cc:subject:message-id;
  bh=o9QAvp7UPIoug/l7DJXIC29rOjSHRMH2VSDrSDOFdhs=;
  b=EiSGjQmjg+pzo/V8+qVe6Ejzv74OfsOxidZiRTlkexWUQ7sgRQY3nKJP
   Y/OBF/2uMRW0hWGGlwppP5N5VvI0c1xKkWsS2YuRH+szucGer5rjZp5EK
   WJafPJNRiQdH1Z9vqF18jPNxAjh5/3VrkugMZdWkeDSopknQrizLvgp8j
   qfiQQDqHuV6Yo4fs/gCQWLKpHWK7ccBzCeX+S8+i/SjZi51HvuLPHdlfy
   /y8jduo8hb4CGdEMM4Khp3HC+k9/6uaj7CVgUIpJytcZ+YuGLS0iRFw9D
   YNvMKaegwUT2//6qQPR2mE86c0flXPP7Yl4TTHEvN7CAkMtDWMVRSBmL1
   g==;
X-CSE-ConnectionGUID: HkAhubXGQ16aOtNlPvbtTg==
X-CSE-MsgGUID: awhr8ejfTuaov91bPbHQhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75159118"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75159118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 20:50:37 -0700
X-CSE-ConnectionGUID: lOmzPHZRTb6/8DyIHxMH8A==
X-CSE-MsgGUID: cAVfX+AKTMyUzZv9UKi63g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="220501343"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2026 20:50:35 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w49pb-000000001bZ-2SsO;
	Sun, 22 Mar 2026 03:50:29 +0000
Date: Sun, 22 Mar 2026 11:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-01 2/2]
 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: warning: no previous
 prototype for 'pl011_hyp_init'
Message-ID: <202603221107.bP41VkHE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   c73b72d5fd8c180443d48a3fb0f8f5dc01b5d782
commit: 069b706b122edd75104eae172b165047a1900935 [2/2] ANDROID: drivers: misc: Add an example pl011 driver for pKVM
config: arm64-randconfig-003-20260321 (https://download.01.org/0day-ci/archive/20260322/202603221107.bP41VkHE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221107.bP41VkHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221107.bP41VkHE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: warning: no previous prototype for 'pl011_hyp_init' [-Wmissing-prototypes]
      38 | int pl011_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/pl011_hyp_init +38 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c

    37	
  > 38	int pl011_hyp_init(const struct pkvm_module_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
