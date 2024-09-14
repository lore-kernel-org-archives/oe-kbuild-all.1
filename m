Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E46175B1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726298272; cv=none; b=Zp6P/QFRTKwfxA5iRnKQPIkfmy7hP9wbl0jc0orY8xvhUaOYsjrJZuAbs/6ZZCeY9z/VkkgPInMzL6ZT3tcMevYx05rcxLuvkQIKKGKOHc3txb+bessuW8a7TskMvEg+dP0zSvRu/hlUtYtsjKH8x/+d8hbdsbHLSN8v2hwqr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726298272; c=relaxed/simple;
	bh=0ya9ZVl4viboR8s7R8MzSZrFshOPJJ47C26TxbbZhyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b1a6WbjdkS0jCvnu+yvTitTOZiTsjbTTWuZTozAj0GXI0aWqOpfXowWqLbTk703pgjvetz5UKJrZeZtfvx/nAIBxrxTmUgOaAEMMALeb/a2uskCztd3VShVC29+gBjwTGjKAUwqaQb6x66mN81LiywUgwd9pcbwOqnWdIY1jE/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LICKQlEL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LICKQlEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726298270; x=1757834270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ya9ZVl4viboR8s7R8MzSZrFshOPJJ47C26TxbbZhyI=;
  b=LICKQlELjFI6OKocWZnqWI/v5Gpt80qzYIxJW8fmTD9o8uLiEFEXzNPp
   lx8xum0H9taFfHnNX793vwQ1HRyaPAYICPOKvOgR/V0nwx7d3lpCg8V0c
   28cxPJ2S8/7PF/QOZ74Wq2kiyJogZTIFgv36P1C/PWyEfEWczobyxq3wy
   eh1io2hOJauhVM28h+74d1nvfapv6Uo+m+YaMuxY+ST5GCr20+mNH7L3A
   cZ4a4yEDF+hVUPVF1CBv6e8x13zA80hPJYk2HU/QEFn6hIxUFTPWM508Z
   IWH2Hat4xG/TSVR9edq2R8P6lpDENDP0mUqCoZ81zzGIKepONwEWSGF6R
   A==;
X-CSE-ConnectionGUID: Gt6I1fqPQbuGNxlecWnISw==
X-CSE-MsgGUID: zztnza4NTyqJahQXrtcDFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35779636"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35779636"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 00:17:49 -0700
X-CSE-ConnectionGUID: lTSG9hzxQOypD1MAMq1DJQ==
X-CSE-MsgGUID: j9oli31rQ7GiYSFBH10SYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="99012395"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 00:17:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spN2P-0007UM-20;
	Sat, 14 Sep 2024 07:17:45 +0000
Date: Sat, 14 Sep 2024 15:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 2584/30000] pda_power.c:undefined
 reference to `usb_put_phy'
Message-ID: <202409141502.rcjF7nkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   c8a568fb88e9a968e38609f91b0d3d1172551054
commit: f7941b37ab1c4cc0a85a5617d32495908c3d08a2 [2584/30000] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-006-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141502.rcjF7nkU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141502.rcjF7nkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141502.rcjF7nkU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x280): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x5cf): undefined reference to `usb_get_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe.cold':
>> pda_power.c:(.text.unlikely+0xb0): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0x8ac): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x160): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: isp1704_charger.c:(.text+0x3da): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
>> twl4030_charger.c:(.text+0x12fb): undefined reference to `devm_usb_get_phy_by_node'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xd28): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0x633): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: sc2731_charger.c:(.text+0x68e): undefined reference to `usb_phy_get_charger_current'

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
