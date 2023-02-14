Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D27C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 02:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676340771; x=1707876771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kV8E2IxvAmDkBwYEd/qGYG4WaH+EJrxOhtpEaExT8lI=;
  b=ZTUilwwPePL597R2+gvqu8i8Q99Qpum40v/Uqc8LmIi85CcheOL1ySpF
   BKIOzFPwmSi+YjTb5wcxMRR1chKNgXqHKPnWggR4i23pz6EIdAfoeCB6C
   TknspAf0YfqfzzORc2gNaq+lDzl1ghJE/00VBMClC/Op19W7rW2bX77e2
   3vjiSFqXXWmTxTGpyHxN31uNRsJmnDWHvjqJ8nVzRnkahInSMXXykV4m6
   js+V63hjVKQP7hz4WasW4aJTWgLyiGRu1MBnpfyYw6Z8RTavJmDiqfM4i
   eIuBPIhT4iCJlXTYFBGeMKVFLPX/kcxiBriOnCcCSGB++6E9aRv3Lc/b6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358465491"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358465491"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 18:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914564578"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="914564578"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Feb 2023 18:12:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRkoL-00088k-0i;
	Tue, 14 Feb 2023 02:12:49 +0000
Date: Tue, 14 Feb 2023 10:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.feb13.2023 7/7] kernel/sched/rt.c:1393:16:
 error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean
 'rt_cg_throttled'?
Message-ID: <202302141032.mbMRXUfW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.feb13.2023
head:   76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e
commit: 76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e [7/7] fixup! fixup! fixup! sched/rt: Keep throttled rt_rqs on the runqueue
config: arc-randconfig-r043-20230213 (https://download.01.org/0day-ci/archive/20230214/202302141032.mbMRXUfW-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.feb13.2023
        git checkout 76f3ee9a77cea5d6f5f04f3bbc620b863bb06e1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141032.mbMRXUfW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'do_sched_rt_period_timer':
   kernel/sched/rt.c:995:50: error: 'struct rt_rq' has no member named 'tg'
     995 |                                         if (rt_rq->tg && rt_rq->tg->parent)
         |                                                  ^~
   kernel/sched/rt.c:995:63: error: 'struct rt_rq' has no member named 'tg'
     995 |                                         if (rt_rq->tg && rt_rq->tg->parent)
         |                                                               ^~
   kernel/sched/rt.c:996:69: error: 'struct rt_rq' has no member named 'tg'
     996 |                                                 parent_rt_se = rt_rq->tg->parent->rt_se[i];
         |                                                                     ^~
   kernel/sched/rt.c: In function 'update_curr_rt':
   kernel/sched/rt.c:1133:54: error: 'struct sched_rt_entity' has no member named 'parent'
    1133 |                                 if (!tbefore && rt_se->parent)
         |                                                      ^~
   kernel/sched/rt.c:1134:69: error: 'struct sched_rt_entity' has no member named 'parent'
    1134 |                                         adjust_cg_throt_update(rt_se->parent, true);
         |                                                                     ^~
   kernel/sched/rt.c: In function 'update_nr_cg_throttled':
   kernel/sched/rt.c:1390:27: error: 'struct sched_rt_entity' has no member named 'parent'
    1390 |         if (!grq || !rt_se->parent || !rt_rq_throttled(grq))
         |                           ^~
>> kernel/sched/rt.c:1393:16: error: 'struct rt_rq' has no member named 'rt_nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1393 |         rt_rq->rt_nr_cg_throttled += (dec ? -1 : 1);
         |                ^~~~~~~~~~~~~~~~~~
         |                rt_cg_throttled
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/rt.c: In function '__delist_rt_entity':
   kernel/sched/rt.c:1413:27: error: 'struct sched_rt_entity' has no member named 'parent'
    1413 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |                           ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1413:9: note: in expansion of macro 'WARN_ON_ONCE'
    1413 |         WARN_ON_ONCE(rt_se->parent && tbefore && !rt_rq_throttled(rt_rq));
         |         ^~~~~~~~~~~~
   kernel/sched/rt.c:1414:56: error: 'struct sched_rt_entity' has no member named 'parent'
    1414 |         if (!tbefore && rt_rq_throttled(rt_rq) && rt_se->parent)
         |                                                        ^~
   kernel/sched/rt.c:1415:45: error: 'struct sched_rt_entity' has no member named 'parent'
    1415 |                 adjust_cg_throt_update(rt_se->parent, true);
         |                                             ^~
   kernel/sched/rt.c: In function '__enqueue_rt_entity':
   kernel/sched/rt.c:1560:35: error: 'struct sched_rt_entity' has no member named 'parent'
    1560 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                                   ^~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/sched/rt.c:1560:17: note: in expansion of macro 'WARN_ON_ONCE'
    1560 |                 WARN_ON_ONCE(rt_se->parent && !tbefore && rt_rq_throttled(rt_rq));
         |                 ^~~~~~~~~~~~
   kernel/sched/rt.c:1561:64: error: 'struct sched_rt_entity' has no member named 'parent'
    1561 |                 if (tbefore && !rt_rq_throttled(rt_rq) && rt_se->parent)
         |                                                                ^~
   kernel/sched/rt.c:1562:53: error: 'struct sched_rt_entity' has no member named 'parent'
    1562 |                         adjust_cg_throt_update(rt_se->parent, false);
         |                                                     ^~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +1393 kernel/sched/rt.c

  1384	
  1385	static void update_nr_cg_throttled(struct sched_rt_entity *rt_se, bool dec)
  1386	{
  1387		struct rt_rq *grq = group_rt_rq(rt_se);
  1388		struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
  1389	
  1390		if (!grq || !rt_se->parent || !rt_rq_throttled(grq))
  1391			return;
  1392	
> 1393		rt_rq->rt_nr_cg_throttled += (dec ? -1 : 1);
  1394	}
  1395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
