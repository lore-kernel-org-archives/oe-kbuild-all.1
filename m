Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335741095A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KczTJzNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697192067; x=1728728067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9b2WOQtsPHs2P19GMcO+teov3DldBvH5IEpF3tD0WI=;
  b=KczTJzNs8UlGUZsBrYnwwgLlYURUPVQNyfHaEgcTf/+YIp9EHWhOeJyG
   zAii8weAUpCV+CDXJG/YYfX2wZkkZARVtJZV4W+/NRYdnrHwlFGoCngK2
   hraTfkZNmcfbS2PAeUj2KTdsHXHTfOs1COzaPFoStBpXcsrqBnA8xS6Oc
   jTJAAg+Hz8t+MdLXdKUxI9d5qA+Eb0+x4krpwsONHQv7BG1Iy1wDf6rbk
   /yfhqMmdCY5peyXD82PzKMNUvYKbzP7scdJBK9WiPyTvo8lApI9UbpFXg
   3rqi0J4hxHRBU8IE9DpUBokpKVxdiWTNPLaDw+Tw6hO0wLhoV23bi0z1r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416202063"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="416202063"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754653479"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="754653479"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 03:14:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFBQ-0004cb-1i;
	Fri, 13 Oct 2023 10:14:16 +0000
Date: Fri, 13 Oct 2023 18:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 868/23620] undefined reference to
 `tty_port_tty_get'
Message-ID: <202310131843.NmlKsNEY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   e2dadb5022c01186d167de5f89f821506f6a8cb6
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db [868/23620] ANDROID: GKI: build in HVC_DRIVER
config: arm64-randconfig-001-20231010 (https://download.01.org/0day-ci/archive/20231013/202310131843.NmlKsNEY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131843.NmlKsNEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131843.NmlKsNEY-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x350): undefined reference to `tty_port_put'
   hvc_console.c:(.text+0x350): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x424): undefined reference to `tty_port_tty_get'
   hvc_console.c:(.text+0x424): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x46c): undefined reference to `tty_do_resize'
   hvc_console.c:(.text+0x46c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x5cc): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x5cc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x6b0): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x6b0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x6f4): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x6f4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x708): undefined reference to `tty_port_put'
   hvc_console.c:(.text+0x708): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x794): undefined reference to `tty_hung_up_p'
   hvc_console.c:(.text+0x794): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x7ec): undefined reference to `tty_port_tty_set'
   hvc_console.c:(.text+0x7ec): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x87c): undefined reference to `tty_wait_until_sent'
   hvc_console.c:(.text+0x87c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
>> (.text+0x8d8): undefined reference to `tty_port_tty_get'
   (.text+0x8d8): additional relocation overflows omitted from the output
>> aarch64-linux-ld: (.text+0x958): undefined reference to `tty_port_put'
>> aarch64-linux-ld: (.text+0x964): undefined reference to `tty_vhangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
>> (.text+0xa10): undefined reference to `__tty_alloc_driver'
>> aarch64-linux-ld: (.text+0xa44): undefined reference to `tty_std_termios'
   aarch64-linux-ld: (.text+0xa54): undefined reference to `tty_std_termios'
   aarch64-linux-ld: (.text+0xad0): undefined reference to `tty_set_operations'
>> aarch64-linux-ld: (.text+0xb0c): undefined reference to `tty_register_driver'
   aarch64-linux-ld: (.text+0xb50): undefined reference to `put_tty_driver'
>> aarch64-linux-ld: (.text+0xbe4): undefined reference to `tty_port_init'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0xeb4): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xf30): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0xfac): undefined reference to `tty_hangup'
   aarch64-linux-ld: hvc_console.c:(.text+0x10d8): undefined reference to `__tty_insert_flip_char'
   aarch64-linux-ld: hvc_console.c:(.text+0x11ac): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0x11e0): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x1668): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0x1678): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
>> (.text+0x1c38): undefined reference to `tty_port_put'

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
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
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
