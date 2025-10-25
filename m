Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080491DF759
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761398470; cv=none; b=i02J51OSFM1YUVEtFmfw5NBTtQdadVPXlHz0ZZHuHXZ2qu4IyE6hU9CWAXP8cUqiG5lYLsp08vc/VrP4MY2kYx0NXCceTwM1jXT7oQ+O7HB/Kp9p2wupnBecA/K5+xZ3kGOAE1qAHf4yzXtufNSxqd0tRnDxAMb/5TOzpxY+0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761398470; c=relaxed/simple;
	bh=Kfrdv3+o3NYOWFgyEvqbobGr72qc0zrcbbmKKuL1hAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFeiPOgfRrAj/2+Q/K4qvcbSbTXSSoaLztFNEN8O1lVFJkrYjgNoVCFFg5nSCtEk8E1YFSMFYwzyO/JI3hFCwBSQC9vp6uFSiz94bXJBqpF2PzMKzR1MylkVPaUUmJTi+nionnCWAqBQLg5RS/vaD/WmysYCADmSS11XtmXIdLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFzf1YhJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFzf1YhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761398468; x=1792934468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kfrdv3+o3NYOWFgyEvqbobGr72qc0zrcbbmKKuL1hAs=;
  b=UFzf1YhJk3xiydTFgUlFf1OSX3LFMkaFP+lQTeX+ReY7PxsUGVyV2bXa
   uzbKKHVqiKFmF/QI7rMt1ezJOwt9P+SnR5T4llDuFSIavYNGcOzN0F4Lp
   rLffuys3m3UiPtqb7ZYvVtRXdfm07Rskw0i/en8VsjU+/fe6E6h1ACJMW
   2F1+tbVpoCm4bVgRC3NStpEI07qc6TDjWcvRgwijRjlzPmU5WKTcqkp0y
   n4ODTO5LrLn+zimQeSwKGSg61bz9zcf/nlAftmLsaYk3t3W9pj1hoBa94
   57JOhqExCztms39ka5hMIe3xr4fBYuC/8nld5H3D9lN6Su7ILGso0Q660
   Q==;
X-CSE-ConnectionGUID: 8fxXuM9tTX6p0j9v+aOatQ==
X-CSE-MsgGUID: 8Q/CW2R+TEy1jUS5Bx52Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74997423"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="74997423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 06:21:07 -0700
X-CSE-ConnectionGUID: aOCjTfFITeWKVeaM30YUyw==
X-CSE-MsgGUID: VWcIIrtIR7uZ2wumINCKWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="183828112"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Oct 2025 06:21:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCeCd-000FKT-1A;
	Sat, 25 Oct 2025 13:21:03 +0000
Date: Sat, 25 Oct 2025 21:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/sys.h:24:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202510252143.gges1vB4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cf7e6e9ee1a5d1be5002e412a58ed3a45bb8e892
commit: e41b8e8e59bf118ee5eb422d531390a141117dd0 [1/1] ANDROID: vendor_hooks: add hooks in prctl_set_vma
config: x86_64-randconfig-121-20251025 (https://download.01.org/0day-ci/archive/20251025/202510252143.gges1vB4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510252143.gges1vB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510252143.gges1vB4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sys.c:1104:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1104:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1104:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/sys.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:757:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:757:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:757:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/sys.c: note: in included file:
>> include/trace/hooks/sys.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sys.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sys.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +24 include/trace/hooks/sys.h

     9	
    10	struct task_struct;
    11	DECLARE_HOOK(android_vh_syscall_prctl_finished,
    12		TP_PROTO(int option, struct task_struct *task),
    13		TP_ARGS(option, task));
    14	
    15	struct mm_struct;
    16	struct anon_vma_name;
    17	DECLARE_HOOK(android_vh_anon_vma_name_recog,
    18		TP_PROTO(struct mm_struct *mm, struct anon_vma_name *anon_name),
    19		TP_ARGS(mm, anon_name));
    20	DECLARE_HOOK(android_vh_restore_mm_flags,
    21		TP_PROTO(struct mm_struct *mm),
    22		TP_ARGS(mm));
    23	
  > 24	DECLARE_RESTRICTED_HOOK(android_rvh_pr_set_vma_name_bypass,
    25		TP_PROTO(struct mm_struct *mm, unsigned long addr, unsigned long size,
    26			      struct anon_vma_name *anon_name, int *error, bool *bypass),
    27		TP_ARGS(mm, addr, size, anon_name, error, bypass), 1);
    28	#endif
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
