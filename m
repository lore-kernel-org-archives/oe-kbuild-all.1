Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF5635
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 01:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749518266; cv=none; b=u15varI78kP04zfds4qr2bmYQcxC9xkGv+uDHgioPGC0j8FdgngWYJdqUrdoa0TPG7yVSt4/zq6HAFBkZfkZdR2jCKQY4SpfKU7p/y43kcgCUoMyrTo04rEphrK7Hrr+MHP6GoAXPL0XHjDl///Dd3KcXjy9Rg64x3ayDa6qC6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749518266; c=relaxed/simple;
	bh=3Xi8p9w1QZBq5/U32TIE6YBvYgvDOs+kLQeW9E1IbFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUl04jQ1UtWEsQ6NjshLc6vHohXuIa+PNyeBXrlLMiao/ghBWwGR+qXk8gESbzV4xkyG6N4qooXBD5iw3MSVJTHA1dgQWEe2rtcmivLHMMoQ46Ce367+leoeXZFlitE+vKz0QhlCiVMeN/F6/azpYIh2HjKDQhcc659+fDMkWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8HpAE3g; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8HpAE3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749518265; x=1781054265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Xi8p9w1QZBq5/U32TIE6YBvYgvDOs+kLQeW9E1IbFM=;
  b=n8HpAE3g/01nh/VYrgTzlh0pyFsrVcUAy1eWeUrvN0bqBv+yYj87qdKC
   u76kfXPyIZrV1lgQBmg4+qm03LFAZSdt/vWw3LOd4H0scIRFf/sLSsJw5
   N5hIhT33qEUSbCBbw1epS2bc3F3bPKtFgYka8r8xJFfhbAXtKPvgSWcpn
   X1KVKB6VIq6ZNWfFSxne/VPBlit/YIba1Xls6ZFHrfp8SJaiYiUTbU+T5
   IZqBDmdhSLjNOLcA5KpvxlVQF0jCVvkEG6uMszSzjk610cLvlxsbYmDm1
   b/1juML3OMD1GnZ43Zfcdc3IIyp2beP/qEEvznrOQ3LI+51qB0kcbHGak
   w==;
X-CSE-ConnectionGUID: KV9qgKJeReyrdumv92jYNw==
X-CSE-MsgGUID: YWurRcHBRTK8YPHKrKVxkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62225577"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="62225577"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:17:44 -0700
X-CSE-ConnectionGUID: b1yuxz/zR4O9f2RJ4EAdsQ==
X-CSE-MsgGUID: M84BxBHQRrWpNCW55Qj15A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="183861110"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jun 2025 18:17:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOncS-0007br-0m;
	Tue, 10 Jun 2025 01:17:40 +0000
Date: Tue, 10 Jun 2025 09:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954] kernel/sched/debug.c:600:33: error:
 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean
 'idle_h_nr_running'?
Message-ID: <202506100931.pmlaSe9t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dd32d51934d00fd319caec8710bd1a438bd69859
commit: 1f9456c873b7bad5a2e394b692e85febe92244a3 [2954/2954] sched/debug: Add h_nr_running/steal_h_nr_running in sched_debug
config: x86_64-randconfig-r052-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100931.pmlaSe9t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100931.pmlaSe9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100931.pmlaSe9t-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/debug.c: In function 'print_cfs_rq':
>> kernel/sched/debug.c:600:33: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
     600 |                         cfs_rq->steal_h_nr_running);
         |                                 ^~~~~~~~~~~~~~~~~~
   kernel/sched/debug.c:18:31: note: in definition of macro 'SEQ_printf'
      18 |                 seq_printf(m, x);               \
         |                               ^
   In file included from include/linux/kernel.h:17,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/debug.c:9:
>> kernel/sched/debug.c:600:33: error: 'struct cfs_rq' has no member named 'steal_h_nr_running'; did you mean 'idle_h_nr_running'?
     600 |                         cfs_rq->steal_h_nr_running);
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:434:33: note: in definition of macro 'pr_cont'
     434 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   kernel/sched/debug.c:599:9: note: in expansion of macro 'SEQ_printf'
     599 |         SEQ_printf(m, "  .%-30s: %ld\n", "steal_h_nr_running",
         |         ^~~~~~~~~~


vim +600 kernel/sched/debug.c

   554	
   555	void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
   556	{
   557		s64 MIN_vruntime = -1, min_vruntime, max_vruntime = -1,
   558			spread, rq0_min_vruntime, spread0;
   559		struct rq *rq = cpu_rq(cpu);
   560		struct sched_entity *last;
   561		unsigned long flags;
   562	
   563	#ifdef CONFIG_FAIR_GROUP_SCHED
   564		SEQ_printf(m, "\n");
   565		SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu);
   566	#else
   567		SEQ_printf(m, "\n");
   568		SEQ_printf(m, "cfs_rq[%d]:\n", cpu);
   569	#endif
   570		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "exec_clock",
   571				SPLIT_NS(cfs_rq->exec_clock));
   572	
   573		raw_spin_rq_lock_irqsave(rq, flags);
   574		if (rb_first_cached(&cfs_rq->tasks_timeline))
   575			MIN_vruntime = (__pick_first_entity(cfs_rq))->vruntime;
   576		last = __pick_last_entity(cfs_rq);
   577		if (last)
   578			max_vruntime = last->vruntime;
   579		min_vruntime = cfs_rq->min_vruntime;
   580		rq0_min_vruntime = cpu_rq(0)->cfs.min_vruntime;
   581		raw_spin_rq_unlock_irqrestore(rq, flags);
   582		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "MIN_vruntime",
   583				SPLIT_NS(MIN_vruntime));
   584		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
   585				SPLIT_NS(min_vruntime));
   586		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "max_vruntime",
   587				SPLIT_NS(max_vruntime));
   588		spread = max_vruntime - MIN_vruntime;
   589		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread",
   590				SPLIT_NS(spread));
   591		spread0 = min_vruntime - rq0_min_vruntime;
   592		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread0",
   593				SPLIT_NS(spread0));
   594		SEQ_printf(m, "  .%-30s: %d\n", "nr_spread_over",
   595				cfs_rq->nr_spread_over);
   596		SEQ_printf(m, "  .%-30s: %d\n", "nr_running", cfs_rq->nr_running);
   597	#ifdef CONFIG_SCHED_STEAL
   598		SEQ_printf(m, "  .%-30s: %d\n", "h_nr_running", cfs_rq->h_nr_running);
   599		SEQ_printf(m, "  .%-30s: %ld\n", "steal_h_nr_running",
 > 600				cfs_rq->steal_h_nr_running);
   601	#endif
   602		SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
   603	#ifdef CONFIG_SMP
   604		SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
   605				cfs_rq->avg.load_avg);
   606		SEQ_printf(m, "  .%-30s: %lu\n", "runnable_avg",
   607				cfs_rq->avg.runnable_avg);
   608		SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
   609				cfs_rq->avg.util_avg);
   610		SEQ_printf(m, "  .%-30s: %u\n", "util_est_enqueued",
   611				cfs_rq->avg.util_est.enqueued);
   612		SEQ_printf(m, "  .%-30s: %ld\n", "removed.load_avg",
   613				cfs_rq->removed.load_avg);
   614		SEQ_printf(m, "  .%-30s: %ld\n", "removed.util_avg",
   615				cfs_rq->removed.util_avg);
   616		SEQ_printf(m, "  .%-30s: %ld\n", "removed.runnable_avg",
   617				cfs_rq->removed.runnable_avg);
   618	#ifdef CONFIG_FAIR_GROUP_SCHED
   619		SEQ_printf(m, "  .%-30s: %lu\n", "tg_load_avg_contrib",
   620				cfs_rq->tg_load_avg_contrib);
   621		SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
   622				atomic_long_read(&cfs_rq->tg->load_avg));
   623	#endif
   624	#endif
   625	#ifdef CONFIG_CFS_BANDWIDTH
   626		SEQ_printf(m, "  .%-30s: %d\n", "throttled",
   627				cfs_rq->throttled);
   628		SEQ_printf(m, "  .%-30s: %d\n", "throttle_count",
   629				cfs_rq->throttle_count);
   630	#endif
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
