Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE8EBB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 02:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693361460; x=1724897460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkYig35ukci0q7d200+ymQr16ymIeUOr89oLaAeqzBc=;
  b=RAbV2MWvukEIkSPCh6Mg/7r2/dPvOuVAKGuOplDu4F6y3sQZiN30hSke
   RBW7N/dP6aLuigXWF7ih6poBwEFjxvkZrLzGdy1iBosJmcuF+gLbS3n4p
   K93JvmNNx46nkGX7icEGSpyRWy1LYKxxyjxo8iM0GHABWfL8chuoX/lHJ
   SyvI4BjaXmYJ6FgBnJqIIBxPw9yHuLQPpwb3SuCKDxF6RIe4gFNQR4fHa
   BIXE0arkVt1nZppQzy7FoS1dsFTh7+JeXhkleQ7UmwAloRkAmiPW8U6bH
   V4lZoqV7SXtdswALuO+mJAMR8XySD0WaR8YaCLptZ3BRLYdXMUF9P6Sg5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406523800"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="406523800"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 19:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862446699"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="862446699"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 19:10:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbAfY-0009J2-00;
	Wed, 30 Aug 2023 02:10:56 +0000
Date: Wed, 30 Aug 2023 10:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/stall-detect-fixes 1/5] kernel/rcu/tree.c:78:55: error:
 conflicting types for 'rcu_data'; have 'struct rcu_data'
Message-ID: <202308301058.Nc58Yi3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/stall-detect-fixes
head:   c74543ca98774da6b7ddfd7d2ea4ced0dd65f3ff
commit: 23689bc9fcc577cc5e856f4080565d786e04c28e [1/5] debug: Make clangd work with tree_stall.
config: x86_64-randconfig-002-20230829 (https://download.01.org/0day-ci/archive/20230830/202308301058.Nc58Yi3K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301058.Nc58Yi3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301058.Nc58Yi3K-lkp@intel.com/

Note: the jfern/rcu/stall-detect-fixes HEAD c74543ca98774da6b7ddfd7d2ea4ced0dd65f3ff builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:34:19: error: redefinition of 'tick_device_is_functional'
      34 | static inline int tick_device_is_functional(struct clock_event_device *dev)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:34:19: note: previous definition of 'tick_device_is_functional' with type 'int(struct clock_event_device *)'
      34 | static inline int tick_device_is_functional(struct clock_event_device *dev)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:39:38: error: redefinition of 'clockevent_get_state'
      39 | static inline enum clock_event_state clockevent_get_state(struct clock_event_device *dev)
         |                                      ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:39:38: note: previous definition of 'clockevent_get_state' with type 'enum clock_event_state(struct clock_event_device *)'
      39 | static inline enum clock_event_state clockevent_get_state(struct clock_event_device *dev)
         |                                      ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:44:20: error: redefinition of 'clockevent_set_state'
      44 | static inline void clockevent_set_state(struct clock_event_device *dev,
         |                    ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:44:20: note: previous definition of 'clockevent_set_state' with type 'void(struct clock_event_device *, enum clock_event_state)'
      44 | static inline void clockevent_set_state(struct clock_event_device *dev,
         |                    ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:114:6: error: redefinition of 'tick_setup_oneshot'
     114 | void tick_setup_oneshot(struct clock_event_device *newdev,
         |      ^~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:114:6: note: previous definition of 'tick_setup_oneshot' with type 'void(struct clock_event_device *, void (*)(struct clock_event_device *), ktime_t)' {aka 'void(struct clock_event_device *, void (*)(struct clock_event_device *), long long int)'}
     114 | void tick_setup_oneshot(struct clock_event_device *newdev,
         |      ^~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:117:20: error: redefinition of 'tick_resume_oneshot'
     117 | static inline void tick_resume_oneshot(void) { BUG(); }
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:117:20: note: previous definition of 'tick_resume_oneshot' with type 'void(void)'
     117 | static inline void tick_resume_oneshot(void) { BUG(); }
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:118:19: error: redefinition of 'tick_program_event'
     118 | static inline int tick_program_event(ktime_t expires, int force) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:118:19: note: previous definition of 'tick_program_event' with type 'int(ktime_t,  int)' {aka 'int(long long int,  int)'}
     118 | static inline int tick_program_event(ktime_t expires, int force) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:119:20: error: redefinition of 'tick_oneshot_notify'
     119 | static inline void tick_oneshot_notify(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:119:20: note: previous definition of 'tick_oneshot_notify' with type 'void(void)'
     119 | static inline void tick_oneshot_notify(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:120:20: error: redefinition of 'tick_oneshot_possible'
     120 | static inline bool tick_oneshot_possible(void) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:120:20: note: previous definition of 'tick_oneshot_possible' with type 'bool(void)' {aka '_Bool(void)'}
     120 | static inline bool tick_oneshot_possible(void) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:121:19: error: redefinition of 'tick_oneshot_mode_active'
     121 | static inline int tick_oneshot_mode_active(void) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:121:19: note: previous definition of 'tick_oneshot_mode_active' with type 'int(void)'
     121 | static inline int tick_oneshot_mode_active(void) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:122:20: error: redefinition of 'tick_clock_notify'
     122 | static inline void tick_clock_notify(void) { }
         |                    ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:122:20: note: previous definition of 'tick_clock_notify' with type 'void(void)'
     122 | static inline void tick_clock_notify(void) { }
         |                    ^~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:123:19: error: redefinition of 'tick_check_oneshot_change'
     123 | static inline int tick_check_oneshot_change(int allow_nohz) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:123:19: note: previous definition of 'tick_check_oneshot_change' with type 'int(int)'
     123 | static inline int tick_check_oneshot_change(int allow_nohz) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:134:20: error: redefinition of 'tick_broadcast_switch_to_oneshot'
     134 | static inline void tick_broadcast_switch_to_oneshot(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:134:20: note: previous definition of 'tick_broadcast_switch_to_oneshot' with type 'void(void)'
     134 | static inline void tick_broadcast_switch_to_oneshot(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:135:19: error: redefinition of 'tick_broadcast_oneshot_active'
     135 | static inline int tick_broadcast_oneshot_active(void) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:135:19: note: previous definition of 'tick_broadcast_oneshot_active' with type 'int(void)'
     135 | static inline int tick_broadcast_oneshot_active(void) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:136:20: error: redefinition of 'tick_check_oneshot_broadcast_this_cpu'
     136 | static inline void tick_check_oneshot_broadcast_this_cpu(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:136:20: note: previous definition of 'tick_check_oneshot_broadcast_this_cpu' with type 'void(void)'
     136 | static inline void tick_check_oneshot_broadcast_this_cpu(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:137:20: error: redefinition of 'tick_broadcast_oneshot_available'
     137 | static inline bool tick_broadcast_oneshot_available(void) { return tick_oneshot_possible(); }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:137:20: note: previous definition of 'tick_broadcast_oneshot_available' with type 'bool(void)' {aka '_Bool(void)'}
     137 | static inline bool tick_broadcast_oneshot_available(void) { return tick_oneshot_possible(); }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:143:20: error: redefinition of 'tick_broadcast_offline'
     143 | static inline void tick_broadcast_offline(unsigned int cpu) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:143:20: note: previous definition of 'tick_broadcast_offline' with type 'void(unsigned int)'
     143 | static inline void tick_broadcast_offline(unsigned int cpu) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:150:20: error: redefinition of 'tick_nohz_init'
     150 | static inline void tick_nohz_init(void) { }
         |                    ^~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:150:20: note: previous definition of 'tick_nohz_init' with type 'void(void)'
     150 | static inline void tick_nohz_init(void) { }
         |                    ^~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/../time/tick-internal.h:160:20: error: redefinition of 'timers_update_nohz'
     160 | static inline void timers_update_nohz(void) { }
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:66:
   kernel/rcu/../time/tick-internal.h:160:20: note: previous definition of 'timers_update_nohz' with type 'void(void)'
     160 | static inline void timers_update_nohz(void) { }
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/rcu_segcblist.h:13:20: error: redefinition of 'rcu_cblist_n_cbs'
      13 | static inline long rcu_cblist_n_cbs(struct rcu_cblist *rclp)
         |                    ^~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:13:20: note: previous definition of 'rcu_cblist_n_cbs' with type 'long int(struct rcu_cblist *)'
      13 | static inline long rcu_cblist_n_cbs(struct rcu_cblist *rclp)
         |                    ^~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
>> kernel/rcu/rcu_segcblist.h:43:20: error: redefinition of 'rcu_segcblist_empty'
      43 | static inline bool rcu_segcblist_empty(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:43:20: note: previous definition of 'rcu_segcblist_empty' with type 'bool(struct rcu_segcblist *)' {aka '_Bool(struct rcu_segcblist *)'}
      43 | static inline bool rcu_segcblist_empty(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:49:20: error: redefinition of 'rcu_segcblist_n_cbs'
      49 | static inline long rcu_segcblist_n_cbs(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:49:20: note: previous definition of 'rcu_segcblist_n_cbs' with type 'long int(struct rcu_segcblist *)'
      49 | static inline long rcu_segcblist_n_cbs(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:58:20: error: redefinition of 'rcu_segcblist_set_flags'
      58 | static inline void rcu_segcblist_set_flags(struct rcu_segcblist *rsclp,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:58:20: note: previous definition of 'rcu_segcblist_set_flags' with type 'void(struct rcu_segcblist *, int)'
      58 | static inline void rcu_segcblist_set_flags(struct rcu_segcblist *rsclp,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:64:20: error: redefinition of 'rcu_segcblist_clear_flags'
      64 | static inline void rcu_segcblist_clear_flags(struct rcu_segcblist *rsclp,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:64:20: note: previous definition of 'rcu_segcblist_clear_flags' with type 'void(struct rcu_segcblist *, int)'
      64 | static inline void rcu_segcblist_clear_flags(struct rcu_segcblist *rsclp,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:70:20: error: redefinition of 'rcu_segcblist_test_flags'
      70 | static inline bool rcu_segcblist_test_flags(struct rcu_segcblist *rsclp,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:70:20: note: previous definition of 'rcu_segcblist_test_flags' with type 'bool(struct rcu_segcblist *, int)' {aka '_Bool(struct rcu_segcblist *, int)'}
      70 | static inline bool rcu_segcblist_test_flags(struct rcu_segcblist *rsclp,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:80:20: error: redefinition of 'rcu_segcblist_is_enabled'
      80 | static inline bool rcu_segcblist_is_enabled(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:80:20: note: previous definition of 'rcu_segcblist_is_enabled' with type 'bool(struct rcu_segcblist *)' {aka '_Bool(struct rcu_segcblist *)'}
      80 | static inline bool rcu_segcblist_is_enabled(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:89:20: error: redefinition of 'rcu_segcblist_is_offloaded'
      89 | static inline bool rcu_segcblist_is_offloaded(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:89:20: note: previous definition of 'rcu_segcblist_is_offloaded' with type 'bool(struct rcu_segcblist *)' {aka '_Bool(struct rcu_segcblist *)'}
      89 | static inline bool rcu_segcblist_is_offloaded(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:98:20: error: redefinition of 'rcu_segcblist_completely_offloaded'
      98 | static inline bool rcu_segcblist_completely_offloaded(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:
   kernel/rcu/rcu_segcblist.h:98:20: note: previous definition of 'rcu_segcblist_completely_offloaded' with type 'bool(struct rcu_segcblist *)' {aka '_Bool(struct rcu_segcblist *)'}
      98 | static inline bool rcu_segcblist_completely_offloaded(struct rcu_segcblist *rsclp)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68,
                    from kernel/rcu/tree_stall.h:12,
                    from kernel/rcu/tree.c:5011:
   kernel/rcu/rcu_segcblist.h:112:20: error: redefinition of 'rcu_segcblist_restempty'
     112 | static inline bool rcu_segcblist_restempty(struct rcu_segcblist *rsclp, int seg)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:22,
                    from kernel/rcu/tree.c:68:


vim +78 kernel/rcu/tree.c

64db4cfff99c04c kernel/rcutree.c  Paul E. McKenney          2008-12-18   77  
4c5273bf2b5ed9b kernel/rcu/tree.c Paul E. McKenney          2018-08-03  @78  static DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data) = {
a5d1b0b68a62afb kernel/rcu/tree.c Paul E. McKenney          2022-08-04   79  	.gpwrap = true,
8d346d438f93b53 kernel/rcu/tree.c Frederic Weisbecker       2020-11-13   80  #ifdef CONFIG_RCU_NOCB_CPU
213d56bf33bdda8 kernel/rcu/tree.c Frederic Weisbecker       2021-10-19   81  	.cblist.flags = SEGCBLIST_RCU_CORE,
8d346d438f93b53 kernel/rcu/tree.c Frederic Weisbecker       2020-11-13   82  #endif
4c5273bf2b5ed9b kernel/rcu/tree.c Paul E. McKenney          2018-08-03   83  };
c30fe5418964406 kernel/rcu/tree.c Paul E. McKenney          2019-10-11  @84  static struct rcu_state rcu_state = {
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   85  	.level = { &rcu_state.node[0] },
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   86  	.gp_state = RCU_GP_IDLE,
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   87  	.gp_seq = (0UL - 300UL) << RCU_SEQ_CTR_SHIFT,
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   88  	.barrier_mutex = __MUTEX_INITIALIZER(rcu_state.barrier_mutex),
80b3fd474c91b3e kernel/rcu/tree.c Paul E. McKenney          2021-12-14   89  	.barrier_lock = __RAW_SPIN_LOCK_UNLOCKED(rcu_state.barrier_lock),
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   90  	.name = RCU_NAME,
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   91  	.abbr = RCU_ABBR,
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   92  	.exp_mutex = __MUTEX_INITIALIZER(rcu_state.exp_mutex),
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   93  	.exp_wake_mutex = __MUTEX_INITIALIZER(rcu_state.exp_wake_mutex),
82980b1622d9701 kernel/rcu/tree.c David Woodhouse           2021-02-16   94  	.ofl_lock = __ARCH_SPIN_LOCK_UNLOCKED,
358be2d3685cb0c kernel/rcu/tree.c Paul E. McKenney          2018-07-03   95  };
27f4d28057adf98 kernel/rcutree.c  Paul E. McKenney          2011-02-07   96  
a3dc2948cec80f2 kernel/rcu/tree.c Paul E. McKenney          2015-04-20   97  /* Dump rcu_node combining tree at boot to verify correct setup. */
a3dc2948cec80f2 kernel/rcu/tree.c Paul E. McKenney          2015-04-20   98  static bool dump_tree;
a3dc2948cec80f2 kernel/rcu/tree.c Paul E. McKenney          2015-04-20   99  module_param(dump_tree, bool, 0444);
48d07c04b4cc1dc kernel/rcu/tree.c Sebastian Andrzej Siewior 2019-03-20  100  /* By default, use RCU_SOFTIRQ instead of rcuc kthreads. */
8b9a0ecc7ef5e1e kernel/rcu/tree.c Scott Wood                2020-12-15 @101  static bool use_softirq = !IS_ENABLED(CONFIG_PREEMPT_RT);
8b9a0ecc7ef5e1e kernel/rcu/tree.c Scott Wood                2020-12-15  102  #ifndef CONFIG_PREEMPT_RT
48d07c04b4cc1dc kernel/rcu/tree.c Sebastian Andrzej Siewior 2019-03-20  103  module_param(use_softirq, bool, 0444);
8b9a0ecc7ef5e1e kernel/rcu/tree.c Scott Wood                2020-12-15  104  #endif
7fa270010e0ddd3 kernel/rcu/tree.c Paul E. McKenney          2015-04-20  105  /* Control rcu_node-tree auto-balancing at boot time. */
7fa270010e0ddd3 kernel/rcu/tree.c Paul E. McKenney          2015-04-20  106  static bool rcu_fanout_exact;
7fa270010e0ddd3 kernel/rcu/tree.c Paul E. McKenney          2015-04-20  107  module_param(rcu_fanout_exact, bool, 0444);
47d631af58bb9b2 kernel/rcu/tree.c Paul E. McKenney          2015-04-21  108  /* Increase (but not decrease) the RCU_FANOUT_LEAF at boot time. */
47d631af58bb9b2 kernel/rcu/tree.c Paul E. McKenney          2015-04-21 @109  static int rcu_fanout_leaf = RCU_FANOUT_LEAF;
7e5c2dfb4de15e2 kernel/rcutree.c  Paul E. McKenney          2012-07-01  110  module_param(rcu_fanout_leaf, int, 0444);
f885b7f2b2de70b kernel/rcutree.c  Paul E. McKenney          2012-04-23 @111  int rcu_num_lvls __read_mostly = RCU_NUM_LVLS;
cb007102398edd0 kernel/rcu/tree.c Alexander Gordeev         2015-06-03  112  /* Number of rcu_nodes at specified level. */
e95d68d2127716c kernel/rcu/tree.c Paul E. McKenney          2017-03-15 @113  int num_rcu_lvl[] = NUM_RCU_LVL_INIT;
f885b7f2b2de70b kernel/rcutree.c  Paul E. McKenney          2012-04-23 @114  int rcu_num_nodes __read_mostly = NUM_RCU_NODES; /* Total # rcu_nodes in use. */
f885b7f2b2de70b kernel/rcutree.c  Paul E. McKenney          2012-04-23  115  
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  116  /*
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  117   * The rcu_scheduler_active variable is initialized to the value
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  118   * RCU_SCHEDULER_INACTIVE and transitions RCU_SCHEDULER_INIT just before the
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  119   * first task is spawned.  So when this variable is RCU_SCHEDULER_INACTIVE,
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  120   * RCU can assume that there is but one task, allowing RCU to (for example)
0d95092ccba1a30 kernel/rcu/tree.c Paul E. McKenney          2016-04-08  121   * optimize synchronize_rcu() to a simple barrier().  When this variable
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  122   * is RCU_SCHEDULER_INIT, RCU must actually do all the hard work required
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  123   * to detect real grace periods.  This variable is also used to suppress
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  124   * boot-time false positives from lockdep-RCU error checking.  Finally, it
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  125   * transitions from RCU_SCHEDULER_INIT to RCU_SCHEDULER_RUNNING after RCU
52d7e48b86fc108 kernel/rcu/tree.c Paul E. McKenney          2017-01-10  126   * is fully initialized, including all of its kthreads having been spawned.
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  127   */
bbad937983147c0 kernel/rcutree.c  Paul E. McKenney          2010-04-02  128  int rcu_scheduler_active __read_mostly;
bbad937983147c0 kernel/rcutree.c  Paul E. McKenney          2010-04-02  129  EXPORT_SYMBOL_GPL(rcu_scheduler_active);
bbad937983147c0 kernel/rcutree.c  Paul E. McKenney          2010-04-02  130  
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  131  /*
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  132   * The rcu_scheduler_fully_active variable transitions from zero to one
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  133   * during the early_initcall() processing, which is after the scheduler
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  134   * is capable of creating new tasks.  So RCU processing (for example,
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  135   * creating tasks for RCU priority boosting) must be delayed until after
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  136   * rcu_scheduler_fully_active transitions from zero to one.  We also
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  137   * currently delay invocation of any RCU callbacks until after this point.
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  138   *
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  139   * It might later prove better for people registering RCU callbacks during
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  140   * early boot to take responsibility for these callbacks, but one step at
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  141   * a time.
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  142   */
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  143  static int rcu_scheduler_fully_active __read_mostly;
b0d304172f49061 kernel/rcutree.c  Paul E. McKenney          2011-07-10  144  
b50912d0b5e03f1 kernel/rcu/tree.c Paul E. McKenney          2018-07-03 @145  static void rcu_report_qs_rnp(unsigned long mask, struct rcu_node *rnp,
b50912d0b5e03f1 kernel/rcu/tree.c Paul E. McKenney          2018-07-03  146  			      unsigned long gps, unsigned long flags);
5d01bbd111d6ff9 kernel/rcutree.c  Thomas Gleixner           2012-07-16 @147  static void rcu_boost_kthread_setaffinity(struct rcu_node *rnp, int outgoingcpu);
a46e0899eec7a30 kernel/rcutree.c  Paul E. McKenney          2011-06-15  148  static void invoke_rcu_core(void);
63d4c8c97948b0b kernel/rcu/tree.c Paul E. McKenney          2018-07-03 @149  static void rcu_report_exp_rdp(struct rcu_data *rdp);
3549c2bc2c4ea8e kernel/rcu/tree.c Paul E. McKenney          2016-04-15  150  static void sync_sched_exp_online_cleanup(int cpu);
b2b00ddf193bf83 kernel/rcu/tree.c Paul E. McKenney          2019-10-30 @151  static void check_cb_ovld_locked(struct rcu_data *rdp, struct rcu_node *rnp);
3820b513a2e33d6 kernel/rcu/tree.c Frederic Weisbecker       2020-11-12 @152  static bool rcu_rdp_is_offloaded(struct rcu_data *rdp);
5a04848d005e051 kernel/rcu/tree.c Paul E. McKenney          2022-11-06 @153  static bool rcu_rdp_cpu_online(struct rcu_data *rdp);
5a04848d005e051 kernel/rcu/tree.c Paul E. McKenney          2022-11-06  154  static bool rcu_init_invoked(void);
5a04848d005e051 kernel/rcu/tree.c Paul E. McKenney          2022-11-06 @155  static void rcu_cleanup_dead_rnp(struct rcu_node *rnp_leaf);
5a04848d005e051 kernel/rcu/tree.c Paul E. McKenney          2022-11-06 @156  static void rcu_init_new_rnp(struct rcu_node *rnp_leaf);
a26ac2455ffcf3b kernel/rcutree.c  Paul E. McKenney          2011-01-12  157  
8f489b4da5278fc kernel/rcu/tree.c Uladzislau Rezki (Sony    2022-05-11  158) /*
8f489b4da5278fc kernel/rcu/tree.c Uladzislau Rezki (Sony    2022-05-11  159)  * rcuc/rcub/rcuop kthread realtime priority. The "rcuop"
8f489b4da5278fc kernel/rcu/tree.c Uladzislau Rezki (Sony    2022-05-11  160)  * real-time priority(enabling/disabling) is controlled by
8f489b4da5278fc kernel/rcu/tree.c Uladzislau Rezki (Sony    2022-05-11  161)  * the extra CONFIG_RCU_NOCB_CPU_CB_BOOST configuration.
8f489b4da5278fc kernel/rcu/tree.c Uladzislau Rezki (Sony    2022-05-11  162)  */
26730f55c2842b4 kernel/rcu/tree.c Paul E. McKenney          2015-04-21 @163  static int kthread_prio = IS_ENABLED(CONFIG_RCU_BOOST) ? 1 : 0;
3ffe3d1adc0b6cf kernel/rcu/tree.c Liu Song                  2019-02-21  164  module_param(kthread_prio, int, 0444);
a94844b22a2e2b9 kernel/rcu/tree.c Paul E. McKenney          2014-12-12  165  
8d7dc9283f399e1 kernel/rcu/tree.c Paul E. McKenney          2015-04-14  166  /* Delay in jiffies for grace-period initialization delays, debug only. */
0f41c0ddadfb3d5 kernel/rcu/tree.c Paul E. McKenney          2015-03-10  167  
90040c9e3015054 kernel/rcu/tree.c Paul E. McKenney          2017-05-10  168  static int gp_preinit_delay;
90040c9e3015054 kernel/rcu/tree.c Paul E. McKenney          2017-05-10  169  module_param(gp_preinit_delay, int, 0444);
90040c9e3015054 kernel/rcu/tree.c Paul E. McKenney          2017-05-10  170  static int gp_init_delay;
90040c9e3015054 kernel/rcu/tree.c Paul E. McKenney          2017-05-10  171  module_param(gp_init_delay, int, 0444);
90040c9e3015054 kernel/rcu/tree.c Paul E. McKenney          2017-05-10  172  static int gp_cleanup_delay;
90040c9e3015054 kernel/rcu/tree.c Paul E. McKenney          2017-05-10  173  module_param(gp_cleanup_delay, int, 0444);
0f41c0ddadfb3d5 kernel/rcu/tree.c Paul E. McKenney          2015-03-10  174  
aa40c138cc8f36e kernel/rcu/tree.c Paul E. McKenney          2020-08-10  175  // Add delay to rcu_read_unlock() for strict grace periods.
aa40c138cc8f36e kernel/rcu/tree.c Paul E. McKenney          2020-08-10  176  static int rcu_unlock_delay;
aa40c138cc8f36e kernel/rcu/tree.c Paul E. McKenney          2020-08-10  177  #ifdef CONFIG_RCU_STRICT_GRACE_PERIOD
aa40c138cc8f36e kernel/rcu/tree.c Paul E. McKenney          2020-08-10  178  module_param(rcu_unlock_delay, int, 0444);
aa40c138cc8f36e kernel/rcu/tree.c Paul E. McKenney          2020-08-10  179  #endif
aa40c138cc8f36e kernel/rcu/tree.c Paul E. McKenney          2020-08-10  180  
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  181) /*
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  182)  * This rcu parameter is runtime-read-only. It reflects
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  183)  * a minimum allowed number of objects which can be cached
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  184)  * per-CPU. Object size is equal to one page. This value
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  185)  * can be changed at boot time.
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  186)  */
56292e8609e3953 kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-10-29 @187) static int rcu_min_cached_objs = 5;
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  188) module_param(rcu_min_cached_objs, int, 0444);
53c72b590b3a0af kernel/rcu/tree.c Uladzislau Rezki (Sony    2020-05-25  189) 
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  190  // A page shrinker can ask for pages to be freed to make them
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  191  // available for other parts of the system. This usually happens
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  192  // under low memory conditions, and in that case we should also
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  193  // defer page-cache filling for a short time period.
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  194  //
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  195  // The default value is 5 seconds, which is long enough to reduce
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  196  // interference with the shrinker while it asks other systems to
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  197  // drain their caches.
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15 @198  static int rcu_delay_page_cache_fill_msec = 5000;
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  199  module_param(rcu_delay_page_cache_fill_msec, int, 0444);
d0bfa8b3c411e25 kernel/rcu/tree.c Zhang Qiang               2021-04-15  200  
4cf439a200fd621 kernel/rcu/tree.c Paul E. McKenney          2018-07-02  201  /* Retrieve RCU kthreads priority for rcutorture */
4babd855fd6137f kernel/rcu/tree.c Joel Fernandes (Google    2018-06-19 @202) int rcu_get_gp_kthreads_prio(void)
4babd855fd6137f kernel/rcu/tree.c Joel Fernandes (Google    2018-06-19  203) {
4babd855fd6137f kernel/rcu/tree.c Joel Fernandes (Google    2018-06-19  204) 	return kthread_prio;
4babd855fd6137f kernel/rcu/tree.c Joel Fernandes (Google    2018-06-19  205) }
4babd855fd6137f kernel/rcu/tree.c Joel Fernandes (Google    2018-06-19  206) EXPORT_SYMBOL_GPL(rcu_get_gp_kthreads_prio);
4babd855fd6137f kernel/rcu/tree.c Joel Fernandes (Google    2018-06-19  207) 
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  208  /*
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  209   * Number of grace periods between delays, normalized by the duration of
bfd090be14edeff kernel/rcu/tree.c Paul E. McKenney          2017-02-08  210   * the delay.  The longer the delay, the more the grace periods between
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  211   * each delay.  The reason for this normalization is that it means that,
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  212   * for non-zero delays, the overall slowdown of grace periods is constant
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  213   * regardless of the duration of the delay.  This arrangement balances
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  214   * the need for long delays to increase some race probabilities with the
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  215   * need for fast grace periods to increase other race probabilities.
eab128e8305f2bc kernel/rcu/tree.c Paul E. McKenney          2015-04-15  216   */
277ffe1b7092808 kernel/rcu/tree.c Zhouyi Zhou               2021-03-30  217  #define PER_RCU_NODE_PERIOD 3	/* Number of grace periods between delays for debugging. */
37745d281069682 kernel/rcu/tree.c Paul E. McKenney          2015-01-22  218  
fc2219d49ef1606 kernel/rcutree.c  Paul E. McKenney          2009-09-23  219  /*
7d0ae8086b82831 kernel/rcu/tree.c Paul E. McKenney          2015-03-03  220   * Return true if an RCU grace period is in progress.  The READ_ONCE()s
fc2219d49ef1606 kernel/rcutree.c  Paul E. McKenney          2009-09-23  221   * permit this function to be invoked without holding the root rcu_node
fc2219d49ef1606 kernel/rcutree.c  Paul E. McKenney          2009-09-23  222   * structure's ->lock, but of course results can be subject to change.
fc2219d49ef1606 kernel/rcutree.c  Paul E. McKenney          2009-09-23  223   */
de8e87305a1ae87 kernel/rcu/tree.c Paul E. McKenney          2018-07-03 @224  static int rcu_gp_in_progress(void)
b1f77b0581b8fd8 kernel/rcutree.c  Ingo Molnar               2009-03-13  225  {
de8e87305a1ae87 kernel/rcu/tree.c Paul E. McKenney          2018-07-03  226  	return rcu_seq_state(rcu_seq_current(&rcu_state.gp_seq));
b1f77b0581b8fd8 kernel/rcutree.c  Ingo Molnar               2009-03-13  227  }
b1f77b0581b8fd8 kernel/rcutree.c  Ingo Molnar               2009-03-13  228  
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  229  /*
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  230   * Return the number of callbacks queued on the specified CPU.
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  231   * Handles both the nocbs and normal cases.
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  232   */
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02 @233  static long rcu_get_n_cbs_cpu(int cpu)
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  234  {
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  235  	struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  236  
c035280f1761b33 kernel/rcu/tree.c Paul E. McKenney          2019-05-21  237  	if (rcu_segcblist_is_enabled(&rdp->cblist))
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  238  		return rcu_segcblist_n_cbs(&rdp->cblist);
c035280f1761b33 kernel/rcu/tree.c Paul E. McKenney          2019-05-21  239  	return 0;
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  240  }
903ee83d91776bc kernel/rcu/tree.c Paul E. McKenney          2018-10-02  241  
d28139c4e96713d kernel/rcu/tree.c Paul E. McKenney          2018-06-28 @242  void rcu_softirq_qs(void)
b1f77b0581b8fd8 kernel/rcutree.c  Ingo Molnar               2009-03-13  243  {
45975c7d21a1c0a kernel/rcu/tree.c Paul E. McKenney          2018-07-02  244  	rcu_qs();
d28139c4e96713d kernel/rcu/tree.c Paul E. McKenney          2018-06-28  245  	rcu_preempt_deferred_qs(current);
cf868c2af244417 kernel/rcu/tree.c Paul E. McKenney          2021-03-24  246  	rcu_tasks_qs(current, false);
b1f77b0581b8fd8 kernel/rcutree.c  Ingo Molnar               2009-03-13  247  }
64db4cfff99c04c kernel/rcutree.c  Paul E. McKenney          2008-12-18  248  
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  249  /*
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  250   * Reset the current CPU's ->dynticks counter to indicate that the
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  251   * newly onlined CPU is no longer in an extended quiescent state.
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  252   * This will either leave the counter unchanged, or increment it
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  253   * to the next non-quiescent value.
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  254   *
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  255   * The non-atomic test/increment sequence works because the upper bits
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  256   * of the ->dynticks counter are manipulated only by the corresponding CPU,
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  257   * or when the corresponding CPU is offline.
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  258   */
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02 @259  static void rcu_dynticks_eqs_online(void)
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  260  {
171476775d32a40 kernel/rcu/tree.c Frederic Weisbecker       2022-06-08  261  	if (ct_dynticks() & RCU_DYNTICKS_IDX)
2625d469baeef3a kernel/rcu/tree.c Paul E. McKenney          2016-11-02  262  		return;
171476775d32a40 kernel/rcu/tree.c Frederic Weisbecker       2022-06-08  263  	ct_state_inc(RCU_DYNTICKS_IDX);
02a5c550b2738f2 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  264  }
02a5c550b2738f2 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  265  
8b2f63ab05eb233 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  266  /*
8b2f63ab05eb233 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  267   * Snapshot the ->dynticks counter with full ordering so as to allow
8b2f63ab05eb233 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  268   * stable comparison of this counter with past and future snapshots.
8b2f63ab05eb233 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  269   */
62e2412df4b90ae kernel/rcu/tree.c Frederic Weisbecker       2022-06-08 @270  static int rcu_dynticks_snap(int cpu)
8b2f63ab05eb233 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  271  {
2be57f732889277 kernel/rcu/tree.c Paul E. McKenney          2021-05-19  272  	smp_mb();  // Fundamental RCU ordering guarantee.
62e2412df4b90ae kernel/rcu/tree.c Frederic Weisbecker       2022-06-08  273  	return ct_dynticks_cpu_acquire(cpu);
8b2f63ab05eb233 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  274  }
8b2f63ab05eb233 kernel/rcu/tree.c Paul E. McKenney          2016-11-02  275  

:::::: The code at line 78 was first introduced by commit
:::::: 4c5273bf2b5ed9b585e470dda19c09c875a9fbbd rcu: Switch dyntick nesting counters to rcu_data structure

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
