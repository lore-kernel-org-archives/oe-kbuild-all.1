Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA331B4257
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753814818; cv=none; b=LD1fSCP5ZuZK18Bn0UrAA/L86IJrbl9o/Cyg/Z4KUiGDo8su0gLYGJqDJ5qBlvCNfz3e54+H56nxqA/f0aGRNSJFDIfT+zUkOzl4tWopeYBespnqGpkr6pTyn/9O7q0S080y5/uvYMOdhP8w4yDdLmG+URnwj81YseUEbmQmgXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753814818; c=relaxed/simple;
	bh=B0gA/6XcYdeSxe21pfe+YQSfBHRV91GfUTRfdkiTwP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKMFeneD3R6z0ALsZjTkWAhqmrpC9yK+3TkG2vjCKKDvOGplY/PbSW4tfexoNdqQQBBSDFL5/zlWhKZhITDOXNY7r8flbTdxQppP256f99+7bsuCHmlVecTuxyeLIOvZKRPfFvlvhkc6ewJpGWGA87Id1G6lh/psY9MSORmHYFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/Rq0JaR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/Rq0JaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753814817; x=1785350817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B0gA/6XcYdeSxe21pfe+YQSfBHRV91GfUTRfdkiTwP8=;
  b=F/Rq0JaRCNjRSMlmDZj3Anw/vc1XKFn9//I426haPRi5fagikH64KDPL
   yENcJQkT0BHLNvG37myPCd89Rs6Xu/UFi4iBxmAlWHj1fZEGBTc9MGwZg
   YamLiWH6LM1Ci8FGxZRYlGldPhZpZBMI3w3EUDSSzOX/BzclLX/oroUKY
   JQkVXYGj4d28+rG0BTjIcnMugOx2p4qSF9UC4jCtgeuA+EVh6OHf85VGE
   lgdJW1fOgJxeD3uiJTdBmzsQun+YPAbY1+JlNXNdXYWwz/r0Yzqh/dbXQ
   H/YIK2cM1ty+04fCC3Wz8vOy3bLMmYBZYNErqVOtTI/MFSZsBTqL8D5Ld
   Q==;
X-CSE-ConnectionGUID: KjYvRl4aSpK6rrcqOfJR6A==
X-CSE-MsgGUID: eQj15TpeTK2tCjMhwqDTmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55985654"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55985654"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 11:46:55 -0700
X-CSE-ConnectionGUID: qPl1pRwtQHiWhFrnkW1jCg==
X-CSE-MsgGUID: tc0xzsF+Sd6BmXLGvyqvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163129797"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jul 2025 11:46:53 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugpLf-0001aB-0r;
	Tue, 29 Jul 2025 18:46:51 +0000
Date: Wed, 30 Jul 2025 02:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202507300218.HRE0Ur8N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   9270bc60703895f1d77fe7da086bb8563cb1dded
commit: e091aa59b956dc60ca88a83ce3510a4de2d8dd59 [1/1] ANDROID: tracing: Add register read and write tracing support
config: arm64-randconfig-r113-20250729 (https://download.01.org/0day-ci/archive/20250730/202507300218.HRE0Ur8N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250730/202507300218.HRE0Ur8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300218.HRE0Ur8N-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x37c): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x40c): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x440): undefined reference to `tty_do_resize'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x53c): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x598): undefined reference to `tty_hung_up_p'
   aarch64-linux-ld: hvc_console.c:(.text+0x5e0): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: hvc_console.c:(.text+0x634): undefined reference to `tty_wait_until_sent'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
   hvc_console.c:(.text+0x6b4): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0x710): undefined reference to `tty_port_put'
   aarch64-linux-ld: hvc_console.c:(.text+0x71c): undefined reference to `tty_vhangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x780): undefined reference to `tty_port_tty_set'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_init':
   hvc_console.c:(.text+0x868): undefined reference to `__tty_alloc_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x87c): undefined reference to `tty_std_termios'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tty_std_termios' which may bind externally can not be used when making a shared object; recompile with -fPIC
   hvc_console.c:(.text+0x87c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: hvc_console.c:(.text+0x880): undefined reference to `tty_std_termios'
   aarch64-linux-ld: hvc_console.c:(.text+0x8e0): undefined reference to `tty_set_operations'
   aarch64-linux-ld: hvc_console.c:(.text+0x924): undefined reference to `tty_register_driver'
   aarch64-linux-ld: hvc_console.c:(.text+0x974): undefined reference to `put_tty_driver'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
   hvc_console.c:(.text+0xa48): undefined reference to `tty_port_init'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0xc34): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xc70): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0xcb4): undefined reference to `__tty_insert_flip_char'
   aarch64-linux-ld: hvc_console.c:(.text+0xd4c): undefined reference to `tty_flip_buffer_push'
   aarch64-linux-ld: hvc_console.c:(.text+0xd8c): undefined reference to `tty_buffer_request_room'
   aarch64-linux-ld: hvc_console.c:(.text+0xdf8): undefined reference to `tty_port_tty_get'
   aarch64-linux-ld: hvc_console.c:(.text+0xe64): undefined reference to `tty_wakeup'
   aarch64-linux-ld: hvc_console.c:(.text+0xec4): undefined reference to `tty_hangup'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x1324): undefined reference to `tty_port_install'
   aarch64-linux-ld: hvc_console.c:(.text+0x1348): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
   hvc_console.c:(.text+0x1460): undefined reference to `tty_port_put'
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x2be8): undefined reference to `v4l_vb2q_enable_media_source'
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
>> socket.c:(.text+0x24e4): undefined reference to `wext_handle_ioctl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
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
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_readwrite.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:37:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:59:1: sparse: sparse: cast removes address space '__iomem' of expression
   kernel/trace/trace_readwrite.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:37:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:59:1: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +13 include/trace/events/rwmmio.h

    12	
  > 13	TRACE_EVENT(rwmmio_write,
    14	
    15		TP_PROTO(unsigned long fn, u64 val, u8 width, volatile void __iomem *addr),
    16	
    17		TP_ARGS(fn, val, width, addr),
    18	
    19		TP_STRUCT__entry(
    20			__field(u64, fn)
    21			__field(u64, val)
    22			__field(u8, width)
    23			__field(u64, addr)
    24		),
    25	
    26		TP_fast_assign(
    27			__entry->fn = fn;
    28			__entry->val = val;
    29			__entry->width = width;
    30			__entry->addr = (u64)addr;
    31		),
    32	
    33		TP_printk("%pS write addr=%llx of width=%x val=0x%llx\n",
    34			__entry->fn, __entry->addr, __entry->width, __entry->val)
    35	);
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
