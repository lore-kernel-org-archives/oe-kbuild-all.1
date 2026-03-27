Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E46215F7D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 05:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774588376; cv=none; b=WR7u/h/BdC9G270xnnSpAc9cND/jUxZCh87ZZjeDiS7/iDa88jfja484NnHNgF5JYUVoCMqxei4DRHkOCbINCvb+0Nc3O6MmBCwNNA9uwNq22GFjZFv0nlFzDt5CkW4gglRd3Yw/PzMTvU1H3+E4uvOTb4TWcToxAa8blPGAVEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774588376; c=relaxed/simple;
	bh=8Xu1z5Ke8UT4ryAoDx+NhmX1CwtXLcSCrYnU89sCERo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h0Xq4D0CLIKZZXEfL9ZEjqSGQgwd/0ctwoq39fmXsNlw7SMsx/CUN65UN1tOhouqzsfb2OiBS06aCKAI52p+h7YD3Xhh19AGP8/9GAhNxPihJUHSLPOHT5N5CeWKMG4J+2yh10+P7Tnopc/r+FubnJOiP9jFdt1BYQHP/PFhgeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edAuiVuC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edAuiVuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774588375; x=1806124375;
  h=date:from:to:cc:subject:message-id;
  bh=8Xu1z5Ke8UT4ryAoDx+NhmX1CwtXLcSCrYnU89sCERo=;
  b=edAuiVuCq3x0PwzvHKZZvYaVHMRGcK123+to1say9qHQygwx9oizgTyq
   JPeQz7PO137GPhKM0tiNvbT7kNyDuuAvN8U7/Uw2xk7waAQOTW2SwES/1
   Slb38WJw8GklPjd6Hz546kj9ixchgYbJcqo3vAXPyvaMlJlmRhP+kapoS
   2E+a6fRlluhQJn0S5bIWPeCqo0CpfX0trlFEy3U95lVBjEVjW/HpwJpzw
   lu8TXkElrq5Zi4HpD2Cuh52KKPOCsDDgHktordGcUaPVCviLdem9khcWb
   I4meDqEEqhEzV94Srfv2rjC+6O8sxlAOAghxLiFcij+B87Yspj3MkKC8e
   Q==;
X-CSE-ConnectionGUID: /VD5Y5x2SqKHv1kG8dMgRA==
X-CSE-MsgGUID: Xb1Mb+UsRoWRgzhG/SatxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75857264"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75857264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 22:12:54 -0700
X-CSE-ConnectionGUID: PCzCX6n3SCynmrXKmfYaoQ==
X-CSE-MsgGUID: GXV+mY5xR3GibEF6pzhg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="220358328"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2026 22:12:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5zV3-000000009oZ-37NF;
	Fri, 27 Mar 2026 05:12:49 +0000
Date: Fri, 27 Mar 2026 13:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/1]
 include/trace/hooks/binder.h:131:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202603271337.JCgzecW6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   7db1e563d6f73706150a812a21f13e5fbc14efde
commit: b13ee5ea88c0090e686cc168a5905f15a7cadc46 [0/1] ANDROID: vendor_hooks: add hook to record binder transaction info
config: i386-randconfig-061-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271337.JCgzecW6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271337.JCgzecW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271337.JCgzecW6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/android/binderfs.c: note: in included file:
>> include/trace/hooks/binder.h:131:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/binder.h:131:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/binder.h:131:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/binder.h):
>> include/trace/hooks/binder.h:131:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/binder.h:131:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/binder.h:131:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/wqlockup.h):
   include/trace/hooks/wqlockup.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/wqlockup.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/wqlockup.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/wqlockup.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/wqlockup.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/wqlockup.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cpufreq.h:41:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:41:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:41:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:42:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:42:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:42:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:46:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:46:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:46:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fs.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fs.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fs.h:64:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fs.h:64:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fs.h:64:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/vmscan.h:88:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:88:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:88:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/vmscan.h:91:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:91:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:91:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   include/trace/hooks/creds.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/selinux.h):
   include/trace/hooks/selinux.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/selinux.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/selinux.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):

vim +131 include/trace/hooks/binder.h

    21	
    22	DECLARE_HOOK(android_vh_binder_transaction_init,
    23		TP_PROTO(struct binder_transaction *t),
    24		TP_ARGS(t));
    25	DECLARE_HOOK(android_vh_binder_set_priority,
    26		TP_PROTO(struct binder_transaction *t, struct task_struct *task),
    27		TP_ARGS(t, task));
    28	DECLARE_HOOK(android_vh_binder_restore_priority,
    29		TP_PROTO(struct binder_transaction *t, struct task_struct *task),
    30		TP_ARGS(t, task));
    31	DECLARE_HOOK(android_vh_binder_alloc_new_buf_locked,
    32		TP_PROTO(size_t size, size_t *free_async_space, int is_async, bool *should_fail),
    33		TP_ARGS(size, free_async_space, is_async, should_fail));
    34	DECLARE_HOOK(android_vh_binder_wait_for_work,
    35		TP_PROTO(bool do_proc_work, struct binder_thread *tsk, struct binder_proc *proc),
    36		TP_ARGS(do_proc_work, tsk, proc));
    37	DECLARE_HOOK(android_vh_sync_txn_recvd,
    38		TP_PROTO(struct task_struct *tsk, struct task_struct *from),
    39		TP_ARGS(tsk, from));
    40	DECLARE_HOOK(android_vh_binder_proc_transaction_finish,
    41		TP_PROTO(struct binder_proc *proc, struct binder_transaction *t,
    42			struct task_struct *binder_th_task, bool pending_async, bool sync),
    43		TP_ARGS(proc, t, binder_th_task, pending_async, sync));
    44	DECLARE_HOOK(android_vh_binder_select_special_worklist,
    45		TP_PROTO(struct list_head **list, struct binder_thread *thread, struct binder_proc *proc,
    46		int wait_for_proc_work, bool *nothing_to_do),
    47		TP_ARGS(list, thread, proc, wait_for_proc_work, nothing_to_do));
    48	DECLARE_HOOK(android_vh_alloc_oem_binder_struct,
    49		TP_PROTO(struct binder_transaction_data *tr, struct binder_transaction *t,
    50			struct binder_proc *proc),
    51		TP_ARGS(tr, t, proc));
    52	DECLARE_HOOK(android_vh_binder_transaction_received,
    53		TP_PROTO(struct binder_transaction *t, struct binder_proc *proc,
    54			struct binder_thread *thread, uint32_t cmd),
    55		TP_ARGS(t, proc, thread, cmd));
    56	DECLARE_HOOK(android_vh_free_oem_binder_struct,
    57		TP_PROTO(struct binder_transaction *t),
    58		TP_ARGS(t));
    59	DECLARE_HOOK(android_vh_binder_special_task,
    60		TP_PROTO(struct binder_transaction *t, struct binder_proc *proc,
    61			struct binder_thread *thread, struct binder_work *w,
    62			struct list_head *head, bool sync, bool *special_task),
    63		TP_ARGS(t, proc, thread, w, head, sync, special_task));
    64	DECLARE_HOOK(android_vh_binder_buffer_release,
    65		TP_PROTO(struct binder_proc *proc, struct binder_thread *thread,
    66			struct binder_buffer *buffer, bool has_transaction),
    67		TP_ARGS(proc, thread, buffer, has_transaction));
    68	DECLARE_HOOK(android_vh_binder_ioctl_end,
    69		TP_PROTO(struct task_struct *caller_task,
    70			unsigned int cmd,
    71			unsigned long arg,
    72			struct binder_thread *thread,
    73			struct binder_proc *proc,
    74			int *ret),
    75		TP_ARGS(caller_task, cmd, arg, thread, proc, ret));
    76	DECLARE_HOOK(android_vh_binder_looper_exited,
    77		TP_PROTO(struct binder_thread *thread, struct binder_proc *proc),
    78		TP_ARGS(thread, proc));
    79	DECLARE_HOOK(android_vh_binder_spawn_new_thread,
    80		TP_PROTO(struct binder_thread *thread, struct binder_proc *proc, bool *force_spawn),
    81		TP_ARGS(thread, proc, force_spawn));
    82	DECLARE_HOOK(android_vh_binder_has_special_work_ilocked,
    83		TP_PROTO(struct binder_thread *thread, bool do_proc_work, bool *has_work),
    84		TP_ARGS(thread, do_proc_work, has_work));
    85	DECLARE_HOOK(android_vh_binder_list_add_work,
    86		TP_PROTO(struct binder_work *work, struct list_head *target_list),
    87		TP_ARGS(work, target_list));
    88	DECLARE_HOOK(android_vh_binder_has_proc_work_ilocked,
    89		TP_PROTO(struct binder_thread *thread, bool do_proc_work, bool *has_work),
    90		TP_ARGS(thread, do_proc_work, has_work));
    91	DECLARE_HOOK(android_vh_binder_check_special_work,
    92		TP_PROTO(struct binder_proc *proc, struct list_head **special_list),
    93		TP_ARGS(proc, special_list));
    94	DECLARE_HOOK(android_vh_binder_free_proc,
    95		TP_PROTO(struct binder_proc *proc),
    96		TP_ARGS(proc));
    97	DECLARE_HOOK(android_vh_binder_preset,
    98		TP_PROTO(struct hlist_head *hhead, struct mutex *lock, struct binder_proc *proc),
    99		TP_ARGS(hhead, lock, proc));
   100	DECLARE_HOOK(android_vh_binder_reply,
   101		TP_PROTO(struct binder_proc *target_proc, struct binder_proc *proc,
   102			struct binder_thread *thread, struct binder_transaction_data *tr),
   103		TP_ARGS(target_proc, proc, thread, tr));
   104	DECLARE_HOOK(android_vh_binder_trans,
   105		TP_PROTO(struct binder_proc *target_proc, struct binder_proc *proc,
   106			struct binder_thread *thread, struct binder_transaction_data *tr),
   107		TP_ARGS(target_proc, proc, thread, tr));
   108	DECLARE_HOOK(android_vh_binder_proc_transaction,
   109		TP_PROTO(struct task_struct *caller_task, struct task_struct *binder_proc_task,
   110			struct task_struct *binder_th_task, int node_debug_id,
   111			struct binder_transaction *t, bool pending_async),
   112		TP_ARGS(caller_task, binder_proc_task, binder_th_task, node_debug_id, t, pending_async));
   113	DECLARE_HOOK(android_vh_binder_thread_read,
   114		TP_PROTO(struct list_head **list, struct binder_proc *proc,
   115			struct binder_thread *thread),
   116		TP_ARGS(list, proc, thread));
   117	DECLARE_HOOK(android_vh_binder_transaction_record,
   118		TP_PROTO(struct binder_transaction_data *tr,
   119			struct binder_transaction *t,
   120			struct binder_transaction *in_reply_to),
   121		TP_ARGS(tr, t, in_reply_to));
   122	DECLARE_HOOK(android_vh_binder_data_preset,
   123		TP_PROTO(struct hlist_head *binder_procs,
   124			struct mutex *binder_procs_lock,
   125			struct binder_transaction_log *binder_transaction_log,
   126			struct binder_transaction_log *binder_transaction_log_failed,
   127			size_t size),
   128		TP_ARGS(binder_procs,
   129			binder_procs_lock, binder_transaction_log,
   130			binder_transaction_log_failed, size));
 > 131	DECLARE_RESTRICTED_HOOK(android_rvh_init_binder_logs,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
