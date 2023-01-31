Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004C67FB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675182906; x=1706718906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsfUv/lkyurYHYoNdHT3LR9OuDCwPC2EgW1Gk11vSdE=;
  b=R7cpWPAjt1/OCxOzaRHuwBGUWY9Asb2Bw2EKx24lfwaA06PLxTFebqlz
   gVDJYP5P3eGRYR1erXSFMG6d8Eo2j8H+X5mazTXVeEA6DdMMidjOgDyxg
   xKtkxw2i5KrItGSJghkUAnyMRTeq7t9Tc8zXRYSNODBWFRYlPdUqBH1YA
   7sqslRsS3+sXjq9gzLQyAEHFDRYfI/aI62UR2vHbXT8ySQkNqqLmk8pX1
   BXqlvDtoA89pTu3zExC37QxjiMoTscAC6ZAwwsWgH5mErr7RQqiF19lsG
   izpXfBlw5OqWYwt78lP34Y7HZWSlpulc1InxBNQNcV5O4jT7jcjtKCP8T
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329157397"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="329157397"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 08:35:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993339438"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="993339438"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2023 08:35:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMtb4-0004Yc-0a;
	Tue, 31 Jan 2023 16:35:02 +0000
Date: Wed, 1 Feb 2023 00:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/urgent 1/1] kernel/cgroup/cpuset.c:3783:1:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202302010035.eYuoOUHs-lkp@intel.com>
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
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230201/202302010035.eYuoOUHs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4f4d0b01796a0e1cae148d96b32520ebabb3951f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/urgent
        git checkout 4f4d0b01796a0e1cae148d96b32520ebabb3951f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/cgroup/

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
   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cgroup/cpuset.c:25:
>> include/linux/compiler.h:215:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
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
   kernel/cgroup/cpuset.c:4006:5: error: section attribute cannot be specified for local variables
    4006 | int cpuset_memory_pressure_enabled __read_mostly;
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4080:1: error: expected declaration or statement at end of input
    4080 | }
         | ^
>> kernel/cgroup/cpuset.c:4006:5: warning: unused variable 'cpuset_memory_pressure_enabled' [-Wunused-variable]
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
>> include/linux/export.h:89:27: warning: unused variable '__kstrtabns_cpuset_mem_spread_node' [-Wunused-variable]
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
>> include/linux/export.h:88:27: warning: unused variable '__kstrtab_cpuset_mem_spread_node' [-Wunused-variable]
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


vim +3783 kernel/cgroup/cpuset.c

9084bb8246ea935 kernel/cpuset.c Oleg Nesterov    2010-03-15  3782  
8f4ab07f4bf1b10 kernel/cpuset.c Rasmus Villemoes 2015-02-12 @3783  void __init cpuset_init_current_mems_allowed(void)
^1da177e4c3f415 kernel/cpuset.c Linus Torvalds   2005-04-16  3784  {
f9a86fcbbb1e554 kernel/cpuset.c Mike Travis      2008-04-04  3785  	nodes_setall(current->mems_allowed);
^1da177e4c3f415 kernel/cpuset.c Linus Torvalds   2005-04-16  3786  }
^1da177e4c3f415 kernel/cpuset.c Linus Torvalds   2005-04-16  3787  

:::::: The code at line 3783 was first introduced by commit
:::::: 8f4ab07f4bf1b1069c01b7c6758a7d444406996b kernel/cpuset.c: Mark cpuset_init_current_mems_allowed as __init

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
