Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491333;
	b=3iDKHMuWydKL70Q9UPe9b32BL9J/uSV4vkGZrS/b+KN673wP16ApwnSn9pLPA10rHfxU
	 SxxC+c+NfOx1sitmvCW7sIxSJptO18czx0uuey5wP8WBioFEYGU+/l6pOTzWQy+HDylaK
	 enV2pBECxT9DSLJH9JqaL2Nojfwmaxf6P6bQ/05YPnh9RV4JkwE87Wp0ED1QAXs0qSqy1
	 he8NwMDWE0IUQkiLfRs9AsagMKXIC3Xp4wZ5gGxmD8TPebtilkDMeci8w6YM6NyzOoLU3
	 1m5/FVCzYLWcTgCiZAjZaOMikmaSC4GP/QfFWddvP3z+RJY0VGZJgftbt8V/yohqe6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491333;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=//o8CpnWKcKozMOIRJ6zlR0umm4F3dAzBt5H0qGTdNE=;
	b=KgGk9KLqe+8tnmDcwEgxrgx2y48NKx9g85H4cX7fXn5IQGrwwRYGyWdK5XJIKPhN8Aro
	 OtNCDCvFI8Ydvjx/JL1mhNqeGkndcCR6yW00WcRMVWpq8l7RN6+qVM6k/oRJMC+kBwOas
	 V9pkfsyyGwHbXBElohtGssgDXQb7f6XzdhNzM7eCQX7WzkMZzAoEHUtiY5huj54GrDP76
	 H/IbcDNRYa1zcx2slB1MqGZq+ciXCzVnnCgE+vqh9Tf9YCu4y7mODwELgbM4AXZPBC7Gt
	 ISwwAAIgyjHDm94PukjiQAkEIahvHQ1ZP2kGRvFiS/hbWGjZUJSzGiqu4u0aA5shfOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OZaKoIzx;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16F606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 13:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF16F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OZaKoIzx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794491333; x=1826027333;
  h=date:from:to:cc:subject:message-id;
  bh=l0YjlzZS3R/O4Yg272x25R+h87Bu1rWRK6O+PKPbdLU=;
  b=OZaKoIzxrIW/ycV/BiZxYVCCVIoa3l9CDeMK21FJER5C3yyKhJdV33YJ
   N6EW5/gmyEd6GmO14HafCLCEmNF5XC4beybtQImZCFw30Q4g7C9LJHKr4
   ctmmOL+XklaD1GzDhBw90g2e/o02YndgUKwjISWDgGE+hpuP16AAAkND7
   2TVc+MdfzVDYNqjUxLzm0CkqqmoJuZeQYZbzcweUZTzcMji5OTWXxY/Ge
   SgYJZ9zq4bZ6E3dJZNaLLoGwF2LBeNk8f740M4qvCVQ74oAEn7Z9uJtv/
   5IDCy6FJ66jDnGYvycQf+C9Uj3qgp4p6b2FD915bvr+cWRwObB+Inkd+X
   A==;
X-CSE-ConnectionGUID: bcHl6wiZQFi10KcudlubMQ==
X-CSE-MsgGUID: F/1sWTZxSv6m7GKhbwx5OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3187686"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3187686"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:48:50 -0800
X-CSE-ConnectionGUID: rHKEvJIQQpuHbqW3Ar2d/w==
X-CSE-MsgGUID: SFGGIEmoS8GPzHaUd7xrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8994342"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Nov 2026 05:48:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRVAT-000000000t1-2syX;
	Thu, 12 Nov 2026 13:48:45 +0000
Date: Thu, 12 Nov 2026 14:48:31 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Kayra Cizmeci <kayracizmeci@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Josh Don <joshdon@google.com>
Subject: [peterz-queue:sched/urgent 2/4]
 kernel/sched/debug.c:1093:48: error: 'struct cfs_rq' has no member named
 'idle'
Message-ID: <202611121431.06YgiErz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urgent
head:   3f35de94c510a1b9becd25747a88692a1c68a350
commit: aedf2ce93d255e888c14c892fa618e786f5c0771 [2/4] sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle
config: sparc64-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121431.06YgiErz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611121431.06YgiErz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611121431.06YgiErz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:71:
   kernel/sched/debug.c: In function 'print_cfs_rq':
>> kernel/sched/debug.c:1093:48: error: 'struct cfs_rq' has no member named 'idle'
    1093 |  SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
         |                                                ^~
   kernel/sched/debug.c:21:17: note: in definition of macro 'SEQ_printf'
      21 |   seq_printf(m, x);  \
         |                 ^
   In file included from include/asm-generic/bug.h:31,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
>> kernel/sched/debug.c:1093:48: error: 'struct cfs_rq' has no member named 'idle'
    1093 |  SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
         |                                                ^~
   include/linux/printk.h:483:19: note: in definition of macro 'printk_index_wrap'
     483 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:596:2: note: in expansion of macro 'printk'
     596 |  printk(KERN_CONT fmt, ##__VA_ARGS__)
         |  ^~~~~~
   kernel/sched/debug.c:23:3: note: in expansion of macro 'pr_cont'
      23 |   pr_cont(x);   \
         |   ^~~~~~~
   kernel/sched/debug.c:1093:2: note: in expansion of macro 'SEQ_printf'
    1093 |  SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
         |  ^~~~~~~~~~


vim +1093 kernel/sched/debug.c

  1054	
  1055		raw_spin_rq_lock_irqsave(rq, flags);
  1056		root = __pick_root_entity(cfs_rq);
  1057		if (root)
  1058			left_vruntime = root->min_vruntime;
  1059		first = __pick_first_entity(cfs_rq);
  1060		if (first)
  1061			left_deadline = first->deadline;
  1062		last = __pick_last_entity(cfs_rq);
  1063		if (last)
  1064			right_vruntime = last->vruntime;
  1065		zero_vruntime = cfs_rq->zero_vruntime;
  1066		sum_w_vruntime = cfs_rq->sum_w_vruntime;
  1067		sum_weight = cfs_rq->sum_weight;
  1068		sum_shift = cfs_rq->sum_shift;
  1069		avruntime = avg_vruntime(cfs_rq);
  1070		raw_spin_rq_unlock_irqrestore(rq, flags);
  1071	
  1072		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "left_deadline",
  1073				SPLIT_NS(left_deadline));
  1074		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "left_vruntime",
  1075				SPLIT_NS(left_vruntime));
  1076		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "zero_vruntime",
  1077				SPLIT_NS(zero_vruntime));
  1078		SEQ_printf(m, "  .%-30s: %Ld (%d bits)\n", "sum_w_vruntime",
  1079			   sum_w_vruntime, ilog2(abs(sum_w_vruntime)));
  1080		SEQ_printf(m, "  .%-30s: %Lu\n", "sum_weight",
  1081			   sum_weight);
  1082		SEQ_printf(m, "  .%-30s: %u\n", "sum_shift", sum_shift);
  1083		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "avg_vruntime",
  1084				SPLIT_NS(avruntime));
  1085		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "right_vruntime",
  1086				SPLIT_NS(right_vruntime));
  1087		spread = right_vruntime - left_vruntime;
  1088		SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "spread", SPLIT_NS(spread));
  1089		SEQ_printf(m, "  .%-30s: %d\n", "nr_queued", cfs_rq->nr_queued);
  1090		SEQ_printf(m, "  .%-30s: %d\n", "h_nr_runnable", cfs_rq->h_nr_runnable);
  1091		SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
  1092		SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
> 1093		SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
  1094		SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
  1095		SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
  1096				cfs_rq->avg.load_avg);
  1097		SEQ_printf(m, "  .%-30s: %lu\n", "runnable_avg",
  1098				cfs_rq->avg.runnable_avg);
  1099		SEQ_printf(m, "  .%-30s: %lu\n", "util_avg",
  1100				cfs_rq->avg.util_avg);
  1101		SEQ_printf(m, "  .%-30s: %u\n", "util_est",
  1102				cfs_rq->avg.util_est);
  1103		SEQ_printf(m, "  .%-30s: %ld\n", "removed.load_avg",
  1104				cfs_rq->removed.load_avg);
  1105		SEQ_printf(m, "  .%-30s: %ld\n", "removed.util_avg",
  1106				cfs_rq->removed.util_avg);
  1107		SEQ_printf(m, "  .%-30s: %ld\n", "removed.runnable_avg",
  1108				cfs_rq->removed.runnable_avg);
  1109	#ifdef CONFIG_FAIR_GROUP_SCHED
  1110		SEQ_printf(m, "  .%-30s: %lu\n", "tg_load_avg_contrib",
  1111				cfs_rq->tg_load_avg_contrib);
  1112		SEQ_printf(m, "  .%-30s: %ld\n", "tg_load_avg",
  1113				atomic_long_read(&cfs_rq->tg->load_avg));
  1114		SEQ_printf(m, "  .%-30s: %lu\n", "h_load",
  1115				cfs_rq->h_load);
  1116	#endif /* CONFIG_FAIR_GROUP_SCHED */
  1117	#ifdef CONFIG_CFS_BANDWIDTH
  1118		SEQ_printf(m, "  .%-30s: %d\n", "throttled",
  1119				cfs_rq->throttled);
  1120		SEQ_printf(m, "  .%-30s: %d\n", "throttle_count",
  1121				cfs_rq->throttle_count);
  1122	#endif
  1123	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
