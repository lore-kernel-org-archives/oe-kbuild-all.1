Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA02F6F2F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770457179; cv=none; b=hpzROUOM5X6rKIJhZbOVxZdsaWILSN9pDbWu1699n1qJkVdpSao4iRQn+19mSbwFh7EkjUdH+Kv8E7ylECSR98QeEqjCgHUxw/oBtUyJXzAKdRJ3I01GKs2uaImmJcOSYqHrXA5Dvdfhep01RdcJ/UAyXtEiFSPn7bGiaIUuiqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770457179; c=relaxed/simple;
	bh=ALj4NaUGq9lexqazQGV90LjikBnXBwadCWR0dzBiuGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RnQIzBJF5msxrGxIJaQ0luY78jl2pM6bqR3IOg6kWoG7A1J7o/MfmsP1ago6DOjCH7gXKNlzyyowxux+bMPTD/S4R0c6QXj+DBjcHQ9s5Cx4SAcQxU0q37ZmyhYoN3siUqU9DvglqWJ1DU9Sj8zEABFFy4PhHACUdyGxEvPlCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJtk8xKE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJtk8xKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770457179; x=1801993179;
  h=date:from:to:cc:subject:message-id;
  bh=ALj4NaUGq9lexqazQGV90LjikBnXBwadCWR0dzBiuGE=;
  b=BJtk8xKEYoPRJAa6Bf/BMqxqk+97Q5KI+MNVIQHUf5ZDMOZJV4LBe9Bo
   X1eSk17lqMrVIfahkxFcgDr7v5WM5nO8fs07STVlpYrY4Uly2i8ovsCg+
   H2kHOZSdGVPqj67WGBPkJ97AZgwadOJwVDHeSFRGDKlpt50Q++mRWCLsF
   I4v7UN6ILRFQP01iz7wCeLeGcOk3MBCCGaHrpT/Yg1AOaZn3CeVBEGlhP
   Uv5if3POv2ajhJUVeGix+R9e8EjpBhqqiD+6auMsvzoTbVgh2PTv/RUYE
   b+kFNRRERtMpIZaE1bFzRUEC16gEaHsfm/wF5rJU6sG2CradmVQoOEDCB
   Q==;
X-CSE-ConnectionGUID: RVMj0ZS1Tp2/3gjUxt1wEA==
X-CSE-MsgGUID: g7UAWjl1RiiN0Ryt0aOBvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70845827"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70845827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 01:39:39 -0800
X-CSE-ConnectionGUID: mJL8m76IRVm1WJhcETS4UA==
X-CSE-MsgGUID: NMwYEaL3RJulPjafaVSPQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="234046598"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 01:39:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voemt-00000000lXe-28V2;
	Sat, 07 Feb 2026 09:39:35 +0000
Date: Sat, 07 Feb 2026 17:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/dtask.h:85:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202602071706.Lu4avaVj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eeee2f3cb9b462b9954fc31022a42fe014fbdc24
commit: 458cdb59f7719f81504d392daa95a8c99c30c276 [1/1] ANDROID: GKI: add percpu_rwsem vendor hooks
config: i386-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071706.Lu4avaVj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071706.Lu4avaVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071706.Lu4avaVj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/percpu-rwsem.c: note: in included file:
>> include/trace/hooks/dtask.h:85:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dtask.h:85:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dtask.h:85:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +85 include/trace/hooks/dtask.h

    21	
    22	DECLARE_HOOK(android_vh_mutex_wait_start,
    23		TP_PROTO(struct mutex *lock),
    24		TP_ARGS(lock));
    25	DECLARE_HOOK(android_vh_mutex_wait_finish,
    26		TP_PROTO(struct mutex *lock),
    27		TP_ARGS(lock));
    28	DECLARE_HOOK(android_vh_mutex_opt_spin_start,
    29		TP_PROTO(struct mutex *lock, bool *time_out, int *cnt),
    30		TP_ARGS(lock, time_out, cnt));
    31	DECLARE_HOOK(android_vh_mutex_opt_spin_finish,
    32		TP_PROTO(struct mutex *lock, bool taken),
    33		TP_ARGS(lock, taken));
    34	DECLARE_HOOK(android_vh_mutex_can_spin_on_owner,
    35		TP_PROTO(struct mutex *lock, int *retval),
    36		TP_ARGS(lock, retval));
    37	DECLARE_HOOK(android_vh_mutex_init,
    38		TP_PROTO(struct mutex *lock),
    39		TP_ARGS(lock));
    40	
    41	DECLARE_HOOK(android_vh_rtmutex_wait_start,
    42		TP_PROTO(struct rt_mutex_base *lock),
    43		TP_ARGS(lock));
    44	DECLARE_HOOK(android_vh_rtmutex_wait_finish,
    45		TP_PROTO(struct rt_mutex_base *lock),
    46		TP_ARGS(lock));
    47	DECLARE_HOOK(android_vh_rt_mutex_steal,
    48		TP_PROTO(int waiter_prio, int top_waiter_prio, bool *ret),
    49		TP_ARGS(waiter_prio, top_waiter_prio, ret));
    50	
    51	DECLARE_HOOK(android_vh_rwsem_read_wait_start,
    52		TP_PROTO(struct rw_semaphore *sem),
    53		TP_ARGS(sem));
    54	DECLARE_HOOK(android_vh_rwsem_read_wait_finish,
    55		TP_PROTO(struct rw_semaphore *sem),
    56		TP_ARGS(sem));
    57	DECLARE_HOOK(android_vh_rwsem_write_wait_start,
    58		TP_PROTO(struct rw_semaphore *sem),
    59		TP_ARGS(sem));
    60	DECLARE_HOOK(android_vh_rwsem_write_wait_finish,
    61		TP_PROTO(struct rw_semaphore *sem),
    62		TP_ARGS(sem));
    63	DECLARE_HOOK(android_vh_rwsem_opt_spin_start,
    64		TP_PROTO(struct rw_semaphore *sem, bool *time_out, int *cnt, bool chk_only),
    65		TP_ARGS(sem, time_out, cnt, chk_only));
    66	DECLARE_HOOK(android_vh_rwsem_opt_spin_finish,
    67		TP_PROTO(struct rw_semaphore *sem, bool taken),
    68		TP_ARGS(sem, taken));
    69	DECLARE_HOOK(android_vh_rwsem_can_spin_on_owner,
    70		TP_PROTO(struct rw_semaphore *sem, bool *ret),
    71		TP_ARGS(sem, ret));
    72	
    73	DECLARE_HOOK(android_vh_sched_show_task,
    74		TP_PROTO(struct task_struct *task),
    75		TP_ARGS(task));
    76	DECLARE_HOOK(android_vh_percpu_rwsem_wq_add,
    77		TP_PROTO(struct percpu_rw_semaphore *sem, bool reader),
    78		TP_ARGS(sem, reader));
    79	DECLARE_HOOK(android_vh_percpu_rwsem_down_read,
    80		TP_PROTO(struct percpu_rw_semaphore *sem, bool try, bool *ret),
    81		TP_ARGS(sem, try, ret));
    82	DECLARE_HOOK(android_vh_percpu_rwsem_up_write,
    83		TP_PROTO(struct percpu_rw_semaphore *sem),
    84		TP_ARGS(sem));
  > 85	DECLARE_RESTRICTED_HOOK(android_rvh_percpu_rwsem_wait_complete,
    86		TP_PROTO(struct percpu_rw_semaphore *sem, long state, bool *complete),
    87		TP_ARGS(sem, state, complete), 1);
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
