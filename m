Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF35D8F78
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 17:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675185969; x=1706721969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IO/tOR1vT5BANtinC9MU3AQq+2NvDPaCFKfgiSDzGvE=;
  b=NkFQ5Ld2zubTMvg/JNJjjHwL8nXWMLTMNFUF0gkCXoHpSCffpnAQO0Qm
   mLiLHNwQ6bGoRYnofbbNFg3ASBjC2YPvnG/fEKfBH5TkU/wsgdh+UAnnh
   zRKDai4CHTB7FoHZZZNz+MnOvQQOOUvunbISX9lm9SET8vBWHGFsK4QTe
   4J7IxP3kAD/tFZGBgqJ9TxEjneO3KU42SHhhJSmUw1tI2+8FTABE8oZHw
   1U9etGv1g0RTS+kMmomfgjeq0PT6w5Z1eTybmKkd/eBSZMkmZ/11fowxG
   AZ9pRoaU/tTvFuBf3A0InZD8bGS3Dgap/gvIwIbdYWDVqOr6WNMiTPAB0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414115649"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="414115649"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 09:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="696899585"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="696899585"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2023 09:26:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMuOU-0004aK-0c;
	Tue, 31 Jan 2023 17:26:06 +0000
Date: Wed, 1 Feb 2023 01:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/urgent 1/1] kernel/cgroup/cpuset.c:3749:1:
 error: expected 'while' before 'bool'
Message-ID: <202302010148.eYoerj1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urgent
head:   4f4d0b01796a0e1cae148d96b32520ebabb3951f
commit: 4f4d0b01796a0e1cae148d96b32520ebabb3951f [1/1] cpuset: Fix cpuset_cpus_allowed() to not filter offline CPUs
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230201/202302010148.eYoerj1L-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4f4d0b01796a0e1cae148d96b32520ebabb3951f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/urgent
        git checkout 4f4d0b01796a0e1cae148d96b32520ebabb3951f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/cgroup/cpuset.c: In function 'cpuset_cpus_allowed':
>> kernel/cgroup/cpuset.c:3749:1: error: expected 'while' before 'bool'
    3749 | bool cpuset_cpus_allowed_fallback(struct task_struct *tsk)
         | ^~~~
   kernel/cgroup/cpuset.c:3783:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3783 | void __init cpuset_init_current_mems_allowed(void)
         | ^~~~
>> kernel/cgroup/cpuset.c:3829:23: error: invalid storage class for function 'nearest_hardwall_ancestor'
    3829 | static struct cpuset *nearest_hardwall_ancestor(struct cpuset *cs)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cpuset.c:3937:12: error: invalid storage class for function 'cpuset_spread_node'
    3937 | static int cpuset_spread_node(int *rotor)
         |            ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:9,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cgroup/cpuset.c:25:
>> kernel/cgroup/cpuset.c:3960:19: error: non-static declaration of 'cpuset_mem_spread_node' follows static declaration
    3960 | EXPORT_SYMBOL_GPL(cpuset_mem_spread_node);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:28: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3960:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3960 | EXPORT_SYMBOL_GPL(cpuset_mem_spread_node);
         | ^~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3942:5: note: previous definition of 'cpuset_mem_spread_node' with type 'int(void)'
    3942 | int cpuset_mem_spread_node(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cgroup/cpuset.c:25:
   include/linux/compiler.h:215:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     215 |         static void * __used __attrs \
         |         ^~~~~~
   include/linux/compiler.h:218:9: note: in expansion of macro '___ADDRESSABLE'
     218 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:41:9: note: in expansion of macro '__ADDRESSABLE'
      41 |         __ADDRESSABLE(sym)                                              \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:96:9: note: in expansion of macro '__KSYMTAB_ENTRY'
      96 |         __KSYMTAB_ENTRY(sym, sec)
         |         ^~~~~~~~~~~~~~~
   include/linux/export.h:140:41: note: in expansion of macro '___EXPORT_SYMBOL'
     140 | #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3960:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3960 | EXPORT_SYMBOL_GPL(cpuset_mem_spread_node);
         | ^~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3973:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3973 | int cpuset_mems_allowed_intersects(const struct task_struct *tsk1,
         | ^~~
>> kernel/cgroup/cpuset.c:4006:5: error: section attribute cannot be specified for local variables
    4006 | int cpuset_memory_pressure_enabled __read_mostly;
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cpuset.c:4080:1: error: expected declaration or statement at end of input
    4080 | }
         | ^
   kernel/cgroup/cpuset.c:4006:5: warning: unused variable 'cpuset_memory_pressure_enabled' [-Wunused-variable]
    4006 | int cpuset_memory_pressure_enabled __read_mostly;
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:9,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cgroup/cpuset.c:25:
   include/linux/export.h:89:27: warning: unused variable '__kstrtabns_cpuset_mem_spread_node' [-Wunused-variable]
      89 |         extern const char __kstrtabns_##sym[];                                  \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:140:41: note: in expansion of macro '___EXPORT_SYMBOL'
     140 | #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3960:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3960 | EXPORT_SYMBOL_GPL(cpuset_mem_spread_node);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:88:27: warning: unused variable '__kstrtab_cpuset_mem_spread_node' [-Wunused-variable]
      88 |         extern const char __kstrtab_##sym[];                                    \
         |                           ^~~~~~~~~~
   include/linux/export.h:140:41: note: in expansion of macro '___EXPORT_SYMBOL'
     140 | #define __EXPORT_SYMBOL(sym, sec, ns)   ___EXPORT_SYMBOL(sym, sec, ns)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3960:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    3960 | EXPORT_SYMBOL_GPL(cpuset_mem_spread_node);
         | ^~~~~~~~~~~~~~~~~
   At top level:
   kernel/cgroup/cpuset.c:4074:6: warning: 'cpuset_task_status_allowed' defined but not used [-Wunused-function]
    4074 | void cpuset_task_status_allowed(struct seq_file *m, struct task_struct *task)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4043:5: warning: 'proc_cpuset_show' defined but not used [-Wunused-function]
    4043 | int proc_cpuset_show(struct seq_file *m, struct pid_namespace *ns,
         |     ^~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4026:6: warning: '__cpuset_memory_pressure_bump' defined but not used [-Wunused-function]
    4026 | void __cpuset_memory_pressure_bump(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3985:6: warning: 'cpuset_print_current_mems_allowed' defined but not used [-Wunused-function]
    3985 | void cpuset_print_current_mems_allowed(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3973:5: warning: 'cpuset_mems_allowed_intersects' defined but not used [-Wunused-function]
    3973 | int cpuset_mems_allowed_intersects(const struct task_struct *tsk1,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3951:5: warning: 'cpuset_slab_spread_node' defined but not used [-Wunused-function]
    3951 | int cpuset_slab_spread_node(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3876:6: warning: '__cpuset_node_allowed' defined but not used [-Wunused-function]
    3876 | bool __cpuset_node_allowed(int node, gfp_t gfp_mask)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3818:5: warning: 'cpuset_nodemask_valid_mems_allowed' defined but not used [-Wunused-function]
    3818 | int cpuset_nodemask_valid_mems_allowed(nodemask_t *nodemask)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3798:12: warning: 'cpuset_mems_allowed' defined but not used [-Wunused-function]
    3798 | nodemask_t cpuset_mems_allowed(struct task_struct *tsk)
         |            ^~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3783:13: warning: 'cpuset_init_current_mems_allowed' defined but not used [-Wunused-function]
    3783 | void __init cpuset_init_current_mems_allowed(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +3749 kernel/cgroup/cpuset.c

^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3734  
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3735  /**
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3736   * cpuset_cpus_allowed_fallback - final fallback before complete catastrophe.
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3737   * @tsk: pointer to task_struct with which the scheduler is struggling
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3738   *
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3739   * Description: In the case that the scheduler cannot find an allowed cpu in
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3740   * tsk->cpus_allowed, we fall back to task_cs(tsk)->cpus_allowed. In legacy
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3741   * mode however, this value is the same as task_cs(tsk)->effective_cpus,
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3742   * which will not contain a sane cpumask during cases such as cpu hotplugging.
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3743   * This is the absolute last resort for the scheduler and it is only used if
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3744   * _every_ other avenue has been traveled.
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3745   *
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3746   * Returns true if the affinity of @tsk was changed, false otherwise.
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3747   **/
d477f8c202d1f0d kernel/cgroup/cpuset.c Joel Savitz      2019-06-12  3748  
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30 @3749  bool cpuset_cpus_allowed_fallback(struct task_struct *tsk)
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3750  {
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3751  	const struct cpumask *possible_mask = task_cpu_possible_mask(tsk);
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3752  	const struct cpumask *cs_mask;
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3753  	bool changed = false;
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3754  
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3755  	rcu_read_lock();
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3756  	cs_mask = task_cs(tsk)->cpus_allowed;
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3757  	if (is_in_v2_mode() && cpumask_subset(cs_mask, possible_mask)) {
d4b96fb92ae7fe7 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3758  		do_set_cpus_allowed(tsk, cs_mask);
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3759  		changed = true;
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3760  	}
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3761  	rcu_read_unlock();
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3762  
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3763  	/*
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3764  	 * We own tsk->cpus_allowed, nobody can change it under us.
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3765  	 *
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3766  	 * But we used cs && cs->cpus_allowed lockless and thus can
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3767  	 * race with cgroup_attach_task() or update_cpumask() and get
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3768  	 * the wrong tsk->cpus_allowed. However, both cases imply the
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3769  	 * subsequent cpuset_change_cpumask()->set_cpus_allowed_ptr()
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3770  	 * which takes task_rq_lock().
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3771  	 *
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3772  	 * If we are called after it dropped the lock we must see all
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3773  	 * changes in tsk_cs()->cpus_allowed. Otherwise we can temporary
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3774  	 * set any mask even if it is not right from task_cs() pov,
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3775  	 * the pending set_cpus_allowed_ptr() will fix things.
2baab4e90495ebc kernel/cpuset.c        Peter Zijlstra   2012-03-20  3776  	 *
2baab4e90495ebc kernel/cpuset.c        Peter Zijlstra   2012-03-20  3777  	 * select_fallback_rq() will fix things ups and set cpu_possible_mask
2baab4e90495ebc kernel/cpuset.c        Peter Zijlstra   2012-03-20  3778  	 * if required.
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3779  	 */
97c0054dbe2c3c5 kernel/cgroup/cpuset.c Will Deacon      2021-07-30  3780  	return changed;
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3781  }
9084bb8246ea935 kernel/cpuset.c        Oleg Nesterov    2010-03-15  3782  
8f4ab07f4bf1b10 kernel/cpuset.c        Rasmus Villemoes 2015-02-12  3783  void __init cpuset_init_current_mems_allowed(void)
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3784  {
f9a86fcbbb1e554 kernel/cpuset.c        Mike Travis      2008-04-04  3785  	nodes_setall(current->mems_allowed);
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3786  }
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3787  
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3788  /**
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3789   * cpuset_mems_allowed - return mems_allowed mask from a tasks cpuset.
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3790   * @tsk: pointer to task_struct from which to obtain cpuset->mems_allowed.
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3791   *
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3792   * Description: Returns the nodemask_t mems_allowed of the cpuset
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3793   * attached to the specified @tsk.  Guaranteed to return some non-empty
38d7bee9d24adf4 kernel/cpuset.c        Lai Jiangshan    2012-12-12  3794   * subset of node_states[N_MEMORY], even if this means going outside the
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3795   * tasks cpuset.
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3796   **/
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3797  
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3798  nodemask_t cpuset_mems_allowed(struct task_struct *tsk)
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3799  {
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3800  	nodemask_t mask;
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3801  	unsigned long flags;
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3802  
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3803  	spin_lock_irqsave(&callback_lock, flags);
b8dadcb58d542ec kernel/cpuset.c        Li Zefan         2014-03-03  3804  	rcu_read_lock();
ae1c802382f7af6 kernel/cpuset.c        Li Zefan         2014-07-09  3805  	guarantee_online_mems(task_cs(tsk), &mask);
b8dadcb58d542ec kernel/cpuset.c        Li Zefan         2014-03-03  3806  	rcu_read_unlock();
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3807  	spin_unlock_irqrestore(&callback_lock, flags);
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3808  
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3809  	return mask;
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3810  }
909d75a3b77bdd8 kernel/cpuset.c        Paul Jackson     2006-01-08  3811  
d9fd8a6d443b509 kernel/cpuset.c        Randy Dunlap     2005-07-27  3812  /**
08b2b6fdf6b2603 kernel/cgroup/cpuset.c Zhen Lei         2021-05-24  3813   * cpuset_nodemask_valid_mems_allowed - check nodemask vs. current mems_allowed
19770b32609b6bf kernel/cpuset.c        Mel Gorman       2008-04-28  3814   * @nodemask: the nodemask to be checked
d9fd8a6d443b509 kernel/cpuset.c        Randy Dunlap     2005-07-27  3815   *
19770b32609b6bf kernel/cpuset.c        Mel Gorman       2008-04-28  3816   * Are any of the nodes in the nodemask allowed in current->mems_allowed?
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3817   */
19770b32609b6bf kernel/cpuset.c        Mel Gorman       2008-04-28  3818  int cpuset_nodemask_valid_mems_allowed(nodemask_t *nodemask)
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3819  {
19770b32609b6bf kernel/cpuset.c        Mel Gorman       2008-04-28  3820  	return nodes_intersects(*nodemask, current->mems_allowed);
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3821  }
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3822  
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3823  /*
786083667e0ced8 kernel/cpuset.c        Paul Menage      2008-04-29  3824   * nearest_hardwall_ancestor() - Returns the nearest mem_exclusive or
786083667e0ced8 kernel/cpuset.c        Paul Menage      2008-04-29  3825   * mem_hardwall ancestor to the specified cpuset.  Call holding
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3826   * callback_lock.  If no ancestor is mem_exclusive or mem_hardwall
786083667e0ced8 kernel/cpuset.c        Paul Menage      2008-04-29  3827   * (an unusual configuration), then returns the root cpuset.
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3828   */
c9710d8018273b0 kernel/cpuset.c        Tejun Heo        2013-08-08 @3829  static struct cpuset *nearest_hardwall_ancestor(struct cpuset *cs)
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3830  {
c431069fe4bacc0 kernel/cpuset.c        Tejun Heo        2013-01-07  3831  	while (!(is_mem_exclusive(cs) || is_mem_hardwall(cs)) && parent_cs(cs))
c431069fe4bacc0 kernel/cpuset.c        Tejun Heo        2013-01-07  3832  		cs = parent_cs(cs);
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3833  	return cs;
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3834  }
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3835  
c70cd039f1d7791 kernel/cgroup/cpuset.c Jiapeng Chong    2022-02-16  3836  /*
c70cd039f1d7791 kernel/cgroup/cpuset.c Jiapeng Chong    2022-02-16  3837   * __cpuset_node_allowed - Can we allocate on a memory node?
a1bc5a4eee990a1 kernel/cpuset.c        David Rientjes   2009-04-02  3838   * @node: is this an allowed node?
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3839   * @gfp_mask: memory allocation flags
d9fd8a6d443b509 kernel/cpuset.c        Randy Dunlap     2005-07-27  3840   *
6e276d2a517fba7 kernel/cpuset.c        David Rientjes   2015-04-14  3841   * If we're in interrupt, yes, we can always allocate.  If @node is set in
6e276d2a517fba7 kernel/cpuset.c        David Rientjes   2015-04-14  3842   * current's mems_allowed, yes.  If it's not a __GFP_HARDWALL request and this
6e276d2a517fba7 kernel/cpuset.c        David Rientjes   2015-04-14  3843   * node is set in the nearest hardwalled cpuset ancestor to current's cpuset,
da99ecf117fce65 kernel/cgroup/cpuset.c Michal Hocko     2017-09-06  3844   * yes.  If current has access to memory reserves as an oom victim, yes.
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3845   * Otherwise, no.
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3846   *
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3847   * GFP_USER allocations are marked with the __GFP_HARDWALL bit,
c596d9f320aaf30 kernel/cpuset.c        David Rientjes   2007-05-06  3848   * and do not allow allocations outside the current tasks cpuset
da99ecf117fce65 kernel/cgroup/cpuset.c Michal Hocko     2017-09-06  3849   * unless the task has been OOM killed.
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3850   * GFP_KERNEL allocations are not so marked, so can escape to the
786083667e0ced8 kernel/cpuset.c        Paul Menage      2008-04-29  3851   * nearest enclosing hardwalled ancestor cpuset.
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3852   *
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3853   * Scanning up parent cpusets requires callback_lock.  The
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3854   * __alloc_pages() routine only calls here with __GFP_HARDWALL bit
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3855   * _not_ set if it's a GFP_KERNEL allocation, and all nodes in the
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3856   * current tasks mems_allowed came up empty on the first pass over
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3857   * the zonelist.  So only GFP_KERNEL allocations, if all nodes in the
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3858   * cpuset are short of memory, might require taking the callback_lock.
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3859   *
36be57ffe39e03a kernel/cpuset.c        Paul Jackson     2006-05-20  3860   * The first call here from mm/page_alloc:get_page_from_freelist()
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3861   * has __GFP_HARDWALL set in gfp_mask, enforcing hardwall cpusets,
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3862   * so no allocation on a node outside the cpuset is allowed (unless
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3863   * in interrupt, of course).
36be57ffe39e03a kernel/cpuset.c        Paul Jackson     2006-05-20  3864   *
36be57ffe39e03a kernel/cpuset.c        Paul Jackson     2006-05-20  3865   * The second pass through get_page_from_freelist() doesn't even call
36be57ffe39e03a kernel/cpuset.c        Paul Jackson     2006-05-20  3866   * here for GFP_ATOMIC calls.  For those calls, the __alloc_pages()
36be57ffe39e03a kernel/cpuset.c        Paul Jackson     2006-05-20  3867   * variable 'wait' is not set, and the bit ALLOC_CPUSET is not set
36be57ffe39e03a kernel/cpuset.c        Paul Jackson     2006-05-20  3868   * in alloc_flags.  That logic and the checks below have the combined
36be57ffe39e03a kernel/cpuset.c        Paul Jackson     2006-05-20  3869   * affect that:
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3870   *	in_interrupt - any node ok (current task context irrelevant)
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3871   *	GFP_ATOMIC   - any node ok
da99ecf117fce65 kernel/cgroup/cpuset.c Michal Hocko     2017-09-06  3872   *	tsk_is_oom_victim   - any node ok
786083667e0ced8 kernel/cpuset.c        Paul Menage      2008-04-29  3873   *	GFP_KERNEL   - any node in enclosing hardwalled cpuset ok
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3874   *	GFP_USER     - only nodes in current tasks mems allowed ok.
02a0e53d8227aff kernel/cpuset.c        Paul Jackson     2006-12-13  3875   */
002f290627c2706 kernel/cpuset.c        Vlastimil Babka  2016-05-19  3876  bool __cpuset_node_allowed(int node, gfp_t gfp_mask)
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3877  {
c9710d8018273b0 kernel/cpuset.c        Tejun Heo        2013-08-08  3878  	struct cpuset *cs;		/* current cpuset ancestors */
d4296faebd337e5 kernel/cgroup/cpuset.c Qi Zheng         2021-12-19  3879  	bool allowed;			/* is allocation in zone z allowed? */
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3880  	unsigned long flags;
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3881  
6e276d2a517fba7 kernel/cpuset.c        David Rientjes   2015-04-14  3882  	if (in_interrupt())
002f290627c2706 kernel/cpuset.c        Vlastimil Babka  2016-05-19  3883  		return true;
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3884  	if (node_isset(node, current->mems_allowed))
002f290627c2706 kernel/cpuset.c        Vlastimil Babka  2016-05-19  3885  		return true;
c596d9f320aaf30 kernel/cpuset.c        David Rientjes   2007-05-06  3886  	/*
c596d9f320aaf30 kernel/cpuset.c        David Rientjes   2007-05-06  3887  	 * Allow tasks that have access to memory reserves because they have
c596d9f320aaf30 kernel/cpuset.c        David Rientjes   2007-05-06  3888  	 * been OOM killed to get memory anywhere.
c596d9f320aaf30 kernel/cpuset.c        David Rientjes   2007-05-06  3889  	 */
da99ecf117fce65 kernel/cgroup/cpuset.c Michal Hocko     2017-09-06  3890  	if (unlikely(tsk_is_oom_victim(current)))
002f290627c2706 kernel/cpuset.c        Vlastimil Babka  2016-05-19  3891  		return true;
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3892  	if (gfp_mask & __GFP_HARDWALL)	/* If hardwall request, stop here */
002f290627c2706 kernel/cpuset.c        Vlastimil Babka  2016-05-19  3893  		return false;
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3894  
5563e77078d85c4 kernel/cpuset.c        Bob Picco        2005-11-13  3895  	if (current->flags & PF_EXITING) /* Let dying task have memory */
002f290627c2706 kernel/cpuset.c        Vlastimil Babka  2016-05-19  3896  		return true;
5563e77078d85c4 kernel/cpuset.c        Bob Picco        2005-11-13  3897  
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3898  	/* Not hardwall and node outside mems_allowed: scan up cpusets */
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3899  	spin_lock_irqsave(&callback_lock, flags);
053199edf54f685 kernel/cpuset.c        Paul Jackson     2005-10-30  3900  
b8dadcb58d542ec kernel/cpuset.c        Li Zefan         2014-03-03  3901  	rcu_read_lock();
786083667e0ced8 kernel/cpuset.c        Paul Menage      2008-04-29  3902  	cs = nearest_hardwall_ancestor(task_cs(current));
99afb0fd5f05aac kernel/cpuset.c        Li Zefan         2014-02-27  3903  	allowed = node_isset(node, cs->mems_allowed);
b8dadcb58d542ec kernel/cpuset.c        Li Zefan         2014-03-03  3904  	rcu_read_unlock();
053199edf54f685 kernel/cpuset.c        Paul Jackson     2005-10-30  3905  
8447a0fee974433 kernel/cpuset.c        Vladimir Davydov 2014-10-20  3906  	spin_unlock_irqrestore(&callback_lock, flags);
9bf2229f8817677 kernel/cpuset.c        Paul Jackson     2005-09-06  3907  	return allowed;
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3908  }
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3909  
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3910  /**
6adef3ebe570bcd kernel/cpuset.c        Jack Steiner     2010-05-26  3911   * cpuset_mem_spread_node() - On which node to begin search for a file page
6adef3ebe570bcd kernel/cpuset.c        Jack Steiner     2010-05-26  3912   * cpuset_slab_spread_node() - On which node to begin search for a slab page
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3913   *
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3914   * If a task is marked PF_SPREAD_PAGE or PF_SPREAD_SLAB (as for
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3915   * tasks in a cpuset with is_spread_page or is_spread_slab set),
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3916   * and if the memory allocation used cpuset_mem_spread_node()
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3917   * to determine on which node to start looking, as it will for
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3918   * certain page cache or slab cache pages such as used for file
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3919   * system buffers and inode caches, then instead of starting on the
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3920   * local node to look for a free page, rather spread the starting
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3921   * node around the tasks mems_allowed nodes.
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3922   *
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3923   * We don't have to worry about the returned node being offline
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3924   * because "it can't happen", and even if it did, it would be ok.
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3925   *
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3926   * The routines calling guarantee_online_mems() are careful to
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3927   * only set nodes in task->mems_allowed that are online.  So it
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3928   * should not be possible for the following code to return an
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3929   * offline node.  But if it did, that would be ok, as this routine
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3930   * is not returning the node where the allocation must be, only
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3931   * the node where the search should start.  The zonelist passed to
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3932   * __alloc_pages() will include all nodes.  If the slab allocator
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3933   * is passed an offline node, it will fall back to the local node.
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3934   * See kmem_cache_alloc_node().
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3935   */
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3936  
6adef3ebe570bcd kernel/cpuset.c        Jack Steiner     2010-05-26 @3937  static int cpuset_spread_node(int *rotor)
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3938  {
0edaf86cf1a6a97 kernel/cpuset.c        Andrew Morton    2016-05-19  3939  	return *rotor = next_node_in(*rotor, current->mems_allowed);
825a46af5ac171f kernel/cpuset.c        Paul Jackson     2006-03-24  3940  }
6adef3ebe570bcd kernel/cpuset.c        Jack Steiner     2010-05-26  3941  

:::::: The code at line 3749 was first introduced by commit
:::::: 97c0054dbe2c3c59d1156fd233f2d44e91981c8e cpuset: Cleanup cpuset_cpus_allowed_fallback() use in select_fallback_rq()

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
