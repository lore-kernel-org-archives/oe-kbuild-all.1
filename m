Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBE91C0DE0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 21:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711834985; cv=none; b=L5hPpeVDEOycu36ih52caKawwyJK5eGz7GjsVZP+PhNy58+vITu4zwv7H4wa7r5rwB1+w5Yy60n1FakOpn4VaVx2PCc/YcW0rNvpZsUGxy44NcXL9cWwrXFqG3t4yICrptkn8BA5gSpB8WEJnh3C3sCCxqaXRIPa8sqlpT2YV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711834985; c=relaxed/simple;
	bh=xTpAA22j7qbXWaH1UIvXj5d9xu1q9JSWJrHWxF0DApg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTSkDj376reK/x2V9zyGqku5V3C6oxlN+ged+V1zR1D0y11owPM8yK13QU+o30ue87dWrdoZ5K5Ek61cyZU1tchCVROLySix/7DhT579NdLMeqE8COBF/3lebeRlfCAkMecZM5gZeP4mTWVAnwTWmvJgMT4CYPnMQ6/cBo6cEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auI30992; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auI30992"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711834983; x=1743370983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTpAA22j7qbXWaH1UIvXj5d9xu1q9JSWJrHWxF0DApg=;
  b=auI30992zbUGIroOvAr6DO0iUET3kTLtaPfvZsbDzLuWwIvaRVqNttBp
   qZNIpKQAwge5dxGBu+4zTs5PBwYq8kouNt3qwWXK9vXHhrkOkJuwC7Lr+
   ExTEGugHuMkHg+mQy5oCp92MDJpbh2O0jXpbUu7VVaeHHtaCMu9Fvqk15
   ixQfKO8qYjZqqxqFU3/EkB391RLvDgm1/7uO+JZuKblU5SdQoWRMRuFZW
   BATw3Lobvd352Ew3hF+SH6q9DQPt8DNIxUJU/SM2LVXY1aI8u1hkW7HD3
   QtwOxXHwnu5k9Fj7+D5BtT+5s6umwpkaW183cnKUr1hniyq6ZWikSS4o6
   g==;
X-CSE-ConnectionGUID: QEyimJHEQgub/SDJb2dEoA==
X-CSE-MsgGUID: Kc2CihM0TmuMyNSilXn07A==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="7209996"
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="7209996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 14:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,168,1708416000"; 
   d="scan'208";a="17185611"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Mar 2024 14:43:01 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqgTb-0000R2-0J;
	Sat, 30 Mar 2024 21:42:59 +0000
Date: Sun, 31 Mar 2024 05:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/2] hvc_console.c:undefined
 reference to `tty_vhangup'
Message-ID: <202403310500.r2GyxhIE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   830a3b57edc6814ba9a50d25f1a504b3e50b9b38
commit: 66942fe0c9148cf125a25aeb6961b2bb690f6d8e [1/2] Merge 8c94ccc7cd69 ("Merge tag 'usb-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") into android-mainline
config: x86_64-buildonly-randconfig-005-20240329 (https://download.01.org/0day-ci/archive/20240331/202403310500.r2GyxhIE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310500.r2GyxhIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310500.r2GyxhIE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x3b3): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x3e5): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x676): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x73e): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x792): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x7d2): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x81a): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x85f): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x8aa): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x97c): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x9f3): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0xa95): undefined reference to `__tty_insert_flip_string_flags'
   ld: hvc_console.c:(.text+0xbb0): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0xbdb): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0xc31): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xdcd): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0xe07): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xe3a): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xe45): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xe50): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xe5b): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:hvc_console.c:(.text+0xe68): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xe9a): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0xefa): undefined reference to `tty_port_init'
   ld: hvc_console.c:(.text+0x1088): undefined reference to `tty_driver_kref_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x124e): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x1292): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0x12a2): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x338): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
>> hvc_console.c:(.text+0x8bb): undefined reference to `tty_vhangup'
   ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0x108): undefined reference to `input_free_device'
   ld: jack.c:(.text+0x122): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0x1c5): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0x1d8): undefined reference to `input_register_device'
   ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x362): undefined reference to `input_event'
   ld: jack.c:(.text+0x3b6): undefined reference to `input_event'
   ld: jack.c:(.text+0x3ca): undefined reference to `input_event'
   ld: sound/core/jack.o: in function `snd_jack_new':
   jack.c:(.text+0x4e8): undefined reference to `input_allocate_device'
   ld: jack.c:(.text+0x536): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0x595): undefined reference to `input_free_device'
   ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x23de): undefined reference to `wext_handle_ioctl'
   ld: net/socket.o: in function `compat_sock_ioctl':
   socket.c:(.text+0x25f5): undefined reference to `compat_wext_handle_ioctl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
