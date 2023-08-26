Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAD10EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693038797; x=1724574797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoP2+vVfV86Oov3PIegPxu4W6itMoDKH8UqreMXElz8=;
  b=Jm4OJbugEoai+ubOq2IznmpUCrb6+P7vK6mAaLVIGgJC4zBHXc9Bqrut
   KRDE6koqWcjcsYOn8B8MneS/7XW+6y73bBiyhvJFggJWMhwuOA0Z0pNm9
   A4UxvOp4FY8q5YzzjYrogpHEDmAzLSX6zu6EYPRHQaMh/PT2pIvoGTQGm
   BtwDfFHIoN++rpRJYnyyHiZXv+4F49myG5aajPQMvnCf6n0pyj4NY8mIZ
   D8Xp171n1IqB/DnNrNXzZjEJ62hH6CwGy3QOesPWXJOFKAMQfUT0kicIW
   h6bjvP7EmRbPrAm1rguIFN+2WUYfDtTDBuuTpNNgScfjNbcdC8hg97lQs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="378641402"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="378641402"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 01:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="737722527"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="737722527"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Aug 2023 01:33:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZojL-0004W3-0E;
	Sat, 26 Aug 2023 08:33:15 +0000
Date: Sat, 26 Aug 2023 16:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 2/9]
 kernel/rcu/rcutorture.c:3174:16: error: implicit declaration of function
 'rcu_get_gp_kthreads_prio'
Message-ID: <202308261623.mbaFeDuU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   e586c67baa1c537a793f135e324cc56df2b6585b
commit: 029b407f286d7bc9a7ace79c65483efa8ead8671 [2/9] rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
config: m68k-randconfig-r005-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261623.mbaFeDuU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261623.mbaFeDuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261623.mbaFeDuU-lkp@intel.com/

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
