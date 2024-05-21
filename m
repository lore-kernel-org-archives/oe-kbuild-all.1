Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E761358AB9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 23:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716335513; cv=none; b=IFcyUoyM2G2S3INhWksccOPZDAxpQX82Igv4Ynuang8wHGPtDwK58nT+1FB/KdjFQn5sTl9d1mSosP/NNgsQZbbsHspHI+/fVL51YxTd6UUH3VXsrGGbJ5LCXElnCpokj6TsZNX9Mqpo8AWLn0w2q3b5BaCdZgcAhw0Qxhr8N1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716335513; c=relaxed/simple;
	bh=GaHluAylXfqV/p30vyDP8eMyzaf/AVHViOnGLSE7hzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nRL+I4Zq+B43wqgBQAsh5JpuIh3Zxf1nJO4gwu3nzIIj2/cPd5X0IiTv69xFYKGHhNld0S2jFyMw1lsJWLVMdW9/Q+rkVRZHIkzFNlcD0ijkjgI1VVEiFd40U7gmlGR0N1iQg4Zdvo/i/m/gszaD5l3Gj/FWV35QGQsWewoMF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALM+2yGR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALM+2yGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716335511; x=1747871511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GaHluAylXfqV/p30vyDP8eMyzaf/AVHViOnGLSE7hzY=;
  b=ALM+2yGRlQOEt97+drrj3zy19vri/MtobIqztqRhFNxyEMKou/djL0uv
   WglcPMgfm8mEICKfxUL7oVTkCvLiErG1Q13JM0XbqbOgkgN0sXXxrZivb
   GFVIm5ou37ovTmkAjiXZcxbptZyApTVwlcyj3AeTmVHF43uvd3wA398eg
   TgTNR1HImM7MtLYG0FawalPUOrw9EAnk3ROz5Qz9RQQiJk2qT0PDYEIlZ
   YaCCzQNCsDWGRI/zEdlSZ8MPelNVs/Hli/+N6MuV1zrGWUK6X9+dqAC9p
   QYZJ7DcAssbSvqT1av018e8BvG3o9KP3T38nm1hll/zBfNLjhS3nGMvgo
   w==;
X-CSE-ConnectionGUID: V+LB3HF+QAamMyN079vk2w==
X-CSE-MsgGUID: rUbm9j1vTh24zGJb92t4RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16389688"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="16389688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 16:51:51 -0700
X-CSE-ConnectionGUID: zeS070QFT4aoUCLnzD4Gaw==
X-CSE-MsgGUID: C4whELjWSOSddCtL8C4mXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33108571"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2024 16:51:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9ZGk-0000qj-2q;
	Tue, 21 May 2024 23:51:46 +0000
Date: Wed, 22 May 2024 07:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4651/13186]
 hvc_console.c:(.text+0xc5c): relocation truncated to fit: R_AARCH64_CALL26
 against undefined symbol `__tty_alloc_driver'
Message-ID: <202405220723.XhqysqOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   22c87c3f23cb51aa73561ce261c2203f288bd893
commit: 51786e2d1bdd897c83474e3f445611d97995e30c [4651/13186] Merge 61401a8724c2 ("Merge tag 'kbuild-v6.6' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm64-randconfig-002-20240521 (https://download.01.org/0day-ci/archive/20240522/202405220723.XhqysqOF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220723.XhqysqOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220723.XhqysqOF-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x748): undefined reference to `tty_port_put'
   hvc_console.c:(.text+0x748): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x868): undefined reference to `tty_port_tty_get'
   hvc_console.c:(.text+0x868): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x8b0): undefined reference to `tty_do_resize'
   hvc_console.c:(.text+0x8b0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0xa7c): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0xa7c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0xb34): undefined reference to `tty_port_tty_get'
   hvc_console.c:(.text+0xb34): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xbb4): undefined reference to `tty_port_put'
   hvc_console.c:(.text+0xbb4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0xbc0): undefined reference to `tty_vhangup'
   hvc_console.c:(.text+0xbc0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_vhangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xc5c): undefined reference to `__tty_alloc_driver'
>> hvc_console.c:(.text+0xc5c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__tty_alloc_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0xc98): undefined reference to `tty_std_termios'
>> hvc_console.c:(.text+0xc98): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0xca0): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0xd48): undefined reference to `tty_register_driver'
>> hvc_console.c:(.text+0xd48): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0xde8): undefined reference to `tty_port_init'
   hvc_console.c:(.text+0xde8): additional relocation overflows omitted from the output
   aarch64-linux-ld: hvc_console.c:(.text+0x1068): undefined reference to `tty_driver_kref_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x1188): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x1200): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0x128c): undefined reference to `__tty_insert_flip_string_flags'
   aarch64-linux-ld: hvc_console.c:(.text+0x13c0): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: hvc_console.c:(.text+0x141c): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0x14c8): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x1550): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0x15c4): undefined reference to `tty_hangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x1bf4): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0x1c1c): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x1d14): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x1e6c): undefined reference to `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x1ec8): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x1f60): undefined reference to `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x20a4): undefined reference to `tty_port_put'
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x3f74): undefined reference to `wext_handle_ioctl'
   aarch64-linux-ld: net/socket.o: in function `compat_sock_ioctl':
   socket.c:(.text+0x4680): undefined reference to `compat_wext_handle_ioctl'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.ref.text+0x80): undefined reference to `wext_proc_exit'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.init.text+0x11c): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
