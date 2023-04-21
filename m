Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDBD160
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 00:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682036941; x=1713572941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsBDIbvS/cdp6jZOeZvMbsJpfcTchq7fbjZOHC2E8OI=;
  b=MjGLvNw1sEYGFLfDnu5YIyMX+51IHLyxoIOSPebHB2GsvkVwVaXBlB94
   I+ggZX6MOlLnqXMTf19QwXQZYlfqUxP5q4nznbWuY8M2njV7IUu9nvV7K
   xOCi+dKGuqP4i1OWWaPXlmi1P44q+NaMECgzpZkUXueOPl0lUy/ZLB2pX
   EMECqm1eWKiNUckVHkQv/BKqh2y8qDp0OmjevGCIn+EkPTdrVjYXRdPWg
   nTvCILTmk+r4+xa6McZVl5SRLMp5PflDH68AGwTlsheP/TDsrnBjB9552
   tQqjEThSsEhQq/s8hSIYvXK6W331Gghy6F7IM6SzHVvnxf33vOh8wPcaM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="345901575"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="345901575"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 17:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724623179"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="724623179"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Apr 2023 17:28:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppee2-000gCC-0x;
	Fri, 21 Apr 2023 00:28:58 +0000
Date: Fri, 21 Apr 2023 08:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 2/2] kernel/rcu/debug.h:63:5: warning: no
 previous prototype for 'rcu_debug_ptr_queue'
Message-ID: <202304210804.dL0i10IW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   c3c9af7f55e25cd3aa48db8bb3623102f34285cb
commit: c3c9af7f55e25cd3aa48db8bb3623102f34285cb [2/2] rcu/debug: Add support for debugfs debugging of RCU CBs.
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230421/202304210804.dL0i10IW-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=c3c9af7f55e25cd3aa48db8bb3623102f34285cb
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout c3c9af7f55e25cd3aa48db8bb3623102f34285cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210804.dL0i10IW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h: In function '__find_func':
   kernel/rcu/debug.h:28:16: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs_nr'
      28 |         e = rdp->rcu_debug_ptrs_nr - 1;
         |                ^~
   kernel/rcu/debug.h:32:25: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      32 |                 p = &rdp->rcu_debug_ptrs[n];
         |                         ^~
   kernel/rcu/debug.h:50:41: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      50 |                 *valid = (b <= e) && rdp->rcu_debug_ptrs[n].valid;
         |                                         ^~
   kernel/rcu/debug.h: At top level:
>> kernel/rcu/debug.h:63:5: warning: no previous prototype for 'rcu_debug_ptr_queue' [-Wmissing-prototypes]
      63 | int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr, bool lazy)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h: In function 'rcu_debug_ptr_queue':
   kernel/rcu/debug.h:71:16: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs_nr'
      71 |         if (rdp->rcu_debug_ptrs_nr >= RCU_DEBUGFS_PTRS_SIZE) {
         |                ^~
   kernel/rcu/debug.h:79:29: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs_nr'
      79 |                 if (n != rdp->rcu_debug_ptrs_nr)
         |                             ^~
   kernel/rcu/debug.h:80:37: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      80 |                         memmove(&rdp->rcu_debug_ptrs[n+1], &rdp->rcu_debug_ptrs[n],
         |                                     ^~
   kernel/rcu/debug.h:80:64: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      80 |                         memmove(&rdp->rcu_debug_ptrs[n+1], &rdp->rcu_debug_ptrs[n],
         |                                                                ^~
   kernel/rcu/debug.h:81:64: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs_nr'
      81 |                                 (sizeof(rcu_debug_entry) * (rdp->rcu_debug_ptrs_nr - n)));
         |                                                                ^~
   kernel/rcu/debug.h:83:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      83 |                 rdp->rcu_debug_ptrs[n].ip = ip;
         |                    ^~
   kernel/rcu/debug.h:84:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      84 |                 rdp->rcu_debug_ptrs[n].valid = true;
         |                    ^~
   kernel/rcu/debug.h:85:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      85 |                 rdp->rcu_debug_ptrs[n].in_flight = false;
         |                    ^~
   kernel/rcu/debug.h:86:20: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs_nr'
      86 |                 rdp->rcu_debug_ptrs_nr++;
         |                    ^~
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from kernel/rcu/tree.c:21:
   kernel/rcu/debug.h:90:34: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      90 |         WARN_ON_ONCE(valid && rdp->rcu_debug_ptrs[n].in_flight);
         |                                  ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/rcu/debug.h:90:9: note: in expansion of macro 'WARN_ON_ONCE'
      90 |         WARN_ON_ONCE(valid && rdp->rcu_debug_ptrs[n].in_flight);
         |         ^~~~~~~~~~~~
   kernel/rcu/debug.h:92:12: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      92 |         rdp->rcu_debug_ptrs[n].lazy = lazy;
         |            ^~
   kernel/rcu/debug.h:93:12: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      93 |         rdp->rcu_debug_ptrs[n].in_flight = true;
         |            ^~
   kernel/rcu/debug.h:94:12: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
      94 |         rdp->rcu_debug_ptrs[n].queue_jiffies = get_jiffies_64();
         |            ^~
   kernel/rcu/debug.h: At top level:
>> kernel/rcu/debug.h:99:17: warning: no previous prototype for 'rcu_debug_ptr_unqueue' [-Wmissing-prototypes]
      99 | rcu_debug_entry rcu_debug_ptr_unqueue(struct rcu_data *rdp, void* ip_ptr)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/debug.h: In function 'rcu_debug_ptr_unqueue':
   kernel/rcu/debug.h:113:26: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
     113 |         if (!valid ||!rdp->rcu_debug_ptrs[n].in_flight)
         |                          ^~
   kernel/rcu/debug.h:115:26: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
     115 |         WARN_ON_ONCE(!rdp->rcu_debug_ptrs[n].valid);
         |                          ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/rcu/debug.h:115:9: note: in expansion of macro 'WARN_ON_ONCE'
     115 |         WARN_ON_ONCE(!rdp->rcu_debug_ptrs[n].valid);
         |         ^~~~~~~~~~~~
   kernel/rcu/debug.h:117:12: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
     117 |         rdp->rcu_debug_ptrs[n].in_flight = false;
         |            ^~
   kernel/rcu/debug.h:118:19: error: 'struct rcu_data' has no member named 'rcu_debug_ptrs'
     118 |         return rdp->rcu_debug_ptrs[n];
         |                   ^~
   kernel/rcu/debug.h: At top level:
>> kernel/rcu/debug.h:121:6: warning: no previous prototype for 'rcu_debug_set_context' [-Wmissing-prototypes]
     121 | void rcu_debug_set_context(struct rcu_data *rdp, void *ip)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/debug.h:129:6: warning: no previous prototype for 'rcu_debug_reset_context' [-Wmissing-prototypes]
     129 | void rcu_debug_reset_context(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/debug.h:135:6: warning: no previous prototype for 'rcu_is_lazy_context' [-Wmissing-prototypes]
     135 | bool rcu_is_lazy_context(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/rcu/debug.h:158:6: warning: no previous prototype for 'rcu_debug_init' [-Wmissing-prototypes]
     158 | void rcu_debug_init(void)
         |      ^~~~~~~~~~~~~~
   kernel/rcu/tree.c: In function 'rcu_do_batch':
   kernel/rcu/tree.c:2110:22: error: implicit declaration of function 'rcu_debug_ptr_unqueue_lock'; did you mean 'rcu_debug_ptr_unqueue'? [-Werror=implicit-function-declaration]
    2110 |                 de = rcu_debug_ptr_unqueue_lock(rdp, rhp);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      rcu_debug_ptr_unqueue
   kernel/rcu/tree.c:2110:22: error: incompatible types when assigning to type 'rcu_debug_entry' from type 'int'
   kernel/rcu/tree.c:2120:25: error: implicit declaration of function 'rcu_debug_set_context_lock'; did you mean 'rcu_debug_set_context'? [-Werror=implicit-function-declaration]
    2120 |                         rcu_debug_set_context_lock(rdp, f);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         rcu_debug_set_context
   kernel/rcu/tree.c: In function '__call_rcu_common':
   kernel/rcu/tree.c:2651:9: error: implicit declaration of function 'rcu_debug_ptr_queue_lock'; did you mean 'rcu_debug_ptr_queue'? [-Werror=implicit-function-declaration]
    2651 |         rcu_debug_ptr_queue_lock(rdp, (void *)head, lazy);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         rcu_debug_ptr_queue
   kernel/rcu/tree.c: In function 'rcu_init':
   kernel/rcu/tree.c:4930:26: warning: unused variable 'rdp' [-Wunused-variable]
    4930 |         struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
         |                          ^~~
   kernel/rcu/tree.c:4928:13: warning: unused variable 'i' [-Wunused-variable]
    4928 |         int i;
         |             ^
   kernel/rcu/debug.h: In function 'rcu_debug_ptr_unqueue':
   kernel/rcu/debug.h:119:1: error: control reaches end of non-void function [-Werror=return-type]
     119 | }
         | ^
   cc1: some warnings being treated as errors


vim +/rcu_debug_ptr_queue +63 kernel/rcu/debug.h

    19	
    20	// rdp lock must be held.
    21	static void __find_func(struct rcu_data *rdp, unsigned long ip, int *B, int *E,
    22				int *N, bool *valid)
    23	{
    24		rcu_debug_entry *p;
    25		int b, e, n;
    26	
    27		b = n = 0;
    28		e = rdp->rcu_debug_ptrs_nr - 1;
    29	
    30		while (b <= e) {
    31			n = (b + e) / 2;
  > 32			p = &rdp->rcu_debug_ptrs[n];
    33			if (ip > p->ip) {
    34				b = n + 1;
    35			} else if (ip < p->ip) {
    36				e = n - 1;
    37			} else
    38				break;
    39		}
    40	
    41		if (B)
    42			*B = b;
    43		if (E)
    44			*E = e;
    45		if (N)
    46			*N = n;
    47	
    48		// Once a ptr is found, check the valid flag.
    49		if (valid)
    50			*valid = (b <= e) && rdp->rcu_debug_ptrs[n].valid;
    51		return;
    52	}
    53	
    54	static bool rcu_debug_ptr_exists(struct rcu_data *rdp, void *ip)
    55	{
    56		bool valid;
    57	
    58		__find_func(rdp, (unsigned long)ip, NULL, NULL, NULL, &valid);
    59		return valid;
    60	}
    61	
    62	// Functions are only ever added and not deleted till reboot.
  > 63	int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr, bool lazy)
    64	{
    65		bool valid;
    66		int b, e, n;
    67		unsigned long ip = (unsigned long)ip_ptr;
    68	
    69		trace_printk("Queuing %ps (%p) at %llu\n", ((struct rcu_head *)ip_ptr)->func, ip_ptr, get_jiffies_64());
    70	
    71		if (rdp->rcu_debug_ptrs_nr >= RCU_DEBUGFS_PTRS_SIZE) {
    72			WARN_ON_ONCE(1);
    73			return -1;
    74		}
    75	
    76		__find_func(rdp, ip, &b, &e, &n, &valid);
    77	
    78		if (b > e) {
    79			if (n != rdp->rcu_debug_ptrs_nr)
    80				memmove(&rdp->rcu_debug_ptrs[n+1], &rdp->rcu_debug_ptrs[n],
    81					(sizeof(rcu_debug_entry) * (rdp->rcu_debug_ptrs_nr - n)));
    82	
    83			rdp->rcu_debug_ptrs[n].ip = ip;
    84			rdp->rcu_debug_ptrs[n].valid = true;
    85			rdp->rcu_debug_ptrs[n].in_flight = false;
    86			rdp->rcu_debug_ptrs_nr++;
    87		}
    88	
    89		WARN_ON_ONCE(valid && b > e);
    90		WARN_ON_ONCE(valid && rdp->rcu_debug_ptrs[n].in_flight);
    91	
    92		rdp->rcu_debug_ptrs[n].lazy = lazy;
  > 93		rdp->rcu_debug_ptrs[n].in_flight = true;
    94		rdp->rcu_debug_ptrs[n].queue_jiffies = get_jiffies_64();
    95		return 0;
    96	}
    97	
    98	// Called when callback functions are invoked.
  > 99	rcu_debug_entry rcu_debug_ptr_unqueue(struct rcu_data *rdp, void* ip_ptr)
   100	{
   101		int n;
   102		rcu_debug_entry ret_none = {};
   103		bool valid;
   104		unsigned long ip = (unsigned long)ip_ptr;
   105	
   106		trace_printk("DeQueuing %ps (%p) at %llu\n", ((struct rcu_head *)ip_ptr)->func, ip_ptr, get_jiffies_64());
   107	
   108		__find_func(rdp, ip, NULL, NULL, &n, &valid);
   109	
   110		// Only valid and inflight entries will get an invocation
   111		// update. For instance, entries migrated before being
   112		// invoked will be ignored, as they will have a new house.
   113		if (!valid ||!rdp->rcu_debug_ptrs[n].in_flight)
   114			return ret_none;
   115		WARN_ON_ONCE(!rdp->rcu_debug_ptrs[n].valid);
   116	
 > 117		rdp->rcu_debug_ptrs[n].in_flight = false;
 > 118		return rdp->rcu_debug_ptrs[n];
   119	}
   120	
 > 121	void rcu_debug_set_context(struct rcu_data *rdp, void *ip)
   122	{
   123		bool *flag = this_cpu_ptr(&rcu_lazy_cb_exec);
   124		*flag = rcu_debug_ptr_exists(rdp, ip);
   125	
   126		*this_cpu_ptr(&rcu_lazy_ip) = *flag ? ip : NULL;
   127	}
   128	
 > 129	void rcu_debug_reset_context(void)
   130	{
   131		bool *flag = this_cpu_ptr(&rcu_lazy_cb_exec);
   132		*flag = false;
   133	}
   134	
 > 135	bool rcu_is_lazy_context(void)
   136	{
   137		return *(this_cpu_ptr(&rcu_lazy_cb_exec));
   138	}
   139	
   140	static void
   141	probe_waking(void *ignore, struct task_struct *p)
   142	{
   143		// kworker wake ups don't appear to cause performance issues.
   144		// Ignore for now.
   145		if (!strncmp(p->comm, "kworker", 7))
   146			return;
   147	
   148		if (WARN_ON(!in_nmi() && !in_hardirq() && rcu_is_lazy_context())) {
   149			pr_err("*****************************************************\n");
   150			pr_err("RCU: A wake up has been detected from a lazy callback!\n");
   151			pr_err("The callback name is: %ps\n", *this_cpu_ptr(&rcu_lazy_ip));
   152			pr_err("The task it woke up is: %s (%d)\n", p->comm, p->pid);
   153			pr_err("This could cause performance issues! Check the stack.\n");
   154			pr_err("*****************************************************\n");
   155		}
   156	}
   157	
 > 158	void rcu_debug_init(void)
   159	{
   160		int ret;
   161		pr_info("RCU Lazy CB debugging is turned on, system may be slow.\n");
   162	
   163		ret = register_trace_sched_waking(probe_waking, NULL);
   164		if (ret)
   165			pr_info("RCU: Lazy debug ched_waking probe could not be registered.");
   166	}
   167	#else
   168	int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
   169	{
   170		return -1;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
