Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0980129D0D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258703; cv=none; b=HI6m7jrjD3GQEt/2UkP9+H7RHHS0+qKc1EzNd+XslWj2i+BWcivh8T/GAlw5GGATefPK4nkTKNKMDNEcobJSi6aoYC3LZhMA2bCmXKA9YS89bt0l1PG9a1pStzoSgAbCABHEFR1iJobneUn+W27ttjMJuBSceHnIoSLVCluSLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258703; c=relaxed/simple;
	bh=HJvlG8WbbqkErQXuQqkI4iNdO/lRBgI4ldrzIehv59c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHTI7uJVEUo9ryxaNsmPzR2QyLGu6+y5ipMRUChXMNydLhRQu2m7DMaNRbvKL+IIfDujNhzF0DqW1kcFQYzBb4JvOo78ZQ7SrZww31ZyvlegBRVVKI0JT8XemdlslQlHl+rJy2f5770aZEn3GO10iE76evUBK4UU0yAz185OYtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bX10koh2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bX10koh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743258702; x=1774794702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJvlG8WbbqkErQXuQqkI4iNdO/lRBgI4ldrzIehv59c=;
  b=bX10koh2ofnUowwSt5GsCVtpv5axhRd62i4YDezLYG27on1s1MHrqYZH
   V2gL1Et7VfMtMAxS6yugFWD0YqIoEUwEr+T/7kWUpiuWMbNGgE6B15EHe
   L8UsGxGz05dtIPY5ZU6jE4XVP67pYgX7QhUQ/Vi0FxvrW9qt/Cnw335jW
   5Gh4LegdjcVEPoW4uUgJ9tNzVz4fsUYgvaqLDnJs9OLhZbc/4PSPC2p67
   /3L/tFvjyu8sbFgzDFQrbntfWQZ+yZ1LhVGSG8sUdT+oR32YfRfN8EvSi
   xO22uHlcnGr5YP98hlJPvXxfOdVKUBPVMsA9QB5Uswzkb0CgibgrkVFl7
   Q==;
X-CSE-ConnectionGUID: liaE5xjlSg2s3Ym4KQkOHQ==
X-CSE-MsgGUID: NLcupPUOTGC/EuLh7VaWpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="54808229"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="54808229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 07:31:41 -0700
X-CSE-ConnectionGUID: RiCPH7nqRYiKSG88Ig4Hag==
X-CSE-MsgGUID: dXwjyOUUTwqCx04QCemgZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="125933430"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Mar 2025 07:31:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyXDl-0008AQ-07;
	Sat, 29 Mar 2025 14:31:37 +0000
Date: Sat, 29 Mar 2025 22:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-lts 0/1]
 include/trace/hooks/delayacct.h:26:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202503292217.Ljz0ICew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-lts
head:   5e1b899f19c3d900664c1ca05c4714c24647d82b
commit: bb57557246d39dba8a66df7f43983fe1ec71bff6 [0/1] ANDROID: Add vendor_hooks to workaround CONFIG_TASK_DELAY_ACCT
config: x86_64-randconfig-123-20250329 (https://download.01.org/0day-ci/archive/20250329/202503292217.Ljz0ICew-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503292217.Ljz0ICew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503292217.Ljz0ICew-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/net.h:35:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/avc.h):
   include/trace/hooks/avc.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/creds.h):
   include/trace/hooks/creds.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/timekeeping.h):
   include/trace/hooks/timekeeping.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/timekeeping.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/timekeeping.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/audio_usboffload.h):
   include/trace/hooks/audio_usboffload.h:38:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/audio_usboffload.h:38:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/audio_usboffload.h:38:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/psci.h):
   include/trace/hooks/psci.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/psci.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/dmabuf.h):
   include/trace/hooks/dmabuf.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mmc.h):
   include/trace/hooks/mmc.h:55:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:55:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:55:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:59:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:59:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:59:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:75:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:75:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:75:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:79:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:79:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:79:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:83:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:83:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:83:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/delayacct.h):
>> include/trace/hooks/delayacct.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/delayacct.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/delayacct.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/delayacct.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/delayacct.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/delayacct.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/delayacct.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/delayacct.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/delayacct.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +26 include/trace/hooks/delayacct.h

    17	
    18	struct task_struct;
    19	struct taskstats;
    20	DECLARE_HOOK(android_vh_delayacct_set_flag,
    21		TP_PROTO(struct task_struct *p, int flag),
    22		TP_ARGS(p, flag));
    23	DECLARE_HOOK(android_vh_delayacct_clear_flag,
    24		TP_PROTO(struct task_struct *p, int flag),
    25		TP_ARGS(p, flag));
  > 26	DECLARE_RESTRICTED_HOOK(android_rvh_delayacct_init,
    27		TP_PROTO(void *unused),
    28		TP_ARGS(unused), 1);
    29	DECLARE_RESTRICTED_HOOK(android_rvh_delayacct_tsk_init,
    30		TP_PROTO(struct task_struct *tsk),
    31		TP_ARGS(tsk), 1);
    32	DECLARE_RESTRICTED_HOOK(android_rvh_delayacct_tsk_free,
    33		TP_PROTO(struct task_struct *tsk),
    34		TP_ARGS(tsk), 1);
    35	DECLARE_HOOK(android_vh_delayacct_blkio_start,
    36		TP_PROTO(void *unused),
    37		TP_ARGS(unused));
    38	DECLARE_HOOK(android_vh_delayacct_blkio_end,
    39		TP_PROTO(struct task_struct *p),
    40		TP_ARGS(p));
    41	DECLARE_HOOK(android_vh_delayacct_add_tsk,
    42		TP_PROTO(struct taskstats *d, struct task_struct *tsk, int *ret),
    43		TP_ARGS(d, tsk, ret));
    44	DECLARE_HOOK(android_vh_delayacct_blkio_ticks,
    45		TP_PROTO(struct task_struct *tsk, __u64 *ret),
    46		TP_ARGS(tsk, ret));
    47	DECLARE_HOOK(android_vh_delayacct_is_task_waiting_on_io,
    48		TP_PROTO(struct task_struct *tsk, int *ret),
    49		TP_ARGS(tsk, ret));
    50	DECLARE_HOOK(android_vh_delayacct_freepages_start,
    51		TP_PROTO(void *unused),
    52		TP_ARGS(unused));
    53	DECLARE_HOOK(android_vh_delayacct_freepages_end,
    54		TP_PROTO(void *unused),
    55		TP_ARGS(unused));
    56	DECLARE_HOOK(android_vh_delayacct_thrashing_start,
    57		TP_PROTO(void *unused),
    58		TP_ARGS(unused));
    59	DECLARE_HOOK(android_vh_delayacct_thrashing_end,
    60		TP_PROTO(void *unused),
    61		TP_ARGS(unused));
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
