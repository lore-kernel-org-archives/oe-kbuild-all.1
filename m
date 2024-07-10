Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE28915A862
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720652514; cv=none; b=Jh1cDKGAd9LATuuQ9mwyHRH9auAXnteM7UJZJXcuXDMrBTVJLoYZ1uilTkXWR4KUwR7kWR/TowK0C3Q/FLl3s91G6w8G+b6z3QOSUpBtjsXtqY7pyfIQuJup8M2bkAFuCIH8/3KaTTdzQxJxlWm4hC0FiLp7fX/BGHE9Hq59dks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720652514; c=relaxed/simple;
	bh=Gq36eyDyVFrfuQ37Vfl5pkrTv44cJVD2eMCOmq4pRFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cE/PZYaaQ491iHZE9V6tqn/KnqZrsM2yKcQhOyRHXH/oCFPF+V67cbYnPeu5gLsZv2YA17JM4AGXEHa2HiGKfY02/E9Av5a1ZcLNxMB9cbwKZY574n5aPguafoQqydQxw5Vk0vGaS+pTPBknaDLHdeVlzsSUk5QLObJ9hoxHTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akPQ/qhm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akPQ/qhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720652511; x=1752188511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gq36eyDyVFrfuQ37Vfl5pkrTv44cJVD2eMCOmq4pRFY=;
  b=akPQ/qhmsqceqydgtBZlD+T14//YGsvmO04phrVAen/TPf2mXodWBXYp
   /pCm1Plab+AUhPTjiwLzuAMDbBy6B2MGFGY68QV5Ux2R38hS9hKWd8d2O
   BHbXFZsiy1FfG2PbBBTxawYM9ngCDqg+FsfDD407D56Zl3brjRAbAUPkP
   22EY/rEQODWXWXnKCsWcluQlHXona59qO6acFg0B4Mq3fQowTlQYVJ2LA
   ooACwr7huWJCx2MhaVVh364fdV1j007rQiOq999N3mhbPj+lNRUTWv7Q5
   0Uek1mIX8fD6Z8Z/OzgnJDEVI0+Z3AUGq4pzR2uDfBEqafJcd0PQohqAY
   Q==;
X-CSE-ConnectionGUID: m2nrbVgUSBSKU2TjC0Xhag==
X-CSE-MsgGUID: RShzhjFpQZ2c4+suBFkg+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21825760"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="21825760"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 16:01:51 -0700
X-CSE-ConnectionGUID: h7GaISHJQVuDzmuGImMHtw==
X-CSE-MsgGUID: bRWacMvNTcmJStaD88R7DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53312032"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jul 2024 16:01:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRgJo-000YPG-0N;
	Wed, 10 Jul 2024 23:01:48 +0000
Date: Thu, 11 Jul 2024 07:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 938/28418] da9150-charger.c:undefined
 reference to `devm_usb_get_phy'
Message-ID: <202407110609.5S1RijEJ-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   2b49e96b31aab859640caa916af2a16cf41f27b4
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [938/28418] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: i386-buildonly-randconfig-002-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110609.5S1RijEJ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110609.5S1RijEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407110609.5S1RijEJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x34a): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x3a7): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x3d8): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x4ce): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x565): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x608): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x619): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x644): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x69c): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x6ec): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_init':
   hvc_console.c:(.text+0x712): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0x751): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x770): undefined reference to `tty_set_operations'
   ld: hvc_console.c:(.text+0x7b3): undefined reference to `tty_register_driver'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x83c): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x888): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0x8d1): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0x982): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0xa44): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xa96): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0xae9): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xf6c): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xf8b): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x1081): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x1173): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x12e8): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x132b): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x1336): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_init.cold':
   hvc_console.c:(.text.unlikely+0x48): undefined reference to `put_tty_driver'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x1e3): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x4b9): undefined reference to `usb_get_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe.cold':
   pda_power.c:(.text.unlikely+0x9c): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0x940): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
>> da9150-charger.c:(.text+0x675): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x13be): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x154): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: isp1704_charger.c:(.text+0x388): undefined reference to `devm_usb_get_phy'
   ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0x16): undefined reference to `input_free_device'
   ld: jack.c:(.text+0x31): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0xce): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0xe3): undefined reference to `input_register_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_free':
   jack.c:(.text+0x28f): undefined reference to `input_free_device'
   ld: jack.c:(.text+0x2c1): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_new':
   jack.c:(.text+0x3a8): undefined reference to `input_allocate_device'
   ld: jack.c:(.text+0x3fa): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0x48c): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x5c7): undefined reference to `input_event'
   ld: jack.c:(.text+0x62a): undefined reference to `input_event'
   ld: jack.c:(.text+0x648): undefined reference to `input_event'
   ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0xb10): undefined reference to `wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.ref.text+0x27): undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.init.text+0xa7): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
