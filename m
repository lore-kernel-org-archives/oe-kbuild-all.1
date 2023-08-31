Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A884B7481
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 12:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693485351; x=1725021351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OpuZeV4JOnWWMTlhYLXoiSdC6ZStDjG8vbHhuEyPLps=;
  b=hEYSOXyj+WHS6+m5CzuEL7XowhaEJxNFQZjl7zb/CrfREazJBkbbqOvm
   MAbobGJUnPdqmZjQkN/fNwaBFoH0OHkptxCkvZ7FQIJhAbEmTEMouOLZo
   /sgXaBxppa3vcOaL6wX9O98zyfCUXvyAysfP40CHBZIOOZf96zWE/yqM4
   xcxS/3cUY2iv/3BI8ZbQZvu8+O9Tszr4ZcwYxCW6Jjf8mXeypRr7lZKyT
   iyJZarqKSIY0/IXiSWBIcvKc8mhRSHUUCAm8e6b8qsyIUHJqwZAGh72oa
   QHA6nl9n+ZJgMEB+H4WpFrfk+FVbCOYKXn5F1LgiQD6JAlsAf6OLNYQm4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462296689"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="462296689"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 05:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716328373"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="716328373"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 05:35:48 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbgtm-00008F-0J;
	Thu, 31 Aug 2023 12:35:46 +0000
Date: Thu, 31 Aug 2023 20:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/stall-detect-fixes.debug 1/5] kernel/rcu/tree.c:4118:6:
 error: redefinition of 'rcu_lockdep_current_cpu_online'
Message-ID: <202308312029.rKq9S5t5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/stall-detect-fixes.debug
head:   c74543ca98774da6b7ddfd7d2ea4ced0dd65f3ff
commit: 23689bc9fcc577cc5e856f4080565d786e04c28e [1/5] debug: Make clangd work with tree_stall.
config: x86_64-randconfig-002-20230829-CONFIG_TREE_RCU (https://download.01.org/0day-ci/archive/20230831/202308312029.rKq9S5t5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312029.rKq9S5t5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312029.rKq9S5t5-lkp@intel.com/

Note: the jfern/rcu/stall-detect-fixes.debug HEAD c74543ca98774da6b7ddfd7d2ea4ced0dd65f3ff builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

    3666 | unsigned long start_poll_synchronize_rcu(void)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3689:6: error: redefinition of 'start_poll_synchronize_rcu_full'
    3689 | void start_poll_synchronize_rcu_full(struct rcu_gp_oldstate *rgosp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3689:6: note: previous definition of 'start_poll_synchronize_rcu_full' with type 'void(struct rcu_gp_oldstate *)'
    3689 | void start_poll_synchronize_rcu_full(struct rcu_gp_oldstate *rgosp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3730:6: error: redefinition of 'poll_state_synchronize_rcu'
    3730 | bool poll_state_synchronize_rcu(unsigned long oldstate)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3730:6: note: previous definition of 'poll_state_synchronize_rcu' with type 'bool(long unsigned int)' {aka '_Bool(long unsigned int)'}
    3730 | bool poll_state_synchronize_rcu(unsigned long oldstate)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3774:6: error: redefinition of 'poll_state_synchronize_rcu_full'
    3774 | bool poll_state_synchronize_rcu_full(struct rcu_gp_oldstate *rgosp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3774:6: note: previous definition of 'poll_state_synchronize_rcu_full' with type 'bool(struct rcu_gp_oldstate *)' {aka '_Bool(struct rcu_gp_oldstate *)'}
    3774 | bool poll_state_synchronize_rcu_full(struct rcu_gp_oldstate *rgosp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3808:6: error: redefinition of 'cond_synchronize_rcu'
    3808 | void cond_synchronize_rcu(unsigned long oldstate)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3808:6: note: previous definition of 'cond_synchronize_rcu' with type 'void(long unsigned int)'
    3808 | void cond_synchronize_rcu(unsigned long oldstate)
         |      ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3835:6: error: redefinition of 'cond_synchronize_rcu_full'
    3835 | void cond_synchronize_rcu_full(struct rcu_gp_oldstate *rgosp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3835:6: note: previous definition of 'cond_synchronize_rcu_full' with type 'void(struct rcu_gp_oldstate *)'
    3835 | void cond_synchronize_rcu_full(struct rcu_gp_oldstate *rgosp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3849:12: error: redefinition of 'rcu_pending'
    3849 | static int rcu_pending(int user)
         |            ^~~~~~~~~~~
   kernel/rcu/tree.c:3849:12: note: previous definition of 'rcu_pending' with type 'int(int)'
    3849 | static int rcu_pending(int user)
         |            ^~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3897:13: error: redefinition of 'rcu_barrier_trace'
    3897 | static void rcu_barrier_trace(const char *s, int cpu, unsigned long done)
         |             ^~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3897:13: note: previous definition of 'rcu_barrier_trace' with type 'void(const char *, int,  long unsigned int)'
    3897 | static void rcu_barrier_trace(const char *s, int cpu, unsigned long done)
         |             ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3913:13: error: redefinition of 'rcu_barrier_callback'
    3913 | static void rcu_barrier_callback(struct rcu_head *rhp)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3913:13: note: previous definition of 'rcu_barrier_callback' with type 'void(struct callback_head *)'
    3913 | static void rcu_barrier_callback(struct rcu_head *rhp)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3928:13: error: conflicting types for 'rcu_barrier_entrain'; have 'void(struct rcu_data *)'
    3928 | static void rcu_barrier_entrain(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3928:13: note: previous definition of 'rcu_barrier_entrain' with type 'void(struct rcu_data *)'
    3928 | static void rcu_barrier_entrain(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3965:13: error: redefinition of 'rcu_barrier_handler'
    3965 | static void rcu_barrier_handler(void *cpu_in)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3965:13: note: previous definition of 'rcu_barrier_handler' with type 'void(void *)'
    3965 | static void rcu_barrier_handler(void *cpu_in)
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:3986:6: error: redefinition of 'rcu_barrier'
    3986 | void rcu_barrier(void)
         |      ^~~~~~~~~~~
   kernel/rcu/tree.c:3986:6: note: previous definition of 'rcu_barrier' with type 'void(void)'
    3986 | void rcu_barrier(void)
         |      ^~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4088:22: error: conflicting types for 'rcu_rnp_online_cpus'; have 'long unsigned int(struct rcu_node *)'
    4088 | static unsigned long rcu_rnp_online_cpus(struct rcu_node *rnp)
         |                      ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4088:22: note: previous definition of 'rcu_rnp_online_cpus' with type 'long unsigned int(struct rcu_node *)'
    4088 | static unsigned long rcu_rnp_online_cpus(struct rcu_node *rnp)
         |                      ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/tree.c:4118:6: error: redefinition of 'rcu_lockdep_current_cpu_online'
    4118 | bool rcu_lockdep_current_cpu_online(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4118:6: note: previous definition of 'rcu_lockdep_current_cpu_online' with type 'bool(void)' {aka '_Bool(void)'}
    4118 | bool rcu_lockdep_current_cpu_online(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4145:13: error: redefinition of 'rcu_init_invoked'
    4145 | static bool rcu_init_invoked(void)
         |             ^~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4145:13: note: previous definition of 'rcu_init_invoked' with type 'bool(void)' {aka '_Bool(void)'}
    4145 | static bool rcu_init_invoked(void)
         |             ^~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4154:5: error: redefinition of 'rcutree_dying_cpu'
    4154 | int rcutree_dying_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4154:5: note: previous definition of 'rcutree_dying_cpu' with type 'int(unsigned int)'
    4154 | int rcutree_dying_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4220:5: error: redefinition of 'rcutree_dead_cpu'
    4220 | int rcutree_dead_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4220:5: note: previous definition of 'rcutree_dead_cpu' with type 'int(unsigned int)'
    4220 | int rcutree_dead_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4263:1: error: redefinition of 'rcu_boot_init_percpu_data'
    4263 | rcu_boot_init_percpu_data(int cpu)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4263:1: note: previous definition of 'rcu_boot_init_percpu_data' with type 'void(int)'
    4263 | rcu_boot_init_percpu_data(int cpu)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4293:5: error: redefinition of 'rcutree_prepare_cpu'
    4293 | int rcutree_prepare_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4293:5: note: previous definition of 'rcutree_prepare_cpu' with type 'int(unsigned int)'
    4293 | int rcutree_prepare_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4341:13: error: redefinition of 'rcutree_affinity_setting'
    4341 | static void rcutree_affinity_setting(unsigned int cpu, int outgoing)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4341:13: note: previous definition of 'rcutree_affinity_setting' with type 'void(unsigned int,  int)'
    4341 | static void rcutree_affinity_setting(unsigned int cpu, int outgoing)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4351:6: error: redefinition of 'rcu_cpu_beenfullyonline'
    4351 | bool rcu_cpu_beenfullyonline(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4351:6: note: previous definition of 'rcu_cpu_beenfullyonline' with type 'bool(int)' {aka '_Bool(int)'}
    4351 | bool rcu_cpu_beenfullyonline(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4362:5: error: redefinition of 'rcutree_online_cpu'
    4362 | int rcutree_online_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4362:5: note: previous definition of 'rcutree_online_cpu' with type 'int(unsigned int)'
    4362 | int rcutree_online_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4387:5: error: redefinition of 'rcutree_offline_cpu'
    4387 | int rcutree_offline_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4387:5: note: previous definition of 'rcutree_offline_cpu' with type 'int(unsigned int)'
    4387 | int rcutree_offline_cpu(unsigned int cpu)
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4418:6: error: redefinition of 'rcu_cpu_starting'
    4418 | void rcu_cpu_starting(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4418:6: note: previous definition of 'rcu_cpu_starting' with type 'void(unsigned int)'
    4418 | void rcu_cpu_starting(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4473:6: error: redefinition of 'rcu_report_dead'
    4473 | void rcu_report_dead(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4473:6: note: previous definition of 'rcu_report_dead' with type 'void(unsigned int)'
    4473 | void rcu_report_dead(unsigned int cpu)
         |      ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/tree.c:4512:6: error: redefinition of 'rcutree_migrate_callbacks'
    4512 | void rcutree_migrate_callbacks(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4512:6: note: previous definition of 'rcutree_migrate_callbacks' with type 'void(int)'
    4512 | void rcutree_migrate_callbacks(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4563:12: error: redefinition of 'rcu_pm_notify'
    4563 | static int rcu_pm_notify(struct notifier_block *self,
         |            ^~~~~~~~~~~~~
   kernel/rcu/tree.c:4563:12: note: previous definition of 'rcu_pm_notify' with type 'int(struct notifier_block *, long unsigned int,  void *)'
    4563 | static int rcu_pm_notify(struct notifier_block *self,
         |            ^~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4617:20: error: redefinition of 'rcu_start_exp_gp_kworkers'
    4617 | static void __init rcu_start_exp_gp_kworkers(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4617:20: note: previous definition of 'rcu_start_exp_gp_kworkers' with type 'void(void)'
    4617 | static void __init rcu_start_exp_gp_kworkers(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4621:20: error: redefinition of 'rcu_alloc_par_gp_wq'
    4621 | static inline void rcu_alloc_par_gp_wq(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4621:20: note: previous definition of 'rcu_alloc_par_gp_wq' with type 'void(void)'
    4621 | static inline void rcu_alloc_par_gp_wq(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4631:19: error: redefinition of 'rcu_spawn_gp_kthread'
    4631 | static int __init rcu_spawn_gp_kthread(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4631:19: note: previous definition of 'rcu_spawn_gp_kthread' with type 'int(void)'
    4631 | static int __init rcu_spawn_gp_kthread(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4680:6: error: redefinition of 'rcu_scheduler_starting'
    4680 | void rcu_scheduler_starting(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4680:6: note: previous definition of 'rcu_scheduler_starting' with type 'void(void)'
    4680 | void rcu_scheduler_starting(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4703:20: error: redefinition of 'rcu_init_one'
    4703 | static void __init rcu_init_one(void)
         |                    ^~~~~~~~~~~~
   kernel/rcu/tree.c:4703:20: note: previous definition of 'rcu_init_one' with type 'void(void)'
    4703 | static void __init rcu_init_one(void)
         |                    ^~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4789:20: error: redefinition of 'sanitize_kthread_prio'
    4789 | static void __init sanitize_kthread_prio(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4789:20: note: previous definition of 'sanitize_kthread_prio' with type 'void(void)'
    4789 | static void __init sanitize_kthread_prio(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4813:6: error: redefinition of 'rcu_init_geometry'
    4813 | void rcu_init_geometry(void)
         |      ^~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4813:6: note: previous definition of 'rcu_init_geometry' with type 'void(void)'
    4813 | void rcu_init_geometry(void)
         |      ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4906:20: error: redefinition of 'rcu_dump_rcu_node_tree'
    4906 | static void __init rcu_dump_rcu_node_tree(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4906:20: note: previous definition of 'rcu_dump_rcu_node_tree' with type 'void(void)'
    4906 | static void __init rcu_dump_rcu_node_tree(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c:4926:20: error: redefinition of 'kfree_rcu_batch_init'
    4926 | static void __init kfree_rcu_batch_init(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:4926:20: note: previous definition of 'kfree_rcu_batch_init' with type 'void(void)'
    4926 | static void __init kfree_rcu_batch_init(void)
         |                    ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/tree.c: In function 'kfree_rcu_batch_init':
   kernel/rcu/tree.c:4948:47: error: assignment to 'struct kfree_rcu_cpu *' from incompatible pointer type 'struct kfree_rcu_cpu *' [-Werror=incompatible-pointer-types]
    4948 |                         krcp->krw_arr[i].krcp = krcp;
         |                                               ^
   kernel/rcu/tree.c: At top level:
   kernel/rcu/tree.c:4965:13: error: redefinition of 'rcu_init'
    4965 | void __init rcu_init(void)
         |             ^~~~~~~~
   kernel/rcu/tree.c:4965:13: note: previous definition of 'rcu_init' with type 'void(void)'
    4965 | void __init rcu_init(void)
         |             ^~~~~~~~
   In file included from kernel/rcu/tree_stall.h:1061,
                    from kernel/rcu/tree.c:5011:


vim +/rcu_lockdep_current_cpu_online +4118 kernel/rcu/tree.c

5a04848d005e05 Paul E. McKenney 2022-11-06  4104  
5a04848d005e05 Paul E. McKenney 2022-11-06  4105  /*
5a04848d005e05 Paul E. McKenney 2022-11-06  4106   * Is the current CPU online as far as RCU is concerned?
5a04848d005e05 Paul E. McKenney 2022-11-06  4107   *
5a04848d005e05 Paul E. McKenney 2022-11-06  4108   * Disable preemption to avoid false positives that could otherwise
5a04848d005e05 Paul E. McKenney 2022-11-06  4109   * happen due to the current CPU number being sampled, this task being
5a04848d005e05 Paul E. McKenney 2022-11-06  4110   * preempted, its old CPU being taken offline, resuming on some other CPU,
5a04848d005e05 Paul E. McKenney 2022-11-06  4111   * then determining that its old CPU is now offline.
5a04848d005e05 Paul E. McKenney 2022-11-06  4112   *
5a04848d005e05 Paul E. McKenney 2022-11-06  4113   * Disable checking if in an NMI handler because we cannot safely
5a04848d005e05 Paul E. McKenney 2022-11-06  4114   * report errors from NMI handlers anyway.  In addition, it is OK to use
5a04848d005e05 Paul E. McKenney 2022-11-06  4115   * RCU on an offline processor during initial boot, hence the check for
5a04848d005e05 Paul E. McKenney 2022-11-06  4116   * rcu_scheduler_fully_active.
5a04848d005e05 Paul E. McKenney 2022-11-06  4117   */
5a04848d005e05 Paul E. McKenney 2022-11-06 @4118  bool rcu_lockdep_current_cpu_online(void)
5a04848d005e05 Paul E. McKenney 2022-11-06  4119  {
5a04848d005e05 Paul E. McKenney 2022-11-06  4120  	struct rcu_data *rdp;
5a04848d005e05 Paul E. McKenney 2022-11-06  4121  	bool ret = false;
5a04848d005e05 Paul E. McKenney 2022-11-06  4122  
5a04848d005e05 Paul E. McKenney 2022-11-06  4123  	if (in_nmi() || !rcu_scheduler_fully_active)
5a04848d005e05 Paul E. McKenney 2022-11-06  4124  		return true;
5a04848d005e05 Paul E. McKenney 2022-11-06  4125  	preempt_disable_notrace();
5a04848d005e05 Paul E. McKenney 2022-11-06  4126  	rdp = this_cpu_ptr(&rcu_data);
5a04848d005e05 Paul E. McKenney 2022-11-06  4127  	/*
5a04848d005e05 Paul E. McKenney 2022-11-06  4128  	 * Strictly, we care here about the case where the current CPU is
5a04848d005e05 Paul E. McKenney 2022-11-06  4129  	 * in rcu_cpu_starting() and thus has an excuse for rdp->grpmask
5a04848d005e05 Paul E. McKenney 2022-11-06  4130  	 * not being up to date. So arch_spin_is_locked() might have a
5a04848d005e05 Paul E. McKenney 2022-11-06  4131  	 * false positive if it's held by some *other* CPU, but that's
5a04848d005e05 Paul E. McKenney 2022-11-06  4132  	 * OK because that just means a false *negative* on the warning.
5a04848d005e05 Paul E. McKenney 2022-11-06  4133  	 */
5a04848d005e05 Paul E. McKenney 2022-11-06  4134  	if (rcu_rdp_cpu_online(rdp) || arch_spin_is_locked(&rcu_state.ofl_lock))
5a04848d005e05 Paul E. McKenney 2022-11-06  4135  		ret = true;
5a04848d005e05 Paul E. McKenney 2022-11-06  4136  	preempt_enable_notrace();
5a04848d005e05 Paul E. McKenney 2022-11-06  4137  	return ret;
5a04848d005e05 Paul E. McKenney 2022-11-06  4138  }
5a04848d005e05 Paul E. McKenney 2022-11-06  4139  EXPORT_SYMBOL_GPL(rcu_lockdep_current_cpu_online);
5a04848d005e05 Paul E. McKenney 2022-11-06  4140  

:::::: The code at line 4118 was first introduced by commit
:::::: 5a04848d005e051b8c063206b1a03363aca8ade4 rcu: Consolidate initialization and CPU-hotplug code

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
