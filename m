Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D5929CF7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711724277; cv=none; b=UukUf/HLXyZR8jqVGdm8f2oQTH5CKnx7JnQolDjIMo0iNaTHo9U/cfWhpDoBoV6fs1RcCX2tmiXy2dm0062MWrBX8zXll1l+n8k0umzhBkB66afdaBn2AdS1HJpMCtq6uX/BUU4iaHB46EukNesJqDjW4j8I/8Ve70yP68c7KS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711724277; c=relaxed/simple;
	bh=TjhEnaqzXAhwRtnATYqehMcXttvucPnonSdm1pghEp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fG2DA2AeiJTPTfTceC5gbKIfOXgAlKL5wd5tHDgNIxeR5v+YrOYk01uAfa/lla9z4a3BQqpVihrBd7HizhM6CR3MYOqmyUpU7Ze+zAYYlzr9kGUPiX7lhOkuNPgs321zAJd9AOWyBWQlwBWrlBevyFILAzyKazKU18JU2IOjgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBAhfgRu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBAhfgRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711724275; x=1743260275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TjhEnaqzXAhwRtnATYqehMcXttvucPnonSdm1pghEp8=;
  b=KBAhfgRuS98mUgRCpGflhrNil3BYEdNcGTNxu4WkBaK0WYNeS8KMm3oC
   exGL3+odDnPTolSkjvcNI4mp82igicw+M4bgybi/EWR7lcnEz710Q8gvH
   dZVyKuXkNTNA4bNl1slJUbjZ8sF+wR0vegRdDIgtQ8dRnYup+ODvXVZRr
   kLR7UVjfqvKzZtbhfyuX2dDaDWaCtxYR6xr9IUVzbeyIb6AcRoSzNX8kc
   n5d5J8iijx+7gK4vHq3YtmlrEffK5MIbuCsAK8xgCrqASwV4g4NhATFRF
   47FKmeHCWtcVB5Crt2MGd3ElT4bypG0ukpHBmeWGKZZCVQqRJ1UK4Kc7W
   A==;
X-CSE-ConnectionGUID: t+NapxMtS+aHp5V+u+BDAg==
X-CSE-MsgGUID: /C4rOeDaTjiB00a0obBzdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="32316299"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="32316299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 07:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="21733070"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2024 07:57:54 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqDfz-0003I2-02;
	Fri, 29 Mar 2024 14:57:51 +0000
Date: Fri, 29 Mar 2024 22:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 5037/29873]
 da9150-charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202403292204.MhlVnkuY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   041e75aaccb4f83ecd969c31dc76d806db164020
commit: f7941b37ab1c4cc0a85a5617d32495908c3d08a2 [5037/29873] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-003-20240329 (https://download.01.org/0day-ci/archive/20240329/202403292204.MhlVnkuY-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403292204.MhlVnkuY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403292204.MhlVnkuY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: arch/x86/mm/ioremap.o: in function `__ioremap_caller':
   ioremap.c:(.text+0x374): undefined reference to `efi_mem_type'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x203): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x235): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x33f): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x3c2): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x461): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x474): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x49d): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x505): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x5cf): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x610): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0x65c): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0x6e9): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0x7ed): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0x845): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xad1): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xaeb): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xf00): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xfa8): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0xff3): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x1006): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x1011): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x101c): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0x1027): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:hvc_console.c:(.text+0x1031): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0x103a): undefined reference to `tty_set_operations'
   ld: hvc_console.c:(.text+0x107a): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x10e5): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x1290): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x12db): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x12e8): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x1b8): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x565): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
   hvc_console.c:(.text.unlikely+0x41): undefined reference to `put_tty_driver'
   ld: hvc_console.c:(.text.unlikely+0x7d): undefined reference to `put_tty_driver'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
   pda_power.c:(.text+0x1c0): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
   pda_power.c:(.text+0x712): undefined reference to `usb_get_phy'
   ld: drivers/power/supply/pda_power.o: in function `pda_power_probe.cold':
   pda_power.c:(.text.unlikely+0xd5): undefined reference to `usb_put_phy'
   ld: drivers/power/supply/da9150-charger.o: in function `da9150_charger_probe':
>> da9150-charger.c:(.text+0x6fa): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x16e): undefined reference to `devm_usb_get_phy_by_phandle'
   ld: isp1704_charger.c:(.text+0x3f8): undefined reference to `devm_usb_get_phy'
   ld: drivers/power/supply/twl4030_charger.o: in function `twl4030_bci_probe':
   twl4030_charger.c:(.text+0x1592): undefined reference to `devm_usb_get_phy_by_node'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
