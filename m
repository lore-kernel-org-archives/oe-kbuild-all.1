Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367953168E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766402956; cv=none; b=SNqX5o2iwFm7yeYq4vELjFaNv+qH2CsXmuodBIVyueD0vTD5rnsWp3/O5u90+9pRCMJyk3RU+ZenW9Nt8OxF04WfJa0yZm9pNKyPq/8uXTAfUHsY+/Dp8SdtnpKuX4CTAOcmtfadLfCJBETuL7d1oUQdB9Q2m/jHiO5mbB+KlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766402956; c=relaxed/simple;
	bh=HwnN1YJw/KJFpPAU/HhO+vewNVW/01XJKkspg9sxdww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N/yGpeyLs1/KBCKnU5sAX9QSGK6+AAYuTYKDAzeLu0NovNXPeleRnrJVssuqIrRLgKahPLhxfs7vebvFklpVIfcJrEHjx4a/tF2rhUw56MuKMymtDdIIsNDZ9SUMZMq78gpE00HMifvvVVoKAFSNEcUA+wU66lUaKh/U+LzDJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpCMPiYg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpCMPiYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766402954; x=1797938954;
  h=date:from:to:cc:subject:message-id;
  bh=HwnN1YJw/KJFpPAU/HhO+vewNVW/01XJKkspg9sxdww=;
  b=hpCMPiYgYUzA8IbeZKyGqqk6CtowzoQW1Af874v/TPsfhTbV5U22pDYm
   0ax5I1sowNMvhYvkZCTBbMDvuv9cH+VpPe0g8RO+saHao1KyFhoP+bFkD
   ixa4PWYXVwf9ux09hS9syf/kwN2FAx/8i9cS/0iF+O5oYod+IMlAjnZj0
   OAGtxcCqxECFbbPus+axusmgx9SIKtLqr1K2Ev1EMIQzG9I9ZKdhiAv4O
   WDZU+qD1BmCETPQ8HfgUXuSn+FMz1FVY4fU3e0RBooFdsXTK9B8yaYl6A
   kIK0nOK30eUDdh4IJQsps/CRVek4AifHOpvG7SHUbnxobM6MgxpE5kVxI
   g==;
X-CSE-ConnectionGUID: RsTuXt5rQRG6eN7nfBdP/g==
X-CSE-MsgGUID: h3uqwR4mSfq1LKHHZ8UDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="90918050"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="90918050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 03:29:11 -0800
X-CSE-ConnectionGUID: SjpRT+W4SkySBgrRoylgTg==
X-CSE-MsgGUID: qFchXuAYTcuEPaS3RwdUmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204031598"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 03:29:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXe67-000000000SD-0FFS;
	Mon, 22 Dec 2025 11:29:07 +0000
Date: Mon, 22 Dec 2025 19:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] hvc_console.c:undefined
 reference to `tty_vhangup'
Message-ID: <202512221932.wEI6ikSV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 8b9a794068e9fe10f91796ee053afdbd5c01782c [1/1] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-003-20251221 (https://download.01.org/0day-ci/archive/20251222/202512221932.wEI6ikSV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221932.wEI6ikSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221932.wEI6ikSV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/power/supply/wm831x_power.o: in function `wm831x_power_probe':
   wm831x_power.c:(.text+0x6ca): undefined reference to `devm_usb_get_phy_by_phandle'
   arm-linux-gnueabi-ld: (devm_usb_get_phy_by_phandle): Unknown destination type (ARM/Thumb) in drivers/power/supply/wm831x_power.o
   wm831x_power.c:(.text+0x6ca): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_probe':
   bq25890_charger.c:(.text+0xcd8): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: (devm_usb_get_phy): Unknown destination type (ARM/Thumb) in drivers/power/supply/bq25890_charger.o
   bq25890_charger.c:(.text+0xcd8): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x266): undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: (tty_port_tty_get): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x266): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x290): undefined reference to `tty_do_resize'
   arm-linux-gnueabi-ld: (tty_do_resize): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x290): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x33a): undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: (tty_port_tty_set): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x33a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x438): undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: (tty_port_tty_get): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x438): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x47a): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: (tty_port_put): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x47a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x506): undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: (tty_port_tty_get): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x506): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x530): undefined reference to `tty_buffer_request_room'
   arm-linux-gnueabi-ld: (tty_buffer_request_room): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x530): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x56a): undefined reference to `tty_hangup'
   arm-linux-gnueabi-ld: (tty_hangup): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x56a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x5d4): undefined reference to `__tty_insert_flip_string_flags'
   arm-linux-gnueabi-ld: (__tty_insert_flip_string_flags): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x5d4): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x620): undefined reference to `tty_wakeup'
   arm-linux-gnueabi-ld: (tty_wakeup): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x620): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x648): undefined reference to `tty_flip_buffer_push'
   arm-linux-gnueabi-ld: (tty_flip_buffer_push): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x648): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x7ec): undefined reference to `tty_port_install'
   arm-linux-gnueabi-ld: (tty_port_install): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x7ec): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x7f6): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: (tty_port_put): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x7f6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x80e): undefined reference to `tty_hung_up_p'
   arm-linux-gnueabi-ld: (tty_hung_up_p): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x80e): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x83a): undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: (tty_port_tty_set): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x83a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x878): undefined reference to `tty_wait_until_sent'
   arm-linux-gnueabi-ld: (tty_wait_until_sent): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x878): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x910): undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: (tty_port_tty_set): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x910): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x9c2): undefined reference to `__tty_alloc_driver'
   arm-linux-gnueabi-ld: (__tty_alloc_driver): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x9c2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0xa2c): undefined reference to `tty_register_driver'
   arm-linux-gnueabi-ld: (tty_register_driver): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0xa2c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0xa44): undefined reference to `tty_driver_kref_put'
   arm-linux-gnueabi-ld: (tty_driver_kref_put): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0xa44): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0xa62): undefined reference to `tty_driver_kref_put'
   arm-linux-gnueabi-ld: (tty_driver_kref_put): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0xa62): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0xa96): undefined reference to `tty_port_init'
   arm-linux-gnueabi-ld: (tty_port_init): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0xa96): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0xb84): undefined reference to `tty_std_termios'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xbde): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: (tty_port_put): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0xbde): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x208): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: (tty_port_put): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x208): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
>> hvc_console.c:(.text+0x486): undefined reference to `tty_vhangup'
   arm-linux-gnueabi-ld: (tty_vhangup): Unknown destination type (ARM/Thumb) in drivers/tty/hvc/hvc_console.o
   hvc_console.c:(.text+0x486): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_gem_shmem_helper.o: in function `drm_gem_shmem_fault':
   drm_gem_shmem_helper.c:(.text+0x4c6): undefined reference to `vmf_insert_pfn'
   arm-linux-gnueabi-ld: (vmf_insert_pfn): Unknown destination type (ARM/Thumb) in drivers/gpu/drm/drm_gem_shmem_helper.o
   drm_gem_shmem_helper.c:(.text+0x4c6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `ttm_bo_vm_dummy_page':
   ttm_bo_vm.c:(.text+0x1aa): undefined reference to `vmf_insert_pfn_prot'
   arm-linux-gnueabi-ld: (vmf_insert_pfn_prot): Unknown destination type (ARM/Thumb) in drivers/gpu/drm/ttm/ttm_bo_vm.o
   ttm_bo_vm.c:(.text+0x1aa): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `ttm_bo_vm_fault_reserved':
   ttm_bo_vm.c:(.text+0x510): undefined reference to `vmf_insert_pfn_prot'
   arm-linux-gnueabi-ld: (vmf_insert_pfn_prot): Unknown destination type (ARM/Thumb) in drivers/gpu/drm/ttm/ttm_bo_vm.o
   ttm_bo_vm.c:(.text+0x510): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0xee): undefined reference to `devm_usb_get_phy_by_phandle'
   arm-linux-gnueabi-ld: (devm_usb_get_phy_by_phandle): Unknown destination type (ARM/Thumb) in drivers/power/supply/isp1704_charger.o
   isp1704_charger.c:(.text+0xee): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: isp1704_charger.c:(.text+0xfa): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: (devm_usb_get_phy): Unknown destination type (ARM/Thumb) in drivers/power/supply/isp1704_charger.o
   isp1704_charger.c:(.text+0xfa): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: drivers/power/supply/bq256xx_charger.o: in function `bq256xx_probe':
   bq256xx_charger.c:(.text+0xd7c): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: (devm_usb_get_phy): Unknown destination type (ARM/Thumb) in drivers/power/supply/bq256xx_charger.o
   bq256xx_charger.c:(.text+0xd7c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: bq256xx_charger.c:(.text+0xdb8): undefined reference to `devm_usb_get_phy'
   arm-linux-gnueabi-ld: (devm_usb_get_phy): Unknown destination type (ARM/Thumb) in drivers/power/supply/bq256xx_charger.o
   bq256xx_charger.c:(.text+0xdb8): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: sound/core/compress_offload.o: in function `snd_compr_ioctl':
   compress_offload.c:(.text+0xe80): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in sound/core/compress_offload.o
   compress_offload.c:(.text+0xe80): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: compress_offload.c:(.text+0xf24): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in sound/core/compress_offload.o
   compress_offload.c:(.text+0xf24): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x12ba): undefined reference to `wext_handle_ioctl'
   arm-linux-gnueabi-ld: (wext_handle_ioctl): Unknown destination type (ARM/Thumb) in net/socket.o
   socket.c:(.text+0x12ba): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.ref.text+0x14): undefined reference to `wext_proc_exit'
   arm-linux-gnueabi-ld: (wext_proc_exit): Unknown destination type (ARM/Thumb) in net/core/net-procfs.o
   net-procfs.c:(.ref.text+0x14): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.init.text+0x76): undefined reference to `wext_proc_init'
   arm-linux-gnueabi-ld: (wext_proc_init): Unknown destination type (ARM/Thumb) in net/core/net-procfs.o
   net-procfs.c:(.init.text+0x76): dangerous relocation: unsupported relocation

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
