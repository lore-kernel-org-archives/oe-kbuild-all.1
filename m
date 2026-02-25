Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF730B52A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772052128; cv=none; b=pg3cXsA3tmV4SbRcxRaOu1ia/B9a7WBaNMYwVswwSMeBxFgqRfRoX2WiPgCByLMsNZNdlPG/6bnF/MHWI3qEBOkiuZg4fFufUBoZv2cg+l1RRXyPOI6xeoX052GDC9QGNzenzjFJndybXkaJ3d+HFtf8jCbCwJL700qW8N7whP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772052128; c=relaxed/simple;
	bh=QSB/DNx6szoOnQpMWicnXlJfuT+MT6vWMah/5nIWQJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KuQzFRI6Qilq/bIM4ajWVTLQSBYZcJk5HFuEoFcX72t3gSZuOU13EtNrOg15KSuG4FpjopaARY2p+LzieWQmTIRVsSx7eWdy2CQng3EMxLjiSYjndZPzE7HmQWKnN9bAye3FLMVbTmcpRflIHbC3bYdJpga/YYOvqMt7lCvs5Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7QQ2obk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7QQ2obk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772052127; x=1803588127;
  h=date:from:to:cc:subject:message-id;
  bh=QSB/DNx6szoOnQpMWicnXlJfuT+MT6vWMah/5nIWQJ8=;
  b=l7QQ2obkrSKup9ba4DJhGPpdhoPegYd9Wlkgtfel7DtiIWTaUhXQUN3Q
   SvI5lhV8poIt08YwQhTfI7/q3G4NoFPlBdrbsMC+Ho9YsjcSUtltwZh7e
   E9TghEGqKxTdXgTYKu07BkJuMxxXbUOpQ3R4D0/Y1Tx7+PQdTN3jxO0be
   Ct9CyA/nsASLGooFcNQd7lkuJs9PVUp5ZYZmbhb234b6lEotShSNe2bvy
   VjD0gu68yJ1H/lQZD/nxLjfzqp9Qs77BOhZSoN/aw/LFF4VUhK27Xk5yg
   VySbZC0VeYQWuuz7EebI22cst+B/bBifqWxezZP6IxykoroQME9dCVOX8
   w==;
X-CSE-ConnectionGUID: v2KSZNUiQf+B6DMrcV77YQ==
X-CSE-MsgGUID: tG45FampQhK5LNh4Z9baWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73209745"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73209745"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 12:42:07 -0800
X-CSE-ConnectionGUID: D5z+RBCeTjC+9If7fG8u/A==
X-CSE-MsgGUID: BwGzrH6sSdmE0Yuv1TrY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="244047473"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Feb 2026 12:42:05 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvLhT-000000007Hr-34pZ;
	Wed, 25 Feb 2026 20:41:43 +0000
Date: Thu, 26 Feb 2026 04:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:sched/preempt-dynamic-optimizations 1/1]
 kernel/sched/core.c:7415:13: warning: no previous prototype for
 '__cond_resched'
Message-ID: <202602260402.BhxYtJ17-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git sched/preempt-dynamic-optimizations
head:   b07713067f078a16fdbf289db10c6f72a7a75aa0
commit: b07713067f078a16fdbf289db10c6f72a7a75aa0 [1/1] HACK: sched: Disable {cond,might}_resched() when ARCH_HAS_PREEMPT_LAZY=y
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260226/202602260402.BhxYtJ17-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260402.BhxYtJ17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260402.BhxYtJ17-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:7415:13: warning: no previous prototype for '__cond_resched' [-Wmissing-prototypes]
    7415 | int __sched __cond_resched(void)
         |             ^~~~~~~~~~~~~~


vim +/__cond_resched +7415 kernel/sched/core.c

d50dde5a10f3052 kernel/sched/core.c Dario Faggioli  2013-11-07  7413  
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7414  #if !defined(CONFIG_PREEMPTION) || defined(CONFIG_PREEMPT_DYNAMIC)
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07 @7415  int __sched __cond_resched(void)
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  7416  {
82c387ef7568c0d kernel/sched/core.c Thomas Gleixner 2024-12-16  7417  	if (should_resched(0) && !irqs_disabled()) {
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7418  		preempt_schedule_common();
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7419  		return 1;
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  7420  	}
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  7421  	/*
2c00e1199c06088 kernel/sched/core.c Ankur Arora     2024-12-12  7422  	 * In PREEMPT_RCU kernels, ->rcu_read_lock_nesting tells the tick
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7423  	 * whether the current CPU is in an RCU read-side critical section,
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7424  	 * so the tick can report quiescent states even for CPUs looping
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7425  	 * in kernel context.  In contrast, in non-preemptible kernels,
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7426  	 * RCU readers leave no in-memory hints, which means that CPU-bound
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7427  	 * processes executing in kernel context might never report an
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7428  	 * RCU quiescent state.  Therefore, the following code causes
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7429  	 * cond_resched() to report a quiescent state, but only when RCU
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7430  	 * is in urgent need of one.
2c00e1199c06088 kernel/sched/core.c Ankur Arora     2024-12-12  7431  	 * A third case, preemptible, but non-PREEMPT_RCU provides for
2c00e1199c06088 kernel/sched/core.c Ankur Arora     2024-12-12  7432  	 * urgently needed quiescent states via rcu_flavor_sched_clock_irq().
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  7433  	 */
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7434  #ifndef CONFIG_PREEMPT_RCU
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7435  	rcu_all_qs();
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7436  #endif
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7437  	return 0;
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  7438  }
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7439  EXPORT_SYMBOL(__cond_resched);
04746ed80bcf313 kernel/sched/core.c Ingo Molnar     2024-04-07  7440  #endif
^1da177e4c3f415 kernel/sched.c      Linus Torvalds  2005-04-16  7441  

:::::: The code at line 7415 was first introduced by commit
:::::: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
