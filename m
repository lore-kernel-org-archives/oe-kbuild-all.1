Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1DA93B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 20:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677787717; x=1709323717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9qpoD3dMLWaUA5yAPzvRlQ2Rl/Fs+7PfpGgzbz0XfU=;
  b=S16Hp8gsulr84yBj4Jdc1MiJ8Dpo4K6eNGZUb0G5VmVll+Pa5M53tI3M
   dmrTPRM5z9MtAdUJ+hroZwqnq1JYMvnfcGqnrN31pK7f6ceQzyYuOhcsR
   h+oy879LA81CMax5AXFelN8CVX6nlkZIBg/SsV1BXUuuLPCvSDYmKkj1L
   /nsMV6KRYzbz9b6XQyECjwEeSZ5GtCE536XX0tXn2Tw6c/FfM1hMwBHLH
   T/fXJ58GCnx1J7snn4rSQJqm9tnMtMHbIJWklbf7aUU7+sygAL7YHW6NW
   tvWL3vLwTl+pXbYgvnfpw5qr62CQJXD19FZ7bX0mFkjY7m//j2UlnLlAT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362433751"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="362433751"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="920843781"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="920843781"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2023 12:08:32 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXpE7-0000qs-2k;
	Thu, 02 Mar 2023 20:08:31 +0000
Date: Fri, 3 Mar 2023 04:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelaf@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle 9/12] kernel/sched/rt.c:924:30: warning:
 missing terminating " character
Message-ID: <202303030411.PaReU7B1-lkp@intel.com>
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
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230303/202303030411.PaReU7B1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=6c138b029b603ef25ddaf0dc82b17d0dbac9b890
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout 6c138b029b603ef25ddaf0dc82b17d0dbac9b890
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030411.PaReU7B1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'init_rt_rq':
   kernel/sched/rt.c:155:16: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
     155 |         rt_rq->rt_nr_cg_throttled = 0;
         |                ^~~~~~~~~~~~~~~~~~
         |                rt_cg_throttled
   kernel/sched/rt.c: At top level:
>> kernel/sched/rt.c:924:30: warning: missing terminating " character
     924 |                 trace_printk("RT_THROT:[actu] Dequeued rt_rq(%p),
         |                              ^
   kernel/sched/rt.c:926:46: warning: missing terminating " character
     926 |                                 cg_throt=%d\n", rt_rq, rt_rq->rt_nr_running,
         |                                              ^
   kernel/sched/rt.c: In function 'update_nr_cg_throttled':
   kernel/sched/rt.c:1412:16: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1412 |         rt_rq->rt_nr_cg_throttled += (dec ? -1 : 1);
         |                ^~~~~~~~~~~~~~~~~~
         |                rt_cg_throttled
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/rt.c: In function '__delist_rt_entity':
   kernel/sched/rt.c:1432:27: error: 'struct sched_rt_entity' has no member named 'parent'
    1432 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |                           ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1432:9: note: in expansion of macro 'WARN_ON_ONCE'
    1432 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |         ^~~~~~~~~~~~
   kernel/sched/rt.c: In function '__enqueue_rt_entity':
   kernel/sched/rt.c:1566:35: error: 'struct sched_rt_entity' has no member named 'parent'
    1566 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                                   ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1566:17: note: in expansion of macro 'WARN_ON_ONCE'
    1566 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                 ^~~~~~~~~~~~


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
   925					nr_running=%d, se_running=%d, bw_throt=%d
   926					cg_throt=%d\n", rt_rq, rt_rq->rt_nr_running,
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
   939			struct sched_entity *rt_se = tg->rt_se[cpu];
   940	
   941			rt_rq = tg->rt_rq[cpu];
   942			if ((!rt_se && rt_rq->rt_queued == 0) || (rt_se && !on_rt_rq(rt_se)))
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
