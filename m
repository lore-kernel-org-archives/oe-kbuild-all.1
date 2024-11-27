Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19A113BAE4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732690653; cv=none; b=lnXm3D45/NnRjWKNpgqNd0z0xsCHepEs/Kh1mDprcKXiVdLGwjXvsYZ7/TQG0xgS6ukIXf0ZUoeJrZqLPHvr+9TL2hep07QIzGdrpwtiuoUFHXmITQRLYIv2Wimciocg5bG96c4Hoxqo4WvYT/Qy0P4RfBQ1ehANcLd7HJBkOCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732690653; c=relaxed/simple;
	bh=KTF3+M/pqfxZfYdtdzSP3274yocYok4P8z3qxEkQtNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQJ6W6NwMRrQhw/FfodruwnksyP5fnQC/sVey6Fe4B0mA6OzWPbNUFZ3gkUSd5cpvlQytGbtBZZmPhuuPK4o/xe+qd1V8UXkaSICDsHFh++bUA7Nf/MMad0ycNBgeVyvZc6P/LuVokt8WUlCCjFHxUFIowAqDs1GH9HAQTZR8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iupZAWPc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iupZAWPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732690652; x=1764226652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTF3+M/pqfxZfYdtdzSP3274yocYok4P8z3qxEkQtNQ=;
  b=iupZAWPcFUkFVq2kCXarO9uMyfR3NMTxiPFkdLjz7R4hwPuKcglSe+1J
   QrnsUHV1paCgunHX5d5iPm3wL3kN/WlWjNkekGcMRD0CpId9YrloWyQqE
   gmEW6nd6LppuEatgLop9dOt/nJpsy9FqMAxxmWZWOiBwhQwR0lhgqLBHL
   /xvExepMGao8FZJQeHgH95CfxHsjRPihr4eb94PEiKt6YPEAGrMpHzY/9
   BnVVOcWxg0WqYUxQJgOlVdSGAKIZ1kUQ5sL9YYp64mLXb5SDd9ck08/qS
   ltkKEdbSzhaQPf+qLV1aDJDyDsV76z08MMFrLjd3gspbv05kSnoGZAc1x
   g==;
X-CSE-ConnectionGUID: 7hq/jEZ+QHq1UWAECi6VKA==
X-CSE-MsgGUID: Jv3oqvR1Tqyys+korgb14A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32826303"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="32826303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 22:57:31 -0800
X-CSE-ConnectionGUID: Y+If1ruzTy6ldSWEmF6/rA==
X-CSE-MsgGUID: MeUgSd/9Suy1rRXq2OcgGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="91461565"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2024 22:57:30 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGBzM-0007nD-0m;
	Wed, 27 Nov 2024 06:57:28 +0000
Date: Wed, 27 Nov 2024 14:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1441/30000]
 hvc_console.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL26
 against undefined symbol `tty_port_put'
Message-ID: <202411271451.fXNneuxJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   893d9dfc5bf5628e722d37be563e064c56252c66
commit: c7e20e359ab33d7ce835b3975603623bb292c328 [1441/30000] ANDROID: GKI: build in HVC_DRIVER
config: arm64-randconfig-003-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271451.fXNneuxJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271451.fXNneuxJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271451.fXNneuxJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x354): undefined reference to `tty_port_put'
>> hvc_console.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x3a4): undefined reference to `tty_port_tty_get'
>> hvc_console.c:(.text+0x3a4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x3d8): undefined reference to `tty_do_resize'
>> hvc_console.c:(.text+0x3d8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x4bc): undefined reference to `tty_port_tty_set'
>> hvc_console.c:(.text+0x4bc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x54c): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x54c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x608): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x608): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x614): undefined reference to `tty_port_put'
   hvc_console.c:(.text+0x614): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x65c): undefined reference to `tty_hung_up_p'
>> hvc_console.c:(.text+0x65c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x6c4): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x6c4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x710): undefined reference to `tty_wait_until_sent'
>> hvc_console.c:(.text+0x710): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x78c): undefined reference to `tty_port_tty_get'
   hvc_console.c:(.text+0x78c): additional relocation overflows omitted from the output
   aarch64-linux-ld: hvc_console.c:(.text+0x7c8): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0x804): undefined reference to `__tty_insert_flip_char'
   aarch64-linux-ld: hvc_console.c:(.text+0x89c): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: hvc_console.c:(.text+0x8e4): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0x980): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x9c0): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0x9f8): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xa08): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xa2c): undefined reference to `tty_hangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xe54): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0xe78): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xf40): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x1030): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1048): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0x104c): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0x10a0): undefined reference to `tty_set_operations'
   aarch64-linux-ld: hvc_console.c:(.text+0x10e0): undefined reference to `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1138): undefined reference to `tty_port_init'
   aarch64-linux-ld: hvc_console.c:(.text+0x1298): undefined reference to `put_tty_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x12c0): undefined reference to `put_tty_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x12e4): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x133c): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0x1348): undefined reference to `tty_vhangup'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
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
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
