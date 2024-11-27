Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AC4367
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732688168; cv=none; b=PgR8Z+AqlkivUbw0tzdsfky7SfhKXfcM10XLM2Las51AM7vZkaoJZ49Ns8p3OEpEv5wlIzbOg7FVc9OL9lSqWz6gJd70TbQRg1ARjYP9RJrI7AtvVRIsBDZ65Megr0Q1/OXr8yGxJTElKIzMzOhlG5ur1QsvcazBlYnYD/N/sVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732688168; c=relaxed/simple;
	bh=DaIFUav6XiF2A/WYOoe3zzNAjy3XYQ0fFDfVRsB6A6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQiOgn8EYVpB3YVPINquJbTUw0asnZIo1NCcQ8xaWeHWfgOgGRj1UoVi7KDLsCW1Oob78oH1gXCRJwtlR8fxilGPgF/zaGkJxV7/Sas/kmwooCbtg/0ERPkMAOwnuaulMtHlS4iVBjywwSJzRjoKDKo5gWpRjHYDUqMAtiJedtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IdaYOE5b; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdaYOE5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732688166; x=1764224166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DaIFUav6XiF2A/WYOoe3zzNAjy3XYQ0fFDfVRsB6A6o=;
  b=IdaYOE5bqy6Wpvpeq1JLP14J27WIBiaElAYUya/5XVr0t/uQGnKNoYdG
   esRCLDAKzpRJNrcdCO5fbJqPFgW7VKo61RJUfsqQI5+4SG95kIOY4iv1X
   YIrJNINuMAVC5AFsx0pFk+pP0qxDQJ2CCwW31oy6R4YQh1F82d/nqkEQ4
   69rrP0tLxwAtBeuOPX90Kn9i74c7Y9+pd//2Wo1oq9dDBDXb8Xbs87Bdr
   QSKClFfUE5n5F/xrP90S8bMn1B9x2kbnjMKiPvEk/oeqFQIjyGNStCPgn
   pkdrRYR8DVeXpImjfD+IY8Z9c+9//GKIG4gWkSPbGeQJbC8hD4vzORKaH
   g==;
X-CSE-ConnectionGUID: YTlB4xYrSOmKfx9ORgfy6A==
X-CSE-MsgGUID: YlN67jiNRDOAxscRTQiABg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32823008"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="32823008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 22:16:05 -0800
X-CSE-ConnectionGUID: 0qHBqqrxRgGe0BTSN/7BXw==
X-CSE-MsgGUID: nwl5pYNgRkSFB62H+74B0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="91937691"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2024 22:16:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGBLF-0007lz-2B;
	Wed, 27 Nov 2024 06:16:01 +0000
Date: Wed, 27 Nov 2024 14:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Muthiah <rammuthiah@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: aarch64-linux-ld: hvc_console.c:undefined reference to
 `tty_set_operations'
Message-ID: <202411271429.G13JmERM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db ANDROID: GKI: build in HVC_DRIVER
date:   4 years, 9 months ago
config: arm64-randconfig-003-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271429.G13JmERM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271429.G13JmERM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271429.G13JmERM-lkp@intel.com/

Note: the ambarus/syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f HEAD caa714448992ba4eb583735a4acb26917fbc67a8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x354): undefined reference to `tty_port_put'
   hvc_console.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x3a4): undefined reference to `tty_port_tty_get'
   hvc_console.c:(.text+0x3a4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x3d8): undefined reference to `tty_do_resize'
   hvc_console.c:(.text+0x3d8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x4bc): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x4bc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x54c): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x54c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x608): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x608): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x614): undefined reference to `tty_port_put'
   hvc_console.c:(.text+0x614): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x65c): undefined reference to `tty_hung_up_p'
   hvc_console.c:(.text+0x65c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x6c4): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x6c4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x710): undefined reference to `tty_wait_until_sent'
   hvc_console.c:(.text+0x710): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_wait_until_sent'
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
   hvc_console.c:(.text+0xea4): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0xec8): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xf88): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x1070): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1088): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0x108c): undefined reference to `tty_std_termios'
>> aarch64-linux-ld: hvc_console.c:(.text+0x10e0): undefined reference to `tty_set_operations'
   aarch64-linux-ld: hvc_console.c:(.text+0x1120): undefined reference to `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1178): undefined reference to `tty_port_init'
>> aarch64-linux-ld: hvc_console.c:(.text+0x12d8): undefined reference to `put_tty_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1300): undefined reference to `put_tty_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x1324): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x137c): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0x1388): undefined reference to `tty_vhangup'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
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
