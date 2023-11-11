Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA416FA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 05:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjUofqfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699681390; x=1731217390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHObY35zjI2v3E5oFjmsdhyjbfU5iyHq/73iMkzvmus=;
  b=TjUofqfed8dcOXTSU0Yj6La6QWyqsXBeSO3Ro/bO88+/T7ez5jRE8mnE
   8YhBfmAYjArmQ794W6XSPyU9g3EjUNmqIGe2rPGa3bXlwl3yogMQkGhUL
   w5q5bIae2amDX+99+8ojyyehT/guZb9F2dfk1EQWrzGjHuwvIZb2a0Q3p
   Md9J+Gi9gSOjqzUYiEaCeEh/7U3wLpIY7DqjZQXsGtEv4LkD/OWSn763T
   Fu2VmfC9cYTJgYWvNSuKszOjt77tL7WvsEA6EfSkTR6KXMvyyGfAy4EZX
   6hyLI0DAumkZI12PVuJo3fXYr5pjv+WxyBpfh51OcTRIR2jiyA0gIvUQA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387423121"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="387423121"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 21:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="12014591"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2023 21:43:05 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1glq-000AFA-2v;
	Sat, 11 Nov 2023 05:43:02 +0000
Date: Sat, 11 Nov 2023 13:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5/6]
 include/trace/hooks/cgroup.h:21:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202311111356.E6uw4rue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   d0dd647190e20389d3554d76653d0e06e35b9918
commit: d4f032e36b84cba331ff9b5e16aa4d447c44391a [5/6] ANDROID: cgroup: Add android_rvh_cgroup_force_kthread_migration
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231111/202311111356.E6uw4rue-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111356.E6uw4rue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111356.E6uw4rue-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/sched.h:147:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:147:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:147:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:151:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:151:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:151:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:155:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:155:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:155:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:159:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:159:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:159:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:163:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:163:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:163:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:167:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:167:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:167:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:171:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:171:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:171:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:176:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:176:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:176:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:180:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:180:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:180:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:184:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:184:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:184:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:188:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:188:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:188:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:193:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:193:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:193:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:197:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:197:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:197:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:202:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:202:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:202:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:206:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:206:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:206:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:210:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:210:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:210:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:214:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:214:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:214:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:218:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:218:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:218:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:237:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:237:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:237:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:240:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:240:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:240:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:243:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:243:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:243:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:247:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:247:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:247:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:252:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:252:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:252:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:257:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:257:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:257:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
>> include/trace/hooks/cgroup.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
   kernel/cgroup/cgroup.c:6281:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6281:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6281:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/cgroup.c:6284:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6284:43: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6284:43: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/cgroup.c: note: in included file:
>> include/trace/hooks/cgroup.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   kernel/cgroup/cgroup.c:2795:20: sparse: sparse: context imbalance in 'cgroup_procs_write_start' - wrong count at exit
   kernel/cgroup/cgroup.c:2875:9: sparse: sparse: context imbalance in 'cgroup_procs_write_finish' - wrong count at exit
   kernel/cgroup/cgroup.c:2986:9: sparse: sparse: context imbalance in 'cgroup_lock_and_drain_offline' - wrong count at exit
   kernel/cgroup/cgroup.c:4877:16: sparse: sparse: context imbalance in '__cgroup_procs_write' - wrong count at exit
   kernel/cgroup/cgroup.c:6064:12: sparse: sparse: context imbalance in 'cgroup_css_set_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6157:9: sparse: sparse: context imbalance in 'cgroup_css_set_put_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6185:5: sparse: sparse: context imbalance in 'cgroup_can_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6234:9: sparse: sparse: context imbalance in 'cgroup_cancel_fork' - unexpected unlock

vim +21 include/trace/hooks/cgroup.h

    10	
    11	struct task_struct;
    12	DECLARE_HOOK(android_vh_cgroup_set_task,
    13		TP_PROTO(int ret, struct task_struct *task),
    14		TP_ARGS(ret, task));
    15	
    16	struct cgroup_subsys;
    17	struct cgroup_taskset;
    18	DECLARE_HOOK(android_vh_cgroup_attach,
    19		TP_PROTO(struct cgroup_subsys *ss, struct cgroup_taskset *tset),
    20		TP_ARGS(ss, tset))
  > 21	DECLARE_RESTRICTED_HOOK(android_rvh_cgroup_force_kthread_migration,
    22		TP_PROTO(struct task_struct *tsk, struct cgroup *dst_cgrp, bool *force_migration),
    23		TP_ARGS(tsk, dst_cgrp, force_migration), 1);
    24	#endif
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
