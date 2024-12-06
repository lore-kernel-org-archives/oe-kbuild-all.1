Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298EB17991
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 05:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733461609; cv=none; b=ghhtWFbSzWoUi+ZB8R7zPHa/8QUtLI2vjMnu9iK0cyYf7WAK5gJOyKSTyS4/POW4UwrXOTEtCxaGBakTT+KnI35FpRh2r7Jy/kAMLUuyIt6q+ENDSWS3K4qtv1yzVdpJlqSB8R9aOw/jacohFGzIUDlSG2c+8eo135jXdhH6Jt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733461609; c=relaxed/simple;
	bh=7ZtB8KqKOtK5AQ6zAXsfvhKqLc9QzsirMSgKOSdcdRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OG0oddTTlLvdPIQIhV6cgVr+qI5+AzExOqxFlQawlNCZv7icNoS5capsthiNMOlClAESW/GklbQFia5gK5sgflc99o5vrOzBZhJ8fNgD+Mt+BA/O3vUzQ3dF0Abu6/tELKobwLCejGM/Op9wNnisjB2MofR2nHBUZWYaLTkI5BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyBTJTSp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyBTJTSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733461608; x=1764997608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ZtB8KqKOtK5AQ6zAXsfvhKqLc9QzsirMSgKOSdcdRE=;
  b=LyBTJTSpkAu0Lsp397g+cQ0Hl9W6kP7C0mm+05Vk+vmuWqPPNqvcgXrv
   61+9HMrOHNF45tomCSyuy6wrOcDGXf6Khy6JWN9oLnrQoDov5OPHXORkz
   DdO8LzawemS4VzZz4+moyP1pYgmvoQvPiUz9CJA4utZrBrZ3HjSyb/KOs
   7ygSZsZ8FkSDROELtdqdJe36tbBAKAjd+QKXcthisC1VQGoDliiqX0Pn8
   I+ZwVo3FbHoYXkgUR1Lg4rOVQMXj9HN6T9LaaKZPWvvm4DHTC1pGy5p3y
   wvuSMoyRj9RlyeXDQgb/mG/9ZkGSaKXWAJTdbteF6hpkZNrLokejmlEcj
   A==;
X-CSE-ConnectionGUID: hXgwwBQRR/OLbl+sRQDqbA==
X-CSE-MsgGUID: +WTKjmHvSBud1nSMnO03dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33123710"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="33123710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 21:06:47 -0800
X-CSE-ConnectionGUID: /Rz1HwyeTae5IpS8Qtw2Wg==
X-CSE-MsgGUID: vvVv8xYtT/Ov/oR8C9xrZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94749828"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2024 21:06:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJQY7-0000id-2p;
	Fri, 06 Dec 2024 05:06:43 +0000
Date: Fri, 6 Dec 2024 13:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8/9] include/trace/hooks/sys.h:24:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202412061343.kIQucXWU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   d92a210e49a13fdc3fb2141d0dbc9f63bc642533
commit: e41b8e8e59bf118ee5eb422d531390a141117dd0 [8/9] ANDROID: vendor_hooks: add hooks in prctl_set_vma
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20241206/202412061343.kIQucXWU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061343.kIQucXWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061343.kIQucXWU-lkp@intel.com/

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
   kernel/sys.c:2813:25: sparse: sparse: self-comparison always evaluates to false

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
