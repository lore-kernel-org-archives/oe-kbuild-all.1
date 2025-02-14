Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A0189F5C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 05:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739512587; cv=none; b=WNMVawumTW03edECA1fRJ2S9Ona8PRFc4vch55vJrkWtnPetBd+/4J5Q6Ac+BIoQOh4XUZ44jvYBvLxMzOdaKCOac2ppe7Kv//3wTOeT2KYHgI8Bi8MwyIWhmmEw97GCCgN2lFFd5sWxRpithZijRx4ckCLPyIiOlcUjKqkqz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739512587; c=relaxed/simple;
	bh=GlGsOK+EcWTAYXatyTnU4rC8NSD648GTmZ70Y8WGrEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CWpbC5ua647tnrmcBa6/xo3OSkEjIZU65xyej6EaqxE3U3RCiqeCKtTS4ALpBaQFjr5Rw5BHngetkH+Ip8fUYsz/p03VthLbc4zNuKLEbRkwB+frcPxx2Zre6Lw3qJfvF7VOmOgv+7dUJFRSkyXA5QuYOmQHDPi8z0MHLAflxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnABZbhD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnABZbhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739512585; x=1771048585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlGsOK+EcWTAYXatyTnU4rC8NSD648GTmZ70Y8WGrEQ=;
  b=gnABZbhDI/wdlxauck7A4aJxdHJohXzgMWviGIMEsPexxI+vKv7E+7cv
   uVxxKOxj+zc72wvTaaUO/gD2f5a3fPjJbcbz+ZK2i72QVsJXqlMUuhCfC
   aUcLStKrYvy34yALeaSuQl/5NGbM/CY0MD7dTW1BSZw2GY/FuEXA+oVJz
   Xnet1xiKtwFgqybSvaP1l6YXpyf8KxuHnkQ2kpkSq+7Xmue3LdY8sNmGY
   3FwYh7MVREX7z7oNWZ/A4GpXF8ZCH9VPcUgZkiaRX+uuA9iKYdiEctbVC
   954Agz/hOZJL9mRqPJFY+00dxgPNIuGWGb4LUi1IxlaupE+n1M9XEvMR9
   w==;
X-CSE-ConnectionGUID: pFcMCsWCSwKE5y+QhgdbHg==
X-CSE-MsgGUID: Bq1REPd9QkuWuA33Tw4GEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50878532"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="50878532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 21:56:24 -0800
X-CSE-ConnectionGUID: k7pPN3wYTl2zXCXrfUdJmA==
X-CSE-MsgGUID: 6l2FbLKcQxmqnMF2YxSqKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113547008"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Feb 2025 21:56:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiogX-00197r-0g;
	Fri, 14 Feb 2025 05:56:21 +0000
Date: Fri, 14 Feb 2025 13:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] aarch64-linux-ld:
 decompress_unzstd.c:undefined reference to `ZSTD_DStreamWorkspaceBound'
Message-ID: <202502141336.lvqL8nZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   11518ffc9e08feaf3d12dcd6b483ac1b01c1d470
commit: 95a43fc99f147282c64e68baf1ea18041c7755ea [2/2] ANDROID: Incremental fs: Add zstd compression support
config: arm64-randconfig-004-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141336.lvqL8nZY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141336.lvqL8nZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141336.lvqL8nZY-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: lib/decompress_unzstd.o: in function `__unzstd.constprop.0':
   decompress_unzstd.c:(.init.text+0xe0): undefined reference to `ZSTD_DCtxWorkspaceBound'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0xf4): undefined reference to `ZSTD_initDCtx'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x118): undefined reference to `ZSTD_findFrameCompressedSize'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x148): undefined reference to `ZSTD_decompressDCtx'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x21c): undefined reference to `ZSTD_getFrameParams'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x274): undefined reference to `ZSTD_DStreamWorkspaceBound'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x290): undefined reference to `ZSTD_initDStream'
>> aarch64-linux-ld: decompress_unzstd.c:(.init.text+0x308): undefined reference to `ZSTD_decompressStream'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x1f0): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x280): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x2b4): undefined reference to `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x3c0): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x464): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x52c): undefined reference to `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x56c): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x5c0): undefined reference to `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x664): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x6bc): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0x6c8): undefined reference to `tty_vhangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x758): undefined reference to `tty_std_termios'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tty_std_termios' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hvc_console.c:(.text+0x758): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hvc_console.c:(.text+0x75c): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0x7ac): undefined reference to `tty_set_operations'
   aarch64-linux-ld: hvc_console.c:(.text+0x7ec): undefined reference to `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x81c): undefined reference to `put_tty_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x848): undefined reference to `put_tty_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x89c): undefined reference to `tty_port_init'
   aarch64-linux-ld: hvc_console.c:(.text+0xa0c): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0xb10): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xb68): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0xbbc): undefined reference to `tty_hangup'
   aarch64-linux-ld: hvc_console.c:(.text+0xc8c): undefined reference to `__tty_insert_flip_char'
   aarch64-linux-ld: hvc_console.c:(.text+0xcfc): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xd2c): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xd60): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xd90): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x10f8): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0x1108): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x1568): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x3930): undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
