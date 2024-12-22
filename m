Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDF5376
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 01:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734830591; cv=none; b=uL9SDpCmceUtCIS04jemn/AZvQAHZ0HezoTK/V+Ni1vxOfd6HDZteF524LNr7doC+zIm56QY7ocJANZo8Wob1cEwiORyyad+2NezOiyRBjOo/TCHquNGyAL9LlI1f9tYqCsOYw8+ED3aDAvfS1/fIKp9dVJqChslY8Sg0y+o6Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734830591; c=relaxed/simple;
	bh=+wwunIiIs4q2DQsZG+VYhppH1dR8aG6Sno5GV+1MYxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oX66Bxn4FbCS42a31DNs/7PzVMClbPOkSieiYC2tR3C2wFWoI8iNP9ZCXtSBZMKKGMJGdeFcWSCHY+gG+1GL+YOVC8b0XzslCki0jxNmp2kN2YZUrxQf4tQ8F76VI8zsWwyS515lJp3uyzyU7z3Py/EMPWMFV8BYg/fW26MRyGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qx3bVVZn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qx3bVVZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734830588; x=1766366588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wwunIiIs4q2DQsZG+VYhppH1dR8aG6Sno5GV+1MYxQ=;
  b=Qx3bVVZn4sD4FeevYOWcraZLCvjAN54jAKvyG0cAQYsLYoiMBRxFJif3
   kZL7A3ElGCUDitQef7tRHrMvABxzzlV9i5ZVTlOLJ8+La/29LYDoJltI+
   C3OXm8diGBfAc5bH0GCccfKbZGSsLUzvaUDNDILWSzZRV3+s2VYgutxwe
   ZfgLHff1E2mOP/JrD34ZTpBZGSQbtgbDYF7opFk+YW2Gu8z3H9b6BUZ/M
   ACDDD9FdTbCe7xP62iDCLrbiSpEDg/5ilqffxYDQXf1C4f3hvojETpoFe
   kGM+O2WjQo8LkhN30qnWzqK3lW5tEGTktC9x1DImQMCb7dz5KSPwxHQYh
   A==;
X-CSE-ConnectionGUID: TBss+mc+Ru6gXiPIXazCeg==
X-CSE-MsgGUID: 78XhxHBZR5GA1pHPAt+lpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35367673"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35367673"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 17:23:07 -0800
X-CSE-ConnectionGUID: DQ4D3vsZSLCOnPuO4AnS6A==
X-CSE-MsgGUID: jxaEBNSPSR6bvF6RI0HHNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99089758"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2024 17:23:06 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPAgS-0002e7-0m;
	Sun, 22 Dec 2024 01:23:04 +0000
Date: Sun, 22 Dec 2024 09:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Baisong Zhong <zhongbaisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not
 used
Message-ID: <202412220957.YMZbEEtD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baisong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84a3bf7f4aa669c05e3884497774148ac111468
commit: 28f152cd0926596e69d412467b11b6fe6fe4e864 sched/rt: fix build error when CONFIG_SYSCTL is disable
date:   2 years, 9 months ago
config: s390-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220957.YMZbEEtD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220957.YMZbEEtD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220957.YMZbEEtD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/rt.c:309:6: warning: no previous prototype for 'unregister_rt_sched_group' [-Wmissing-prototypes]
     309 | void unregister_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:311:6: warning: no previous prototype for 'free_rt_sched_group' [-Wmissing-prototypes]
     311 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:313:5: warning: no previous prototype for 'alloc_rt_sched_group' [-Wmissing-prototypes]
     313 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:716:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     716 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~
   In file included from arch/s390/include/asm/bitops.h:39,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   In function '__atomic_add',
       inlined from '__preempt_count_add' at arch/s390/include/asm/preempt.h:52:3:
   arch/s390/include/asm/atomic_ops.h:52:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
      52 |         asm volatile(                                                   \
         |         ^~~
   arch/s390/include/asm/atomic_ops.h:61:9: note: in expansion of macro '__ATOMIC_OP'
      61 |         __ATOMIC_OP(op_name, op_type, op_string, "\n")                  \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/atomic_ops.h:64:1: note: in expansion of macro '__ATOMIC_OPS'
      64 | __ATOMIC_OPS(__atomic_add, int, "laa")
         | ^~~~~~~~~~~~
   In function '__preempt_count_add':
   cc1: note: source object is likely at address zero
   In function '__atomic_add',
       inlined from '__preempt_count_add' at arch/s390/include/asm/preempt.h:52:3:
   arch/s390/include/asm/atomic_ops.h:52:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
      52 |         asm volatile(                                                   \
         |         ^~~
   arch/s390/include/asm/atomic_ops.h:61:9: note: in expansion of macro '__ATOMIC_OP'
      61 |         __ATOMIC_OP(op_name, op_type, op_string, "\n")                  \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/atomic_ops.h:64:1: note: in expansion of macro '__ATOMIC_OPS'
      64 | __ATOMIC_OPS(__atomic_add, int, "laa")
         | ^~~~~~~~~~~~
   In function '__preempt_count_add':
   cc1: note: source object is likely at address zero
   In function '__atomic_and',
       inlined from 'set_preempt_need_resched' at arch/s390/include/asm/preempt.h:34:2,
       inlined from 'do_idle' at kernel/sched/idle.c:315:2:
   arch/s390/include/asm/atomic_ops.h:52:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
      52 |         asm volatile(                                                   \
         |         ^~~
   arch/s390/include/asm/atomic_ops.h:61:9: note: in expansion of macro '__ATOMIC_OP'
      61 |         __ATOMIC_OP(op_name, op_type, op_string, "\n")                  \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/atomic_ops.h:65:1: note: in expansion of macro '__ATOMIC_OPS'
      65 | __ATOMIC_OPS(__atomic_and, int, "lan")
         | ^~~~~~~~~~~~
   In function 'do_idle':
   cc1: note: source object is likely at address zero
   In function '__atomic_and',
       inlined from 'set_preempt_need_resched' at arch/s390/include/asm/preempt.h:34:2,
       inlined from 'do_idle' at kernel/sched/idle.c:315:2:
   arch/s390/include/asm/atomic_ops.h:52:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
      52 |         asm volatile(                                                   \
         |         ^~~
   arch/s390/include/asm/atomic_ops.h:61:9: note: in expansion of macro '__ATOMIC_OP'
      61 |         __ATOMIC_OP(op_name, op_type, op_string, "\n")                  \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/atomic_ops.h:65:1: note: in expansion of macro '__ATOMIC_OPS'
      65 | __ATOMIC_OPS(__atomic_and, int, "lan")
         | ^~~~~~~~~~~~
   In function 'do_idle':
   cc1: note: source object is likely at address zero
   In function '__atomic_and',
       inlined from 'set_preempt_need_resched' at arch/s390/include/asm/preempt.h:34:2,
       inlined from 'play_idle_precise' at kernel/sched/idle.c:390:2:
   arch/s390/include/asm/atomic_ops.h:52:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
      52 |         asm volatile(                                                   \
         |         ^~~
   arch/s390/include/asm/atomic_ops.h:61:9: note: in expansion of macro '__ATOMIC_OP'
      61 |         __ATOMIC_OP(op_name, op_type, op_string, "\n")                  \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/atomic_ops.h:65:1: note: in expansion of macro '__ATOMIC_OPS'
      65 | __ATOMIC_OPS(__atomic_and, int, "lan")
         | ^~~~~~~~~~~~
   In function 'play_idle_precise':
   cc1: note: source object is likely at address zero
   In function '__atomic_and',
       inlined from 'set_preempt_need_resched' at arch/s390/include/asm/preempt.h:34:2,
       inlined from 'play_idle_precise' at kernel/sched/idle.c:390:2:
   arch/s390/include/asm/atomic_ops.h:52:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
      52 |         asm volatile(                                                   \
         |         ^~~
   arch/s390/include/asm/atomic_ops.h:61:9: note: in expansion of macro '__ATOMIC_OP'
      61 |         __ATOMIC_OP(op_name, op_type, op_string, "\n")                  \
         |         ^~~~~~~~~~~
   arch/s390/include/asm/atomic_ops.h:65:1: note: in expansion of macro '__ATOMIC_OPS'
      65 | __ATOMIC_OPS(__atomic_and, int, "lan")
         | ^~~~~~~~~~~~
   In function 'play_idle_precise':
   cc1: note: source object is likely at address zero
   In file included from ./arch/s390/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12:
   In function 'preempt_count',
       inlined from 'account_system_time' at kernel/sched/cputime.c:188:31:
   include/asm-generic/rwonce.h:44:26: warning: array subscript 0 is outside array bounds of 'const volatile int[0]' [-Warray-bounds=]


vim +/max_rt_runtime +9 kernel/sched/rt.c

d505b8af58912a Huaixin Chang  2020-04-25  @9  static const u64 max_rt_runtime = MAX_BW;
ce0dbbbb30aee6 Clark Williams 2013-02-07  10  

:::::: The code at line 9 was first introduced by commit
:::::: d505b8af58912ae1e1a211fabc9995b19bd40828 sched: Defend cfs and rt bandwidth quota against overflow

:::::: TO: Huaixin Chang <changhuaixin@linux.alibaba.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
