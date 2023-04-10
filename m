Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD223A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 06:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681107261; x=1712643261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYmSQFsL/bNWZhfnE9VuuYbeix2QbqGxlmZEzFI78W4=;
  b=Cd0BCZManskTBswkHxN4VNfwrG68u9O9mPQzdo0+ulP7DHmMh6SzU66c
   cAeqTQ4D02hPaZng3fWhvVJPJeLxjfreMk8qvV/sWG6Pyu5rgMTRsnWO3
   7AMtMVXHUtScDblrcUtZL1IXgZvwuhFcOMJ+mfBIm1vBY4TEbkpp5F8Nv
   BKuBIAYeyeJMVdEo1OWvbF2p2XzBTKeD3zfnH2GnfXyyBe3X7TXHhIE1v
   DkOr6ttmnJcBVDe7lkjyTNBDtHb5CSYK6DjwzyiUgvp/+wmHdl0yzQd2Q
   yGNxD1jaRlqi5aigYVrr9J3XdrTJ7wX/Qa2NJRa736MISj63Q/sikkoA0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="408431344"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="408431344"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 23:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="681645550"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="681645550"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Apr 2023 23:14:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plkn7-000V95-0u;
	Mon, 10 Apr 2023 06:14:13 +0000
Date: Mon, 10 Apr 2023 14:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/old/tree_nocb.vscode.index 2/2] kernel/rcu/tree.c:29:55:
 error: static declaration of 'rcu_data' follows non-static declaration
Message-ID: <202304101435.u4MBokSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/old/tree_nocb.vscode.index
head:   06474d6fd35371bdcdf95ac2ec08500fd892333c
commit: 06474d6fd35371bdcdf95ac2ec08500fd892333c [2/2] kernel: rcu: Try to get vscode to index tree_nocb.h (half working)
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230410/202304101435.u4MBokSr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=06474d6fd35371bdcdf95ac2ec08500fd892333c
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/old/tree_nocb.vscode.index
        git checkout 06474d6fd35371bdcdf95ac2ec08500fd892333c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101435.u4MBokSr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:390,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from kernel/rcu/tree_includes.h:6,
                    from kernel/rcu/tree.c:20:
>> kernel/rcu/tree.c:29:55: error: static declaration of 'rcu_data' follows non-static declaration
      29 | static DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data) = {
         |                                                       ^~~~~~~~
   include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   kernel/rcu/tree.c:29:8: note: in expansion of macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
      29 | static DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data) = {
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_includes.h:70:55: note: previous declaration of 'rcu_data' with type 'struct rcu_data'
      70 | extern DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data);
         |                                                       ^~~~~~~~
   include/linux/percpu-defs.h:104:44: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
     104 |         __PCPU_ATTRS(sec) __typeof__(type) name
         |                                            ^~~~
   kernel/rcu/tree_includes.h:70:8: note: in expansion of macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
      70 | extern DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/tree.c:843:13: error: static declaration of 'trace_rcu_this_gp' follows non-static declaration
     843 | static void trace_rcu_this_gp(struct rcu_node *rnp, struct rcu_data *rdp,
         |             ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:20:
   kernel/rcu/tree_includes.h:77:13: note: previous declaration of 'trace_rcu_this_gp' with type 'void(struct rcu_node *, struct rcu_data *, long unsigned int,  const char *)'
      77 | extern void trace_rcu_this_gp(struct rcu_node *rnp, struct rcu_data *rdp,
         |             ^~~~~~~~~~~~~~~~~
>> kernel/rcu/tree.c:1070:13: error: static declaration of 'rcu_advance_cbs' follows non-static declaration
    1070 | static bool rcu_advance_cbs(struct rcu_node *rnp, struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:20:
   kernel/rcu/tree_includes.h:62:13: note: previous declaration of 'rcu_advance_cbs' with type 'bool(struct rcu_node *, struct rcu_data *)' {aka '_Bool(struct rcu_node *, struct rcu_data *)'}
      62 | extern bool rcu_advance_cbs(struct rcu_node *rnp, struct rcu_data *rdp);
         |             ^~~~~~~~~~~~~~~
>> kernel/rcu/tree.c:1093:28: error: static declaration of 'rcu_advance_cbs_nowake' follows non-static declaration
    1093 | static void __maybe_unused rcu_advance_cbs_nowake(struct rcu_node *rnp,
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:20:
   kernel/rcu/tree_includes.h:60:28: note: previous declaration of 'rcu_advance_cbs_nowake' with type 'void(struct rcu_node *, struct rcu_data *)'
      60 | extern void __maybe_unused rcu_advance_cbs_nowake(struct rcu_node *rnp,
         |                            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/tree.c:2000:13: error: static declaration of 'rcu_do_batch' follows non-static declaration
    2000 | static void rcu_do_batch(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:20:
   kernel/rcu/tree_includes.h:66:13: note: previous declaration of 'rcu_do_batch' with type 'void(struct rcu_data *)'
      66 | extern void rcu_do_batch(struct rcu_data *rdp);
         |             ^~~~~~~~~~~~
>> kernel/rcu/tree.c:2368:13: error: static declaration of 'invoke_rcu_core' follows non-static declaration
    2368 | static void invoke_rcu_core(void)
         |             ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:20:
   kernel/rcu/tree_includes.h:68:13: note: previous declaration of 'invoke_rcu_core' with type 'void(void)'
      68 | extern void invoke_rcu_core(void);
         |             ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:17:13: error: redefinition of 'rcu_rdp_is_offloaded'
      17 | static bool rcu_rdp_is_offloaded(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:17:13: note: previous definition of 'rcu_rdp_is_offloaded' with type 'bool(struct rcu_data *)' {aka '_Bool(struct rcu_data *)'}
      17 | static bool rcu_rdp_is_offloaded(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:45:20: error: redefinition of 'rcu_bootup_announce_oddness'
      45 | static void __init rcu_bootup_announce_oddness(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:45:20: note: previous definition of 'rcu_bootup_announce_oddness' with type 'void(void)'
      45 | static void __init rcu_bootup_announce_oddness(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:112:20: error: redefinition of 'rcu_bootup_announce'
     112 | static void __init rcu_bootup_announce(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:112:20: note: previous definition of 'rcu_bootup_announce' with type 'void(void)'
     112 | static void __init rcu_bootup_announce(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:152:13: error: redefinition of 'rcu_preempt_ctxt_queue'
     152 | static void rcu_preempt_ctxt_queue(struct rcu_node *rnp, struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:152:13: note: previous definition of 'rcu_preempt_ctxt_queue' with type 'void(struct rcu_node *, struct rcu_data *)'
     152 | static void rcu_preempt_ctxt_queue(struct rcu_node *rnp, struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:285:13: error: redefinition of 'rcu_qs'
     285 | static void rcu_qs(void)
         |             ^~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:285:13: note: previous definition of 'rcu_qs' with type 'void(void)'
     285 | static void rcu_qs(void)
         |             ^~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:311:6: error: redefinition of 'rcu_note_context_switch'
     311 | void rcu_note_context_switch(bool preempt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:311:6: note: previous definition of 'rcu_note_context_switch' with type 'void(bool)' {aka 'void(_Bool)'}
     311 | void rcu_note_context_switch(bool preempt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:368:12: error: redefinition of 'rcu_preempt_blocked_readers_cgp'
     368 | static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:368:12: note: previous definition of 'rcu_preempt_blocked_readers_cgp' with type 'int(struct rcu_node *)'
     368 | static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:376:13: error: redefinition of 'rcu_preempt_read_enter'
     376 | static void rcu_preempt_read_enter(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:376:13: note: previous definition of 'rcu_preempt_read_enter' with type 'void(void)'
     376 | static void rcu_preempt_read_enter(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:381:12: error: redefinition of 'rcu_preempt_read_exit'
     381 | static int rcu_preempt_read_exit(void)
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:381:12: note: previous definition of 'rcu_preempt_read_exit' with type 'int(void)'
     381 | static int rcu_preempt_read_exit(void)
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:389:13: error: redefinition of 'rcu_preempt_depth_set'
     389 | static void rcu_preempt_depth_set(int val)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:389:13: note: previous definition of 'rcu_preempt_depth_set' with type 'void(int)'
     389 | static void rcu_preempt_depth_set(int val)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:399:6: error: redefinition of '__rcu_read_lock'
     399 | void __rcu_read_lock(void)
         |      ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:399:6: note: previous definition of '__rcu_read_lock' with type 'void(void)'
     399 | void __rcu_read_lock(void)
         |      ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:417:6: error: redefinition of '__rcu_read_unlock'
     417 | void __rcu_read_unlock(void)
         |      ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:417:6: note: previous definition of '__rcu_read_unlock' with type 'void(void)'
     417 | void __rcu_read_unlock(void)
         |      ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:439:26: error: redefinition of 'rcu_next_node_entry'
     439 | static struct list_head *rcu_next_node_entry(struct task_struct *t,
         |                          ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:439:26: note: previous definition of 'rcu_next_node_entry' with type 'struct list_head *(struct task_struct *, struct rcu_node *)'
     439 | static struct list_head *rcu_next_node_entry(struct task_struct *t,
         |                          ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
>> kernel/rcu/tree_plugin.h:454:13: error: redefinition of 'rcu_preempt_has_tasks'
     454 | static bool rcu_preempt_has_tasks(struct rcu_node *rnp)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:454:13: note: previous definition of 'rcu_preempt_has_tasks' with type 'bool(struct rcu_node *)' {aka '_Bool(struct rcu_node *)'}
     454 | static bool rcu_preempt_has_tasks(struct rcu_node *rnp)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:465:1: error: redefinition of 'rcu_preempt_deferred_qs_irqrestore'
     465 | rcu_preempt_deferred_qs_irqrestore(struct task_struct *t, unsigned long flags)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:465:1: note: previous definition of 'rcu_preempt_deferred_qs_irqrestore' with type 'void(struct task_struct *, long unsigned int)'
     465 | rcu_preempt_deferred_qs_irqrestore(struct task_struct *t, unsigned long flags)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:585:21: error: redefinition of 'rcu_preempt_need_deferred_qs'
     585 | static notrace bool rcu_preempt_need_deferred_qs(struct task_struct *t)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:585:21: note: previous definition of 'rcu_preempt_need_deferred_qs' with type 'bool(struct task_struct *)' {aka '_Bool(struct task_struct *)'}
     585 | static notrace bool rcu_preempt_need_deferred_qs(struct task_struct *t)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:599:14: error: redefinition of 'rcu_preempt_deferred_qs'
     599 | notrace void rcu_preempt_deferred_qs(struct task_struct *t)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:599:14: note: previous definition of 'rcu_preempt_deferred_qs' with type 'void(struct task_struct *)'
     599 | notrace void rcu_preempt_deferred_qs(struct task_struct *t)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:612:13: error: redefinition of 'rcu_preempt_deferred_qs_handler'
     612 | static void rcu_preempt_deferred_qs_handler(struct irq_work *iwp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:612:13: note: previous definition of 'rcu_preempt_deferred_qs_handler' with type 'void(struct irq_work *)'
     612 | static void rcu_preempt_deferred_qs_handler(struct irq_work *iwp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:625:13: error: redefinition of 'rcu_read_unlock_special'
     625 | static void rcu_read_unlock_special(struct task_struct *t)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:625:13: note: previous definition of 'rcu_read_unlock_special' with type 'void(struct task_struct *)'
     625 | static void rcu_read_unlock_special(struct task_struct *t)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:692:13: error: redefinition of 'rcu_preempt_check_blocked_tasks'
     692 | static void rcu_preempt_check_blocked_tasks(struct rcu_node *rnp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:692:13: note: previous definition of 'rcu_preempt_check_blocked_tasks' with type 'void(struct rcu_node *)'
     692 | static void rcu_preempt_check_blocked_tasks(struct rcu_node *rnp)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:718:13: error: redefinition of 'rcu_flavor_sched_clock_irq'
     718 | static void rcu_flavor_sched_clock_irq(int user)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:718:13: note: previous definition of 'rcu_flavor_sched_clock_irq' with type 'void(int)'
     718 | static void rcu_flavor_sched_clock_irq(int user)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:755:6: error: redefinition of 'exit_rcu'
     755 | void exit_rcu(void)
         |      ^~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:755:6: note: previous definition of 'exit_rcu' with type 'void(void)'
     755 | void exit_rcu(void)
         |      ^~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:777:1: error: redefinition of 'dump_blkd_tasks'
     777 | dump_blkd_tasks(struct rcu_node *rnp, int ncheck)
         | ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:777:1: note: previous definition of 'dump_blkd_tasks' with type 'void(struct rcu_node *, int)'
     777 | dump_blkd_tasks(struct rcu_node *rnp, int ncheck)
         | ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:1004:13: error: redefinition of 'rcu_cpu_kthread_setup'
    1004 | static void rcu_cpu_kthread_setup(unsigned int cpu)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:1004:13: note: previous definition of 'rcu_cpu_kthread_setup' with type 'void(unsigned int)'
    1004 | static void rcu_cpu_kthread_setup(unsigned int cpu)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:1017:13: error: redefinition of 'rcu_is_callbacks_nocb_kthread'
    1017 | static bool rcu_is_callbacks_nocb_kthread(struct rcu_data *rdp)


vim +/rcu_data +29 kernel/rcu/tree.c

a7538352da722f kernel/rcu/tree.c Joe Perches             2018-05-14  19  
06474d6fd35371 kernel/rcu/tree.c Joel Fernandes (Google  2023-04-09 @20) #include "tree_includes.h"
9f77da9f400452 kernel/rcutree.c  Paul E. McKenney        2009-08-22  21  
4102adab9189c8 kernel/rcu/tree.c Paul E. McKenney        2013-10-08  22  #ifdef MODULE_PARAM_PREFIX
4102adab9189c8 kernel/rcu/tree.c Paul E. McKenney        2013-10-08  23  #undef MODULE_PARAM_PREFIX
4102adab9189c8 kernel/rcu/tree.c Paul E. McKenney        2013-10-08  24  #endif
4102adab9189c8 kernel/rcu/tree.c Paul E. McKenney        2013-10-08  25  #define MODULE_PARAM_PREFIX "rcutree."
4102adab9189c8 kernel/rcu/tree.c Paul E. McKenney        2013-10-08  26  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  27  /* Data structures. */
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  28  
4c5273bf2b5ed9 kernel/rcu/tree.c Paul E. McKenney        2018-08-03 @29  static DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data) = {
a5d1b0b68a62af kernel/rcu/tree.c Paul E. McKenney        2022-08-04  30  	.gpwrap = true,
8d346d438f93b5 kernel/rcu/tree.c Frederic Weisbecker     2020-11-13  31  #ifdef CONFIG_RCU_NOCB_CPU
213d56bf33bdda kernel/rcu/tree.c Frederic Weisbecker     2021-10-19  32  	.cblist.flags = SEGCBLIST_RCU_CORE,
8d346d438f93b5 kernel/rcu/tree.c Frederic Weisbecker     2020-11-13  33  #endif
4c5273bf2b5ed9 kernel/rcu/tree.c Paul E. McKenney        2018-08-03  34  };
c30fe541896440 kernel/rcu/tree.c Paul E. McKenney        2019-10-11  35  static struct rcu_state rcu_state = {
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  36  	.level = { &rcu_state.node[0] },
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  37  	.gp_state = RCU_GP_IDLE,
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  38  	.gp_seq = (0UL - 300UL) << RCU_SEQ_CTR_SHIFT,
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  39  	.barrier_mutex = __MUTEX_INITIALIZER(rcu_state.barrier_mutex),
80b3fd474c91b3 kernel/rcu/tree.c Paul E. McKenney        2021-12-14  40  	.barrier_lock = __RAW_SPIN_LOCK_UNLOCKED(rcu_state.barrier_lock),
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  41  	.name = RCU_NAME,
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  42  	.abbr = RCU_ABBR,
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  43  	.exp_mutex = __MUTEX_INITIALIZER(rcu_state.exp_mutex),
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  44  	.exp_wake_mutex = __MUTEX_INITIALIZER(rcu_state.exp_wake_mutex),
82980b1622d970 kernel/rcu/tree.c David Woodhouse         2021-02-16  45  	.ofl_lock = __ARCH_SPIN_LOCK_UNLOCKED,
358be2d3685cb0 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  46  };
27f4d28057adf9 kernel/rcutree.c  Paul E. McKenney        2011-02-07  47  

:::::: The code at line 29 was first introduced by commit
:::::: 4c5273bf2b5ed9b585e470dda19c09c875a9fbbd rcu: Switch dyntick nesting counters to rcu_data structure

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
