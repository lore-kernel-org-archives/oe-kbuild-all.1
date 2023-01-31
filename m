Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B08C15
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675182242; x=1706718242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0UOGmEU/RR/8fL6GI4sFj2Ugfg/YvQ0dIYi3VMVprs=;
  b=cpbOyjPAoI2kc2g7S8YRnT+MBC9yPcdWOnhMCj/l3mRtgpIqKgg2sryl
   +U8dOFjW5h20ALg613YCXjNPmaq8Ic261VwPlsr5P2DuuiQkcV8fRArMU
   ZuEm0zEDSuP3fgo8bMvsJyzIMBPDKmnAJdQ2AgwRgnLu/2jGLr3csyrdW
   gLy50dzqasuc8TbYfOY4KO9NtjwL+9kXYePZr0JlAGISiuFfN+ndVg16G
   oxpUIdKF20TzsD+je0uwId/8IqEqQwJi/P7EmSf9d64Bu6vzdYLG6MrpR
   yozhSlqXqBwz0oRFT3TERYpEkK250tGhVKV5wubf9PvkGDXlWxzm2NNld
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="325585998"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="325585998"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 08:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="733174698"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="733174698"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2023 08:24:01 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMtQO-0004YI-1D;
	Tue, 31 Jan 2023 16:24:00 +0000
Date: Wed, 1 Feb 2023 00:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/urgent 1/1] kernel/cgroup/cpuset.c:3783:1:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202302010002.LvcXSxvh-lkp@intel.com>
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
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302010002.LvcXSxvh-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4f4d0b01796a0e1cae148d96b32520ebabb3951f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/urgent
        git checkout 4f4d0b01796a0e1cae148d96b32520ebabb3951f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/cgroup/cpuset.c: In function 'cpuset_cpus_allowed':
   kernel/cgroup/cpuset.c:3749:1: error: expected 'while' before 'bool'
    3749 | bool cpuset_cpus_allowed_fallback(struct task_struct *tsk)
         | ^~~~
>> kernel/cgroup/cpuset.c:3783:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3783 | void __init cpuset_init_current_mems_allowed(void)
         | ^~~~
   kernel/cgroup/cpuset.c:3829:23: error: invalid storage class for function 'nearest_hardwall_ancestor'
    3829 | static struct cpuset *nearest_hardwall_ancestor(struct cpuset *cs)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3937:12: error: invalid storage class for function 'cpuset_spread_node'
    3937 | static int cpuset_spread_node(int *rotor)
         |            ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cgroup/cpuset.c:25:
   kernel/cgroup/cpuset.c:3960:19: error: non-static declaration of 'cpuset_mem_spread_node' follows static declaration
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
   include/linux/export.h:57:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      57 |         static const struct kernel_symbol __ksymtab_##sym               \
         |         ^~~~~~
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
   kernel/cgroup/cpuset.c:4006:5: error: section attribute cannot be specified for local variables
    4006 | int cpuset_memory_pressure_enabled __read_mostly;
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4080:1: error: expected declaration or statement at end of input
    4080 | }
         | ^
   kernel/cgroup/cpuset.c:4006:5: warning: unused variable 'cpuset_memory_pressure_enabled' [-Wunused-variable]
    4006 | int cpuset_memory_pressure_enabled __read_mostly;
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c: At top level:
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


vim +3783 kernel/cgroup/cpuset.c

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
8f4ab07f4bf1b10 kernel/cpuset.c        Rasmus Villemoes 2015-02-12 @3783  void __init cpuset_init_current_mems_allowed(void)
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3784  {
f9a86fcbbb1e554 kernel/cpuset.c        Mike Travis      2008-04-04  3785  	nodes_setall(current->mems_allowed);
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3786  }
^1da177e4c3f415 kernel/cpuset.c        Linus Torvalds   2005-04-16  3787  

:::::: The code at line 3783 was first introduced by commit
:::::: 8f4ab07f4bf1b1069c01b7c6758a7d444406996b kernel/cpuset.c: Mark cpuset_init_current_mems_allowed as __init

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
