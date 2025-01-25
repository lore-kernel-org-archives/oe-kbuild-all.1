Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF663205AB5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843237; cv=none; b=JZkJb4whuqTpwj54wMZNRGR5DLjrhOILYXYcUhmUaQEtZD8/b9j7P741XW8mrY3PbM2WF9FnUaZKKfChwgN83dEFCV6l/gt5Jg1rzJ8+3c5yDacWLf3wBWl7kUpUtZHyayhkgN9EpDqr1ZqIvnplnC/kJE4MoS3jw5oOkTkKiVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843237; c=relaxed/simple;
	bh=27k5hqsqn00xJ7hO2U49tjtPm1jmXJDkqjbAaKdCPho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcGkVXd3acXhWgT0vohJVnDSUmmiEbUgQmDt+zRUEt6ppV4eXT0rRBthDp0ZFaCaqEzJNXkuT00zIIv8QVWYjAb5hjslufwU0irmdt7yJ5qAAuVExLS7AnhXsSZ/9NXl7Ut250r/ny0AZLuSXUQbdbhsYYA7UeAHTOylAXZ69CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeS1vcsS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeS1vcsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737843235; x=1769379235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=27k5hqsqn00xJ7hO2U49tjtPm1jmXJDkqjbAaKdCPho=;
  b=JeS1vcsSBCntJzHAjS9+36JmZA0gEckc0Nd6zLwyI0TEZIU0Ma4Ympa2
   4fAenX7A7N2cRW8BneRWjMw7wtTCA19V4Vp4WnasobvJWVlLS4O/1gN3r
   Wb0ldbHh34mATJfzxVHymwkcXTVgbxaDSJ99lgeiD0Lxll6QUv+gsD3EX
   72D4nHEFOAauZ5zL/cNRoTSwLWqVk38dOjlGcVXvx0DBwTUNTkFJe6hVv
   oGF7Pz5UE3v0up0NW83/WVhD65jrwKCMUA4chOhW8Tsba0SzOJx92hFKN
   Ykfp51H6BgTwxZygXfiCN2PJB18je2bfekzVSAu8ihOOEH+aru8z8gtw5
   Q==;
X-CSE-ConnectionGUID: /TW2eIY2S+i0T5xlS16zDg==
X-CSE-MsgGUID: oYK14YhKTLCvpYnSw6nDiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="60815082"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="60815082"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 14:13:55 -0800
X-CSE-ConnectionGUID: sKM8ZGAJRliWOmpBqn+07Q==
X-CSE-MsgGUID: kOMDylZiRhGCUbCIDAMlJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109005210"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Jan 2025 14:13:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tboPX-000eHL-0A;
	Sat, 25 Jan 2025 22:13:51 +0000
Date: Sun, 26 Jan 2025 06:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 80/80]
 kernel/sched/fair.c:8653:13: warning: 'update_nohz_stats' defined but not
 used
Message-ID: <202501260648.VaGuM5HE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   237971eded915babb289acfe3ef55b529714b001
commit: 1940ddbeb9af3b68a7d800d9470951abaf9ccce4 [80/80] sched/fair: Remove update of blocked load from newidle_balance
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250126/202501260648.VaGuM5HE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260648.VaGuM5HE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260648.VaGuM5HE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:5576:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5576 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11455:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   11455 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11457:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   11457 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11462:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   11462 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11464:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   11464 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:8653:13: warning: 'update_nohz_stats' defined but not used [-Wunused-function]
    8653 | static bool update_nohz_stats(struct rq *rq, bool force)
         |             ^~~~~~~~~~~~~~~~~


vim +/update_nohz_stats +8653 kernel/sched/fair.c

caeb178c60f4f93 Rik van Riel    2014-07-28  8652  
63928384faefba1 Peter Zijlstra  2018-02-13 @8653  static bool update_nohz_stats(struct rq *rq, bool force)
e022e0d38ad475f Peter Zijlstra  2017-12-21  8654  {
e022e0d38ad475f Peter Zijlstra  2017-12-21  8655  #ifdef CONFIG_NO_HZ_COMMON
e022e0d38ad475f Peter Zijlstra  2017-12-21  8656  	unsigned int cpu = rq->cpu;
e022e0d38ad475f Peter Zijlstra  2017-12-21  8657  
f643ea2207010db Vincent Guittot 2018-02-13  8658  	if (!rq->has_blocked_load)
f643ea2207010db Vincent Guittot 2018-02-13  8659  		return false;
f643ea2207010db Vincent Guittot 2018-02-13  8660  
e022e0d38ad475f Peter Zijlstra  2017-12-21  8661  	if (!cpumask_test_cpu(cpu, nohz.idle_cpus_mask))
f643ea2207010db Vincent Guittot 2018-02-13  8662  		return false;
e022e0d38ad475f Peter Zijlstra  2017-12-21  8663  
63928384faefba1 Peter Zijlstra  2018-02-13  8664  	if (!force && !time_after(jiffies, rq->last_blocked_load_update_tick))
f643ea2207010db Vincent Guittot 2018-02-13  8665  		return true;
e022e0d38ad475f Peter Zijlstra  2017-12-21  8666  
e022e0d38ad475f Peter Zijlstra  2017-12-21  8667  	update_blocked_averages(cpu);
f643ea2207010db Vincent Guittot 2018-02-13  8668  
f643ea2207010db Vincent Guittot 2018-02-13  8669  	return rq->has_blocked_load;
f643ea2207010db Vincent Guittot 2018-02-13  8670  #else
f643ea2207010db Vincent Guittot 2018-02-13  8671  	return false;
e022e0d38ad475f Peter Zijlstra  2017-12-21  8672  #endif
e022e0d38ad475f Peter Zijlstra  2017-12-21  8673  }
e022e0d38ad475f Peter Zijlstra  2017-12-21  8674  

:::::: The code at line 8653 was first introduced by commit
:::::: 63928384faefba1b31c3bb77361965715a9fc71c sched/nohz: Optimize nohz_idle_balance()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
