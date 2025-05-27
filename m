Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3D1E1DE2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383239; cv=none; b=fGBi6gNvPSl2HwrRK5BM5XxachXhyphFO9y7U6NUWwzWm6vfJBFja04AKTJGmJeMOxc5BCKeoRYkRMWiTUlqRU0VbCAQr5iU/Je6S2QhVqENLitpxbWSVW7DfRurGkpasElv404N9kkvDfnysghcETcVHlf1qI8zG1APBtUtI5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383239; c=relaxed/simple;
	bh=cG4ZcvcUqfASCm3MjXSGN45hxzsmlzSpCXV6S+TJ7iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CwCdUUUaJAtsiZvY0xbcV9b8+gUNYxhF5LXKylPPmO8SMUxzniQNYbu/pZk7zJICMxjL+a+imyE3It2SCA6pDmwtFcW7nQE/Bawd4Uo+Qce8OTAexpPrrhw31+vBI3VyxZCNYag9mdAlbGrzXF6TDYfj4DqMG2hj2ECzEiuHFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUKaCheX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUKaCheX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748383238; x=1779919238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cG4ZcvcUqfASCm3MjXSGN45hxzsmlzSpCXV6S+TJ7iw=;
  b=RUKaCheXZPRcUjkQvIAiFyTx40ZagJ1mmzgdsSk0Ulx2qisWxD1H0bAB
   JBKSCevs7VCajZ6ikLNCAyv+aPvlu0Pbb53D3CMBh6Q/k/VdQpVxQGrTn
   oCtETHr5QeFqfWD6S+yp33Wgh4YmqU6vA2gpc01uaT8Qqg5V3RLRFwzzt
   nJkg02NfmzzSC41feQvRa19nAGX4H8yG+FWdNSuOMnSAQPxnQBopm5f4k
   DvXcV5MVPQ0pcE5gjbcz+0+gUCfYgH6hoTqFvvM7rhoeJIz6Vwk3W3PEG
   CnOZhPBnGU8EwjFg1RxtGoKvONPDDkNkyKFpTVQocbwiU4n1yQCAhWSwk
   g==;
X-CSE-ConnectionGUID: pD6KyC+NRwyboRysKjKdPQ==
X-CSE-MsgGUID: 9qd5NXhXR4m9Y9+qEcJHIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61053328"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61053328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 15:00:37 -0700
X-CSE-ConnectionGUID: NaXXucrjQvu6NCXIM2bGiw==
X-CSE-MsgGUID: sMsAlhZiSiOrUXP/Zm0T5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143338347"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2025 15:00:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK2LZ-000V2U-2M;
	Tue, 27 May 2025 22:00:33 +0000
Date: Wed, 28 May 2025 05:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.sched/core 20/43] kernel/sched/core.c:3866:undefined
 reference to `__smp_call_single_queue'
Message-ID: <202505280555.fVSODtNV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/core
head:   731a8585a149733b0b5d8d2d80385810e2cc7791
commit: 9575f83b90508bfb5a891d2997589bddb0202dcd [20/43] sched/smp: Make SMP unconditional
config: csky-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280555.fVSODtNV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280555.fVSODtNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280555.fVSODtNV-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/sched/core.o: in function `__ttwu_queue_wakelist':
>> kernel/sched/core.c:3866:(.text+0x6d76): undefined reference to `__smp_call_single_queue'
   csky-linux-ld: kernel/sched/core.o: in function `ttwu_queue':
   kernel/sched/core.c:3973:(.text+0x6dbc): undefined reference to `__smp_call_single_queue'


vim +3866 kernel/sched/core.c

ca38062e57e977 kernel/sched.c      Suresh Siddha  2011-10-03  3852  
ca38062e57e977 kernel/sched.c      Suresh Siddha  2011-10-03  3853  /*
2ebb1771755060 kernel/sched/core.c Mel Gorman     2020-05-24  3854   * Queue a task on the target CPUs wake_list and wake the CPU via IPI if
2ebb1771755060 kernel/sched/core.c Mel Gorman     2020-05-24  3855   * necessary. The wakee CPU on receipt of the IPI will queue the task
2ebb1771755060 kernel/sched/core.c Mel Gorman     2020-05-24  3856   * via sched_ttwu_wakeup() for activation so the wakee incurs the cost
2ebb1771755060 kernel/sched/core.c Mel Gorman     2020-05-24  3857   * of the wakeup instead of the waker.
ca38062e57e977 kernel/sched.c      Suresh Siddha  2011-10-03  3858   */
2ebb1771755060 kernel/sched/core.c Mel Gorman     2020-05-24  3859  static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3860  {
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3861  	struct rq *rq = cpu_rq(cpu);
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3862  
b7e7ade34e6188 kernel/sched/core.c Peter Zijlstra 2016-05-23  3863  	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
b7e7ade34e6188 kernel/sched/core.c Peter Zijlstra 2016-05-23  3864  
126c2092e5c8b2 kernel/sched/core.c Peter Zijlstra 2020-05-26  3865  	WRITE_ONCE(rq->ttwu_pending, 1);
8c4890d1c3358f kernel/sched/core.c Peter Zijlstra 2020-06-22 @3866  	__smp_call_single_queue(cpu, &p->wake_entry.llist);
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3867  }
d6aa8f85f16379 kernel/sched.c      Peter Zijlstra 2011-05-26  3868  

:::::: The code at line 3866 was first introduced by commit
:::::: 8c4890d1c3358fb8023d46e1e554c41d54f02878 smp, irq_work: Continue smp_call_function*() and irq_work*() integration

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
