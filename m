Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1561097E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 07:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnxYSd9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701244221; x=1732780221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JUx1t3AYdN8an5DGSHbqA3AJydbFv4agoKE/MCHGeN4=;
  b=WnxYSd9Vv8T1SbUkE7kcni8DyNlSLQy9OQM3UtquNnW5fOb+xZ1p8Fu4
   fKRJjJUIN01vkGj9jutiEIxXLqD6B3e3OFieu/Lpk4MJKM+HTcd+qTmXo
   uM4S76mzoT5/GJro/vCUeWN+TxrDbpJ9XePyLC7QPciTtvdwh6IXUQROA
   UVLNtcojzdhN/PhiUMlpihNROHzneEUul6TiTU/x6Y/93CfdxeaEaUWE2
   rzZAwLoakpgedBuihz3tpt+pWmxX6i2u5fYlBWzDRQdLJ76vXkGpqOLxH
   LBk/8mGJnkxGIx9rOOknX4uEIe2KXj6HkfDGt4aKI5VZsGp48QDlENc0N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6385860"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6385860"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 23:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772596898"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772596898"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 23:50:19 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8FKr-0008kT-1O;
	Wed, 29 Nov 2023 07:50:17 +0000
Date: Wed, 29 Nov 2023 15:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/11]
 kernel/sched/core.c:1480:1: error: conflicting types for 'uclamp_eff_get'
Message-ID: <202311291327.pRKO1LNG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   eb0c51750b3bf5ac41d3f628fd05e22a5426a759
commit: 1184db07bd011cf19005485e643f767d12c33184 [9/11] sched/uclamp: Remove rq max aggregation
config: i386-buildonly-randconfig-001-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291327.pRKO1LNG-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291327.pRKO1LNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291327.pRKO1LNG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:1410:1: error: return type defaults to 'int' [-Werror=implicit-int]
    1410 | update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
         | ^~~~~~~~~~~~~~~~~
   kernel/sched/core.c:1410:1: warning: no previous prototype for 'update_uclamp_req' [-Wmissing-prototypes]
   kernel/sched/core.c: In function 'update_uclamp_req':
   kernel/sched/core.c:1413:29: error: incompatible type for argument 1 of 'uclamp_se_set'
    1413 |  uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
         |                ~~~~~~~~~~~~~^~~~~~~~~~
         |                             |
         |                             struct uclamp_se
   kernel/sched/core.c:1402:52: note: expected 'struct uclamp_se *' but argument is of type 'struct uclamp_se'
    1402 | static inline void uclamp_se_set(struct uclamp_se *uc_se,
         |                                  ~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/core.c:1414:37: error: implicit declaration of function 'uclamp_eff_get'; did you mean 'uclamp_se_set'? [-Werror=implicit-function-declaration]
    1414 |  uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
         |                                     ^~~~~~~~~~~~~~
         |                                     uclamp_se_set
   kernel/sched/core.c:1414:25: error: incompatible type for argument 1 of 'uclamp_se_set'
    1414 |  uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
         |                ~~~~~~~~~^~~~~~~~~~
         |                         |
         |                         struct uclamp_se
   kernel/sched/core.c:1402:52: note: expected 'struct uclamp_se *' but argument is of type 'struct uclamp_se'
    1402 | static inline void uclamp_se_set(struct uclamp_se *uc_se,
         |                                  ~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/core.c: At top level:
>> kernel/sched/core.c:1480:1: error: conflicting types for 'uclamp_eff_get'
    1480 | uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
         | ^~~~~~~~~~~~~~
   kernel/sched/core.c:1414:37: note: previous implicit declaration of 'uclamp_eff_get' was here
    1414 |  uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
         |                                     ^~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'update_uclamp_req':
   kernel/sched/core.c:1415:1: warning: control reaches end of non-void function [-Wreturn-type]
    1415 | }
         | ^
   cc1: some warnings being treated as errors


vim +/uclamp_eff_get +1480 kernel/sched/core.c

69842cba9ace84 Patrick Bellasi 2019-06-21  1408  
1184db07bd011c Qais Yousef     2023-09-03  1409  /* Update p->uclamp_req and effective p->uclamp in one go */
1184db07bd011c Qais Yousef     2023-09-03  1410  update_uclamp_req(struct task_struct *p, enum uclamp_id clamp_id,
1184db07bd011c Qais Yousef     2023-09-03  1411  		  unsigned int value, bool user_defined)
69842cba9ace84 Patrick Bellasi 2019-06-21  1412  {
1184db07bd011c Qais Yousef     2023-09-03  1413  	uclamp_se_set(p->uclamp_req[clamp_id], value, user_defined);
1184db07bd011c Qais Yousef     2023-09-03 @1414  	uclamp_se_set(p->uclamp[clamp_id], uclamp_eff_get(p, clamp_id), user_defined);
69842cba9ace84 Patrick Bellasi 2019-06-21  1415  }
69842cba9ace84 Patrick Bellasi 2019-06-21  1416  
13685c4a08fca9 Qais Yousef     2020-07-16  1417  static void __uclamp_update_util_min_rt_default(struct task_struct *p)
13685c4a08fca9 Qais Yousef     2020-07-16  1418  {
13685c4a08fca9 Qais Yousef     2020-07-16  1419  	unsigned int default_util_min;
13685c4a08fca9 Qais Yousef     2020-07-16  1420  	struct uclamp_se *uc_se;
13685c4a08fca9 Qais Yousef     2020-07-16  1421  
13685c4a08fca9 Qais Yousef     2020-07-16  1422  	lockdep_assert_held(&p->pi_lock);
13685c4a08fca9 Qais Yousef     2020-07-16  1423  
13685c4a08fca9 Qais Yousef     2020-07-16  1424  	uc_se = &p->uclamp_req[UCLAMP_MIN];
13685c4a08fca9 Qais Yousef     2020-07-16  1425  
13685c4a08fca9 Qais Yousef     2020-07-16  1426  	/* Only sync if user didn't override the default */
13685c4a08fca9 Qais Yousef     2020-07-16  1427  	if (uc_se->user_defined)
13685c4a08fca9 Qais Yousef     2020-07-16  1428  		return;
13685c4a08fca9 Qais Yousef     2020-07-16  1429  
13685c4a08fca9 Qais Yousef     2020-07-16  1430  	default_util_min = sysctl_sched_uclamp_util_min_rt_default;
13685c4a08fca9 Qais Yousef     2020-07-16  1431  	uclamp_se_set(uc_se, default_util_min, false);
13685c4a08fca9 Qais Yousef     2020-07-16  1432  }
13685c4a08fca9 Qais Yousef     2020-07-16  1433  
13685c4a08fca9 Qais Yousef     2020-07-16  1434  static void uclamp_update_util_min_rt_default(struct task_struct *p)
13685c4a08fca9 Qais Yousef     2020-07-16  1435  {
13685c4a08fca9 Qais Yousef     2020-07-16  1436  	if (!rt_task(p))
13685c4a08fca9 Qais Yousef     2020-07-16  1437  		return;
13685c4a08fca9 Qais Yousef     2020-07-16  1438  
13685c4a08fca9 Qais Yousef     2020-07-16  1439  	/* Protect updates to p->uclamp_* */
0e34600ac9317d Peter Zijlstra  2023-06-09  1440  	guard(task_rq_lock)(p);
13685c4a08fca9 Qais Yousef     2020-07-16  1441  	__uclamp_update_util_min_rt_default(p);
13685c4a08fca9 Qais Yousef     2020-07-16  1442  }
13685c4a08fca9 Qais Yousef     2020-07-16  1443  
3eac870a324728 Patrick Bellasi 2019-08-22  1444  static inline struct uclamp_se
0413d7f33e6075 Patrick Bellasi 2019-08-22  1445  uclamp_tg_restrict(struct task_struct *p, enum uclamp_id clamp_id)
3eac870a324728 Patrick Bellasi 2019-08-22  1446  {
0213b7083e81f4 Qais Yousef     2021-06-17  1447  	/* Copy by value as we could modify it */
3eac870a324728 Patrick Bellasi 2019-08-22  1448  	struct uclamp_se uc_req = p->uclamp_req[clamp_id];
3eac870a324728 Patrick Bellasi 2019-08-22  1449  #ifdef CONFIG_UCLAMP_TASK_GROUP
0213b7083e81f4 Qais Yousef     2021-06-17  1450  	unsigned int tg_min, tg_max, value;
3eac870a324728 Patrick Bellasi 2019-08-22  1451  
3eac870a324728 Patrick Bellasi 2019-08-22  1452  	/*
3eac870a324728 Patrick Bellasi 2019-08-22  1453  	 * Tasks in autogroups or root task group will be
3eac870a324728 Patrick Bellasi 2019-08-22  1454  	 * restricted by system defaults.
3eac870a324728 Patrick Bellasi 2019-08-22  1455  	 */
3eac870a324728 Patrick Bellasi 2019-08-22  1456  	if (task_group_is_autogroup(task_group(p)))
3eac870a324728 Patrick Bellasi 2019-08-22  1457  		return uc_req;
3eac870a324728 Patrick Bellasi 2019-08-22  1458  	if (task_group(p) == &root_task_group)
3eac870a324728 Patrick Bellasi 2019-08-22  1459  		return uc_req;
3eac870a324728 Patrick Bellasi 2019-08-22  1460  
0213b7083e81f4 Qais Yousef     2021-06-17  1461  	tg_min = task_group(p)->uclamp[UCLAMP_MIN].value;
0213b7083e81f4 Qais Yousef     2021-06-17  1462  	tg_max = task_group(p)->uclamp[UCLAMP_MAX].value;
0213b7083e81f4 Qais Yousef     2021-06-17  1463  	value = uc_req.value;
0213b7083e81f4 Qais Yousef     2021-06-17  1464  	value = clamp(value, tg_min, tg_max);
0213b7083e81f4 Qais Yousef     2021-06-17  1465  	uclamp_se_set(&uc_req, value, false);
3eac870a324728 Patrick Bellasi 2019-08-22  1466  #endif
3eac870a324728 Patrick Bellasi 2019-08-22  1467  
3eac870a324728 Patrick Bellasi 2019-08-22  1468  	return uc_req;
3eac870a324728 Patrick Bellasi 2019-08-22  1469  }
3eac870a324728 Patrick Bellasi 2019-08-22  1470  
e8f14172c6b11e Patrick Bellasi 2019-06-21  1471  /*
e8f14172c6b11e Patrick Bellasi 2019-06-21  1472   * The effective clamp bucket index of a task depends on, by increasing
e8f14172c6b11e Patrick Bellasi 2019-06-21  1473   * priority:
e8f14172c6b11e Patrick Bellasi 2019-06-21  1474   * - the task specific clamp value, when explicitly requested from userspace
3eac870a324728 Patrick Bellasi 2019-08-22  1475   * - the task group effective clamp value, for tasks not either in the root
3eac870a324728 Patrick Bellasi 2019-08-22  1476   *   group or in an autogroup
e8f14172c6b11e Patrick Bellasi 2019-06-21  1477   * - the system default clamp value, defined by the sysadmin
e8f14172c6b11e Patrick Bellasi 2019-06-21  1478   */
1184db07bd011c Qais Yousef     2023-09-03  1479  static inline unsigned long
0413d7f33e6075 Patrick Bellasi 2019-08-22 @1480  uclamp_eff_get(struct task_struct *p, enum uclamp_id clamp_id)
e8f14172c6b11e Patrick Bellasi 2019-06-21  1481  {
3eac870a324728 Patrick Bellasi 2019-08-22  1482  	struct uclamp_se uc_req = uclamp_tg_restrict(p, clamp_id);
e8f14172c6b11e Patrick Bellasi 2019-06-21  1483  	struct uclamp_se uc_max = uclamp_default[clamp_id];
e8f14172c6b11e Patrick Bellasi 2019-06-21  1484  
e8f14172c6b11e Patrick Bellasi 2019-06-21  1485  	/* System default restrictions always apply */
e8f14172c6b11e Patrick Bellasi 2019-06-21  1486  	if (unlikely(uc_req.value > uc_max.value))
1184db07bd011c Qais Yousef     2023-09-03  1487  		return uc_max.value;
e8f14172c6b11e Patrick Bellasi 2019-06-21  1488  
1184db07bd011c Qais Yousef     2023-09-03  1489  	return uc_req.value;
e8f14172c6b11e Patrick Bellasi 2019-06-21  1490  }
e8f14172c6b11e Patrick Bellasi 2019-06-21  1491  

:::::: The code at line 1480 was first introduced by commit
:::::: 0413d7f33e60751570fd6c179546bde2f7d82dcb sched/uclamp: Always use 'enum uclamp_id' for clamp_id values

:::::: TO: Patrick Bellasi <patrick.bellasi@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
