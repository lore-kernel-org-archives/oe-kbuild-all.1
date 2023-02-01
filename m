Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369D7F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675231936; x=1706767936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDAlmX/NsmkzCpa8kHsal6A403DIWlqYkVuQ6yQa+Nw=;
  b=GcgDeAWmS8XLsvyj7bSdU6NFmhzTN437lnPPzLFYFTrbPWMMLp1C/pBc
   x69DE3CeXi4aqdgOk2EUTHel/tGrpaEcwcCZOkF4lFxwWEhJbGI6rzWq3
   q1rLpklX0sNAtHiJpP1IEIGVmCTBuhHnINkzycOhXKMQjR8PNJH/OfpJS
   yy7f1NOeRv/rAzwSXV+rW/U+XWp9j9RE60+TDvfduXOfcDCNzT6Ik618P
   jHbIf+4DVB1Z6B/o6g5i0EzNCwTXsPplEAohpRnBvRD43yhmAFNlem93o
   D8Aj6GVt5LoP1h19HQDSKEs4lxMVdx4CYePoBH/Gq5ftRO2kyfozaFOr7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329349266"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="329349266"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 22:04:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="642286944"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="642286944"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Jan 2023 22:04:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN6E2-00058Y-0R;
	Wed, 01 Feb 2023 06:04:06 +0000
Date: Wed, 1 Feb 2023 14:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.jan31 3/3] kernel/sched/rt.c:1093:41:
 error: implicit declaration of function 'adjust_cg_throt_update'
Message-ID: <202302011343.B7lSC7kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.jan31
head:   963d18b2596e81d74b3abe1730572d6d2ae6a595
commit: a0977d3c9221b1872073fc4b1756ca0c3b9f464b [3/3] sched/rt: Keep throttled rt_rqs on the runqueue
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230201/202302011343.B7lSC7kj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=a0977d3c9221b1872073fc4b1756ca0c3b9f464b
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.jan31
        git checkout a0977d3c9221b1872073fc4b1756ca0c3b9f464b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'update_curr_rt':
>> kernel/sched/rt.c:1093:41: error: implicit declaration of function 'adjust_cg_throt_update' [-Werror=implicit-function-declaration]
    1093 |                                         adjust_cg_throt_update(rt_se->parent, true);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:1341:13: warning: conflicting types for 'adjust_cg_throt_update'; have 'void(struct sched_rt_entity *, bool)' {aka 'void(struct sched_rt_entity *, _Bool)'}
    1341 | static void adjust_cg_throt_update(struct sched_rt_entity *rt_se, bool throt)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:1341:13: error: static declaration of 'adjust_cg_throt_update' follows non-static declaration
   kernel/sched/rt.c:1093:41: note: previous implicit declaration of 'adjust_cg_throt_update' with type 'void(struct sched_rt_entity *, bool)' {aka 'void(struct sched_rt_entity *, _Bool)'}
    1093 |                                         adjust_cg_throt_update(rt_se->parent, true);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: In function 'adjust_cg_throt_update':
>> kernel/sched/rt.c:1358:32: error: 'struct rt_rq' has no member named 'nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1358 |                         rt_rq->nr_cg_throttled++;
         |                                ^~~~~~~~~~~~~~~
         |                                rt_cg_throttled
   kernel/sched/rt.c:1360:32: error: 'struct rt_rq' has no member named 'nr_cg_throttled'; did you mean 'rt_cg_throttled'?
    1360 |                         rt_rq->nr_cg_throttled--;
         |                                ^~~~~~~~~~~~~~~
         |                                rt_cg_throttled
   kernel/sched/rt.c: In function '__delist_rt_entity':
   kernel/sched/rt.c:1379:9: error: 'rt_rq' undeclared (first use in this function)
    1379 |         rt_rq->rt_se_running--;
         |         ^~~~~
   kernel/sched/rt.c:1379:9: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   kernel/sched/rt.c:1341:13: warning: 'adjust_cg_throt_update' defined but not used [-Wunused-function]
    1341 | static void adjust_cg_throt_update(struct sched_rt_entity *rt_se, bool throt)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/adjust_cg_throt_update +1093 kernel/sched/rt.c

  1042	
  1043	/*
  1044	 * Update the current task's runtime statistics. Skip current tasks that
  1045	 * are not in our scheduling class.
  1046	 */
  1047	static void update_curr_rt(struct rq *rq)
  1048	{
  1049		struct task_struct *curr = rq->curr;
  1050		struct sched_rt_entity *rt_se = &curr->rt;
  1051		u64 delta_exec;
  1052		u64 now;
  1053	
  1054		if (curr->sched_class != &rt_sched_class)
  1055			return;
  1056	
  1057		now = rq_clock_task(rq);
  1058		delta_exec = now - curr->se.exec_start;
  1059		if (unlikely((s64)delta_exec <= 0))
  1060			return;
  1061	
  1062		schedstat_set(curr->stats.exec_max,
  1063			      max(curr->stats.exec_max, delta_exec));
  1064	
  1065		trace_sched_stat_runtime(curr, delta_exec, 0);
  1066	
  1067		update_current_exec_runtime(curr, now, delta_exec);
  1068	
  1069		if (!rt_bandwidth_enabled())
  1070			return;
  1071	
  1072		for_each_sched_rt_entity(rt_se) {
  1073			struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
  1074			int exceeded;
  1075	
  1076			if (sched_rt_runtime(rt_rq) != RUNTIME_INF) {
  1077				bool tbefore;
  1078				raw_spin_lock(&rt_rq->rt_runtime_lock);
  1079				tbefore = rt_rq_throttled(rt_rq);
  1080	
  1081				rt_rq->rt_time += delta_exec;
  1082				exceeded = sched_rt_runtime_exceeded(rt_rq);
  1083				if (exceeded) {
  1084					resched_curr(rq);
  1085	
  1086					/*
  1087					 * Whenever reasons of our parent group's
  1088					 * throttling change (bw ran out here), we have
  1089					 * to adjust grandparent's cg throttling state
  1090					 * and so forth. @rt_se can be a task or group.
  1091					 */
  1092					if (!tbefore && rt_se->parent)
> 1093						adjust_cg_throt_update(rt_se->parent, true);
  1094				}
  1095	
  1096				raw_spin_unlock(&rt_rq->rt_runtime_lock);
  1097				if (exceeded)
  1098					do_start_rt_bandwidth(sched_rt_bandwidth(rt_rq));
  1099			}
  1100		}
  1101	}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
