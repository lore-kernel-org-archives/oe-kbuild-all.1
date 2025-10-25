Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3959A2FF646
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761405926; cv=none; b=dW5UjH0wkJ4I+3q3Ff/BmzGoZ3L27I+SGqB29M3DDPaTFC+nfCnAsm9Ddj/BttPYMfZtquT1ww1ktrqYXUBJhHZn5n3zI7RXEsyzoEGOpHfsuM8uQip5z+V6EiOoxGUun04r+4eYdlfgd1LqAEZ+j061b9HTOgu2RyjYuHB4mqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761405926; c=relaxed/simple;
	bh=PrQQYTb9UlAi+Wk3iUTkfOq3sdbslVg9CwsRA6mWkC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsmAk0qhI7XRXpWg+DDGOgoKPV+5vEHI/Q1N13gG97cb9c4rNl3fFjTntLKsVN3GCXmlbWVNBnqcVPHFRULSNa3mfibQAqDzTOckReaVuP78cbL94inGGOooSWvtPZ1H/s/S2no7mjQNhg/CBX9p61pliQkjDz9/moqG0EErmGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJLUdDv2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJLUdDv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761405924; x=1792941924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PrQQYTb9UlAi+Wk3iUTkfOq3sdbslVg9CwsRA6mWkC0=;
  b=RJLUdDv2mjo9SdgT9FQXkB9+c2LQSXd+VidenU1PUgz143ZBJN7EQFfz
   xJWtZH8aCruRPCKhVcX4dpkxJAADHvQ8FohUoe4d+JB3xGszFRmg5zDnl
   7V1oDOk0xP1A6loCPVihXs7FirIIlmz/7/oU27ofyVTr0LEQMe/o8gh40
   d8OZQkApV/tym3YYN82e1iYxIM6PIkcMbQIWZ501jmHY6aedvV/gVNajl
   ycEjV7w8k+FbtYYjHSNCJhtNI7KOfOromZwiyNSWU8otttVaQ/yo7bsgj
   /c4zbvsmeOz4oTcnZfVdd6QFcvuzMGKU1LDZOtN7uKPugY83G576jBSvn
   Q==;
X-CSE-ConnectionGUID: 5kAJ7I8HQrOwFRqPU+mkpw==
X-CSE-MsgGUID: EsivjJ/UTMekGBWaLE/BJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51131648"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="51131648"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 08:25:23 -0700
X-CSE-ConnectionGUID: peua9q/kS2GyolNj/44o0Q==
X-CSE-MsgGUID: 2vlhGkwVTLiBXYToVAvKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="188720229"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2025 08:25:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCg8u-000FOD-19;
	Sat, 25 Oct 2025 15:25:20 +0000
Date: Sat, 25 Oct 2025 23:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/sys.h:24:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202510252316.vyIcZhHm-lkp@intel.com>
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
config: x86_64-randconfig-121-20251025 (https://download.01.org/0day-ci/archive/20251025/202510252316.vyIcZhHm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510252316.vyIcZhHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510252316.vyIcZhHm-lkp@intel.com/

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
