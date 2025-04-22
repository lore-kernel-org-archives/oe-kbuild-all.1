Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61DF1EE03D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353029; cv=none; b=Y9KbzHabExR5IhvTEaxGUq1HOpbwiXYR+ulXfRzhLZ+hy3ElIbbi7BisqyLYOWQ99OyVYHlNSMaNP/Bc0fQ7NHTI/mclJ1fwY5yO5z84awzN7RR/x0zwrao4Bm+qGrc65VEEMUfUUsVIL3JT63iIcptbD6LuiGvoilCKyLjQykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353029; c=relaxed/simple;
	bh=1CosQzve+8vBu8s6zYfdbGRTO+N9T234QcroQ0hOzfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t81F4T5BOEW9cOn/zQkKb9IT743YUfhAi4f9i+3Xva0zv22y8AGAQRXbcIq8uSSyz2fchz2P5uM7MIIdupegGvGGDaeZUETyvzuC7bH2i3FWNEqRiFQutqsYnA/tHfAiCi1JjVSROYjiucmAyJeHpRfKgWRbG6KGG7drYkX6pNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkLTEpDm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkLTEpDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745353027; x=1776889027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CosQzve+8vBu8s6zYfdbGRTO+N9T234QcroQ0hOzfA=;
  b=PkLTEpDmrIK6f0i6yxl8SrpI5OUf6q6FkE5qAtpVK0tZ50xhRFkrwWRY
   KTKVNfm3o3QSOdg3Qkd2ugcKPLVqG+PNg1Grp2VLbvyyTRsb/PdhsW2OW
   8TaBNsoaGKRT09A4HEphpUk8tgTzk33mk0ZbLfgGpzqnNl0vBI9LbpvER
   Tz/mLqrgl6q/DMjOXOJGYSOh5lG2dJ0YIaoX09INJdkreXzWVeRZlairJ
   zilP7DRzQkwUogO3nBAKtkTA6uaV7I/8WdLxqva44ge6Frkp9Gf5yCkbd
   1eY5YwGQZcKEBBt7/WwrtYJSeGJMDZyaj0vruAaL7JikVhEy7HtqclCJ8
   A==;
X-CSE-ConnectionGUID: se0PLcslR0iideg1p8JqJA==
X-CSE-MsgGUID: ZBXqNxmhR827IDr4A4e+dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57912709"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="57912709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 13:17:06 -0700
X-CSE-ConnectionGUID: DcLmxgxDSL+AytRm9nwkgw==
X-CSE-MsgGUID: cZ1vT8RUQdqrkal7i/mGyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="136194964"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2025 13:17:05 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7K3C-0001IZ-2T;
	Tue, 22 Apr 2025 20:17:02 +0000
Date: Wed, 23 Apr 2025 04:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 128/128] hvc_console.c:undefined
 reference to `tty_port_put'
Message-ID: <202504230424.pUuBKtuU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ram,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   49f235be5794a89218d9c986c56a6d320b68eed3
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db [128/128] ANDROID: GKI: build in HVC_DRIVER
config: arm-randconfig-002-20250423 (https://download.01.org/0day-ci/archive/20250423/202504230424.pUuBKtuU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504230424.pUuBKtuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230424.pUuBKtuU-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
>> hvc_console.c:(.text+0x21c): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
>> hvc_console.c:(.text+0x284): undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x2c0): undefined reference to `tty_do_resize'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
>> hvc_console.c:(.text+0x3d4): undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x458): undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x504): undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x514): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
>> hvc_console.c:(.text+0x56c): undefined reference to `tty_hung_up_p'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x5d0): undefined reference to `tty_port_tty_set'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x628): undefined reference to `tty_wait_until_sent'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x6a8): undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x6f4): undefined reference to `tty_buffer_request_room'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x730): undefined reference to `__tty_insert_flip_char'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x8d8): undefined reference to `tty_flip_buffer_push'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x8f0): undefined reference to `tty_wakeup'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x908): undefined reference to `tty_hangup'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
>> hvc_console.c:(.text+0xdb0): undefined reference to `tty_port_install'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0xdc8): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_init':
>> hvc_console.c:(.text+0xf9c): undefined reference to `__tty_alloc_driver'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x1028): undefined reference to `tty_set_operations'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x1094): undefined reference to `put_tty_driver'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x10c8): undefined reference to `tty_register_driver'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x1100): undefined reference to `tty_std_termios'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x13a4): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
>> hvc_console.c:(.text+0x1568): undefined reference to `tty_port_init'
   arm-linux-gnueabi-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x1724): undefined reference to `tty_port_tty_get'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x1778): undefined reference to `tty_port_put'
   arm-linux-gnueabi-ld: hvc_console.c:(.text+0x1788): undefined reference to `tty_vhangup'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
