Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85A15A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 04:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689481576; x=1721017576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b8Qbhs1P/mQsZ8J8vuLm4ii4wS+mcnFGDSUw85Z0HtA=;
  b=MCtnzj+TMyJPESPGOUMVgVfyCvkOOY0ccHIAr62d23qyU/MK30PrzZDQ
   /DXxPWVA6tYP8Sk2wFS8Jb1pcPSLcEPuTieVVGzsVsWyfsujQ0xoM5EKD
   DuOZ4TpMMhMBJAYOsi0C1rbUgXnZJsEUhbv9bnBw7pkkeXxMk9ggr2tEN
   j45ZTkT7rm85gAq685inh0PDfztUPY6HCET61/W59xb4z8x+dSnDY4jFA
   xZdN0BAgTMYtdJSwg4TrEc2O6PrBA4QNQSQGqRePwYNgSxL/qsaBmfZcz
   VhqPpPVDBFbxYeFGRafRNx2H1qxH8bn+pqjaJ9ftmsa7hZHvE9cpCYAdn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="396544569"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="396544569"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 21:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846890929"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="846890929"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 21:26:14 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKtKn-0008ZZ-2B;
	Sun, 16 Jul 2023 04:26:13 +0000
Date: Sun, 16 Jul 2023 12:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 2/6]
 kernel/rcu/rcutorture.c:3174:16: error: implicit declaration of function
 'rcu_get_gp_kthreads_prio'
Message-ID: <202307161220.Qv8n8nd6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   40f87f6acda90270ee3eb284cbd13a8751ac4e61
commit: d8106d64bbf0e8d98e636ddda1524fae375c8cf5 [2/6] rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
config: nios2-randconfig-r023-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161220.Qv8n8nd6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161220.Qv8n8nd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161220.Qv8n8nd6-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/rcutorture.c: In function 'rcu_torture_can_boost':
>> kernel/rcu/rcutorture.c:3174:16: error: implicit declaration of function 'rcu_get_gp_kthreads_prio' [-Werror=implicit-function-declaration]
    3174 |         prio = rcu_get_gp_kthreads_prio();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/rcu_get_gp_kthreads_prio +3174 kernel/rcu/rcutorture.c

fae4b54f28f034 kernel/rcutorture.c     Paul E. McKenney        2012-02-20  3163  
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3164) static bool rcu_torture_can_boost(void)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3165) {
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3166) 	static int boost_warn_once;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3167) 	int prio;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3168) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3169) 	if (!(test_boost == 1 && cur_ops->can_boost) && test_boost != 2)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3170) 		return false;
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney        2021-03-30  3171  	if (!cur_ops->start_gp_poll || !cur_ops->poll_gp_state)
5e59fba573e64c kernel/rcu/rcutorture.c Paul E. McKenney        2021-01-15  3172  		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3173) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19 @3174) 	prio = rcu_get_gp_kthreads_prio();
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3175) 	if (!prio)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3176) 		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3177) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3178) 	if (prio < 2) {
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3179) 		if (boost_warn_once == 1)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3180) 			return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3181) 
bf5b64355a3ce4 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3182) 		pr_alert("%s: WARN: RCU kthread priority too low to test boosting.  Skipping RCU boost test. Try passing rcutree.kthread_prio > 1 on the kernel command line.\n", KBUILD_MODNAME);
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3183) 		boost_warn_once = 1;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3184) 		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3185) 	}
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3186) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3187) 	return true;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3188) }
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3189) 

:::::: The code at line 3174 was first introduced by commit
:::::: 4babd855fd6137f9792117eb73b096c221a49d3c rcutorture: Add support to detect if boost kthread prio is too low

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
