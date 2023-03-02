Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B08EA2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 00:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677718257; x=1709254257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mwsrk08yx08t+3NOB/gdRsh5AxXAjxMaNSfCGtdqKoo=;
  b=ECmiz3Zz+nsmRuuYpSKYLDkwP/rg+XxKp3yn7LfcmiPcBSaR7n+h0bSy
   FeSu5JZwSitk5Mmy4jMU0wQKA11vc0Wi4dZULPOIp0OP6IJohcjoi3e/X
   HNLHL6ciu0/qLo3EyinyjEOMhelc/xvVpL6EutGSAQQG1akH1C9ToQ+LH
   25yp7UErmcuHthVoM5+dAl+H1qAdr0pF2RLAzdrTITmi3aQ0hHNQWhRvh
   Wu08mROyyertk9mGMCLia56tL3FOb2zYFkR/vKdFJ40oxaA7vl3EtkvsP
   HOJZKSAe6YAUGXNa397Nnqk0vz2x3o4bq6nL+n4fdro59Mj/7vxTiSsug
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="362158867"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="362158867"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 16:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674766149"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="674766149"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2023 16:50:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXX9o-00000z-0N;
	Thu, 02 Mar 2023 00:50:52 +0000
Date: Thu, 2 Mar 2023 08:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle 3/8] kernel/sched/rt.c:155:16: error:
 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean
 'rt_cg_throttled'?
Message-ID: <202303020804.y1mZSN4F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle
head:   4cd8088f96afb641f4bb30db0188c1be4740cfe3
commit: 5f134520f916698ea857f21b89ef7f98d38204d9 [3/8] sched/rt: Keep throttled rt_rqs on the runqueue
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230302/202303020804.y1mZSN4F-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=5f134520f916698ea857f21b89ef7f98d38204d9
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout 5f134520f916698ea857f21b89ef7f98d38204d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020804.y1mZSN4F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'init_rt_rq':
>> kernel/sched/rt.c:155:16: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
     155 |         rt_rq->rt_nr_cg_throttled = 0;
         |                ^~~~~~~~~~~~~~~~~~
         |                rt_cg_throttled
   kernel/sched/rt.c: In function 'update_nr_cg_throttled':
>> kernel/sched/rt.c:1400:27: error: 'struct sched_rt_entity' has no member named 'parent'
    1400 |         if (!grq || !rt_se->parent || !rt_rq_throttled(grq))
         |                           ^~
   kernel/sched/rt.c:1403:16: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1403 |         rt_rq->rt_nr_cg_throttled += (dec ? -1 : 1);
         |                ^~~~~~~~~~~~~~~~~~
         |                rt_cg_throttled
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/rt.c: In function '__delist_rt_entity':
   kernel/sched/rt.c:1423:27: error: 'struct sched_rt_entity' has no member named 'parent'
    1423 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |                           ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1423:9: note: in expansion of macro 'WARN_ON_ONCE'
    1423 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |         ^~~~~~~~~~~~
   kernel/sched/rt.c: In function '__enqueue_rt_entity':
   kernel/sched/rt.c:1570:35: error: 'struct sched_rt_entity' has no member named 'parent'
    1570 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                                   ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1570:17: note: in expansion of macro 'WARN_ON_ONCE'
    1570 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                 ^~~~~~~~~~~~


vim +155 kernel/sched/rt.c

   129	
   130	void init_rt_rq(struct rt_rq *rt_rq)
   131	{
   132		struct rt_prio_array *array;
   133		int i;
   134	
   135		array = &rt_rq->active;
   136		for (i = 0; i < MAX_RT_PRIO; i++) {
   137			INIT_LIST_HEAD(array->queue + i);
   138			__clear_bit(i, array->bitmap);
   139		}
   140		/* delimiter for bitsearch: */
   141		__set_bit(MAX_RT_PRIO, array->bitmap);
   142	
   143	#if defined CONFIG_SMP
   144		rt_rq->highest_prio.curr = MAX_RT_PRIO-1;
   145		rt_rq->highest_prio.next = MAX_RT_PRIO-1;
   146		rt_rq->rt_nr_migratory = 0;
   147		rt_rq->overloaded = 0;
   148		plist_head_init(&rt_rq->pushable_tasks);
   149	#endif /* CONFIG_SMP */
   150		/* We start is dequeued state, because no RT tasks are queued */
   151		rt_rq->rt_queued = 0;
   152	
   153		rt_rq->rt_time = 0;
   154		rt_rq->rt_bw_throttled = 0;
 > 155		rt_rq->rt_nr_cg_throttled = 0;
   156		rt_rq->rt_se_running = 0;
   157		rt_rq->rt_runtime = 0;
   158		raw_spin_lock_init(&rt_rq->rt_runtime_lock);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
