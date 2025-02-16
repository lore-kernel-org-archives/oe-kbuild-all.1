Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401B01B808
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739723191; cv=none; b=CDCHZaz1H2cLNBplCFYQGwyufSxHwqrcQKXrRiSSfKAF4LgXiTo2HuQDKgpBxO9w+pAX3a1Y8C0M2AaDn3vCjPFAgFMqTO2tFjvAUDWeJfEquk21QT6QgzQtL93FoqZZdy00J8U3lQqtUj7tuNhbrg+tb5dCbhgltnAxG0eNsQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739723191; c=relaxed/simple;
	bh=SA7JTsExijwU0fxpvPPTOjTNSbQwjUoGLm0eyxYlAgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liPtaIX4I7pMYvykN3czCOcsweQmyt8skK8fYaz+OKVMutPTKnw1WEOs13LgWMGgjQCKzuv3frp/SE3vQH+VA76+OwwTnNYvg1mCXF68/JkGEndy5nJWuX2Ro1BGJWRC3AhceJayedo09khCmkesqLbEWMZvYLucN+hqRaDVzLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nD7cE+qF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nD7cE+qF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739723189; x=1771259189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SA7JTsExijwU0fxpvPPTOjTNSbQwjUoGLm0eyxYlAgg=;
  b=nD7cE+qFrDkOcqdkEtv3pA06CWniYHQk4xHyoZTJUgoN9ktJbtN2XgUp
   BVBeDW+hmmCd68aebG6r+N6P3V6PXocSqGazzr5NvY0uWlprqPMzlSgpS
   S9u++u1HzslEW76FoCpEy1PXMcLwt7NRTNNeASO0jwRm6nTieQWDS78Ce
   gwM5b85yGq6ORA0vqcfEUigUhNfrWPRq8vdaaTfP8MuMOKPkWrmo9iKxL
   L9opy0GN/HjW/cjJa4uLjTfib8SwxAheU2oE0o0MO+6GDkReucHKnVrXK
   qQzSxmyoJVdqLP5DslxLYOcOENq6U3TLaiVmZM8vJ8ImDdlwHDdV2dd7W
   w==;
X-CSE-ConnectionGUID: HMeTHAIeQRqK/3d/gM3Dxg==
X-CSE-MsgGUID: 9R/Tzq6lTHu/w8Sqoj31vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="44066204"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="44066204"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 08:26:29 -0800
X-CSE-ConnectionGUID: liv0WU+3QhyMqw6s8opb2g==
X-CSE-MsgGUID: N+CVyJ/PRbWXKB63UylHJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114398677"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Feb 2025 08:26:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjhTN-001C4P-1G;
	Sun, 16 Feb 2025 16:26:25 +0000
Date: Mon, 17 Feb 2025 00:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/next 4/4] kernel/rcu/rcutorture.c:2389:39: error:
 implicit declaration of function 'get_gp_wrap_count'
Message-ID: <202502170006.FbuyaYgD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/next
head:   984c47eeb7728829901b33462baae2771af80ea0
commit: 984c47eeb7728829901b33462baae2771af80ea0 [4/4] TEST: force gpwraps
config: nios2-randconfig-002-20250216 (https://download.01.org/0day-ci/archive/20250217/202502170006.FbuyaYgD-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170006.FbuyaYgD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170006.FbuyaYgD-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/rcutorture.c: In function 'rcu_read_delay':
   kernel/rcu/rcutorture.c:450:28: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
     450 |         unsigned long long ts;
         |                            ^~
   kernel/rcu/rcutorture.c:447:23: warning: variable 'completed' set but not used [-Wunused-but-set-variable]
     447 |         unsigned long completed;
         |                       ^~~~~~~~~
   kernel/rcu/rcutorture.c:446:23: warning: variable 'started' set but not used [-Wunused-but-set-variable]
     446 |         unsigned long started;
         |                       ^~~~~~~
   kernel/rcu/rcutorture.c: In function 'rcu_torture_one_read':
   kernel/rcu/rcutorture.c:2169:28: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
    2169 |         unsigned long long ts;
         |                            ^~
   kernel/rcu/rcutorture.c: In function 'rcu_torture_stats_print':
>> kernel/rcu/rcutorture.c:2389:39: error: implicit declaration of function 'get_gp_wrap_count' [-Wimplicit-function-declaration]
    2389 |                 total_gpwrap_count += get_gp_wrap_count(cpu);
         |                                       ^~~~~~~~~~~~~~~~~


vim +/get_gp_wrap_count +2389 kernel/rcu/rcutorture.c

  2362	
  2363	/*
  2364	 * Print torture statistics.  Caller must ensure that there is only
  2365	 * one call to this function at a given time!!!  This is normally
  2366	 * accomplished by relying on the module system to only have one copy
  2367	 * of the module loaded, and then by giving the rcu_torture_stats
  2368	 * kthread full control (or the init/cleanup functions when rcu_torture_stats
  2369	 * thread is not running).
  2370	 */
  2371	static void
  2372	rcu_torture_stats_print(void)
  2373	{
  2374		int cpu;
  2375		int i;
  2376		long pipesummary[RCU_TORTURE_PIPE_LEN + 1] = { 0 };
  2377		long batchsummary[RCU_TORTURE_PIPE_LEN + 1] = { 0 };
  2378		long total_gpwrap_count = 0;
  2379		struct rcu_torture *rtcp;
  2380		static unsigned long rtcv_snap = ULONG_MAX;
  2381		static bool splatted;
  2382		struct task_struct *wtp;
  2383	
  2384		for_each_possible_cpu(cpu) {
  2385			for (i = 0; i < RCU_TORTURE_PIPE_LEN + 1; i++) {
  2386				pipesummary[i] += READ_ONCE(per_cpu(rcu_torture_count, cpu)[i]);
  2387				batchsummary[i] += READ_ONCE(per_cpu(rcu_torture_batch, cpu)[i]);
  2388			}
> 2389			total_gpwrap_count += get_gp_wrap_count(cpu);
  2390		}
  2391		for (i = RCU_TORTURE_PIPE_LEN; i >= 0; i--) {
  2392			if (pipesummary[i] != 0)
  2393				break;
  2394		}
  2395	
  2396		pr_alert("%s%s total_gpwrap_count: %ld", torture_type, TORTURE_FLAG, total_gpwrap_count);
  2397		rtcp = rcu_access_pointer(rcu_torture_current);
  2398		pr_cont("rtc: %p %s: %lu tfle: %d rta: %d rtaf: %d rtf: %d ",
  2399			rtcp,
  2400			rtcp && !rcu_stall_is_suppressed_at_boot() ? "ver" : "VER",
  2401			rcu_torture_current_version,
  2402			list_empty(&rcu_torture_freelist),
  2403			atomic_read(&n_rcu_torture_alloc),
  2404			atomic_read(&n_rcu_torture_alloc_fail),
  2405			atomic_read(&n_rcu_torture_free));
  2406		pr_cont("rtmbe: %d rtmbkf: %d/%d rtbe: %ld rtbke: %ld ",
  2407			atomic_read(&n_rcu_torture_mberror),
  2408			atomic_read(&n_rcu_torture_mbchk_fail), atomic_read(&n_rcu_torture_mbchk_tries),
  2409			n_rcu_torture_barrier_error,
  2410			n_rcu_torture_boost_ktrerror);
  2411		pr_cont("rtbf: %ld rtb: %ld nt: %ld ",
  2412			n_rcu_torture_boost_failure,
  2413			n_rcu_torture_boosts,
  2414			atomic_long_read(&n_rcu_torture_timers));
  2415		torture_onoff_stats();
  2416		pr_cont("barrier: %ld/%ld:%ld ",
  2417			data_race(n_barrier_successes),
  2418			data_race(n_barrier_attempts),
  2419			data_race(n_rcu_torture_barrier_error));
  2420		pr_cont("read-exits: %ld ", data_race(n_read_exits)); // Statistic.
  2421		pr_cont("nocb-toggles: %ld:%ld\n",
  2422			atomic_long_read(&n_nocb_offload), atomic_long_read(&n_nocb_deoffload));
  2423	
  2424		pr_alert("%s%s ", torture_type, TORTURE_FLAG);
  2425		if (atomic_read(&n_rcu_torture_mberror) ||
  2426		    atomic_read(&n_rcu_torture_mbchk_fail) ||
  2427		    n_rcu_torture_barrier_error || n_rcu_torture_boost_ktrerror ||
  2428		    n_rcu_torture_boost_failure || i > 1) {
  2429			pr_cont("%s", "!!! ");
  2430			atomic_inc(&n_rcu_torture_error);
  2431			WARN_ON_ONCE(atomic_read(&n_rcu_torture_mberror));
  2432			WARN_ON_ONCE(atomic_read(&n_rcu_torture_mbchk_fail));
  2433			WARN_ON_ONCE(n_rcu_torture_barrier_error);  // rcu_barrier()
  2434			WARN_ON_ONCE(n_rcu_torture_boost_ktrerror); // no boost kthread
  2435			WARN_ON_ONCE(n_rcu_torture_boost_failure); // boost failed (TIMER_SOFTIRQ RT prio?)
  2436			WARN_ON_ONCE(i > 1); // Too-short grace period
  2437		}
  2438		pr_cont("Reader Pipe: ");
  2439		for (i = 0; i < RCU_TORTURE_PIPE_LEN + 1; i++)
  2440			pr_cont(" %ld", pipesummary[i]);
  2441		pr_cont("\n");
  2442	
  2443		pr_alert("%s%s ", torture_type, TORTURE_FLAG);
  2444		pr_cont("Reader Batch: ");
  2445		for (i = 0; i < RCU_TORTURE_PIPE_LEN + 1; i++)
  2446			pr_cont(" %ld", batchsummary[i]);
  2447		pr_cont("\n");
  2448	
  2449		pr_alert("%s%s ", torture_type, TORTURE_FLAG);
  2450		pr_cont("Free-Block Circulation: ");
  2451		for (i = 0; i < RCU_TORTURE_PIPE_LEN + 1; i++) {
  2452			pr_cont(" %d", atomic_read(&rcu_torture_wcount[i]));
  2453		}
  2454		pr_cont("\n");
  2455	
  2456		if (cur_ops->stats)
  2457			cur_ops->stats();
  2458		if (rtcv_snap == rcu_torture_current_version &&
  2459		    rcu_access_pointer(rcu_torture_current) &&
  2460		    !rcu_stall_is_suppressed()) {
  2461			int __maybe_unused flags = 0;
  2462			unsigned long __maybe_unused gp_seq = 0;
  2463	
  2464			if (cur_ops->get_gp_data)
  2465				cur_ops->get_gp_data(&flags, &gp_seq);
  2466			wtp = READ_ONCE(writer_task);
  2467			pr_alert("??? Writer stall state %s(%d) g%lu f%#x ->state %#x cpu %d\n",
  2468				 rcu_torture_writer_state_getname(),
  2469				 rcu_torture_writer_state, gp_seq, flags,
  2470				 wtp == NULL ? ~0U : wtp->__state,
  2471				 wtp == NULL ? -1 : (int)task_cpu(wtp));
  2472			if (!splatted && wtp) {
  2473				sched_show_task(wtp);
  2474				splatted = true;
  2475			}
  2476			if (cur_ops->gp_kthread_dbg)
  2477				cur_ops->gp_kthread_dbg();
  2478			rcu_ftrace_dump(DUMP_ALL);
  2479		}
  2480		rtcv_snap = rcu_torture_current_version;
  2481	}
  2482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
