Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5218C0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 23:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695945063; x=1727481063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPqLDSNk1kKk3Y5dD3Iu49yUK+n5SkW7LROh5U/nalE=;
  b=fZMO7uZRlNb9owoUjswF4co1f7aq/28+VKKKRWUTITSZLKwhf3Z1uPi/
   Xdd6a0s7+HrPIZPfS6JPyinQGWSr75QlXzoQvyCeAPMPm3G/iv7n6zxtn
   sK8v6geINuqjSqZU07jOYt4NH9xJydo+7IOn/cl4cVacn82cYrzRmHN22
   E2ws2ibpsN6PD842R0t5LsyQF06qIOI44atUhLa2iezUlVYT3t58C9Z0b
   enEHaHoYEWZaDynKiX844viUYaHaT6d8oGSUeRaPeTrJPTTLGgae8fWDV
   79hAxigzlAY59Upa2J92JUbndEqqGFX1pPaD2Za7QMXia1EdZWuKxTnUj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468482398"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="468482398"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 16:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="840099291"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="840099291"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2023 16:50:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm0mX-0002Aa-0e;
	Thu, 28 Sep 2023 23:50:57 +0000
Date: Fri, 29 Sep 2023 07:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 4460/27216] hvc_console.c:undefined
 reference to `tty_port_tty_get'
Message-ID: <202309290722.Bcf2ykW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   627da86f6d0621a5dc51e547bff9b42380b5ba4d
commit: c7e20e359ab33d7ce835b3975603623bb292c328 [4460/27216] ANDROID: GKI: build in HVC_DRIVER
config: x86_64-buildonly-randconfig-002-20230922 (https://download.01.org/0day-ci/archive/20230929/202309290722.Bcf2ykW7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290722.Bcf2ykW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290722.Bcf2ykW7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
>> hvc_console.c:(.text+0x373): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x3a5): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
>> hvc_console.c:(.text+0x4ae): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x532): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x5cb): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x5dc): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
>> hvc_console.c:(.text+0x60d): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x675): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x743): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x782): undefined reference to `tty_buffer_request_room'
>> ld: hvc_console.c:(.text+0x7c9): undefined reference to `__tty_insert_flip_char'
>> ld: hvc_console.c:(.text+0x889): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0x946): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x9a9): undefined reference to `tty_wakeup'
>> ld: hvc_console.c:(.text+0xa14): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
>> hvc_console.c:(.text+0xdcf): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xde8): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
>> hvc_console.c:(.text+0xe80): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xf19): undefined reference to `__tty_alloc_driver'
   ld: hvc_console.c:(.text+0xf57): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xf6a): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xf7a): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xf8d): undefined reference to `tty_std_termios'
   ld: hvc_console.c:(.text+0xf98): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:hvc_console.c:(.text+0xfa2): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xfab): undefined reference to `tty_set_operations'
>> ld: hvc_console.c:(.text+0xfeb): undefined reference to `tty_register_driver'
   ld: hvc_console.c:(.text+0x1045): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x11ef): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x123a): undefined reference to `tty_port_put'
   ld: hvc_console.c:(.text+0x1247): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x308): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x6cf): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
   hvc_console.c:(.text.unlikely+0x35): undefined reference to `put_tty_driver'
   ld: hvc_console.c:(.text.unlikely+0x6e): undefined reference to `put_tty_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
