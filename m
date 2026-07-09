Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F721A683B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783557450; cv=none; b=XzBl3vE9W4TgxV1kfkx249P67IppuSMzFu+Px/lV98dTiszQHUjRPBVepbVDug516ukFYF6hme3dIrc7SJ2pSI8WW0H7z5RvhBOxXNInRhzkhq71DQ7KgX+5qNaII0DYZemBIrfvf65+TSQFcHKQdXKLxtX3R6F6YD02P3S0n0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783557450; c=relaxed/simple;
	bh=COkDWWbnxlCXTIAAL/Af9gjeEyi06h2ez0S27MFF6SY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=micU1u0A1wR5HLbUsctQJE54ZWQX2D0qtY0Q/qsi++L+qy1pv+4AvWvoe1OonBJbwQGKJjksLSjjgZfUQgGXRz+09yRpyNCjgXoy0Q5qKM4IA/Vm9MdUbnn9RhkzdIEJkw3frV7EOOK6ydkVSlDMVXLOTBdpE5ZH2x/G1xyeBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qr0/gAmW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qr0/gAmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783557449; x=1815093449;
  h=date:from:to:cc:subject:message-id;
  bh=COkDWWbnxlCXTIAAL/Af9gjeEyi06h2ez0S27MFF6SY=;
  b=Qr0/gAmWTkrCx51wvhqaRLXcLE6oJfM1ZW+C3H4yJQJfWgV9AyfpPbWx
   IvUP9gcu8MnrZJHG61rPtrKCCvWdyUO1Im1RdB2Wv5JUdISrXcGUHvuYE
   a9KsF/KLdToacB9uJTCg+dyBrk4JWPGnWAqz/TcTGCbDE79I1Lqp+M/6m
   hO0Rc3b4BN8VHyF9Iaqa3XcRA55uj1B2kHEGu9cdaUZOf4dS5uySa4jL1
   ub5UGs86shXM5N1QCt8oReN8HcN8eNLOTytZP/5wG0e5YCz6TVo5lpvyV
   1Mah55SRRQGSVNiyZXW+Fk4Oo4Kv3nNYfcyBv9BIuCC4A2eWy59lrT4co
   g==;
X-CSE-ConnectionGUID: EiU4Kp4dRL+aA/ItUIKQlA==
X-CSE-MsgGUID: AH2aiiyvSx6hKROMwRcZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88145861"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88145861"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 17:37:28 -0700
X-CSE-ConnectionGUID: HbBrYHG6T8W+14yUcTyaFA==
X-CSE-MsgGUID: 5nu0C5ImTQCxEmZHU4TQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258731614"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2026 17:37:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whclY-00000000H4t-2BO6;
	Thu, 09 Jul 2026 00:37:24 +0000
Date: Thu, 09 Jul 2026 08:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 jack.c:(.text.snd_jack_dev_disconnect+0x28): undefined reference to
 `input_unregister_device'
Message-ID: <202607090831.yumo48G2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   adf8bc5941e7beff5b8ba6f64385d50c6b4d32c5
commit: c16fe0a335e01fb417796730b2d9d8612eaba9de [1/1] Merge tag 'v6.11-rc2' into android-mainline
config: arm-randconfig-001-20260709 (https://download.01.org/0day-ci/archive/20260709/202607090831.yumo48G2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090831.yumo48G2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090831.yumo48G2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
>> jack.c:(.text.snd_jack_dev_disconnect+0x28): undefined reference to `input_unregister_device'
   arm-linux-gnueabi-ld: (input_unregister_device): Unknown destination type (ARM/Thumb) in sound/core/jack.o
>> jack.c:(.text.snd_jack_dev_disconnect+0x28): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: jack.c:(.text.snd_jack_dev_disconnect+0x4a): undefined reference to `input_free_device'
   arm-linux-gnueabi-ld: (input_free_device): Unknown destination type (ARM/Thumb) in sound/core/jack.o
   jack.c:(.text.snd_jack_dev_disconnect+0x4a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_dev_register':
>> jack.c:(.text.snd_jack_dev_register+0x8e): undefined reference to `input_set_capability'
   arm-linux-gnueabi-ld: (input_set_capability): Unknown destination type (ARM/Thumb) in sound/core/jack.o
>> jack.c:(.text.snd_jack_dev_register+0x8e): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: jack.c:(.text.snd_jack_dev_register+0xa6): undefined reference to `input_register_device'
   arm-linux-gnueabi-ld: (input_register_device): Unknown destination type (ARM/Thumb) in sound/core/jack.o
   jack.c:(.text.snd_jack_dev_register+0xa6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_report':
>> jack.c:(.text.snd_jack_report+0x7e): undefined reference to `input_event'
   arm-linux-gnueabi-ld: (input_event): Unknown destination type (ARM/Thumb) in sound/core/jack.o
>> jack.c:(.text.snd_jack_report+0x7e): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: jack.c:(.text.snd_jack_report+0xc2): undefined reference to `input_event'
   arm-linux-gnueabi-ld: (input_event): Unknown destination type (ARM/Thumb) in sound/core/jack.o
   jack.c:(.text.snd_jack_report+0xc2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: jack.c:(.text.snd_jack_report+0xdc): undefined reference to `input_event'
   arm-linux-gnueabi-ld: (input_event): Unknown destination type (ARM/Thumb) in sound/core/jack.o
   jack.c:(.text.snd_jack_report+0xdc): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: sound/core/jack.o: in function `snd_jack_new':
>> jack.c:(.text.snd_jack_new+0x8c): undefined reference to `input_allocate_device'
   arm-linux-gnueabi-ld: (input_allocate_device): Unknown destination type (ARM/Thumb) in sound/core/jack.o
>> jack.c:(.text.snd_jack_new+0x8c): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: jack.c:(.text.snd_jack_new+0xc2): undefined reference to `input_set_capability'
   arm-linux-gnueabi-ld: (input_set_capability): Unknown destination type (ARM/Thumb) in sound/core/jack.o
   jack.c:(.text.snd_jack_new+0xc2): dangerous relocation: unsupported relocation
>> arm-linux-gnueabi-ld: jack.c:(.text.snd_jack_new+0x116): undefined reference to `input_free_device'
   arm-linux-gnueabi-ld: (input_free_device): Unknown destination type (ARM/Thumb) in sound/core/jack.o
   jack.c:(.text.snd_jack_new+0x116): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: net/socket.o: in function `sock_ioctl':
>> socket.c:(.text.sock_ioctl+0x94): undefined reference to `wext_handle_ioctl'
   arm-linux-gnueabi-ld: (wext_handle_ioctl): Unknown destination type (ARM/Thumb) in net/socket.o
>> socket.c:(.text.sock_ioctl+0x94): dangerous relocation: unsupported relocation

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
