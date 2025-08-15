Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0722741A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241152; cv=none; b=WvYXIMPsvz7namh0FQvHwghpIhWJB3EKsF3vttlJuE8kt8ft755NI1rJ/d8ESJvZFVMNjXhP0zzfvkef9xxatRWCM/P5wp7FLNmHJGpOWrvhIRtdm7rAVaUSBFAHTrDersNSOsWomzkW7oAN52krLGUJ85w8RRQDoC80qx2n7+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241152; c=relaxed/simple;
	bh=3a4c9BhOPhK50VCmCgCYbCq5389sgN6bu7UPqK0vrpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPcBkXHMfpGQWkZNBbhjpGeIjCqF6xvZaus8QQSlEFjuyus3UZ0Fbz0ndjQRaFwUhZXi6MGFKtjFViFJtNjj+FXyIzEgE3CfC2i/UuYJ0OsSDjYCZUBL9h8aqKDiDUrDyDMwp1wVuaoxTm83mNzbIFUXy51BfuvIDxd3wS59dyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNMjxFib; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNMjxFib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755241151; x=1786777151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3a4c9BhOPhK50VCmCgCYbCq5389sgN6bu7UPqK0vrpU=;
  b=SNMjxFibGGIrp6iXwJi7WwObVuzX2VQmMMEkBwbrdAhc2limqFkpXQJ2
   Mr2UwYjRy0Dx+sIksDm3J7Lp9M9xr070oHWUqLZ4CG1gzUFSkQ6ePDFav
   wBVD2YjEyu4rwi+1fK3D6e6Q8qXMEnv303OXuxIvsTufoQyFk8pWSzAGw
   IQfAo9bVRNLq0G2rJkts5qsSfC2AVFh3FTnVfjf4Cda5B1nTalo+SU1ul
   pyJPCVJNpCt8/gTEuykBDzq6nO+xkHBPI6AXEHuuqs6nO12+n4PSsNz/m
   CoEYEY2ExdFcBBSZSA0AVTSLhkvSALD3UhLrSA0RDZJjLPb8aPh9n5bTE
   w==;
X-CSE-ConnectionGUID: J60h80JZTuKpt+1fsjoXag==
X-CSE-MsgGUID: n4EDWT82TgukWaaL5YTYkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68939669"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68939669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:59:10 -0700
X-CSE-ConnectionGUID: jRL8e4TzTmGo0MrTo5199w==
X-CSE-MsgGUID: rQ11MwnWS8qEYR2106re6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172287396"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2025 23:59:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umoP4-000BfQ-1N;
	Fri, 15 Aug 2025 06:59:06 +0000
Date: Fri, 15 Aug 2025 14:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/1]
 kernel/sched/core.c:3530:15: error: implicit declaration of function
 'stop_two_cpus'; did you mean 'stop_one_cpu'?
Message-ID: <202508151443.B6WG9lpH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   86ec48ee0c114e178781440c986964038c06d932
commit: 658dc70320d9c61652fc8b1bc761085e0641386c [0/1] ANDROID: sched: Re-apply patch to export a few scheduler symbols for vendor modules
config: i386-buildonly-randconfig-006-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151443.B6WG9lpH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151443.B6WG9lpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151443.B6WG9lpH-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:2597:12: warning: no previous prototype for '__migrate_task' [-Wmissing-prototypes]
    2597 | struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
         |            ^~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'migrate_swap':
>> kernel/sched/core.c:3530:15: error: implicit declaration of function 'stop_two_cpus'; did you mean 'stop_one_cpu'? [-Werror=implicit-function-declaration]
    3530 |         ret = stop_two_cpus(arg.dst_cpu, arg.src_cpu, migrate_swap_stop, &arg);
         |               ^~~~~~~~~~~~~
         |               stop_one_cpu
   cc1: some warnings being treated as errors


vim +3530 kernel/sched/core.c

ac66f5477239ebd Peter Zijlstra            2013-10-07  3496  
ac66f5477239ebd Peter Zijlstra            2013-10-07  3497  /*
ac66f5477239ebd Peter Zijlstra            2013-10-07  3498   * Cross migrate two tasks
ac66f5477239ebd Peter Zijlstra            2013-10-07  3499   */
0ad4e3dfe6cf3f2 Srikar Dronamraju         2018-06-20  3500  int migrate_swap(struct task_struct *cur, struct task_struct *p,
0ad4e3dfe6cf3f2 Srikar Dronamraju         2018-06-20  3501  		int target_cpu, int curr_cpu)
ac66f5477239ebd Peter Zijlstra            2013-10-07  3502  {
ac66f5477239ebd Peter Zijlstra            2013-10-07  3503  	struct migration_swap_arg arg;
ac66f5477239ebd Peter Zijlstra            2013-10-07  3504  	int ret = -EINVAL;
ac66f5477239ebd Peter Zijlstra            2013-10-07  3505  
ac66f5477239ebd Peter Zijlstra            2013-10-07  3506  	arg = (struct migration_swap_arg){
ac66f5477239ebd Peter Zijlstra            2013-10-07  3507  		.src_task = cur,
0ad4e3dfe6cf3f2 Srikar Dronamraju         2018-06-20  3508  		.src_cpu = curr_cpu,
ac66f5477239ebd Peter Zijlstra            2013-10-07  3509  		.dst_task = p,
0ad4e3dfe6cf3f2 Srikar Dronamraju         2018-06-20  3510  		.dst_cpu = target_cpu,
ac66f5477239ebd Peter Zijlstra            2013-10-07  3511  	};
ac66f5477239ebd Peter Zijlstra            2013-10-07  3512  
ac66f5477239ebd Peter Zijlstra            2013-10-07  3513  	if (arg.src_cpu == arg.dst_cpu)
ac66f5477239ebd Peter Zijlstra            2013-10-07  3514  		goto out;
ac66f5477239ebd Peter Zijlstra            2013-10-07  3515  
6acce3ef8452053 Peter Zijlstra            2013-10-11  3516  	/*
6acce3ef8452053 Peter Zijlstra            2013-10-11  3517  	 * These three tests are all lockless; this is OK since all of them
6acce3ef8452053 Peter Zijlstra            2013-10-11  3518  	 * will be re-checked with proper locks held further down the line.
6acce3ef8452053 Peter Zijlstra            2013-10-11  3519  	 */
ac66f5477239ebd Peter Zijlstra            2013-10-07  3520  	if (!cpu_active(arg.src_cpu) || !cpu_active(arg.dst_cpu))
ac66f5477239ebd Peter Zijlstra            2013-10-07  3521  		goto out;
ac66f5477239ebd Peter Zijlstra            2013-10-07  3522  
3bd3706251ee8ab Sebastian Andrzej Siewior 2019-04-23  3523  	if (!cpumask_test_cpu(arg.dst_cpu, arg.src_task->cpus_ptr))
ac66f5477239ebd Peter Zijlstra            2013-10-07  3524  		goto out;
ac66f5477239ebd Peter Zijlstra            2013-10-07  3525  
3bd3706251ee8ab Sebastian Andrzej Siewior 2019-04-23  3526  	if (!cpumask_test_cpu(arg.src_cpu, arg.dst_task->cpus_ptr))
ac66f5477239ebd Peter Zijlstra            2013-10-07  3527  		goto out;
ac66f5477239ebd Peter Zijlstra            2013-10-07  3528  
286549dcaf4f128 Mel Gorman                2014-01-21  3529  	trace_sched_swap_numa(cur, arg.src_cpu, p, arg.dst_cpu);
ac66f5477239ebd Peter Zijlstra            2013-10-07 @3530  	ret = stop_two_cpus(arg.dst_cpu, arg.src_cpu, migrate_swap_stop, &arg);
ac66f5477239ebd Peter Zijlstra            2013-10-07  3531  
ac66f5477239ebd Peter Zijlstra            2013-10-07  3532  out:
ac66f5477239ebd Peter Zijlstra            2013-10-07  3533  	return ret;
ac66f5477239ebd Peter Zijlstra            2013-10-07  3534  }
658dc70320d9c61 Sai Harshini Nimmala      2025-08-12  3535  EXPORT_SYMBOL_GPL(migrate_swap);
ac66f5477239ebd Peter Zijlstra            2013-10-07  3536  

:::::: The code at line 3530 was first introduced by commit
:::::: ac66f5477239ebd3c4e2cbf2f591ef387aa09884 sched/numa: Introduce migrate_swap()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
