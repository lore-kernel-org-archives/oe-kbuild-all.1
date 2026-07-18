Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812D2727FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 03:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784345905; cv=none; b=V/IdV0Vpo2J8XkKyFT5tlEx6GqsqmrB5gODKoMsZzkU+/ZEx1iwgP5zct3+c8sbXSHcRe0y54L/XVi246tCdDLd/eyYk37j+O/jeY58xuoY40fbjYQA/GFVAbIj38a3IxzQTRbu1rPUWpovnfdHFBogQkyCPxJpfNwzSrBsNz7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784345905; c=relaxed/simple;
	bh=vV99gpyUlDsQK5q+R2EJXgRbqgRhZzWMQnQUYIOfRqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uWpwsVOCJ2Fm+m7pd12axQtolcvLqU3+gcF9kp2w0gYeJOZPVnng/0zG1F6mK8NLS9cquGKQ87FBTAZbxCHQm9X7dsU93mk3tj3ifw4BXlD8PgYGnqspCOXKp7ZNJEE8qS6qeRYRAxqEqpllTqrDiv8eO/da6DK+vWWbyGUeMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXVkDMBC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXVkDMBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784345903; x=1815881903;
  h=date:from:to:cc:subject:message-id;
  bh=vV99gpyUlDsQK5q+R2EJXgRbqgRhZzWMQnQUYIOfRqw=;
  b=LXVkDMBCuQHRNRfeZ6HQS2H3A1pIacnZxqFocgaAu9BFD5qQ9L/UWDRM
   9XXMFmoxP1NWGyPEaonUyOjBtkw9EsvF6ThWWCetTlrjtONAXLggldp6n
   drn+xIhdI6TbnoV6WV8vZT3u3xyiXrEfiC7lAvgkrPZ4gERtcBqXptykE
   JQ9Je79Y7i62o2U5Q0xTlsC1YGBEiUoYaoQKwlRDGXiC3wQwCup930+P8
   BhPwRBulNxjWlLt+5xmI3zCC21WmKohqkfIgAvONOKh14zawfZCLkbTbW
   eI0S9e2cNuN5Md/avCHHtgDN0iM1PyLVa+WqPJDaBh6FS+plOy9iiRaiM
   A==;
X-CSE-ConnectionGUID: /GpqaR2vT9SPyTrsrI4zHQ==
X-CSE-MsgGUID: uqcYpHEcTVmlp425iHSv4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="83998304"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="83998304"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 20:38:18 -0700
X-CSE-ConnectionGUID: GUGz6VJeQWi1ib35tRAikw==
X-CSE-MsgGUID: T18cBFsMTxGaq5HehVRUcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="250596955"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 20:38:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkvsU-00000000TQR-3wH0;
	Sat, 18 Jul 2026 03:38:14 +0000
Date: Sat, 18 Jul 2026 11:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/12]
 include/trace/hooks/binder.h:131:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202607181141.GklHqxFa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: b13ee5ea88c0090e686cc168a5905f15a7cadc46 [0/12] ANDROID: vendor_hooks: add hook to record binder transaction info
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20260718/202607181141.GklHqxFa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181141.GklHqxFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181141.GklHqxFa-lkp@intel.com/

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
