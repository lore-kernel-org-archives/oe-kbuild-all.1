Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F74E224CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Mar 2024 04:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710737521; cv=none; b=HEtxwa9e022DqTjPalesgRp33HTKmaWgDnOYimHBRdiC5PPHMXUpzqWkirEzKyclZwYuUAdY/iVUvmawreCKKFbCEJCO+2kjANfvzP14lByvQqLZPL6iSnHHBkeYDr69Rb0GEnfrv4Oi7S6CYAzT/8HkEdmWUkfvXhslx3dUJG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710737521; c=relaxed/simple;
	bh=LO25xymfEMINAwG9mCNGLkF2joOqhvZDZNY/Bi3Gzxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRR6auhvhEpk7ZtuobFsL3Fx0RirpRoLaCdCiYq+eNvUda9We3vcQN6mpLSOIPEkuLipEupXMuP1H0mwQxquJwLG7pgo65uNV/t+2GDXCTxk+tXQRjj/2vewxs2yvIL31q7OhOx1kIEcrtOIKNta7sXlwYSxbE+jfABscTAcsK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2YZHFRs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2YZHFRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710737519; x=1742273519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LO25xymfEMINAwG9mCNGLkF2joOqhvZDZNY/Bi3Gzxg=;
  b=N2YZHFRs4ms2dWxsdscmgXwD9tuFLSIUO5ehjUAPeV0xusaUSnThlgNf
   FhuJ3tgGPF5zV4vgBvemD8EW8PnFaEIYO3MRARYfe/eTXJWEITToMEQv7
   qwoHfO9BQSVvNCYXaD9Rg40TgrUgoMNjQ8xvj3VAy/Hrb46/rM7hO0Qav
   fkQfY4xIqy7PSQHfuqMNVa3bWiXthBHhLUMFR55sMYCKYH/TUvGIjR85v
   gd5g8NNWTEfOQ5pwqKYs1FmsEtgdhwqdmtyvNj4DuB7zn+2GK7wm3rKGQ
   sIv/8PU3WNplKTIrNzY3DTo2EB3RPIqTMAkPjm6R5+lPkJliP6VL7uQWz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5665577"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5665577"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 21:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="18055780"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2024 21:51:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rm4yX-000Gfj-08;
	Mon, 18 Mar 2024 04:51:53 +0000
Date: Mon, 18 Mar 2024 12:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26605/27507]
 kernel/sched/batch.c:2915:16: error: invalid use of undefined type 'struct
 sched_domain'
Message-ID: <202403181205.TrWTfCA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: f2b1cebbfb364bfee4bf65cc11a429c360a64b89 [26605/27507] rue/cpu: Add control method to limit the rating of entering idle_balance_bt
config: x86_64-randconfig-r053-20240315 (https://download.01.org/0day-ci/archive/20240318/202403181205.TrWTfCA7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403181205.TrWTfCA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403181205.TrWTfCA7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/batch.c:17:
   kernel/sched/ht_isolate.h:20:6: warning: no previous prototype for 'sensitive_running_on_sibling' [-Wmissing-prototypes]
      20 | bool sensitive_running_on_sibling(int cpu) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:869:6: warning: no previous prototype for 'unthrottle_bt_rq' [-Wmissing-prototypes]
     869 | void unthrottle_bt_rq(struct bt_rq *bt_rq)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'do_sched_bt_period_timer':
   kernel/sched/batch.c:940:29: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
     940 |                         u64 runtime;
         |                             ^~~~~~~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:1148:25: warning: no previous prototype for '__pick_first_bt_entity' [-Wmissing-prototypes]
    1148 | struct sched_bt_entity *__pick_first_bt_entity(struct bt_rq *bt_rq)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c:1882:6: warning: no previous prototype for 'place_bt_entity' [-Wmissing-prototypes]
    1882 | void place_bt_entity(struct bt_rq *bt_rq, struct sched_bt_entity *se,
         |      ^~~~~~~~~~~~~~~
   kernel/sched/batch.c:2894:12: warning: no previous prototype for 'find_busiest_rq' [-Wmissing-prototypes]
    2894 | struct rq *find_busiest_rq(struct rq *this_rq, struct sched_domain *sd,
         |            ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'find_busiest_rq':
>> kernel/sched/batch.c:2915:16: error: invalid use of undefined type 'struct sched_domain'
    2915 |         if (!sd->parent) {
         |                ^~
>> kernel/sched/batch.c:2916:51: error: 'struct rq' has no member named 'rd'; did you mean 'rt'?
    2916 |                 struct root_domain *rd = this_rq->rd;
         |                                                   ^~
         |                                                   rt
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from kernel/sched/batch.c:5:
>> kernel/sched/batch.c:2918:30: error: invalid use of undefined type 'struct root_domain'
    2918 |                 WRITE_ONCE(rd->overload_bt, overload);
         |                              ^~
   include/linux/compiler.h:355:24: note: in definition of macro 'WRITE_ONCE'
     355 |         union { typeof(x) __val; char __c[1]; } __u =   \
         |                        ^
>> kernel/sched/batch.c:2918:30: error: invalid use of undefined type 'struct root_domain'
    2918 |                 WRITE_ONCE(rd->overload_bt, overload);
         |                              ^~
   include/linux/compiler.h:356:44: note: in definition of macro 'WRITE_ONCE'
     356 |                 { .__val = (__force typeof(x)) (val) }; \
         |                                            ^
>> kernel/sched/batch.c:2918:30: error: invalid use of undefined type 'struct root_domain'
    2918 |                 WRITE_ONCE(rd->overload_bt, overload);
         |                              ^~
   include/linux/compiler.h:357:29: note: in definition of macro 'WRITE_ONCE'
     357 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                             ^
>> kernel/sched/batch.c:2918:30: error: invalid use of undefined type 'struct root_domain'
    2918 |                 WRITE_ONCE(rd->overload_bt, overload);
         |                              ^~
   include/linux/compiler.h:357:49: note: in definition of macro 'WRITE_ONCE'
     357 |         __write_once_size(&(x), __u.__c, sizeof(x));    \
         |                                                 ^
   kernel/sched/batch.c: In function 'can_migrate_bt':
   kernel/sched/batch.c:2930:37: error: 'struct rq' has no member named 'cpu'
    2930 |         if (!cpumask_test_cpu(dst_rq->cpu, p->cpus_ptr) ||
         |                                     ^~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:2936:5: warning: no previous prototype for 'load_balance_bt' [-Wmissing-prototypes]
    2936 | int load_balance_bt(struct rq *this_rq, struct sched_domain *sd,
         |     ^~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'load_balance_bt':
   kernel/sched/batch.c:2961:24: error: 'struct rq' has no member named 'bt_tasks'
    2961 |         tasks = &src_rq->bt_tasks;
         |                        ^~
   kernel/sched/batch.c: In function 'rebalance_domains_bt':
   kernel/sched/batch.c:3018:9: error: implicit declaration of function 'for_each_domain'; did you mean 'for_each_class'? [-Werror=implicit-function-declaration]
    3018 |         for_each_domain(cpu, sd) {
         |         ^~~~~~~~~~~~~~~
         |         for_each_class
   kernel/sched/batch.c:3018:33: error: expected ';' before '{' token
    3018 |         for_each_domain(cpu, sd) {
         |                                 ^~
         |                                 ;
   kernel/sched/batch.c:3009:23: warning: unused variable 'interval' [-Wunused-variable]
    3009 |         unsigned long interval;
         |                       ^~~~~~~~
   kernel/sched/batch.c:3008:25: warning: unused variable 'mask' [-Wunused-variable]
    3008 |         struct cpumask *mask;
         |                         ^~~~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:3037:6: warning: no previous prototype for 'trigger_load_balance_bt' [-Wmissing-prototypes]
    3037 | void trigger_load_balance_bt(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/batch.c: In function 'idle_balance_bt':
   kernel/sched/batch.c:3061:13: error: 'struct rq' has no member named 'idle_stamp'; did you mean 'idle_state'?
    3061 |         rq->idle_stamp = rq_clock(rq);
         |             ^~~~~~~~~~
         |             idle_state
   kernel/sched/batch.c:3063:15: error: 'struct rq' has no member named 'avg_idle'
    3063 |         if (rq->avg_idle < sysctl_idle_balance_bt_cost ||
         |               ^~
   kernel/sched/batch.c:3064:28: error: 'struct rq' has no member named 'rd'; did you mean 'rt'?
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |                            ^~
   include/linux/compiler.h:330:24: note: in definition of macro '__READ_ONCE'
     330 |         union { typeof(x) __val; char __c[1]; } __u;                    \
         |                        ^
   kernel/sched/batch.c:3064:14: note: in expansion of macro 'READ_ONCE'
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |              ^~~~~~~~~
   kernel/sched/batch.c:3064:28: error: 'struct rq' has no member named 'rd'; did you mean 'rt'?
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |                            ^~
   include/linux/compiler.h:332:36: note: in definition of macro '__READ_ONCE'
     332 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                    ^
   kernel/sched/batch.c:3064:14: note: in expansion of macro 'READ_ONCE'
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |              ^~~~~~~~~
   kernel/sched/batch.c:3064:28: error: 'struct rq' has no member named 'rd'; did you mean 'rt'?
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |                            ^~
   include/linux/compiler.h:332:56: note: in definition of macro '__READ_ONCE'
     332 |                 __read_once_size(&(x), __u.__c, sizeof(x));             \
         |                                                        ^
   kernel/sched/batch.c:3064:14: note: in expansion of macro 'READ_ONCE'
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |              ^~~~~~~~~
   kernel/sched/batch.c:3064:28: error: 'struct rq' has no member named 'rd'; did you mean 'rt'?
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |                            ^~
   include/linux/compiler.h:334:44: note: in definition of macro '__READ_ONCE'
     334 |                 __read_once_size_nocheck(&(x), __u.__c, sizeof(x));     \
         |                                            ^
   kernel/sched/batch.c:3064:14: note: in expansion of macro 'READ_ONCE'
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |              ^~~~~~~~~
   kernel/sched/batch.c:3064:28: error: 'struct rq' has no member named 'rd'; did you mean 'rt'?
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |                            ^~
   include/linux/compiler.h:334:64: note: in definition of macro '__READ_ONCE'
     334 |                 __read_once_size_nocheck(&(x), __u.__c, sizeof(x));     \
         |                                                                ^
   kernel/sched/batch.c:3064:14: note: in expansion of macro 'READ_ONCE'
    3064 |             !READ_ONCE(rq->rd->overload_bt))
         |              ^~~~~~~~~
   kernel/sched/batch.c:3076:38: error: expected ';' before '{' token
    3076 |         for_each_domain(this_cpu, sd) {
         |                                      ^~
         |                                      ;
   kernel/sched/batch.c:3059:18: warning: unused variable 'pulled_task' [-Wunused-variable]
    3059 |         int ret, pulled_task = 0;
         |                  ^~~~~~~~~~~
   kernel/sched/batch.c: At top level:
   kernel/sched/batch.c:3209:6: warning: no previous prototype for 'init_offline_cpu_control' [-Wmissing-prototypes]
    3209 | void init_offline_cpu_control(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +2915 kernel/sched/batch.c

  2893	
> 2894	struct rq *find_busiest_rq(struct rq *this_rq, struct sched_domain *sd,
  2895				   struct cpumask *mask)
  2896	{
  2897		int cpu, this_cpu = cpu_of(this_rq), busiest_cpu = -1, overload = 0;
  2898		u64 load, busiest_load = 0;
  2899		struct rq *rq;
  2900	
  2901		for_each_cpu(cpu, mask) {
  2902			rq = cpu_rq(cpu);
  2903			if (cpu != this_cpu && rq->bt.h_nr_running > 0) {
  2904				load = get_balance_load(rq);
  2905				if (load > busiest_load) {
  2906					busiest_load = load;
  2907					busiest_cpu = cpu;
  2908				}
  2909			}
  2910	
  2911			if (rq->bt_nr_running > 1)
  2912				overload = 1;
  2913		}
  2914	
> 2915		if (!sd->parent) {
> 2916			struct root_domain *rd = this_rq->rd;
  2917	
> 2918			WRITE_ONCE(rd->overload_bt, overload);
  2919		}
  2920	
  2921		if (busiest_cpu != -1)
  2922			return cpu_rq(busiest_cpu);
  2923		else
  2924			return NULL;
  2925	}
  2926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
