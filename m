Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F00622126D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 23:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768173676; cv=none; b=gF6xxK/oZGf2su2WYNhKJYzF75/aWkOyGBcHR7JJP+cyoQK1O3/GWRpNW+VteKhP+7j/ufzW8tIfv7xYU56wCVkbPwstVtT8d06+yaYRED4zTYE7d1RAgVBZN5V0Ox9woM8V5safI1WCrG0oXxvqQ7JXeLsnTOuk+onwFxJ2xQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768173676; c=relaxed/simple;
	bh=IrjHz27LFbb0+A0BoeBvk4hoak/6jXzsKBK3nW10P3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lip8H75WXJlOcNU/RWoMDpw4PL5O6nRpFkS2/rZNihy1EaVsoOGJa0on1ZHJIbewHf2nWAWYo9wttJEt+CP1TPFRH9CqshlGUpRnyE7AKl/wHo1KEPBSe3DSCc4pP2Quk7DlQ/LRx7fegqqXflOh/8iBk1zZNYyQ5GmD9+2FrPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tlb4bnbg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tlb4bnbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768173675; x=1799709675;
  h=date:from:to:cc:subject:message-id;
  bh=IrjHz27LFbb0+A0BoeBvk4hoak/6jXzsKBK3nW10P3M=;
  b=Tlb4bnbgXj1Q5MdfsDweS+nNqZhZ8HkZ6RbUxZZnDhn6MqYH8hExtNOF
   RiLgrFcSQ+tbCaI6ucJp5XYHrqudB2ntI53rh3/kBYVAl5zBz9ciFcjFI
   l4jyYdyBoFPM1p0huEy+b6cHxD0BpvOUTFJ9YcBIdPuwZEMU+O9Xr1kiz
   ed9d/kGZ0qC9LahxsqG1BaTVhgFl9Ze0wsWgF4RfdtzEHLrpLp4gEqSip
   H45Dg7uyJrD67+edWZ7P6cFV8aAm2mpO7pLC8HouXmBGjfdoqeXgaTc2y
   NRB4ddOp+tCAg9QMJpLvWyxhTAX5U9NeoFWZvOe8R/jOKPzf6yZuVXFBL
   A==;
X-CSE-ConnectionGUID: eEV7s8vpRqCih7eVa/eyZw==
X-CSE-MsgGUID: 0sJD7/orSiqK2oa+kwSLKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69504084"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69504084"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:21:15 -0800
X-CSE-ConnectionGUID: btsYm92FRUKs5gapopVByg==
X-CSE-MsgGUID: dVxJBY0sRi2OJqAr20NbtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203575150"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2026 15:21:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf4kA-00000000Cld-2spR;
	Sun, 11 Jan 2026 23:21:10 +0000
Date: Mon, 12 Jan 2026 07:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 11/15]
 kernel/sched/cputime.c:554:5: error: redefinition of 'get_cpu_idle_time_us'
Message-ID: <202601120739.xPZewj5K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   dbfc29e2be8d36d0159dc4337c7362bf51c8da9f
commit: e9eee24ece46539c4412ead656822a5bf6d12aa7 [11/15] tick/sched: Consolidate fetching idle time
config: arm-randconfig-002-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120739.xPZewj5K-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120739.xPZewj5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120739.xPZewj5K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:57:
>> kernel/sched/cputime.c:554:5: error: redefinition of 'get_cpu_idle_time_us'
    u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
        ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/sched/isolation.h:7,
                    from kernel/sched/build_policy.c:19:
   include/linux/tick.h:163:19: note: previous definition of 'get_cpu_idle_time_us' was here
    static inline u64 get_cpu_idle_time_us(int cpu, u64 *unused) { return -1; }
                      ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:57:
>> kernel/sched/cputime.c:578:5: error: redefinition of 'get_cpu_iowait_time_us'
    u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
        ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/sched/isolation.h:7,
                    from kernel/sched/build_policy.c:19:
   include/linux/tick.h:164:19: note: previous definition of 'get_cpu_iowait_time_us' was here
    static inline u64 get_cpu_iowait_time_us(int cpu, u64 *unused) { return -1; }
                      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c:12:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
    static const u64 max_rt_runtime = MAX_BW;
                     ^~~~~~~~~~~~~~


vim +/get_cpu_idle_time_us +554 kernel/sched/cputime.c

7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  536  
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  537  /**
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  538   * get_cpu_idle_time_us - get the total idle time of a CPU
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  539   * @cpu: CPU number to query
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  540   * @last_update_time: variable to store update time in. Do not update
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  541   * counters if NULL.
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  542   *
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  543   * Return the cumulative idle time (since boot) for a given
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  544   * CPU, in microseconds. Note that this is partially broken due to
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  545   * the counter of iowait tasks that can be remotely updated without
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  546   * any synchronization. Therefore it is possible to observe backward
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  547   * values within two consecutive reads.
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  548   *
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  549   * This time is measured via accounting rather than sampling,
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  550   * and is as accurate as ktime_get() is.
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  551   *
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  552   * Return: total idle time of the @cpu
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  553   */
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17 @554  u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  555  {
e9eee24ece4653 Frederic Weisbecker 2025-12-17  556  	return __get_cpu_idle_time_us(cpu, CPUTIME_IDLE,
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  557  				      !nr_iowait_cpu(cpu), last_update_time);
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  558  }
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  559  EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  560  
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  561  /**
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  562   * get_cpu_iowait_time_us - get the total iowait time of a CPU
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  563   * @cpu: CPU number to query
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  564   * @last_update_time: variable to store update time in. Do not update
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  565   * counters if NULL.
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  566   *
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  567   * Return the cumulative iowait time (since boot) for a given
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  568   * CPU, in microseconds. Note this is partially broken due to
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  569   * the counter of iowait tasks that can be remotely updated without
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  570   * any synchronization. Therefore it is possible to observe backward
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  571   * values within two consecutive reads.
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  572   *
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  573   * This time is measured via accounting rather than sampling,
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  574   * and is as accurate as ktime_get() is.
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  575   *
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  576   * Return: total iowait time of @cpu
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  577   */
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17 @578  u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  579  {
e9eee24ece4653 Frederic Weisbecker 2025-12-17  580  	return __get_cpu_idle_time_us(cpu, CPUTIME_IOWAIT,
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  581  				      nr_iowait_cpu(cpu), last_update_time);
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  582  }
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  583  EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
7e99d0a40c54b7 Frederic Weisbecker 2025-12-17  584  

:::::: The code at line 554 was first introduced by commit
:::::: 7e99d0a40c54b737d21d2cac216937e4665fd024 tick/sched: Move dyntick-idle cputime accounting to cputime code

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Frederic Weisbecker <frederic@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
