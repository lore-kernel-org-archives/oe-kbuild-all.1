Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419B4AD26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 21:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677189384; x=1708725384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yVxBJKXeRLDyvEqQ+UJERzQVzd3Gm0NiB1HZyWyBO5M=;
  b=jw6F2zNkNceW768oBIhzORfEUfv8AIbXLX2G8dRjo79MHjsUK2SMuw3E
   avYq1LGrwt2Wkt3Y+CVso/xWXNxPTKU7D37bBdEqyaWNkGaJN3HHVcryh
   mJgCcC8/cSSw+57g3XYbXvAOyZDayhZGIp4IYtdiQsMMggwyUbqhnYemD
   D3XucFAqlNtCwQd7HoOqME4hzB+WTnsGyb6Rszsi1nPVlOhCBjqY0JkqH
   DTpIHt0V+4tbymG2+mSbq+9YtJsuKm2c7++fomV4tmP8wZ6IdftfZeFwb
   HI4KrCoXRluYhade7wO6SmDHIXBtOZINbXHzrlSxEuwyHGkwGt6SKaASm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="317088361"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="317088361"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 13:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="815511335"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="815511335"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2023 13:56:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVJZe-0001oz-0p;
	Thu, 23 Feb 2023 21:56:22 +0000
Date: Fri, 24 Feb 2023 05:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/debug.h:63:5: warning: no previous
 prototype for 'rcu_debug_func_add'
Message-ID: <202302240547.ububoXby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop
head:   9617e0851ec17ab3ed416aa8d2aa17029cba7acd
commit: 9617e0851ec17ab3ed416aa8d2aa17029cba7acd [1/1] debug: dynamic lazy wake debug
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302240547.ububoXby-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=9617e0851ec17ab3ed416aa8d2aa17029cba7acd
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop
        git checkout 9617e0851ec17ab3ed416aa8d2aa17029cba7acd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240547.ububoXby-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
>> kernel/rcu/debug.h:63:5: warning: no previous prototype for 'rcu_debug_func_add' [-Wmissing-prototypes]
      63 | int rcu_debug_func_add(struct rcu_data *rdp, void* ip_ptr)
         |     ^~~~~~~~~~~~~~~~~~
>> kernel/rcu/debug.h:88:6: warning: no previous prototype for 'rcu_debug_set_context' [-Wmissing-prototypes]
      88 | void rcu_debug_set_context(struct rcu_data *rdp, void *ip)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/debug.h:96:6: warning: no previous prototype for 'rcu_debug_reset_context' [-Wmissing-prototypes]
      96 | void rcu_debug_reset_context(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/debug.h:102:6: warning: no previous prototype for 'rcu_is_lazy_context' [-Wmissing-prototypes]
     102 | bool rcu_is_lazy_context(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/rcu/debug.h:125:6: warning: no previous prototype for 'rcu_debug_init' [-Wmissing-prototypes]
     125 | void rcu_debug_init(void)
         |      ^~~~~~~~~~~~~~


vim +/rcu_debug_func_add +63 kernel/rcu/debug.h

    61	
    62	// Functions are only ever added and not deleted till reboot.
  > 63	int rcu_debug_func_add(struct rcu_data *rdp, void* ip_ptr)
    64	{
    65		int b, e, n;
    66		unsigned long ip = (unsigned long)ip_ptr;
    67	
    68		if (rdp->rcu_debug_funcs_nr >= RCU_DEBUGFS_FUNC_SIZE)
    69			return -1;
    70	
    71		__find_func(rdp, ip, &b, &e, &n, NULL);
    72	
    73		if (b > e) {
    74			if (n != rdp->rcu_debug_funcs_nr)
    75				memmove(&rdp->rcu_debug_funcs[n+1], &rdp->rcu_debug_funcs[n],
    76					(sizeof(rcu_debug_entry) * (rdp->rcu_debug_funcs_nr - n)));
    77	
    78			rdp->rcu_debug_funcs[n].ip = ip;
    79			rdp->rcu_debug_funcs[n].queue_jiffies = get_jiffies_64();
    80			rdp->rcu_debug_funcs[n].valid = true;
    81			rdp->rcu_debug_funcs[n].in_flight = true;
    82			rdp->rcu_debug_funcs_nr++;
    83		}
    84	
    85		return 0;
    86	}
    87	
  > 88	void rcu_debug_set_context(struct rcu_data *rdp, void *ip)
    89	{
    90		bool *flag = this_cpu_ptr(&rcu_lazy_cb_exec);
    91		*flag = rcu_debug_func_exists(rdp, ip);
    92	
    93		*this_cpu_ptr(&rcu_lazy_ip) = *flag ? ip : NULL;
    94	}
    95	
  > 96	void rcu_debug_reset_context(void)
    97	{
    98		bool *flag = this_cpu_ptr(&rcu_lazy_cb_exec);
    99		*flag = false;
   100	}
   101	
 > 102	bool rcu_is_lazy_context(void)
   103	{
   104		return *(this_cpu_ptr(&rcu_lazy_cb_exec));
   105	}
   106	
   107	static void
   108	probe_waking(void *ignore, struct task_struct *p)
   109	{
   110		// kworker wake ups don't appear to cause performance issues.
   111		// Ignore for now.
   112		if (!strncmp(p->comm, "kworker", 7))
   113			return;
   114	
   115		if (WARN_ON(!in_nmi() && !in_hardirq() && rcu_is_lazy_context())) {
   116			pr_err("*****************************************************\n");
   117			pr_err("RCU: A wake up has been detected from a lazy callback!\n");
   118			pr_err("The callback name is: %ps\n", *this_cpu_ptr(&rcu_lazy_ip));
   119			pr_err("The task it woke up is: %s (%d)\n", p->comm, p->pid);
   120			pr_err("This could cause performance issues! Check the stack.\n");
   121			pr_err("*****************************************************\n");
   122		}
   123	}
   124	
 > 125	void rcu_debug_init(void)
   126	{
   127		int ret;
   128		pr_info("RCU Lazy CB debugging is turned on, system may be slow.\n");
   129	
   130		ret = register_trace_sched_waking(probe_waking, NULL);
   131		if (ret)
   132			pr_info("RCU: Lazy debug ched_waking probe could not be registered.");
   133	}
   134	#else
   135	int rcu_debug_func_add(struct rcu_data *rdp, void* ip_ptr)
   136	{
   137		return -1;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
