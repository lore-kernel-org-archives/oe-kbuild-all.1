Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD51170E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694441239; x=1725977239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ju8H2RNwtC/5xFIbUnLGmBz8I3NQwcp9FUX5c+4eZUw=;
  b=XMQ5CTTujknXIkJ4MWXyAoH1RfkeAx1JUwcwhAtLwXjaeCpnclOXEWyC
   ZDVmPABRxFYBoCOIUqAuetxoD/rX2eqt4eHVzz7ImSZAYJKoc1LUm28cZ
   9dwDGTP6e93T5NoXH7rv8n0W1+cvRljx82kgWiSOijwQWDhjsQ3x7lIXV
   FPjWSs2ox7HltqxkE8wmTjvC7yK1J+7ZzjGi1D4fN4raK3xw4agptjhKy
   J1O1LtqooAYmWaU0nDFa4OduoOi018MF93EPbuMUdd3qHoKnVu0FF9nf+
   b93FvAQFSPRJ/UzeHxKv7yyaYGJpH4HAzOlJKy6nVOwPPktKKfgVN7/sU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409059383"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="409059383"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 07:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778393683"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="778393683"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Sep 2023 07:07:17 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfhZI-0006Ii-2I;
	Mon, 11 Sep 2023 14:07:12 +0000
Date: Mon, 11 Sep 2023 22:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 868/28405] ld:
 hvc_console.c:undefined reference to `tty_do_resize'
Message-ID: <202309112208.hrm8d1Oc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   37d958fa8871b14db29738088a29b16c40f05ba1
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db [868/28405] ANDROID: GKI: build in HVC_DRIVER
config: i386-buildonly-randconfig-006-20230908 (https://download.01.org/0day-ci/archive/20230911/202309112208.hrm8d1Oc-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309112208.hrm8d1Oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309112208.hrm8d1Oc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x157): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x188): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x1b7): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x287): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x2e1): undefined reference to `tty_hung_up_p'
>> ld: hvc_console.c:(.text+0x326): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x373): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x45e): undefined reference to `tty_port_install'
>> ld: hvc_console.c:(.text+0x46b): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x50a): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x549): undefined reference to `tty_buffer_request_room'
>> ld: hvc_console.c:(.text+0x589): undefined reference to `tty_hangup'
>> ld: hvc_console.c:(.text+0x632): undefined reference to `__tty_insert_flip_char'
>> ld: hvc_console.c:(.text+0x69a): undefined reference to `tty_wakeup'
>> ld: hvc_console.c:(.text+0x6bc): undefined reference to `tty_flip_buffer_push'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x966): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x9fb): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0xa24): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0xa32): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xbd6): undefined reference to `__tty_alloc_driver'
>> ld: hvc_console.c:(.text+0xbf7): undefined reference to `tty_std_termios'
>> ld: hvc_console.c:(.text+0xc2d): undefined reference to `tty_set_operations'
>> ld: hvc_console.c:(.text+0xc66): undefined reference to `tty_register_driver'
>> ld: hvc_console.c:(.text+0xc97): undefined reference to `put_tty_driver'
>> ld: hvc_console.c:(.text+0xcfe): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0xe18): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xe5c): undefined reference to `tty_port_put'
>> ld: hvc_console.c:(.text+0xe67): undefined reference to `tty_vhangup'
   ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0x40): undefined reference to `input_unregister_device'
   ld: jack.c:(.text+0x47): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0xda): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0xe8): undefined reference to `input_register_device'
   ld: sound/core/jack.o: in function `snd_jack_new':
   jack.c:(.text+0x2a0): undefined reference to `input_allocate_device'
   ld: jack.c:(.text+0x2d2): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0x311): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x406): undefined reference to `input_event'
   ld: jack.c:(.text+0x43f): undefined reference to `input_event'
   ld: jack.c:(.text+0x44e): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
