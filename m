Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A0C8821
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 00:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732926313; cv=none; b=dBmQXSGxxIegHCiGeLUi/U6CKpr2eGntXRUk28BVD+EnhTt6C2+ZvhfvJltpCgZ0HDfrmdUe6aNEL087GLCoerQvZUgmGhDbUVLd2dRtsgfz4mHXi+0aSdUHHt7wobpQeeWc0wXwKwocw8BqgqXbjtMpU4ISbPt2hH58HTktJdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732926313; c=relaxed/simple;
	bh=8AaE7jnjZbpd5kuL+l0SRRM7rk1EVnKsTVvPzPUs4jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwQ6d6CQGOpjNe9rcvnTCV3RgzwhYGaj6WY3w766wSvUAJmyFsOLbfEAXRdbdA9MdzgvpOVCnGNuY2FT27yCoJg6sXozjj4NfskikiXQ0z7BnHsji+m4zHdtWeWRh4WakHuC3Jq1mvpNVb0a7iZToiweJsulD7dwSSv21KP/Jis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqxF0WZ+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqxF0WZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732926311; x=1764462311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AaE7jnjZbpd5kuL+l0SRRM7rk1EVnKsTVvPzPUs4jY=;
  b=dqxF0WZ+lh3x2nY8IN2Aod0cfxKpEb80BjqOM2cHS3zE16SS1siYC4yt
   eTL4jpV30rD5fm2iN/0rvmPA//OAy6L43irZyLC/WtGH312diDZD7WtuZ
   JRPS1GguTDHuumufBCkxAvunf9Bl11NLWuvcH8B4Knuoqey+NetJVd8t5
   3UPwV+yRkzjs4TwL7yB9UcWz89ISg6/ZRELbS189A0Urh8GuzU9hKqRo+
   bl32urstpWk8ZrnMjDZXFBk0fbr9/a0jzzqf8mGT1mP56jYXBDtv9Jmer
   gd3ODyj7v0UGxjbX+jWJgJPlPDB2Rs3o1ZyGb0PS1j5uI5SxqlTQvNJlD
   A==;
X-CSE-ConnectionGUID: mWKoM22xS2aOC1tz1FMwIg==
X-CSE-MsgGUID: qtFjZ2ghRb2wxyMHXQqxng==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="50677468"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="50677468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 16:25:11 -0800
X-CSE-ConnectionGUID: HcZ2l76HQfeqF1bIFv2ptw==
X-CSE-MsgGUID: Bfta+xqGT/Kw9NziQS0hUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92466761"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Nov 2024 16:25:09 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHBIJ-0000nR-0N;
	Sat, 30 Nov 2024 00:25:07 +0000
Date: Sat, 30 Nov 2024 08:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 1830/30000] ld:
 hvc_console.c:undefined reference to `tty_set_operations'
Message-ID: <202411300821.Q2vR83lB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   eb0803d4658c42bd3e9de688fb72a1cf6cf4e28a
commit: c7e20e359ab33d7ce835b3975603623bb292c328 [1830/30000] ANDROID: GKI: build in HVC_DRIVER
config: i386-buildonly-randconfig-005-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300821.Q2vR83lB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300821.Q2vR83lB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300821.Q2vR83lB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x1ef): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x24a): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x27b): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x353): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x3ee): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x490): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x49f): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x4d9): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x534): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x57e): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x5f1): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x638): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0x681): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0x806): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x848): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0x886): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0x8a6): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xb41): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xb63): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xfe1): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x109a): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0x10d9): undefined reference to `tty_std_termios'
>> ld: hvc_console.c:(.text+0x10f8): undefined reference to `tty_set_operations'
   ld: hvc_console.c:(.text+0x113b): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x11a6): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x130d): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x1350): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x135b): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
>> hvc_console.c:(.text.unlikely+0x3f): undefined reference to `put_tty_driver'
>> ld: hvc_console.c:(.text.unlikely+0x70): undefined reference to `put_tty_driver'
   ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x46f): undefined reference to `wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.text+0x12c): undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.text+0x211): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
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
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
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
