Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A627EC73
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749158435; cv=none; b=oC1SQxsmMt2uDebtlXsxWZzqPIaHQeevDFCgNQ2oMRGE+dRUHr8Oj6zDar8W2CgVGjiqB6yfDnX3lBDvbBTfu+7Xfy7rbnvteoY+5qf4KrP0/w0tPGTA2mcaBvqrWVKUNg4zXw5B7EUFKsNn5d2EvjlM4KHcrn/+ujxn6KDVIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749158435; c=relaxed/simple;
	bh=p1R7YDwsTJvouQJrR0QWB5ZdeZeuhtIJhpX7/diqODo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oc/06cA3+NEgyhWwA+hI/tqKbgcLNF1Tut2Hef8maBzqFPuc1oGNnMxMKTkvs5e2GotCOlZj+5HZGgI0MA9hb+BRf3MRd232TfU+7h6gesxRkdJe2w0/DzTE0xQA6fa/M8vfLKmIYEu2gvFmrZ6wGCEaeThBPofVLm57VhG92iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAKxRZUC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAKxRZUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749158433; x=1780694433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1R7YDwsTJvouQJrR0QWB5ZdeZeuhtIJhpX7/diqODo=;
  b=QAKxRZUC0VPEyd0BLjTConvKJxBJl+4n5kqld8Zhoqz90PpDvBBbhq1T
   yDxvCJBIWtgbadFs4Ld/krrbElCWEioLTyoMOrA3Y4bdjlNkq5FBeNK/x
   lgIV9jqkCCRjolrv0WTPDh8x9fuKYcZMnS+bWn2wbaZvGm5me/7doXbHp
   lvKRCBp9eE/12uWEhVKp+R00Nq0XAs+QvMlYKvGISuU+HQ46OtPEfJNdF
   sRwAm8IVRkcnP36XfIK/H5gA6sR6Ar1DKHdH/8/fCwCOXPNuITmJZs0v5
   x0ytK1knihzngsoMYEujIupla64c6dUO+cQa3rai6Dolb/H4BNHb8YbAB
   g==;
X-CSE-ConnectionGUID: +TZjRnPlSjC216EnS8KTBQ==
X-CSE-MsgGUID: e65j2uv2RyGK2/uurmiElw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38929846"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="38929846"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 14:20:31 -0700
X-CSE-ConnectionGUID: j8Q8OUlCQ4KdOZYCINXcHQ==
X-CSE-MsgGUID: WddtSLyoSN6f23RdVVUMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="150456993"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2025 14:20:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNI0i-0004UV-04;
	Thu, 05 Jun 2025 21:20:28 +0000
Date: Fri, 6 Jun 2025 05:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 4/4] pda_power.c:undefined reference
 to `usb_put_phy'
Message-ID: <202506060551.eTVKD6kp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandeep,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f4357ac53bffd3331e69b90374f2a236f3aa7e0e
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [4/4] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060551.eTVKD6kp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060551.eTVKD6kp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060551.eTVKD6kp-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x32c): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x374): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x3ac): undefined reference to `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x4b0): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x550): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x57c): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x588): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x60c): undefined reference to `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x654): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x6a4): undefined reference to `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x95c): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x9a8): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0x9f4): undefined reference to `tty_hangup'
   aarch64-linux-ld: hvc_console.c:(.text+0xa78): undefined reference to `__tty_insert_flip_char'
   aarch64-linux-ld: hvc_console.c:(.text+0xb00): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xb24): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xdfc): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0xe0c): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0xe7c): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xff0): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1008): undefined reference to `tty_std_termios'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tty_std_termios' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hvc_console.c:(.text+0x1008): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hvc_console.c:(.text+0x100c): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0x1060): undefined reference to `tty_set_operations'
   aarch64-linux-ld: hvc_console.c:(.text+0x10a0): undefined reference to `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x10c8): undefined reference to `put_tty_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x1120): undefined reference to `tty_port_init'
   aarch64-linux-ld: hvc_console.c:(.text+0x1258): undefined reference to `put_tty_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x12ac): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x1308): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0x1314): undefined reference to `tty_vhangup'
   aarch64-linux-ld: drivers/power/supply/pda_power.o: in function `pda_power_remove':
>> pda_power.c:(.text+0x350): undefined reference to `usb_put_phy'
   aarch64-linux-ld: drivers/power/supply/pda_power.o: in function `pda_power_probe':
>> pda_power.c:(.text+0x740): undefined reference to `usb_get_phy'
>> aarch64-linux-ld: pda_power.c:(.text+0xa60): undefined reference to `usb_put_phy'
   aarch64-linux-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_probe':
   rt9455_charger.c:(.text+0x1440): undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x810): undefined reference to `devm_usb_get_phy_by_phandle'
   aarch64-linux-ld: isp1704_charger.c:(.text+0x824): undefined reference to `devm_usb_get_phy'
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0xcd4): undefined reference to `wext_handle_ioctl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
