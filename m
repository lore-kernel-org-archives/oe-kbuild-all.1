Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8373CA6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 00:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749948837; cv=none; b=aK7WQXYOVTnotGSRjiIdlZ/sQ+LUlu1XztIRdcjO8FZEruyCUAIqYai+39EbOsaXIxrXs6WJAC3MqGLANuIGetqx0bfGvMexWy/x+2tuYfP+G1+Fxjz1eK+jEolGZkwrKs3/1SMRA+qTYlaxu9ZJ9OFCgsEt0S0s/zJQRJps3Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749948837; c=relaxed/simple;
	bh=V4H6OYuSAyT4eDVMem/6jmsHrIPlE0iJq5KFAPoEPIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jrZH3u5jx/6ndvpqrspm4CoBkQJSYUm+Wzo2rXjee2y9GIOghMySvVe/wnorL7xqG/dju3X6RegNk1dFSYWjZbehHDsEgC2w6/1EKSLmor3tfVZyK8F/1hptD6uVtc83paQw07NojzgWMKkHGmTA0kmA65mI2/vwoGHK4pXL27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUfjepKp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUfjepKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749948835; x=1781484835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4H6OYuSAyT4eDVMem/6jmsHrIPlE0iJq5KFAPoEPIw=;
  b=SUfjepKpeWS8e6HjhxdGtSp2czbBS/ude4wykjYbA4C6A2GEo0VZ4+vC
   tv376NR6NgPw01ILf8qkIUmUHvkYB/ZCRXGYu3kGvIr2O34AtmgtBMF/9
   EuBlakkYK8xGndv/olDHfWZxkiiPf88ihdwqWRGfGX06LROFgL7Ej4Db4
   kl85hyfxGGdMkw2pZOGoF85o55BVyeFflSSgNev2l/gCDbF22ERG9aOLx
   7VQntUMlLHR0Ev3j6fQnK0Euil92rsI/b5b4GrsZWcs3isWPZ99cGJ5xZ
   ifx09CCVDw+7S8QLQ0P43XLLeSjMlkC/jIg8/gmDGT5lY9y1wq1D+XIiD
   A==;
X-CSE-ConnectionGUID: rsMl/YipREK4QlUmoBZmrQ==
X-CSE-MsgGUID: ROuwhZvqTdS2nWfTjD3XBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="74660543"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="74660543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 17:53:55 -0700
X-CSE-ConnectionGUID: K7rUBQrPQYOEDdLpAvPuyg==
X-CSE-MsgGUID: Ps9gqBDZTjKaswWFjCkV1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148007668"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2025 17:53:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQbd9-000E0W-2a;
	Sun, 15 Jun 2025 00:53:51 +0000
Date: Sun, 15 Jun 2025 08:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] kismet: WARNING: unmet direct
 dependencies detected for DMA_ENGINE_RAID when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202506150833.oXIGFBGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   75547173ff9c2ebe5002749b07c5a1e45c87eb24
commit: 89542310160d3b0ff963cc8fd23186d5acd231df [3/3] ANDROID: dma: Select CONFIG_DMA_ENGINE_RAID in Kconfig.gki
config: x86_64-kismet-CONFIG_DMA_ENGINE_RAID-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250615/202506150833.oXIGFBGc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250615/202506150833.oXIGFBGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150833.oXIGFBGc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for WEXT_PROC
     Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
     Selected by [y]:
     - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
