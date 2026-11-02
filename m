Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636963;
	b=N6f7UBMyDET6hEOofsyZxq/UgkueCYOEOqjmCPW3FCUuwo1LdHI7fhQS8R31JFLGggnM
	 PjWKVBS39blXsz0Xyu7Odir/C8wAH37vxAaFOwkqV/IF9NOPpQycZJNtyXyeWZ/jXKTtn
	 nfCj/N6KiBNrAKmfQlfWE6FDBSzFaIUaqQaKHhjbrYIznpdJznqdjygCjztX7DSiqtDrP
	 eLePPWwdUYLMwP9MrIzaVJVHechDr72qTwszMrWfl5znqutgZ39Bn5E3q8qu5Hq4z6IfN
	 GxaElvKpSr1KmL9kty+KekyRI+/DJSfplkfl+uDeqU6lkWk5m6f9pm/1N8Svb846a2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636963;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uT34MOCsaA8ymMBfIzgau2f3TUdogo96BwwKNnuhkLA=;
	b=gqwsqqvIyO7yGYSGRO4M4LwPrrfThNDOmWCpG7F4G5J0dE7kcJVimBd7VDVojArwTHux
	 Dg/Un+7d+eX3iWPMqh5bhEoxBjadiSNoWsMeVkslhPXhv56bnNo2WetKgB/ta0ji4CQWm
	 /MDdC4VHyzPsaECet21/rFIMrrrsPAvdbUislUMIHAZx017r+EXoDYkTiRfBqQ8J4paLj
	 TMjs5ylLEkhYHTDtYYAE0CbpXJyouyrE9cC1slBtkD8Orn7WTJhEXoWwVAYHTpbN9Aj9+
	 HsMWmg6pdO10KmYTvZifW1Whx+EUNC/5/GhU7nog9y1Fk5y0l5eWvFs2pmPhe84oUmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J3ot69dV;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B966072290
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 16:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B966072290
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J3ot69dV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793636963; x=1825172963;
  h=date:from:to:cc:subject:message-id;
  bh=4eOoTWXZvFTv+Qg/NyybHCoG7xOMfYIiMB1F/kAZASI=;
  b=J3ot69dVgp/1LT9rFER4GabTXOsfA7DpVGasDADxLRUXm+767Aw1jooe
   F+3x0/hJWS0WmDm9qhr8XgzAQCRoiXwObPIzUcq737XIz9iwjZ10HHUKC
   QmucXtYr7P1WMjLjeFVWqLaJkyqVVkcy/yIpzF094L1vTXpmC+YS2xeJE
   7ylE8NN/tUNYrfbQRr/uVpIN3e64qh+pPcDq4+CN98q4omEi3fJA96ZKU
   UBJ5g1YBugEpiN4woiTQdr9KsFZjfkZquYtJW/bHCbwShVdW80oBDt0Qa
   gDpzn6XgmT5uY3ULe83RpFa700OGEAqN7oQj2t8wI4e3Eo5hVz3zuIPFC
   Q==;
X-CSE-ConnectionGUID: 196QDDuLSlqSspxjquFvxA==
X-CSE-MsgGUID: huRodEUNSRaZY1OU1rYDAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2346070"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2346070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 08:29:14 -0800
X-CSE-ConnectionGUID: oOd9ElL2QJ6pUO555f3pWw==
X-CSE-MsgGUID: 1nk193tyTOuKNUduoXWr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6494966"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2026 08:29:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNuuE-000000008et-0IZp;
	Mon, 02 Nov 2026 16:29:10 +0000
Date: Mon, 02 Nov 2026 17:29:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 20/20]
 kernel/sched/test_ksched_football.c:55:10: sparse: sparse: symbol
 'players_ready' was not declared. Should it be static?
Message-ID: <202611021729.Pbzc1MVo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e92b73070f9a9cf42236e34fdc16537c05349f91
commit: 84f4417638e9588ebcb43c4ed0280d097c46abf9 [20/20] ANDROID: sched: Initial ksched_football test implementation
config: i386-randconfig-r2309-20261102 (https://download.01.org/0day-ci/archive/20261102/202611021729.Pbzc1MVo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611021729.Pbzc1MVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611021729.Pbzc1MVo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/test_ksched_football.c:55:10: sparse: sparse: symbol 'players_ready' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:56:10: sparse: sparse: symbol 'ball_pos' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:57:15: sparse: sparse: symbol 'players_per_team' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:58:6: sparse: sparse: symbol 'game_over' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:71:14: sparse: sparse: symbol 'mutex_low_list' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:72:14: sparse: sparse: symbol 'mutex_mid_list' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:216:19: sparse: sparse: symbol 'referee_done' was not declared. Should it be static?

vim +/players_ready +55 kernel/sched/test_ksched_football.c

    54	
  > 55	atomic_t players_ready;
  > 56	atomic_t ball_pos;
  > 57	unsigned long players_per_team;
  > 58	bool game_over;
    59	
    60	#define DEF_GAME_TIME		10
    61	#define CHECKIN_TIMEOUT		30
    62	
    63	#define REF_PRIO		20
    64	#define FAN_PRIO		15
    65	#define DEF_HI_PRIO		10
    66	#define OFF_PRIO		5
    67	#define DEF_MID_PRIO		3
    68	#define DEF_LOW_PRIO		2
    69	
    70	#ifdef CONFIG_SCHED_PROXY_EXEC
  > 71	struct mutex *mutex_low_list;
  > 72	struct mutex *mutex_mid_list;
    73	#define test_lock_init(x)	mutex_init(x)
    74	#define TEST_LOCK_SIZE		sizeof(struct mutex)
    75	#define test_lock(x)		mutex_lock(x)
    76	#define test_unlock(x)		mutex_unlock(x)
    77	#else
    78	struct rt_mutex *mutex_low_list;
    79	struct rt_mutex *mutex_mid_list;
    80	#define test_lock_init(x)	rt_mutex_init(x)
    81	#define TEST_LOCK_SIZE		sizeof(struct rt_mutex)
    82	#define test_lock(x)		rt_mutex_lock(x)
    83	#define test_unlock(x)		rt_mutex_unlock(x)
    84	#endif
    85	
    86	static struct task_struct *create_fifo_thread(int (*threadfn)(void *data),
    87						      void *data, char *name, int prio)
    88	{
    89		struct task_struct *kth;
    90		struct sched_attr attr = {
    91			.size		= sizeof(struct sched_attr),
    92			.sched_policy	= SCHED_FIFO,
    93			.sched_nice	= 0,
    94			.sched_priority	= prio,
    95		};
    96		int ret;
    97	
    98		kth = kthread_create(threadfn, data, name);
    99		if (IS_ERR(kth)) {
   100			pr_warn("%s: Error, kthread_create %s failed\n", __func__,
   101				name);
   102			return kth;
   103		}
   104		ret = sched_setattr_nocheck(kth, &attr);
   105		if (ret) {
   106			kthread_stop(kth);
   107			pr_warn("%s: Error, failed to set SCHED_FIFO for %s\n",
   108				__func__, name);
   109			return ERR_PTR(ret);
   110		}
   111	
   112		wake_up_process(kth);
   113		return kth;
   114	}
   115	
   116	static int spawn_players(int (*threadfn)(void *data), char *name, int prio)
   117	{
   118		unsigned long current_players, start, i;
   119		struct task_struct *kth;
   120	
   121		current_players = atomic_read(&players_ready);
   122		/* Create players_per_team threads */
   123		for (i = 0; i < players_per_team; i++) {
   124			kth = create_fifo_thread(threadfn, (void *)i, name, prio);
   125			if (IS_ERR(kth))
   126				return -1;
   127		}
   128	
   129		start = jiffies;
   130		/* Wait for players_per_team threads to check in */
   131		while (atomic_read(&players_ready) < current_players + players_per_team) {
   132			msleep(1);
   133			if (jiffies - start > CHECKIN_TIMEOUT * HZ) {
   134				pr_err("%s: Error, %s players took too long to checkin "
   135				       "(only %ld of %ld checked in)\n", __func__, name,
   136				       (long)atomic_read(&players_ready),
   137				       current_players + players_per_team);
   138				return -1;
   139			}
   140		}
   141		return 0;
   142	}
   143	
   144	static int defense_low_thread(void *arg)
   145	{
   146		long tnum = (long)arg;
   147	
   148		atomic_inc(&players_ready);
   149		test_lock(&mutex_low_list[tnum]);
   150		while (!READ_ONCE(game_over)) {
   151			if (kthread_should_stop())
   152				break;
   153			schedule();
   154		}
   155		test_unlock(&mutex_low_list[tnum]);
   156		return 0;
   157	}
   158	
   159	static int defense_mid_thread(void *arg)
   160	{
   161		long tnum = (long)arg;
   162	
   163		atomic_inc(&players_ready);
   164		test_lock(&mutex_mid_list[tnum]);
   165		test_lock(&mutex_low_list[tnum]);
   166		while (!READ_ONCE(game_over)) {
   167			if (kthread_should_stop())
   168				break;
   169			schedule();
   170		}
   171		test_unlock(&mutex_low_list[tnum]);
   172		test_unlock(&mutex_mid_list[tnum]);
   173		return 0;
   174	}
   175	
   176	static int offense_thread(void *arg)
   177	{
   178		atomic_inc(&players_ready);
   179		while (!READ_ONCE(game_over)) {
   180			if (kthread_should_stop())
   181				break;
   182			schedule();
   183			atomic_inc(&ball_pos);
   184		}
   185		return 0;
   186	}
   187	
   188	static int defense_hi_thread(void *arg)
   189	{
   190		long tnum = (long)arg;
   191	
   192		atomic_inc(&players_ready);
   193		test_lock(&mutex_mid_list[tnum]);
   194		while (!READ_ONCE(game_over)) {
   195			if (kthread_should_stop())
   196				break;
   197			schedule();
   198		}
   199		test_unlock(&mutex_mid_list[tnum]);
   200		return 0;
   201	}
   202	
   203	static int crazy_fan_thread(void *arg)
   204	{
   205		atomic_inc(&players_ready);
   206		while (!READ_ONCE(game_over)) {
   207			if (kthread_should_stop())
   208				break;
   209			schedule();
   210			udelay(1000);
   211			msleep(2);
   212		}
   213		return 0;
   214	}
   215	
 > 216	struct completion referee_done;
   217	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
