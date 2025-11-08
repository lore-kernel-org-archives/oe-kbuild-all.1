Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A161285074
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762591774; cv=none; b=UsudQxiTSPUb4MMQY+hqMQ1nAWIbd1bVhWlQ8DHf3KoX0QGFbzSGQWCLl5ZQhF68TWWgni0zjoirrvNIZVCSO67+OcFBHO5WwN7ecxqgnGPfTWQvc51VeWVbrNDTLS2ZQYtXXM9VPYmzFNSWjqxoaHZO4Y1oxDxeCEYFZAMyfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762591774; c=relaxed/simple;
	bh=STAbroN/MVy3uR5//VP0DPFslQqGClwEXJNxPHb31m0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+v+6MGUU39VCd5tgWq1FGKKfkU1AXR52hdhyPbn7zqnVQCxFDpgRSaKhGdEQYFSjubRWApNiXbK/BrC6X6DGsO1+LswLkSN3QWRozSCsHY76VqXT0f2EvJXIeCShp2xpizKtRm/uNmwec55RMyvNaP1kehbGxoI5oZkxwg2E8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgrloBmk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgrloBmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762591771; x=1794127771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STAbroN/MVy3uR5//VP0DPFslQqGClwEXJNxPHb31m0=;
  b=cgrloBmkveq9pak8xyVWZLHUOdkd3bLmSyiWZCwbotms4HxzTz+eGPAC
   3r5xBI8VbKB9CeUML4nBdDh/jEJYuL8wM9qlGL8QoJHiKIejw3DPRGA3C
   FP8/JJKTJxPxCmsHNCvPnZQFDx9cZ0AVnkgMJcvrsnToy0EW2ycCrtr8b
   Konx8fLU8eVTEmWRDniQnZOsjSNNcdO+9ucEFdOQiQtqE/j2p+1cBwGJO
   uNu1uaO+TXxo8LPoJonjK4R5J/BE1jPIddtSyNMLf2JXeNEeOqHoiGNlc
   D12RiUUyqHG0HKDY2Wl7timKsAf3lY2Xx53V3R+g3VnbOaVOc3hFJLGQC
   A==;
X-CSE-ConnectionGUID: mXxk5jGlQhKAty6KdoM96Q==
X-CSE-MsgGUID: I5TpQsjeRHe9RKWKK85gxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="90199768"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="90199768"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 00:49:31 -0800
X-CSE-ConnectionGUID: agVI1/23TC+FYafG4h/EnQ==
X-CSE-MsgGUID: ie/ueulqRni+6koY1H/kOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="192620584"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2025 00:49:30 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHedT-0000rf-15;
	Sat, 08 Nov 2025 08:49:27 +0000
Date: Sat, 8 Nov 2025 16:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 include/trace/hooks/binder.h:131:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202511081625.4qmhiszp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b1e3b721e19fab571dcfd5d4cc3c9fbd947bd6c9
commit: b13ee5ea88c0090e686cc168a5905f15a7cadc46 [1/1] ANDROID: vendor_hooks: add hook to record binder transaction info
config: x86_64-randconfig-r112-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081625.4qmhiszp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081625.4qmhiszp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081625.4qmhiszp-lkp@intel.com/

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
