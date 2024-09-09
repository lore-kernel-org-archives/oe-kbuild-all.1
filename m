Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9DEC5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 00:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725841333; cv=none; b=nFIbyoCnL5221VQTD69Mzbpd3HqX9IdrPzvqdq+joRn6qEIgMapbqvMUNoBVEKSqRWW6sWV4iePLP+2To3IW7XtlUYz5LvDKjoi8ktBQiYsbP+NyO2pCAzKsM53xDTLs+RygmpZRB4r1+EUJnr7CpF5cGzKveY7xT+S29LbdQSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725841333; c=relaxed/simple;
	bh=hDzWvogxfi/HEHUrDe4EKSR5WlZBI7h2JAyItRAQm9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vm+QUPJDLGfJ8csEX9ANyjpY0p1YezoxO63QzBIAsKjLbfQ4zHzMOXlSELpPXuoGLJ9sXhlRfMJi58vT2glWXXIjSIJFTKVny0+p8Gw+IyaNNTLYle8pGaBUKNRcErq0SCtoIW0R3TNgkFtqOqVQJzda+KkpPADVghjNfW9aA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmfTiSJm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmfTiSJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725841330; x=1757377330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hDzWvogxfi/HEHUrDe4EKSR5WlZBI7h2JAyItRAQm9M=;
  b=CmfTiSJm8ernopgD/YQZMi1i0MYBxj2rf3NOY1OTK0Tss8/CikW3Jg3l
   MN2lI6rhOwgmhBUGYhhX5ysFhpEfUVASGwAOmZtHQTRO+4ywm9wuYjFnz
   lMLFBVjRcOW3PTV8i1YN10uefCWjZeshVUziKepAJ3LII9UdnMOn3YYcP
   rV2sBln6CCY1eQ04hBPm+vDhbT05bBEkyRM4xmwkfCR+Q1O7ItbIlD7ec
   H+qnB3KuDz7WHlEXSrSd/KQy5DyPv/RXzg3wUQ0kibunOVTTRPuWyFnZw
   ena/KULagwIzqsxNt72wnexmRfvG1q7wRc7nPrBjpfzh+8Q/5k/KHOCgf
   A==;
X-CSE-ConnectionGUID: HryGuFmHQpKmpsD1n8cZ/A==
X-CSE-MsgGUID: Gd7OXpAXTre1JEFEpA3dVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24066448"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24066448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 17:22:09 -0700
X-CSE-ConnectionGUID: 5vI5ADQfRA2kPQKWw98J5w==
X-CSE-MsgGUID: Qz8jmt0KQOG84WhmH/CsjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66488258"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 17:22:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snSAQ-000E6m-2H;
	Mon, 09 Sep 2024 00:22:06 +0000
Date: Mon, 9 Sep 2024 08:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 2589/30000] ld:
 isp1704_charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202409090859.rIB7V1sX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   729ca65c840bac7a36eda19c62d1d5d6df554f5d
commit: f7941b37ab1c4cc0a85a5617d32495908c3d08a2 [2589/30000] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-004-20240909 (https://download.01.org/0day-ci/archive/20240909/202409090859.rIB7V1sX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090859.rIB7V1sX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090859.rIB7V1sX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x6e4): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x712): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x86d): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x925): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0xa02): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0xa1b): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0xa42): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0xa8e): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0xc04): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xc95): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0xd1a): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0xe67): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0xea5): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0xf45): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xf89): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x14a9): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0x14c2): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x158d): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x16ed): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0x1776): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x1782): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x1791): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x179c): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x17a7): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:hvc_console.c:(.text+0x17b2): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x17dc): undefined reference to `tty_set_operations'
   ld: hvc_console.c:(.text+0x181c): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x18e2): undefined reference to `tty_port_init'
   ld: hvc_console.c:(.text+0x1ae2): undefined reference to `put_tty_driver'
   ld: hvc_console.c:(.text+0x1b0c): undefined reference to `put_tty_driver'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x1b2f): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x1b94): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x1ba1): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x62e): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0xb03): undefined reference to `tty_wait_until_sent'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x3c2): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x7ca): undefined reference to `usb_get_phy'
   ld: pda_power.c:(.text+0xa87): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0xd73): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1cca): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x28d): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: isp1704_charger.c:(.text+0x55a): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0x16b7): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
>> sc2731_charger.c:(.text+0x9a7): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: sc2731_charger.c:(.text+0xa36): undefined reference to `usb_phy_get_charger_current'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
