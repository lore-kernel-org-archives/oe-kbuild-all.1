Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED78494
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731547855; cv=none; b=G7cy4lmLdbaizzrFOw4A3n4Rm6nH7QkKPbQjGHrNrPEN9JSKMV213SCRf17DQqCeeoqxnIQWfpyrhv9PTXFDItZg2SKCZ618jCEbMUd0iJRlSlNWib/Ny4T9SjynwXqik0ijXv0mkd62bwqAatZmNVvWQdKV8Wek0ui34o27fko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731547855; c=relaxed/simple;
	bh=xLPwM2VwFjQPpX6Lr3705TcB18M6NLh9JqM90xO682A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7tjgirJSkGkYbd/EjH0XgOKegSV8LrQ5WRuSZ4dqQX3Wo1jQxuSfBCm0CT4hgwfemHIZcNo5xLbDawvCj8r6vsBcGqZJy7K7FAIfO8Gh3SjIIuAAOKMnJH0NeOjLFcbxG8A9nbNkSbSvrKQuEgY9plNhNVCfxdb4jcJj2mVpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOpL1ybX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOpL1ybX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731547854; x=1763083854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xLPwM2VwFjQPpX6Lr3705TcB18M6NLh9JqM90xO682A=;
  b=KOpL1ybXlOJLOTLy4MByZhpspRPwHIi4jzmQykQHXmW6J1Z4hfAxr009
   y1+QbKgK3OSgCSamwDDjl7Gt8nZhlevmLP//jnDtp2Ec7hFOtuhsOJpoa
   SqXUDCbzG4N7irgkAA5pSw1RQQEdLqf0Gh7RZstPvGWeQDBTBiZ63qBNG
   AfSW4+zVKSqA/5EaBZoa63oPR8Pbumh28FOqpcAAnBoJN2yIjEgJkgVbX
   PAJGfQwyRvxwNBfVubmRXZqW4WdzNpd/G9qA6YYWjBWHa33tROzDY6vHE
   1E28bFtbXspicn+xjYS2OyqBW5pN6cyCQWoWyVKNbDzecHaPpdztd7b1o
   A==;
X-CSE-ConnectionGUID: zabBgPcpRfqTeCY7o1FNuA==
X-CSE-MsgGUID: lfJSx6MaQ765NritHe7YSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42884793"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="42884793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 17:30:54 -0800
X-CSE-ConnectionGUID: o17ihUaOTNSbgne0v8xS4w==
X-CSE-MsgGUID: oZgA0HcPSpuXchVH7rAeEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88437431"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2024 17:30:53 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBOh8-00012f-0I;
	Thu, 14 Nov 2024 01:30:50 +0000
Date: Thu, 14 Nov 2024 09:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] Scheduler time extention
Message-ID: <202411140916.EaVa0bnv-lkp@intel.com>
References: <20241113000126.967713-3-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113000126.967713-3-prakash.sangappa@oracle.com>

Hi Prakash,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.12-rc7]
[cannot apply to tip/sched/core tip/x86/asm tip/core/entry next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prakash-Sangappa/Introduce-per-thread-user-kernel-shared-structure/20241113-082854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241113000126.967713-3-prakash.sangappa%40oracle.com
patch subject: [RFC PATCH 2/4] Scheduler time extention
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241114/202411140916.EaVa0bnv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140916.EaVa0bnv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140916.EaVa0bnv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/entry/common.c:93: warning: Function parameter or struct member 'irq' not described in 'exit_to_user_mode_loop'


vim +93 kernel/entry/common.c

a9f3a74a29af09 Thomas Gleixner     2020-07-22   84  
d68019471995ba Sven Schnelle       2023-12-18   85  /**
d68019471995ba Sven Schnelle       2023-12-18   86   * exit_to_user_mode_loop - do any pending work before leaving to user space
d68019471995ba Sven Schnelle       2023-12-18   87   * @regs:	Pointer to pt_regs on entry stack
d68019471995ba Sven Schnelle       2023-12-18   88   * @ti_work:	TIF work flags as read by the caller
d68019471995ba Sven Schnelle       2023-12-18   89   */
d68019471995ba Sven Schnelle       2023-12-18   90  __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
4d4270d40543ca Prakash Sangappa    2024-11-13   91  						     unsigned long ti_work,
4d4270d40543ca Prakash Sangappa    2024-11-13   92  						     bool irq)
a9f3a74a29af09 Thomas Gleixner     2020-07-22  @93  {
a9f3a74a29af09 Thomas Gleixner     2020-07-22   94  	/*
a9f3a74a29af09 Thomas Gleixner     2020-07-22   95  	 * Before returning to user space ensure that all pending work
a9f3a74a29af09 Thomas Gleixner     2020-07-22   96  	 * items have been completed.
a9f3a74a29af09 Thomas Gleixner     2020-07-22   97  	 */
a9f3a74a29af09 Thomas Gleixner     2020-07-22   98  	while (ti_work & EXIT_TO_USER_MODE_WORK) {
a9f3a74a29af09 Thomas Gleixner     2020-07-22   99  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  100  		local_irq_enable_exit_to_user(ti_work);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  101  
4d4270d40543ca Prakash Sangappa    2024-11-13  102  		if (ti_work & _TIF_NEED_RESCHED) {
4d4270d40543ca Prakash Sangappa    2024-11-13  103  			if (irq && taskshrd_delay_resched())
4d4270d40543ca Prakash Sangappa    2024-11-13  104  				clear_tsk_need_resched(current);
4d4270d40543ca Prakash Sangappa    2024-11-13  105  			else
a9f3a74a29af09 Thomas Gleixner     2020-07-22  106  				schedule();
4d4270d40543ca Prakash Sangappa    2024-11-13  107  		}
a9f3a74a29af09 Thomas Gleixner     2020-07-22  108  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  109  		if (ti_work & _TIF_UPROBE)
a9f3a74a29af09 Thomas Gleixner     2020-07-22  110  			uprobe_notify_resume(regs);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  111  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  112  		if (ti_work & _TIF_PATCH_PENDING)
a9f3a74a29af09 Thomas Gleixner     2020-07-22  113  			klp_update_patch_state(current);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  114  
12db8b690010cc Jens Axboe          2020-10-26  115  		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
8ba62d37949e24 Eric W. Biederman   2022-02-09  116  			arch_do_signal_or_restart(regs);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  117  
a68de80f61f6af Sean Christopherson 2021-09-01  118  		if (ti_work & _TIF_NOTIFY_RESUME)
03248addadf1a5 Eric W. Biederman   2022-02-09  119  			resume_user_mode_work(regs);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  120  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  121  		/* Architecture specific TIF work */
a9f3a74a29af09 Thomas Gleixner     2020-07-22  122  		arch_exit_to_user_mode_work(regs, ti_work);
a9f3a74a29af09 Thomas Gleixner     2020-07-22  123  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  124  		/*
a9f3a74a29af09 Thomas Gleixner     2020-07-22  125  		 * Disable interrupts and reevaluate the work flags as they
a9f3a74a29af09 Thomas Gleixner     2020-07-22  126  		 * might have changed while interrupts and preemption was
a9f3a74a29af09 Thomas Gleixner     2020-07-22  127  		 * enabled above.
a9f3a74a29af09 Thomas Gleixner     2020-07-22  128  		 */
a9f3a74a29af09 Thomas Gleixner     2020-07-22  129  		local_irq_disable_exit_to_user();
47b8ff194c1fd7 Frederic Weisbecker 2021-02-01  130  
47b8ff194c1fd7 Frederic Weisbecker 2021-02-01  131  		/* Check if any of the above work has queued a deferred wakeup */
f268c3737ecaef Frederic Weisbecker 2021-05-27  132  		tick_nohz_user_enter_prepare();
47b8ff194c1fd7 Frederic Weisbecker 2021-02-01  133  
6ce895128b3bff Mark Rutland        2021-11-29  134  		ti_work = read_thread_flags();
a9f3a74a29af09 Thomas Gleixner     2020-07-22  135  	}
a9f3a74a29af09 Thomas Gleixner     2020-07-22  136  
a9f3a74a29af09 Thomas Gleixner     2020-07-22  137  	/* Return the latest work state for arch_exit_to_user_mode() */
a9f3a74a29af09 Thomas Gleixner     2020-07-22  138  	return ti_work;
a9f3a74a29af09 Thomas Gleixner     2020-07-22  139  }
a9f3a74a29af09 Thomas Gleixner     2020-07-22  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
