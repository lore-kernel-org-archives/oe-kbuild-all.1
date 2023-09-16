Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5823C3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 06:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694845162; x=1726381162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXsgtw/jl/p7ZXMUn4Q14NxVSvq5zxFmKRnT/LwoSmk=;
  b=SqRiqJx2uMON29rL0a+wSivrBM6OHa84tU3mR18GN+1/cSE5cGCe7FiZ
   Ol6W0MugYH3k6LFl/oeswU9KokkVEimon47LSSePPJM4r0JLitjEQ6bNs
   o3fawTJ2YvIEizQ/zPIDeF8OAXKDEkuEt+Rph2oirJYd2YhyqRFEU1td4
   3fIvJxmjsrF+BbgiiCi9M9OfbY0dhxH59+CKU8Ag7TwlEAGMc3dKK5Sg1
   qw7i/i1g1eyIIT5boVOI070CqcCv+hRFfKWsQBluP+cuQlOuKrPzRLS1e
   KfogV2UKuDJs6oZYR0ol/bjyYTc4jpR3OJnH3+JSnCD8aXE6dBYmPKHyr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465749081"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="465749081"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 23:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="1076008125"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="1076008125"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2023 23:19:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhOeE-0003xO-0Z;
	Sat, 16 Sep 2023 06:19:18 +0000
Date: Sat, 16 Sep 2023 14:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5/6]
 include/trace/hooks/cgroup.h:21:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202309161456.rcJPL945-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   4f9b4aec2e8615331919b1c300269ecf07cd71f0
commit: d4f032e36b84cba331ff9b5e16aa4d447c44391a [5/6] ANDROID: cgroup: Add android_rvh_cgroup_force_kthread_migration
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230916/202309161456.rcJPL945-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161456.rcJPL945-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161456.rcJPL945-lkp@intel.com/

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
