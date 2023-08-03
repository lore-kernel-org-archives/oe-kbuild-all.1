Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70D7F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 01:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691024436; x=1722560436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gZg71BWmLImY+XBWNyFFpDbAgO4DezkMLFr3xG1MmMA=;
  b=i+uyeCQcXCfcHZJdWtwM1cf6SKZfEtUxgm3OdAA9C3l82TR8Fx8+d7BN
   +Vrg1FkTdwD5EIGKfD7zl+NZPlI0UDpWO98xUTooNjfrS5MH/ZomFB9J8
   FaO80XhAPPK+DCB4TT2l9+pk5WirDhfZeede+LGz0oDZrP/2kXsU85nuS
   Pezj9Xvunh2yC5oZfHu64BngSFxXp+m3iihiw36QbUkJxST2K5ulC6XLY
   FzTig9/dKQCM2JHa9BUbp8e705xcjbk1FIuXahcW3EPTOO3SdNdK0yhcS
   OETkmj6gBqKrhjOeVDPAGkj7vrW0QTstdYbxAYIsNgguhmbVqM94PQtmF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="354653160"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="354653160"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 18:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794811039"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="794811039"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 18:00:34 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRMhe-0001cV-0N;
	Thu, 03 Aug 2023 01:00:34 +0000
Date: Thu, 3 Aug 2023 08:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 284/387] kernel/sched/alt_debug.c:23:6: warning: no
 previous prototype for 'proc_sched_show_task'
Message-ID: <202308030849.cTPYtQ1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   81c27c2ecb3019a7e76026b3fced2f750c2faf0a
commit: fa51a210dd580901cb9fde19d3d268b3dc9cd597 [284/387] sched/alt: Headers cleanup
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230803/202308030849.cTPYtQ1W-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030849.cTPYtQ1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030849.cTPYtQ1W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:9,
                    from kernel/sched/alt_debug.c:9:
   kernel/sched/alt_sched.h:481:42: warning: 'struct cpuidle_state' declared inside parameter list will not be visible outside of this definition or declaration
     481 |                                   struct cpuidle_state *idle_state)
         |                                          ^~~~~~~~~~~~~
>> kernel/sched/alt_debug.c:23:6: warning: no previous prototype for 'proc_sched_show_task' [-Wmissing-prototypes]
      23 | void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
         |      ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_debug.c:30:6: warning: no previous prototype for 'proc_sched_set_task' [-Wmissing-prototypes]
      30 | void proc_sched_set_task(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/proc_sched_show_task +23 kernel/sched/alt_debug.c

cedcd3e67433b3 Alfred Chen 2019-08-19  10  
cedcd3e67433b3 Alfred Chen 2019-08-19  11  /*
cedcd3e67433b3 Alfred Chen 2019-08-19  12   * This allows printing both to /proc/sched_debug and
cedcd3e67433b3 Alfred Chen 2019-08-19  13   * to the console
cedcd3e67433b3 Alfred Chen 2019-08-19  14   */
cedcd3e67433b3 Alfred Chen 2019-08-19  15  #define SEQ_printf(m, x...)			\
cedcd3e67433b3 Alfred Chen 2019-08-19  16   do {						\
cedcd3e67433b3 Alfred Chen 2019-08-19  17  	if (m)					\
cedcd3e67433b3 Alfred Chen 2019-08-19  18  		seq_printf(m, x);		\
cedcd3e67433b3 Alfred Chen 2019-08-19  19  	else					\
cedcd3e67433b3 Alfred Chen 2019-08-19  20  		pr_cont(x);			\
cedcd3e67433b3 Alfred Chen 2019-08-19  21   } while (0)
cedcd3e67433b3 Alfred Chen 2019-08-19  22  
cedcd3e67433b3 Alfred Chen 2019-08-19 @23  void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
cedcd3e67433b3 Alfred Chen 2019-08-19  24  			  struct seq_file *m)
cedcd3e67433b3 Alfred Chen 2019-08-19  25  {
cedcd3e67433b3 Alfred Chen 2019-08-19  26  	SEQ_printf(m, "%s (%d, #threads: %d)\n", p->comm, task_pid_nr_ns(p, ns),
cedcd3e67433b3 Alfred Chen 2019-08-19  27  						get_nr_threads(p));
cedcd3e67433b3 Alfred Chen 2019-08-19  28  }
cedcd3e67433b3 Alfred Chen 2019-08-19  29  
cedcd3e67433b3 Alfred Chen 2019-08-19 @30  void proc_sched_set_task(struct task_struct *p)

:::::: The code at line 23 was first introduced by commit
:::::: cedcd3e67433b3472068caf48ea86414191e0a6b Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
