Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A3813D297
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737446106; cv=none; b=HaKcU2B2nBMT0sz8T8HVUH3GzCXsS3hQ7XzhKqKbX2UXdBjQpnqf0pRi/J+zXLhDC9SfhBWwBTAhALcyRxLZp3p0lhVSLloY943kqvbM5Zc1GJ2DmDbvEFL2A3TV6SDnzfgdMG2kUMQ0t/SbBoXq+RoqNzq/QIQ5wMxk4q8XwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737446106; c=relaxed/simple;
	bh=QRDq5++D1sV6BnDoMg7bw7jyzPxluejs8R+lGOmFeo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BkhB+4H3lWaZJPDCSymlbv8MHcJ98It69ARdnG121Nl3ZxZt/PETtcufzmRFgE/l4G/j3T/tc8vE4KpLlLNvY636VaDrSX5AA7Gjw/ITAcdfmda8pVw9/vxY35oRpgKhHtHN3iooF5gX5IlrIPqiaid4yKLEFxDFTCcsMFeDIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFJsxlhz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFJsxlhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737446104; x=1768982104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QRDq5++D1sV6BnDoMg7bw7jyzPxluejs8R+lGOmFeo4=;
  b=mFJsxlhzGoQYdJsbPNVWqQDWtj2ugs+EsB0ywsJ1TNrBf7VQA5Q52kt/
   nBvevATyviCj6KNxYMBexXkDJxLHVAMGd7Cc7Pxy2cc7cLMVZWOi09kEd
   Pb8QkAs8yZnV4hte8oK4CQ2fz7Fr7chDM8qnE8A9OIW630QjqQhAnFYUp
   37CBjRAwJz8c2wV5VK4tXxVf+pTiMuby0GLpBRb8+R2WbPfxe+gZn6t5z
   a3MuxiMKX8vB6xTwwunDcKmFkaxoINzSX7wF5JETQorlClWxcBhXGcT6m
   6+JB0KQhskO4882E2uGx2Xk8lhA0VM+monzAEhy4oVIntxyvSR5h9ZmXg
   g==;
X-CSE-ConnectionGUID: fD8uUk8XSpWri/jcpmSH3Q==
X-CSE-MsgGUID: OrpOZbYRRi2VZPM689+Gjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37115136"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="37115136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 23:55:04 -0800
X-CSE-ConnectionGUID: dBXP5nHZTGySKt/uiK0LcQ==
X-CSE-MsgGUID: eDtfHYicQCedehC9hLBGsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110786355"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2025 23:55:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta96C-000Xo3-2p;
	Tue, 21 Jan 2025 07:55:00 +0000
Date: Tue, 21 Jan 2025 15:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1] aarch64-linux-ld:
 isp1704_charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202501211525.IjmlegTR-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f22dfe9625b11d8041c35682344f932cbc9ca30b
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [1/1] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: arm64-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211525.IjmlegTR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211525.IjmlegTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211525.IjmlegTR-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x36c): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x3c4): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x3f8): undefined reference to `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x4ec): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x578): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x634): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x640): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x694): undefined reference to `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x6fc): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x748): undefined reference to `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x7bc): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x810): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0x854): undefined reference to `__tty_insert_flip_char'
   aarch64-linux-ld: hvc_console.c:(.text+0x90c): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: hvc_console.c:(.text+0x978): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0xa20): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xa60): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xaa0): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xacc): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xaf0): undefined reference to `tty_hangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xefc): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0xf20): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xfe0): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x10dc): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x10f4): undefined reference to `tty_std_termios'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tty_std_termios' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hvc_console.c:(.text+0x10f4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hvc_console.c:(.text+0x10f8): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0x1148): undefined reference to `tty_set_operations'
   aarch64-linux-ld: hvc_console.c:(.text+0x1188): undefined reference to `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x11e4): undefined reference to `tty_port_init'
   aarch64-linux-ld: hvc_console.c:(.text+0x1368): undefined reference to `put_tty_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1390): undefined reference to `put_tty_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x13b4): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x140c): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0x1418): undefined reference to `tty_vhangup'
   aarch64-linux-ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0x9fc): undefined reference to `devm_usb_get_phy_by_phandle'
   aarch64-linux-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1958): undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x198): undefined reference to `devm_usb_get_phy_by_phandle'
>> aarch64-linux-ld: isp1704_charger.c:(.text+0x3b4): undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0x84c): undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0x6b0): undefined reference to `devm_usb_get_phy_by_phandle'
>> aarch64-linux-ld: sc2731_charger.c:(.text+0x6f8): undefined reference to `usb_phy_get_charger_current'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
