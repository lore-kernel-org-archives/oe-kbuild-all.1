Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB427257D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 03:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737256965; cv=none; b=WezpyK5Vpd4sYZj+oZEdSHsmA5Q9A50VGw4D0XHbJen16N17OLS8C9hudjFvRecqhA6Kiq/VfO3AkxEr8WywsA7lbcZGKtiJieRXprt7ixhtigBU1j7tLoy1CF1V3LaxB5BXSP/G/JAN0wyW4d1jEPDABANk/tYmY0vZoxwkBTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737256965; c=relaxed/simple;
	bh=gV5uLK3bQh5q9fZqlQIEFEHn1cKqnsUASZtTjHkE9p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qw83MHwtYL98YdVJxzuLKf2Qm0wlQXOmtDOHPU5ZdGYEu/uXD/eRvlUKKaIzaySR/5VxyaQJgUvzuLEZTnemimWYE8+s3wul7gw0/wmgGSc1ws3UpSY8kFX4GCWiqYg8orA8R8R7zh3dvoG4/mFTlh8It6GU1eLtKao0PYmvFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bdnxfJIs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bdnxfJIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737256964; x=1768792964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gV5uLK3bQh5q9fZqlQIEFEHn1cKqnsUASZtTjHkE9p0=;
  b=bdnxfJIs2REfJpORm4uvyakZWd8EOQFOWfOfNcUPkbD+KboZkLRcI5Py
   LptdmH6R7djJVVgQkgPGlk46KB289swxedoAR52MbThrYMNvLCXo7/uUK
   W74VgwjVtxvPUCFa+yiYZlSd10H48jL/EMc9YAY8dHIjlx+pwBYQ76PsD
   IELww6a+muk4xlRNEe61NGeuiSzjaMvY1AzkGGbE2GfcVgnnN9R/FHpw6
   5ow1+m4Ir2rnpxxLihuYGec3P87fpdtgzvuFCA2dOi0rxbTzlnz5QnoQQ
   MsguC4QG8JLIAXl4DwCY19cCrGF/3Tv7jxda8W6e24Fj0RSsbTq4zLwWD
   A==;
X-CSE-ConnectionGUID: jjsLBMN9RKiUdwCvobIU1A==
X-CSE-MsgGUID: Dqvg5QbIR2OmYLez/URfMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37560295"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="37560295"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 19:22:43 -0800
X-CSE-ConnectionGUID: T6bHCkbmS4OlmnvBYrXjOg==
X-CSE-MsgGUID: XV7PPnuKQ9StPwswsjdd1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107050823"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jan 2025 19:22:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZLtY-000V43-0I;
	Sun, 19 Jan 2025 03:22:40 +0000
Date: Sun, 19 Jan 2025 11:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 kernel/sched/test_ksched_football.c:55:10: sparse: sparse: symbol
 'players_ready' was not declared. Should it be static?
Message-ID: <202501191133.SzCovnhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   7127c4ff9a236436d479ddcb28182042ade17161
commit: 84f4417638e9588ebcb43c4ed0280d097c46abf9 [0/1] ANDROID: sched: Initial ksched_football test implementation
config: x86_64-randconfig-121-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191133.SzCovnhZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191133.SzCovnhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191133.SzCovnhZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/test_ksched_football.c:55:10: sparse: sparse: symbol 'players_ready' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:56:10: sparse: sparse: symbol 'ball_pos' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:57:15: sparse: sparse: symbol 'players_per_team' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:58:6: sparse: sparse: symbol 'game_over' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:78:17: sparse: sparse: symbol 'mutex_low_list' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:79:17: sparse: sparse: symbol 'mutex_mid_list' was not declared. Should it be static?
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
    71	struct mutex *mutex_low_list;
    72	struct mutex *mutex_mid_list;
    73	#define test_lock_init(x)	mutex_init(x)
    74	#define TEST_LOCK_SIZE		sizeof(struct mutex)
    75	#define test_lock(x)		mutex_lock(x)
    76	#define test_unlock(x)		mutex_unlock(x)
    77	#else
  > 78	struct rt_mutex *mutex_low_list;
  > 79	struct rt_mutex *mutex_mid_list;
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
