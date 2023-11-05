Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2E89474
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 12:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9kuTpd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699186931; x=1730722931;
  h=date:from:cc:subject:message-id:mime-version;
  bh=NjglhRiJKHys12vcu06dA5E/bvWrVqgwjP9SSm3lziY=;
  b=J9kuTpd3p+9uHmqAs8ZjWWjh27+pP79I6KESO2e7cqIGySDouXw58KCk
   uR/+cfivQ9pey7bPYabQ70jLYN2q19kGomJfx2r6WoEkm6nzKQ4eHyA7L
   XUS5y4W6AJgFsrfwkAmgaM02YDvw8XLLdnw2l6lB+QhyoA2MdiX91Cl8E
   gcR8PrbQJBbIHgczl5CvJtx7SiFeuq0aga6GgRL3r91BViAF31W12qiJU
   C1yQMisXGf0tjZwwOa5BY2qVt63g/3nnwqUAWCfP3nodGIfbbBi7yn6+3
   b+GO813kvd+7ISyMIxJmUObHc1zy9GHl+xOPvgPPVmSilnq5D3HjC0RyA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="392009499"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392009499"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 04:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="935551879"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="935551879"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Nov 2023 04:22:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzc8j-0005Pn-23
	for oe-kbuild-all@lists.linux.dev;
	Sun, 05 Nov 2023 12:22:05 +0000
Date: Sun, 5 Nov 2023 20:21:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 2645/25757] xtensa-linux-ld:
 hvc_console.c:undefined reference to `tty_port_install'
Message-ID: <202311052017.3y3TyJSn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   5455d4dc654c79d773b594b4703d5919bf217095
commit: 7889eed9171e6988176a877d677d5f291185d186 [2645/25757] Merge 54a728dc5e4fe ("Merge tag 'sched-core-2021-06-28' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip") into android-mainline
config: xtensa-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20231105/202311052017.3y3TyJSn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052017.3y3TyJSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052017.3y3TyJSn-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   xtensa-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   xtensa-linux-ld: warning: drivers/of/unittest-data/testcases.dtb.o: missing .note.GNU-stack section implies executable stack
   xtensa-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   xtensa-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_console_print':
   hvc_console.c:(.text+0x490): undefined reference to `tty_port_put'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_push':
   hvc_console.c:(.text+0x4af): undefined reference to `tty_port_put'
   xtensa-linux-ld: hvc_console.c:(.text+0x50c): undefined reference to `tty_port_tty_get'
   xtensa-linux-ld: hvc_console.c:(.text+0x510): undefined reference to `tty_do_resize'
   xtensa-linux-ld: hvc_console.c:(.text+0x568): undefined reference to `tty_port_tty_get'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x5a2): undefined reference to `tty_do_resize'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x650): undefined reference to `tty_port_tty_set'
   xtensa-linux-ld: hvc_console.c:(.text+0x6c3): undefined reference to `tty_port_tty_set'
   xtensa-linux-ld: hvc_console.c:(.text+0x70c): undefined reference to `tty_hung_up_p'
   xtensa-linux-ld: hvc_console.c:(.text+0x710): undefined reference to `tty_wait_until_sent'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_port_destruct':
   hvc_console.c:(.text+0x732): undefined reference to `tty_hung_up_p'
   xtensa-linux-ld: hvc_console.c:(.text+0x774): undefined reference to `tty_port_tty_set'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x804): undefined reference to `tty_wait_until_sent'
   xtensa-linux-ld: hvc_console.c:(.text+0x85c): undefined reference to `tty_vhangup'
   xtensa-linux-ld: hvc_console.c:(.text+0x86f): undefined reference to `tty_port_tty_get'
   xtensa-linux-ld: hvc_console.c:(.text+0x8d8): undefined reference to `tty_port_put'
   xtensa-linux-ld: hvc_console.c:(.text+0x8e2): undefined reference to `tty_vhangup'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x8f4): undefined reference to `tty_std_termios'
   xtensa-linux-ld: hvc_console.c:(.text+0x92c): undefined reference to `tty_set_operations'
   xtensa-linux-ld: hvc_console.c:(.text+0x934): undefined reference to `tty_register_driver'
   xtensa-linux-ld: hvc_console.c:(.text+0x938): undefined reference to `put_tty_driver'
   xtensa-linux-ld: hvc_console.c:(.text+0x940): undefined reference to `tty_port_init'
   xtensa-linux-ld: hvc_console.c:(.text+0x948): undefined reference to `__tty_alloc_driver'
   xtensa-linux-ld: hvc_console.c:(.text+0xa0b): undefined reference to `tty_set_operations'
   xtensa-linux-ld: hvc_console.c:(.text+0xa37): undefined reference to `tty_register_driver'
   xtensa-linux-ld: hvc_console.c:(.text+0xa56): undefined reference to `put_tty_driver'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0xa76): undefined reference to `put_tty_driver'
   xtensa-linux-ld: hvc_console.c:(.text+0xaef): undefined reference to `tty_port_init'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xca2): undefined reference to `__tty_alloc_driver'
   xtensa-linux-ld: hvc_console.c:(.text+0xcd4): undefined reference to `tty_buffer_request_room'
   xtensa-linux-ld: hvc_console.c:(.text+0xcd8): undefined reference to `tty_hangup'
   xtensa-linux-ld: hvc_console.c:(.text+0xcdc): undefined reference to `__tty_insert_flip_char'
   xtensa-linux-ld: hvc_console.c:(.text+0xce0): undefined reference to `tty_wakeup'
   xtensa-linux-ld: hvc_console.c:(.text+0xce4): undefined reference to `tty_flip_buffer_push'
   xtensa-linux-ld: hvc_console.c:(.text+0xdb6): undefined reference to `tty_port_tty_get'
   xtensa-linux-ld: hvc_console.c:(.text+0xe0e): undefined reference to `tty_buffer_request_room'
   xtensa-linux-ld: hvc_console.c:(.text+0xe62): undefined reference to `tty_hangup'
   xtensa-linux-ld: hvc_console.c:(.text+0xf10): undefined reference to `__tty_insert_flip_char'
   xtensa-linux-ld: hvc_console.c:(.text+0xfa0): undefined reference to `tty_wakeup'
   xtensa-linux-ld: hvc_console.c:(.text+0xfbf): undefined reference to `tty_flip_buffer_push'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `khvcd':
   hvc_console.c:(.text+0x13ec): undefined reference to `tty_port_install'
>> xtensa-linux-ld: hvc_console.c:(.text+0x1422): undefined reference to `tty_port_install'
   xtensa-linux-ld: hvc_console.c:(.text+0x142e): undefined reference to `tty_port_put'
   xtensa-linux-ld: hvc_console.c:(.text+0x14ae): undefined reference to `tty_port_put'
   xtensa-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_write':
   hvc_console.c:(.text+0x156f): undefined reference to `tty_port_tty_set'
   xtensa-linux-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_pwr_rdy_work_callback':
   rt9455_charger.c:(.text+0x11c0): undefined reference to `devm_usb_get_phy'
   xtensa-linux-ld: drivers/power/supply/rt9455_charger.o: in function `rt9455_hw_init':
   rt9455_charger.c:(.text+0x147a): undefined reference to `devm_usb_get_phy'
   xtensa-linux-ld: drivers/power/supply/bq25890_charger.o: in function `bq25890_irq_handler_thread':
   bq25890_charger.c:(.text+0xf2c): undefined reference to `devm_usb_get_phy'
   xtensa-linux-ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_hw_init':
   sc2731_charger.c:(.text+0x4dc): undefined reference to `devm_usb_get_phy_by_phandle'
   xtensa-linux-ld: sc2731_charger.c:(.text+0x4e0): undefined reference to `usb_phy_get_charger_current'
   xtensa-linux-ld: sc2731_charger.c:(.text+0x686): undefined reference to `devm_usb_get_phy_by_phandle'
   xtensa-linux-ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0x71a): undefined reference to `usb_phy_get_charger_current'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
