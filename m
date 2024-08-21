Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C3913BAE2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256230; cv=none; b=M0IKr+RBlKmuiojiSLmPzBcQjSyuLYh6MC2vIxsoz2nzC3giMN3sVneKxGsvN33JaREtXx5KekFSs42B8SajNLAJNawZ0RGJ5fqjWsuGdxBz9znSH+X2rHWM3gNqewju1zYr4q5+cLw8UHwJL0eZuty4jO0RTbGdzLBzXD5Pw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256230; c=relaxed/simple;
	bh=RhSkP9VfZgaRm08TPqBrThNKvhnm+vlb6C5pIaL+7ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D6ZofMsdwag0J1mBA98WFjuF3sj4HHYHaK0C1I6PHG0mJM71HS7KtcKs3nMcg+4lW/jzWi3Pe+8gt+PA/h5dTcrcSGKKLUHVI8OJV6UBP7Kxvtf1Q9EzSXfNxod9Nf6HJvFHwb4QV4ZIQB+BUsL+u6NHnbtXenHPWM0/VFO6d08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OA25YOsN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OA25YOsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724256229; x=1755792229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RhSkP9VfZgaRm08TPqBrThNKvhnm+vlb6C5pIaL+7ZI=;
  b=OA25YOsN2sfMf0w3x5IEP38sfJ0y5PNp/xr/LnbwiTzCA5vbGsiiXZKk
   8YtH2+rPtpgk6UvlAgkrufSDYCe73BXC8BBmZ7FeJWT6yDV5WHx5aq2el
   HLMIOMUFPSRKYysBcXnD3Zw82qGNuTVaHj2u8uqPqNBOwkugM3erPsPWP
   7vvHJG2S3j8EY2yvnTRKXc+JsBn+ChkiK8ogiYbZopXIv19Y6c7w4UIL2
   gGWDX6Du2I733Y+scO8y7nY3Vg4SfjAPLdkAFjsSTCMD9vLU1p6LqmSSM
   XC/f6z/o/P2nwrxZ8LF1aTYiqlnISbZbNMa4Nmg1156G7jBq5DdLQ0z0m
   Q==;
X-CSE-ConnectionGUID: 9uUz55mWST+XuNcSuVAWuA==
X-CSE-MsgGUID: h0T7XoHlR0GOMy+tqxkzxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22760816"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22760816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 09:02:44 -0700
X-CSE-ConnectionGUID: N3zC9Du5TdSm02rUw129/Q==
X-CSE-MsgGUID: zM2UeZOjRDWG5bF+KUavOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65341993"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2024 09:02:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgnnD-000Bf0-3A;
	Wed, 21 Aug 2024 16:02:39 +0000
Date: Thu, 22 Aug 2024 00:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 938/5360]
 da9150-charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202408212352.Y2feX32o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandeep,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   bd36ac357371d8a67aabf4f5e2da611e5fa52e80
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [938/5360] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: arm64-randconfig-r121-20240821 (https://download.01.org/0day-ci/archive/20240821/202408212352.Y2feX32o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240821/202408212352.Y2feX32o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408212352.Y2feX32o-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0xce4): undefined reference to `devm_usb_get_phy_by_phandle'
   wm831x_power.c:(.text+0xce4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy_by_phandle'
   aarch64-linux-ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
>> da9150-charger.c:(.text+0x80c): undefined reference to `devm_usb_get_phy'
   da9150-charger.c:(.text+0x80c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1c64): undefined reference to `devm_usb_get_phy'
   rt9455_charger.c:(.text+0x1c64): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xe38): undefined reference to `devm_usb_get_phy'
   bq25890_charger.c:(.text+0xe38): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
