Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80DD2FF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 04:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725598029; cv=none; b=soUZPEiRRVQ6TQ7Ztk3Jfn0zwPC/pXMx2XiWA7RXxstgQ7o2/PD+LHtEvx7GKLygzMP7Ukb215h9amKkqa1AO7SNiiPLtjXyISpuAxqjtXXwC/q5crWbYOtHDfqHWorrY1+30QYs8nGGbB4301M0XePZL0LcVdA9Gb/ICksObyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725598029; c=relaxed/simple;
	bh=6FS6TFwzAxrKdDyboG85WbJqlbwlxUbarF2/LZdyr3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ECmit0O5swb+Yy9cqoAi16q6UZ9s5tfMlNRzIh+vbe35Mmv59yZA96OiuGAkf1rObGtnzJi/V6qhGe4FWQ5A2C9gRmMWQFRu+Jt5pHXBaRqi4/EQMTF3YawrySRpbVcY8Mke1sjBnVbSNpdmjHAeeQDcsfvZrKuXONzzNfjtacw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcS224Tt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcS224Tt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725598027; x=1757134027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6FS6TFwzAxrKdDyboG85WbJqlbwlxUbarF2/LZdyr3k=;
  b=OcS224TtbIbFgfqWVoUwe4UkYnsgADFm5I2Xj5v8ngC4TlGboBoPCeNz
   JWLBBfToM4MO5yXReTc7uvALZbKrb8OK86gzwZD21UqHNsCIBhOJKxLmu
   yl3OY4RgsJJ1YBbNHjgSJ/nQWCwBbw1xFcuKqxXkh3G+vUDCvx6+ByVYy
   K5YL/MBJA39sE6y39KerZNS7wQYYJytiwz68zBiXlHvbOaIWb14aRu0tm
   Np4xi7qUtyyHfWjiheEh9jhQ6t+nryI6cYDawzlfvDxRuCWcd2f/utOFb
   pTwa3ZC2M5E5pTPodHkFRE18HCxnan21KGtGyiPk+5yxx0tBZfRpoJ58C
   g==;
X-CSE-ConnectionGUID: 3xVkLFofTDSykcL/thf+4A==
X-CSE-MsgGUID: d4NAPfqOShetXmJHLgiS6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23852354"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="23852354"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 21:47:07 -0700
X-CSE-ConnectionGUID: LxuHwL0ATI+0ha8JX9SnvQ==
X-CSE-MsgGUID: 894pwC5JSzez8EfF5evX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="89098876"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2024 21:47:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smQsB-000AeT-27;
	Fri, 06 Sep 2024 04:47:03 +0000
Date: Fri, 6 Sep 2024 12:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 868/5359] ld:
 hvc_console.c:undefined reference to `tty_do_resize'
Message-ID: <202409061209.F4Oixuwm-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   3cd9ef1c2800d7c5beb986710497712d866b78c6
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db [868/5359] ANDROID: GKI: build in HVC_DRIVER
config: i386-buildonly-randconfig-002-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061209.F4Oixuwm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061209.F4Oixuwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061209.F4Oixuwm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x37a): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x3df): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x410): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x4e9): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x56c): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x60a): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x619): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x63e): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x69c): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x6ec): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
>> (.text+0x70f): undefined reference to `tty_port_tty_get'
   ld: (.text+0x753): undefined reference to `tty_port_put'
   ld: (.text+0x75e): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
>> (.text+0x7a4): undefined reference to `__tty_alloc_driver'
   ld: (.text+0x7e8): undefined reference to `tty_std_termios'
   ld: (.text+0x7f7): undefined reference to `tty_std_termios'
   ld: (.text+0x7ff): undefined reference to `tty_std_termios'
   ld: (.text+0x807): undefined reference to `tty_std_termios'
   ld: (.text+0x80f): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:(.text+0x817): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
>> (.text+0x849): undefined reference to `tty_set_operations'
   ld: (.text+0x87e): undefined reference to `tty_register_driver'
   ld: (.text+0x8e0): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0xaa8): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0xae8): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0xb30): undefined reference to `__tty_insert_flip_char'
>> ld: hvc_console.c:(.text+0xbf4): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0xcba): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0xd09): undefined reference to `tty_wakeup'
>> ld: hvc_console.c:(.text+0xd62): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x1163): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0x117b): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
>> (.text+0x1241): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
   hvc_console.c:(.text.unlikely+0x37): undefined reference to `put_tty_driver'
   ld: hvc_console.c:(.text.unlikely+0x68): undefined reference to `put_tty_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
