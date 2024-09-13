Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3121D26289
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726271435; cv=none; b=CuPmuc5i4JBzkPEfi+WLzrgmNIN/sLdU2FUvtLncRTOGkOGAO5xd8hSbDrD5gKuiwGGsYCypBXhZrsRq1ANp8RFD6taewh8ZWXZKxhNajNrrperS8NGcYcSTp9UE68h7hoUzEmakDtm+iQcGA4nZRnxhka152RezQXKH4wJZ5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726271435; c=relaxed/simple;
	bh=eU4WxhbrkWFfWrPmGG4XSfluuIRDaKgtcp8kww5WRp8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqDsp3kcvFTS9J0aUdKvTWE+6rj8ZSGO4iHMc3jsEqQXTLKVIJdngcuTivB7RUlv6lgXvTHI+sI8CmYGESw/saqskNLx1JexuTwpwbX5RH6X7JHfP19OCoPrZshefyr/Z+GulNq+uG4c8E45tlKeHPsQlmUk6oi7DPTBZSZ7KXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrpGnHxx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrpGnHxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726271433; x=1757807433;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eU4WxhbrkWFfWrPmGG4XSfluuIRDaKgtcp8kww5WRp8=;
  b=QrpGnHxxET+R1ZRLeISkJHW9SUOe9LEUcvxbiLNV5ZzPXJUwfqXmImVC
   8AkZU/U+nKLVJ5lIAWMEXNLid9svJojuuJbibza4dlETIglLwjqwxp1k3
   +cenFoMmNDJYPvxDX+TksUb0GNDcd62vpK+gXm2bGbGb/mfpyRqBfxL2O
   vMg1qrSn7eeflrB62j69z7TjzVal5XP8qZOX/lIrq55QYj8OhIsG9qLD+
   eZ16+aV7/XbkajNtPvsRcMNUeHcpag+BCVGxqqUCgANULHiNDsZDJjiwJ
   qnvSIMrtl2E7r8ioibGMSh/Uj4cFID/wVkD7sci26paAE3guiCQRNyG2v
   g==;
X-CSE-ConnectionGUID: RSTfV2YuQxieMpNJ5dstOQ==
X-CSE-MsgGUID: Wzgz9TmeSGKAquE4fJPM1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25071649"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25071649"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 16:50:32 -0700
X-CSE-ConnectionGUID: lK4tIU/LS/6DIA2b+OjQow==
X-CSE-MsgGUID: XAapo55eRWiIIzorQqMldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72838028"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 16:50:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spG3Z-00079K-1x
	for oe-kbuild-all@lists.linux.dev;
	Fri, 13 Sep 2024 23:50:29 +0000
Date: Sat, 14 Sep 2024 07:49:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 11239/30000] ld: pda_power.c:undefined
 reference to `usb_put_phy'
Message-ID: <202409140738.mjLmKGHC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 5ea2cc2db6cc28453c07b2305bc74e9379878e27 [11239/30000] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-006-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140738.mjLmKGHC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140738.mjLmKGHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140738.mjLmKGHC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x280): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x619): undefined reference to `usb_get_phy'
>> ld: pda_power.c:(.text+0x812): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
>> wm831x_power.c:(.text+0x9b7): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x898): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: isp1704_charger.c:(.text+0xab0): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
>> twl4030_charger.c:(.text+0x138b): undefined reference to `devm_usb_get_phy_by_node'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xce3): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
