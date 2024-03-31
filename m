Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B3D3399B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711897354; cv=none; b=J9E3kJHfMJX1SpPhd3uCU160YA2fvUkGbxyWarTRrrVf68pOpZESSijelqhYF4czpz5XuMZB0yNGRc4pWMQdoV77MYCc78lyudvMrgWaMPErddxwyPpAAYsBwAyyd39eaFpTeXrA8o6DfNJ9vkfKU24uDBSE8QPA8RxeHtArPHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711897354; c=relaxed/simple;
	bh=tC+TkKo5fyK4aa8flLVfFfG7cbnkYDgfHgixm2u2fXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZtwZY9eA36Drn+zN4Au1x1vdVHOJ49LsPygjHzhQKnsDPZJjq/It1awjAwTST81l/de+O8/an1kIU5oNtitUOBCZ5+ujp3h/uxFvHS1YcESwYEDkx8Umbl1WDmwbGcTNhgfaC7vS+UvdCK2P6Jacjnjpf1tVUAgR38nySz8k3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8cgwXPn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8cgwXPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711897353; x=1743433353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tC+TkKo5fyK4aa8flLVfFfG7cbnkYDgfHgixm2u2fXk=;
  b=C8cgwXPnjnTlY0sD4jxywk0sfZH8NJU3x/DT/Vx+rurAIQ3xd5DJEMqD
   VzCbGn20GxscgTDsd3iqng0wbM3wCabfssw8z0hhElPxD8FsUmjMGhhgs
   fUfopKS7pcMhx0IeoG+a+Vjv6qiJbOCqgoYrjYFZ8murmqE3Gf40rWZIM
   jhRy4k+6B7v5umIyHEw+qhbUMi9hQNEuQPHyzIKYkLj1Iu8ExN80JvnCa
   uwi6Gvwkr/T20uRgCpRmWKvY3WU4o1eTEWmYGpxjMVbxwPzxNETc+9SBj
   J6RhWd/BmAVZxXgvbFiK6FsbqZ+XrqXl/vZgLWajWFl6vXvG4rfi2LVff
   w==;
X-CSE-ConnectionGUID: dO1oZrFYSyuLQBcsQD7wTg==
X-CSE-MsgGUID: inUYBJiISTKMMVjqgQd1VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="17594425"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17594425"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 08:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17548113"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2024 08:02:29 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqwhX-0001CQ-1l;
	Sun, 31 Mar 2024 15:02:27 +0000
Date: Sun, 31 Mar 2024 23:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 1/2] virtio_pvclock.c:undefined
 reference to `timekeeping_inject_sleeptime64'
Message-ID: <202403312313.JnDKA1Hi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   041e75aaccb4f83ecd969c31dc76d806db164020
commit: 04f660d6724f5df1b07f8cf9e1c55f70fb43d1d2 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: x86_64-buildonly-randconfig-003-20240329 (https://download.01.org/0day-ci/archive/20240331/202403312313.JnDKA1Hi-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403312313.JnDKA1Hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403312313.JnDKA1Hi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/virtio/virtio_pvclock.o: in function `update_suspend_time':
>> virtio_pvclock.c:(.text+0x4a9): undefined reference to `timekeeping_inject_sleeptime64'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x203): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x235): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x33f): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x3c6): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x484): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x4e0): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x545): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x5bf): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x600): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0x64c): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0x6d9): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0x7dd): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0x835): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xac1): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xadb): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xee0): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xf88): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0xfd3): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xfe6): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xff1): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xffc): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x1007): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:hvc_console.c:(.text+0x1011): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x101a): undefined reference to `tty_set_operations'
   ld: hvc_console.c:(.text+0x105a): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x10c5): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x1290): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x12db): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x12e8): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x1b8): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
   hvc_console.c:(.text.unlikely+0x54): undefined reference to `put_tty_driver'
   ld: hvc_console.c:(.text.unlikely+0x90): undefined reference to `put_tty_driver'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x1c0): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x712): undefined reference to `usb_get_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe.cold':
   pda_power.c:(.text.unlikely+0xd5): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
   da9150-charger.c:(.text+0x6fd): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x16e): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: isp1704_charger.c:(.text+0x3f8): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
   twl4030_charger.c:(.text+0x1592): undefined reference to `devm_usb_get_phy_by_node'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
