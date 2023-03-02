Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BFDD524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677789575; x=1709325575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EjBAEizmM9mdqA44d3PLABh3TcJ2pQouIUQE0j3BuHo=;
  b=oGa0EUyIskQpwuyUImJf/3pGlwK0bIvq8SqrTZ6bu9YmrQvvi0G36GxF
   LSBXk/g/2ENklyc7d99iEtako+IQB0qRYWEfAardkftvb+AQz8TSHhvAx
   H31tNAkydge9uPN2xOH7kKAx/pQl+UgtdUhg8mi0TrF1YwUIxotVS1Tp8
   DFnAUiyFqQ/KE/p6QmjMUG+bKpEPxhfrQWLgQ33Jh9qXkfmv18/hssCNI
   /Um0Vr+oqD9SxvRIy1YqCRl+qUWij4ow/PzvhLpndW1aB+CrPm7hEeJPg
   k1EsiCYcyP+Xhq3MQ0f2sUOZ/diBfXiv823DoEOy5hAsEYMbwM6O+SZi9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362442577"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="362442577"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="798973358"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="798973358"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 12:39:33 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXpi8-0000rq-2h;
	Thu, 02 Mar 2023 20:39:32 +0000
Date: Fri, 3 Mar 2023 04:38:42 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelaf@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle 9/12] kernel/sched/rt.c:924:30: error:
 missing terminating " character
Message-ID: <202303030411.z5ELYUSN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle
head:   3426c4b45d36b426432e250f667021e9b4b5356b
commit: 6c138b029b603ef25ddaf0dc82b17d0dbac9b890 [9/12] fixup! sched/rt: Keep throttled rt_rqs on the runqueue
config: parisc-buildonly-randconfig-r003-20230302 (https://download.01.org/0day-ci/archive/20230303/202303030411.z5ELYUSN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=6c138b029b603ef25ddaf0dc82b17d0dbac9b890
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout 6c138b029b603ef25ddaf0dc82b17d0dbac9b890
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030411.z5ELYUSN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'adjust_cg_throt_update':
   kernel/sched/rt.c:924:30: warning: missing terminating " character
     924 |                 trace_printk("RT_THROT:[actu] Dequeued rt_rq(%p),
         |                              ^
>> kernel/sched/rt.c:924:30: error: missing terminating " character
     924 |                 trace_printk("RT_THROT:[actu] Dequeued rt_rq(%p),
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:925:44: error: expected expression before '%' token
     925 |                                 nr_running=%d, se_running=%d, bw_throt=%d
         |                                            ^
>> kernel/sched/rt.c:926:44: error: stray '\' in program
     926 |                                 cg_throt=%d\n", rt_rq, rt_rq->rt_nr_running,
         |                                            ^
   kernel/sched/rt.c:926:46: warning: missing terminating " character
     926 |                                 cg_throt=%d\n", rt_rq, rt_rq->rt_nr_running,
         |                                              ^
   kernel/sched/rt.c:926:46: error: missing terminating " character
     926 |                                 cg_throt=%d\n", rt_rq, rt_rq->rt_nr_running,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:939:46: error: initialization of 'struct sched_entity *' from incompatible pointer type 'struct sched_rt_entity *' [-Werror=incompatible-pointer-types]
     939 |                 struct sched_entity *rt_se = tg->rt_se[cpu];
         |                                              ^~
>> kernel/sched/rt.c:942:78: error: passing argument 1 of 'on_rt_rq' from incompatible pointer type [-Werror=incompatible-pointer-types]
     942 |                 if ((!rt_se && rt_rq->rt_queued == 0) || (rt_se && !on_rt_rq(rt_se)))
         |                                                                              ^~~~~
         |                                                                              |
         |                                                                              struct sched_entity *
   kernel/sched/rt.c:487:52: note: expected 'struct sched_rt_entity *' but argument is of type 'struct sched_entity *'
     487 | static inline int on_rt_rq(struct sched_rt_entity *rt_se)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:577:13: warning: 'sched_rt_rq_enqueue' defined but not used [-Wunused-function]
     577 | static void sched_rt_rq_enqueue(struct rt_rq *rt_rq)
         |             ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +924 kernel/sched/rt.c

   913	
   914	static void adjust_cg_throt_update(struct rt_rq *rt_rq, bool throt)
   915	{
   916		int cpu = cpu_of(rt_rq->rq);
   917		struct task_group *tg = rt_rq->tg->parent;
   918	
   919		/*
   920		 * If this rt_rq is already dequeued, we need not propagate the throttled
   921		 * status up the tree.
   922		 */
   923		if (!rt_rq->rt_nr_running) {
 > 924			trace_printk("RT_THROT:[actu] Dequeued rt_rq(%p),
 > 925					nr_running=%d, se_running=%d, bw_throt=%d
 > 926					cg_throt=%d\n", rt_rq, rt_rq->rt_nr_running,
   927					rt_rq->rt_se_running,
   928					rt_rq->rt_bw_throttled, rt_rq->rt_nr_cg_throttled);
   929			return;
   930		}
   931	
   932		/*
   933		 * The caller had a change in status for bw_throttled or nr_boosted for rt_rq.
   934		 * We need to propagate it up the tree starting from rt_rq's parent rt_rq.
   935		 */
   936		for (; tg; tg = tg->parent) {
   937			bool after;
   938			bool before;
 > 939			struct sched_entity *rt_se = tg->rt_se[cpu];
   940	
   941			rt_rq = tg->rt_rq[cpu];
 > 942			if ((!rt_se && rt_rq->rt_queued == 0) || (rt_se && !on_rt_rq(rt_se)))
   943				break;
   944	
   945			before = rt_rq_throttled(rt_rq);
   946			rt_rq->rt_nr_cg_throttled += (throt ? 1 : -1);
   947	
   948			after = rt_rq_throttled(rt_rq);
   949	
   950			if (before == after)
   951				break;
   952	
   953			throt = (!before && after);
   954		}
   955	}
   956	#else
   957	static void adjust_cg_throt_update(struct rt_rq *rt_rq, bool throt) { }
   958	#endif
   959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
