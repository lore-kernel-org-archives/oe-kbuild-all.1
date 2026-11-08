Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165057;
	b=2Vbr+2FNYoKBgxJGx/PNoM0K+Mn1pIzOgEZiPL8hqkM8W3Vig7h5QCiuoFNyYJpyp67X
	 bcQJEmD0T+gcbX2HY9rhXrIzksrSQKuDgAdVsjQE12IxjeeWAwevX9or1jeVbtRokwtGi
	 ycdCSV2Ocj6fnhn2n8DPsFr8JHIrNVRMm0FWTxkoh1o9kbf/jMGHmc9gfBqM4oO3NqAco
	 gngGYiRTBQWv7KoKUp6PXu+uHFp4UBflhWMyJwCmuDLrU30TiLRy9QA2cuV6sQfPaWY04
	 jlOE/udzSOviXW40V+N46B2jkyVn6kSECHGahLO/ymNiv3T2Z21CVXLHbOfygBRXswg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165057;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4GBoNVPXyZe6nal8JUnuQV0e6blcwPwx3pWMc0oI+Xk=;
	b=TPWrpGeATnooSKGfZ8lvCWNA12xMuApx4wnYhldVhVehzn14XP0H84Wwk10wKB9cmg+a
	 VwwqVKqrsqCTxLaQgpO7W8alMMleM9O2KlSkBHXfDoaGXOYWNVwTHguHYrVDX2NdgjUVX
	 9iJs2wo+oep2o5TgZlqilZDYHX2i20wCxNhStDMZ79rLd+11pl6T/5wutdq8UAtM5fpl6
	 iTtrf3zLIlFvlzZG8OerHbtiCclx2+jH8bEvfZVc+0I2qPTcfoeBgMACICjnVijsMInB4
	 OsnYORTAFZ7cwkVutqL5if6fX6oCef6ukDGyDSDCFfDMkHe4fDZHYS0Bygl5OS6/8yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qp5wSjMu;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5514E606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 19:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5514E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qp5wSjMu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794165056; x=1825701056;
  h=date:from:to:cc:subject:message-id;
  bh=lhU9tjpg1v1Vv5PaPFoohy8UDUQI6yAKJSryF2LZwLk=;
  b=Qp5wSjMuF7V/C7N/vqU8h+0dAsPT6defQLrooe7kj/2QLcnY2Qh4T8wc
   qOQglR9nyoSCC8u6ggFsNFVRypUHhgztxiYzV68n6cLPXXGKTazzIbB9L
   bW6fEO9w48RY84WwxtduNRHjdpGU1/5Z1FWvt27kGawu7cNccPuNC+2Oh
   RbCXrvTZS/YjkjgGF57yZ23McOPQrUJiq98VUDD8lbswBBtr+30mp60hy
   Ml+l35QqnIqgfoIDE0HLOJWTN/toRL4vglPEeEpKedPqPTsYPqyY0h67I
   cejvf4nxNXFbTlwmMzIZhSwU/3pRpY0GVYVtGObpIC6hFxPgkftEu6iCU
   Q==;
X-CSE-ConnectionGUID: I/CXNdMvQO6rlkfwhYChhQ==
X-CSE-MsgGUID: zErNV8XsSqaSltr7O8QBMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2779824"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2779824"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 11:10:55 -0800
X-CSE-ConnectionGUID: 6rGE6yHgQOaispYCQ85aqQ==
X-CSE-MsgGUID: 7RUqakjGRHqILmZzcF9jcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7578756"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2026 11:10:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ8Hz-00000000BfT-0Maa;
	Sun, 08 Nov 2026 19:10:51 +0000
Date: Sun, 08 Nov 2026 20:10:41 +0100
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 94/98]
 drivers/perf/riscv_ctr.c:435:18: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202611082009.K7RVG572-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v1
head:   929bf13433e242a3f255f463b2fb44633e102e0d
commit: b4cc5b9ca0cada8221e31b647640bbae515000a1 [94/98] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-randconfig-r2304-20261108 (https://download.01.org/0day-ci/archive/20261108/202611082009.K7RVG572-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611082009.K7RVG572-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611082009.K7RVG572-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/riscv_ctr.c:435:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *task_ctx @@     got struct perf_ctx_data [noderef] __rcu * @@
   drivers/perf/riscv_ctr.c:435:18: sparse:     expected void *task_ctx
   drivers/perf/riscv_ctr.c:435:18: sparse:     got struct perf_ctx_data [noderef] __rcu *
>> drivers/perf/riscv_ctr.c:462:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ctx @@     got struct perf_ctx_data [noderef] __rcu *perf_ctx_data @@
   drivers/perf/riscv_ctr.c:462:46: sparse:     expected void *ctx
   drivers/perf/riscv_ctr.c:462:46: sparse:     got struct perf_ctx_data [noderef] __rcu *perf_ctx_data
   drivers/perf/riscv_ctr.c:477:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ctx @@     got struct perf_ctx_data [noderef] __rcu *perf_ctx_data @@
   drivers/perf/riscv_ctr.c:477:46: sparse:     expected void *ctx
   drivers/perf/riscv_ctr.c:477:46: sparse:     got struct perf_ctx_data [noderef] __rcu *perf_ctx_data

vim +435 drivers/perf/riscv_ctr.c

   416	
   417	/*
   418	 * On context switch in, we need to make sure no samples from previous tasks
   419	 * are left in the CTR.
   420	 *
   421	 * On ctxswin, sched_in = true, called after the PMU has started
   422	 * On ctxswout, sched_in = false, called before the PMU is stopped
   423	 */
   424	void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx, struct task_struct *task,
   425				      bool sched_in)
   426	{
   427		struct riscv_pmu *rvpmu = to_riscv_pmu(pmu_ctx->pmu);
   428		struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
   429		void *task_ctx;
   430	
   431		if (!cpuc->ctr_users)
   432			return;
   433	
   434		/* Save branch records in task_ctx on sched out */
 > 435		task_ctx = pmu_ctx ? task->perf_ctx_data : NULL;
   436		if (task_ctx) {
   437			if (sched_in)
   438				riscv_pmu_ctr_restore(task_ctx);
   439			else
   440				riscv_pmu_ctr_save(task_ctx, rvpmu->ctr_depth);
   441			return;
   442		}
   443	
   444		/* Reset branch records on sched in */
   445		if (sched_in)
   446			riscv_pmu_ctr_reset();
   447	}
   448	
   449	static inline bool branch_user_callstack(unsigned int br_type)
   450	{
   451		return (br_type & PERF_SAMPLE_BRANCH_USER) &&
   452			(br_type & PERF_SAMPLE_BRANCH_CALL_STACK);
   453	}
   454	
   455	void riscv_pmu_ctr_add(struct perf_event *event)
   456	{
   457		struct riscv_pmu *rvpmu = to_riscv_pmu(event->pmu);
   458		struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
   459	
   460		if (branch_user_callstack(event->attr.branch_sample_type) &&
   461		    event->ctx->task->perf_ctx_data)
 > 462			task_context(event->ctx->task->perf_ctx_data)->callstack_users++;
   463	
   464		perf_sched_cb_inc(event->pmu);
   465	
   466		if (!cpuc->ctr_users++)
   467			riscv_pmu_ctr_reset();
   468	}
   469	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
