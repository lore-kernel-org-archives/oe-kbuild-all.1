Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F535385
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 00:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707094383; cv=none; b=LDjqTMhoFVvdI/P61PEgcfAznCKtHVGOz/DRteSuzhJ+bpicXyBcTA9u3RMh0pDa49yCjkHSDqTLtMB93k9xaAMAJgrCLtJ0NJ0scSFK0PKwIiqXSp32i1OqbeDd42UwLXidPAuqvfwwT6JIjrFapHnO9PxhdBQglAE+kCRRMI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707094383; c=relaxed/simple;
	bh=cvVNy8ObSXJ5fjnTAuW/Zp+4WSExVW5wR3dIeB7uWPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GpDSu0HUVUtjfenmXCPiXpDeRnUAeADsDVvRJFroIYE1xC7T4ITuVTE7Eojk8t2Z9FyOfZiJc8kRB+cROVuZL7o1leUw8dKvHnLvkMlRX9HSEZ90caaN8moV/ubDT+1tZITyR9hgkihKhrt/wHsxoyUDzt/zQFjfoHOggsp0nbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqBVTDSv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HqBVTDSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707094381; x=1738630381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cvVNy8ObSXJ5fjnTAuW/Zp+4WSExVW5wR3dIeB7uWPo=;
  b=HqBVTDSv+CQw4ByX4GTL9kJ+f6GEeXRGPG3oBaxNJHMjga6kyQMR//Y4
   lUA4cvaMfNeI02qLvyEfhhZ6LZi6oQOvZqkhmJk/W+T9gbAYn0qe70v3h
   SGKuzQNWkeWs63rjYANUHZdLvJUrEYiOzjO4/LVBtQ7uzIPnF5rPR8Av8
   bCFZNT+CMnaLrOpnD9g/ZNCMDLw84YpgPVTg/qKUGXWyAbhilU/HRq0kJ
   rta/wweka8Kam+totwgBQyh7scFE+y6YAFtSLWJ4GNr+BT0KUPFslKf4z
   LevX6QliOi415uJOmoXWk0VLTVpMvagVqGeKBvgBx5doM98Cz6vSJJKpL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="3392131"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="3392131"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 16:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5183412"
Received: from lkp-server02.sh.intel.com (HELO 1098e01a32bc) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2024 16:52:56 -0800
Received: from kbuild by 1098e01a32bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWnEC-00003N-2u;
	Mon, 05 Feb 2024 00:52:52 +0000
Date: Mon, 5 Feb 2024 08:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2377/2942] kernel/sched/psi.c:178:13: warning:
 'psi_avgs_work' used but never defined
Message-ID: <202402050806.VUKjhfla-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   988c7111f1e95028838eb8e4f71ee49b45132a23
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2377/2942] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: loongarch-randconfig-001-20240205 (https://download.01.org/0day-ci/archive/20240205/202402050806.VUKjhfla-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050806.VUKjhfla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050806.VUKjhfla-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:241:1: note: in expansion of macro '__setup'
     241 | __setup("isolcpus=", housekeeping_isolcpus_setup);
         | ^~~~~~~
   kernel/sched/isolation.c:241:22: note: (near initialization for '__setup_housekeeping_isolcpus_setup.setup_func')
     241 | __setup("isolcpus=", housekeeping_isolcpus_setup);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/isolation.c:241:1: note: in expansion of macro '__setup'
     241 | __setup("isolcpus=", housekeeping_isolcpus_setup);
         | ^~~~~~~
   In file included from kernel/sched/build_utility.c:109:
   kernel/sched/autogroup.c:7:28: error: section attribute cannot be specified for local variables
       7 | unsigned int __read_mostly sysctl_sched_autogroup_enabled = 1;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:15:35: error: initializer element is not constant
      15 |                 .data           = &sysctl_sched_autogroup_enabled,
         |                                   ^
   kernel/sched/autogroup.c:15:35: note: (near initialization for 'sched_autogroup_sysctls[0].data')
   kernel/sched/autogroup.c:25:20: error: invalid storage class for function 'sched_autogroup_sysctl_init'
      25 | static void __init sched_autogroup_sysctl_init(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:47:20: error: invalid storage class for function 'autogroup_destroy'
      47 | static inline void autogroup_destroy(struct kref *kref)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:60:20: error: invalid storage class for function 'autogroup_kref_put'
      60 | static inline void autogroup_kref_put(struct autogroup *ag)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:65:33: error: invalid storage class for function 'autogroup_kref_get'
      65 | static inline struct autogroup *autogroup_kref_get(struct autogroup *ag)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:71:33: error: invalid storage class for function 'autogroup_task_get'
      71 | static inline struct autogroup *autogroup_task_get(struct task_struct *p)
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:85:33: error: invalid storage class for function 'autogroup_create'
      85 | static inline struct autogroup *autogroup_create(void)
         |                                 ^~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:158:1: error: invalid storage class for function 'autogroup_move_group'
     158 | autogroup_move_group(struct task_struct *p, struct autogroup *ag)
         | ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:202:15: error: non-static declaration of 'sched_autogroup_create_attach' follows static declaration
     202 | EXPORT_SYMBOL(sched_autogroup_create_attach);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:202:1: note: in expansion of macro 'EXPORT_SYMBOL'
     202 | EXPORT_SYMBOL(sched_autogroup_create_attach);
         | ^~~~~~~~~~~~~
   kernel/sched/autogroup.c:193:6: note: previous definition of 'sched_autogroup_create_attach' with type 'void(struct task_struct *)'
     193 | void sched_autogroup_create_attach(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:209:15: error: non-static declaration of 'sched_autogroup_detach' follows static declaration
     209 | EXPORT_SYMBOL(sched_autogroup_detach);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:28: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:86:41: note: in expansion of macro '_EXPORT_SYMBOL'
      86 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/autogroup.c:209:1: note: in expansion of macro 'EXPORT_SYMBOL'
     209 | EXPORT_SYMBOL(sched_autogroup_detach);
         | ^~~~~~~~~~~~~
   kernel/sched/autogroup.c:205:6: note: previous definition of 'sched_autogroup_detach' with type 'void(struct task_struct *)'
     205 | void sched_autogroup_detach(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:221:19: error: invalid storage class for function 'setup_autogroup'
     221 | static int __init setup_autogroup(char *str)
         |                   ^~~~~~~~~~~~~~~
   kernel/sched/autogroup.c:227:24: error: initializer element is not constant
     227 | __setup("noautogroup", setup_autogroup);
         |                        ^~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/autogroup.c:227:1: note: in expansion of macro '__setup'
     227 | __setup("noautogroup", setup_autogroup);
         | ^~~~~~~
   kernel/sched/autogroup.c:227:24: note: (near initialization for '__setup_setup_autogroup.setup_func')
     227 | __setup("noautogroup", setup_autogroup);
         |                        ^~~~~~~~~~~~~~~
   include/linux/init.h:343:46: note: in definition of macro '__setup_param'
     343 |                 = { __setup_str_##unique_id, fn, early }
         |                                              ^~
   kernel/sched/autogroup.c:227:1: note: in expansion of macro '__setup'
     227 | __setup("noautogroup", setup_autogroup);
         | ^~~~~~~
   kernel/sched/build_utility.c:110: error: expected declaration or statement at end of input
     110 | #endif
         | 
   kernel/sched/psi.c: At top level:
>> kernel/sched/psi.c:178:13: warning: 'psi_avgs_work' used but never defined
     178 | static void psi_avgs_work(struct work_struct *work);
         |             ^~~~~~~~~~~~~
>> kernel/sched/psi.c:180:13: warning: 'poll_timer_fn' used but never defined
     180 | static void poll_timer_fn(struct timer_list *t);
         |             ^~~~~~~~~~~~~
>> kernel/sched/autogroup.c:285:5: warning: 'autogroup_path' defined but not used [-Wunused-function]
     285 | int autogroup_path(struct task_group *tg, char *buf, int buflen)
         |     ^~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:269:6: warning: 'proc_sched_autogroup_show_task' defined but not used [-Wunused-function]
     269 | void proc_sched_autogroup_show_task(struct task_struct *p, struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:231:5: warning: 'proc_sched_autogroup_set_nice' defined but not used [-Wunused-function]
     231 | int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:216:6: warning: 'sched_autogroup_exit' defined but not used [-Wunused-function]
     216 | void sched_autogroup_exit(struct signal_struct *sig)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:211:6: warning: 'sched_autogroup_fork' defined but not used [-Wunused-function]
     211 | void sched_autogroup_fork(struct signal_struct *sig)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:147:6: warning: 'sched_autogroup_exit_task' defined but not used [-Wunused-function]
     147 | void sched_autogroup_exit_task(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:129:6: warning: 'task_wants_autogroup' defined but not used [-Wunused-function]
     129 | bool task_wants_autogroup(struct task_struct *p, struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:42:6: warning: 'autogroup_free' defined but not used [-Wunused-function]
      42 | void autogroup_free(struct task_group *tg)
         |      ^~~~~~~~~~~~~~
>> kernel/sched/autogroup.c:33:13: warning: 'autogroup_init' defined but not used [-Wunused-function]
      33 | void __init autogroup_init(struct task_struct *init_task)
         |             ^~~~~~~~~~~~~~
   kernel/sched/isolation.c:82:13: warning: 'housekeeping_init' defined but not used [-Wunused-function]
      82 | void __init housekeeping_init(void)
         |             ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:25: warning: '__se_sys_membarrier' defined but not used [-Wunused-function]
     249 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
         |                         ^~~~~~~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:221:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     221 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:614:1: note: in expansion of macro 'SYSCALL_DEFINE3'
     614 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, int, cpu_id)
         | ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:233:6: warning: 'membarrier_update_current_mm' defined but not used [-Wunused-function]
     233 | void membarrier_update_current_mm(struct mm_struct *next_mm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:217:6: warning: 'membarrier_exec_mmap' defined but not used [-Wunused-function]
     217 | void membarrier_exec_mmap(struct mm_struct *mm)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1471:6: warning: 'psi_cgroup_restart' defined but not used [-Wunused-function]
    1471 | void psi_cgroup_restart(struct psi_group *group)
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1416:6: warning: 'cgroup_move_task' defined but not used [-Wunused-function]
    1416 | void cgroup_move_task(struct task_struct *task, struct css_set *to)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1392:6: warning: 'psi_cgroup_free' defined but not used [-Wunused-function]
    1392 | void psi_cgroup_free(struct cgroup *cgroup)
         |      ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1373:5: warning: 'psi_cgroup_alloc' defined but not used [-Wunused-function]
    1373 | int psi_cgroup_alloc(struct cgroup *cgroup)
         |     ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1262:6: warning: 'psi_account_irqtime' defined but not used [-Wunused-function]
    1262 | void psi_account_irqtime(struct task_struct *task, u32 delta)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1168:6: warning: 'psi_task_switch' defined but not used [-Wunused-function]
    1168 | void psi_task_switch(struct task_struct *prev, struct task_struct *next,
         |      ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:949:13: warning: 'poll_timer_fn' defined but not used [-Wunused-function]
     949 | static void poll_timer_fn(struct timer_list *t)
         |             ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/psi_avgs_work +178 kernel/sched/psi.c

eb414681d5a07d Johannes Weiner    2018-10-26  177  
bcc78db64168eb Suren Baghdasaryan 2019-05-14 @178  static void psi_avgs_work(struct work_struct *work);
eb414681d5a07d Johannes Weiner    2018-10-26  179  
8f91efd870ea5d Zhaoyang Huang     2021-06-11 @180  static void poll_timer_fn(struct timer_list *t);
8f91efd870ea5d Zhaoyang Huang     2021-06-11  181  

:::::: The code at line 178 was first introduced by commit
:::::: bcc78db64168eb6dede056fed2999f75f7ace309 psi: rename psi fields in preparation for psi trigger addition

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
