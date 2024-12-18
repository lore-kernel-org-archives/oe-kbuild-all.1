Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1158C219ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 01:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734486459; cv=none; b=nJOSea+5uk+Gnvh4HHNvYs+8xqJD8kP1FAAT/CrqvtOU7FInoneK5LOC+S8nHXjzBxNHAj1diJKeQp6y9hPIiDtzEZOJqydTTxVMnuJ6MXhDWN7yEYVDDq8671izKrea8JteSpaEIgNd3aau0Iws6tUosTsSgP8zXNNosrVUkdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734486459; c=relaxed/simple;
	bh=e4oRQANJ4mCbCDgcIARtPm5UvCtAJ10/oWJvsKEGkC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJl9NRqE+8NOD/t8HdgSvRjoCz/AshoQsA03qG2AvwvsY9Zqpk+HH4icD/Lea4DyNt2OAYct+q78Q7MAAjkj2wxf6VXOs4ox4bw3SUmltFBLRXgesTETu6JSQP/eUjxwwn0alehfgScTVhARVYuETgUj7IfIEONQbYf/MFU15kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNb1C7rI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNb1C7rI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734486458; x=1766022458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4oRQANJ4mCbCDgcIARtPm5UvCtAJ10/oWJvsKEGkC0=;
  b=CNb1C7rILxoiPpmYQU+fix0pQ7pqDTIgYZ0xx9cSt/C8hpL2Acfl2QsM
   YR28c+zHpp0YbFfyx7nP440id/CEeCio5Q8bBQxSAZ15DZl4hQYn3OqMU
   UzdPaifNL6wy670aCNhZEPIcP0ncNYd0jQuCXc6PgddGG6BuP8Jc+vnXI
   mw2RIVkE/YVhJQoaJurR5M+t8+YnepcpV3UZs1Ys3QtGAFTXfZl3WRjaz
   GQAE/kuCVOVnA0hy8us3KkdwnP6qRpIhmQw61OfZFi6dg7xRpqGAw+w7y
   Ds18E+8bJJu9oxzVNOLcQt7mnTN5RFNIAuEiPj+mt+6f/8rWdHujyl+x9
   w==;
X-CSE-ConnectionGUID: ZoY/3lPLS+ytZ2Tkb6LWWw==
X-CSE-MsgGUID: 4s1NFwOlTgGRzxtks8valA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35161930"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="35161930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:47:37 -0800
X-CSE-ConnectionGUID: v1xvMQG4S7Si0Vd8F13FCw==
X-CSE-MsgGUID: pUV894kQT3K7wbqvTiMXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="97610679"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Dec 2024 17:47:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNj9x-000FyU-2q;
	Wed, 18 Dec 2024 01:47:33 +0000
Date: Wed, 18 Dec 2024 09:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 10597/30000]
 qcom-rpmh-regulator.c:undefined reference to `rpmh_write'
Message-ID: <202412180930.PwoWgRzy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   3348bc389f2b07ddaf6aa60f9f8e319b93ba4e3c
commit: a4d654c504ca4b3182b9ea2afa9ec0a23e304ec4 [10597/30000] FROMLIST: soc: qcom: rpmh: Allow RPMH driver to be loaded as a module
config: i386-buildonly-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241218/202412180930.PwoWgRzy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412180930.PwoWgRzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180930.PwoWgRzy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_set_mode_bypass':
>> qcom-rpmh-regulator.c:(.text+0x2f6): undefined reference to `rpmh_write'
   ld: drivers/regulator/qcom-rpmh-regulator.o: in function `_rpmh_regulator_vrm_set_voltage_sel':
   qcom-rpmh-regulator.c:(.text+0x498): undefined reference to `rpmh_write'
>> ld: qcom-rpmh-regulator.c:(.text+0x4ca): undefined reference to `rpmh_write_async'
   ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_set_enable_state':
   qcom-rpmh-regulator.c:(.text+0x5aa): undefined reference to `rpmh_write'
   ld: qcom-rpmh-regulator.c:(.text+0x5f0): undefined reference to `rpmh_write_async'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x39f): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x41a): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x44b): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x543): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x5de): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x6af): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x70c): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x760): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x79d): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x7e0): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x7eb): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x839): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0x878): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x897): undefined reference to `tty_set_operations'
   ld: hvc_console.c:(.text+0x8da): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x93f): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0xb4d): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xb98): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0xbe1): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0xd44): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xd96): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0xdd4): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0xdeb): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x1251): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0x1273): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x1339): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
   hvc_console.c:(.text.unlikely+0x54): undefined reference to `put_tty_driver'
   ld: hvc_console.c:(.text.unlikely+0x86): undefined reference to `put_tty_driver'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x32f3): undefined reference to `v4l_vb2q_enable_media_source'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x2ab): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x73b): undefined reference to `usb_get_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe.cold':
   pda_power.c:(.text.unlikely+0x9a): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0x71a): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: sc2731_charger.c:(.text+0x768): undefined reference to `usb_phy_get_charger_current'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
