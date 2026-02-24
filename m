Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A089739B4AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 13:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938894; cv=none; b=N66lSjOai/1s4FSgj+cyWM9WtXUY/NzIxrlLMBFXatAeEZBLQyZQdslzuTsiv3lldn1Jf3WeWje/paVKVuinSgUUD3QSb1/sfIkuPCDhIgHXFxQdyaq6Hy7fWv/TKl9okrSEeDUAmYVwr4GZ1ERMzO3PuvI1OsXLYNKjeAud6PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938894; c=relaxed/simple;
	bh=YTIBxbmWKqt+f/c8SNteJQqEq2UjJeXrlDY0UXgfZVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/jtydvklw+ZxxQtoNPZHIpze0BWsjNPhwk4Owj5sO2p9fTjpj4WSszFchyQmz5z8fL/wQNEpDRkr5Ke4Bzjn3otYH9Z4Av8qOPXQ2rmOAc2Bh5uF/rbiSzjsUmEb9iv6IWlNpLmBd63B1HDBszHVGH6vN2l08yNG/UR5E4Xj+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuDoMWMV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuDoMWMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771938893; x=1803474893;
  h=date:from:to:cc:subject:message-id;
  bh=YTIBxbmWKqt+f/c8SNteJQqEq2UjJeXrlDY0UXgfZVA=;
  b=AuDoMWMVl7/A0Bbwnr8SZ6/B5FU6dry5vT3ZvlYQqeqqiKxTHuahM3cY
   qltTEMRr0Oh5PHh9TBbUuwR1ypCbzbZNCDNkJrAv+95K982RNFoq1x7Mi
   EIPTrDYhFcEf7EbiSR5Zl+/PyMuJ4ffgT/OTa77bqneQiUlMpsrQyBMaY
   Lng2+AbJEzQ72C4btOrw82hadijIUMeU4tmOkx1mRxBS91OV5dJc62Wyk
   u0BYuFEtCq5EmNeKD5KucBnzOQ42ycl38xUyJb4nJ8/rY+It1+yfkDyql
   gtHigU6kBRj/8iMdQl0X5MW8PcrcDNEIkkYbKUd5JFC+ib4rD6AsHfcVP
   w==;
X-CSE-ConnectionGUID: PzGAfRv9S6i4a0bkKUICow==
X-CSE-MsgGUID: LrL7DyTpQwaweCYPj4n3nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90363437"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="90363437"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 05:14:52 -0800
X-CSE-ConnectionGUID: vSTpz9GlSzG8vNLQUUwh+g==
X-CSE-MsgGUID: O/oylXK5TBqbG2s9g7prJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="216066599"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2026 05:14:50 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vusFT-000000001yx-4AI7;
	Tue, 24 Feb 2026 13:14:47 +0000
Date: Tue, 24 Feb 2026 21:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:sched/hrtick 35/48] kernel/entry/common.c:53:30:
 error: too many arguments to function 'rseq_grant_slice_extension'
Message-ID: <202602242106.dMfiUf6D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   27cd0d3a6b3db913813a2ead85957bf4dce21e04
commit: cfff40a7c0b95b3942ae221617bb5f4b09994f19 [35/48] entry: Prepare for deferred hrtimer rearming
config: x86_64-buildonly-randconfig-006-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242106.dMfiUf6D-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602242106.dMfiUf6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602242106.dMfiUf6D-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/entry/common.c: In function '__exit_to_user_mode_loop':
>> kernel/entry/common.c:53:30: error: too many arguments to function 'rseq_grant_slice_extension'
      53 |                         if (!rseq_grant_slice_extension(ti_work, TIF_SLICE_EXT_DENY))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/irq-entry-common.h:8,
                    from kernel/entry/common.c:3:
   include/linux/rseq_entry.h:791:20: note: declared here
     791 | static inline bool rseq_grant_slice_extension(bool work_pending) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rseq_grant_slice_extension +53 kernel/entry/common.c

    40	
    41	static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *regs,
    42								      unsigned long ti_work)
    43	{
    44		/*
    45		 * Before returning to user space ensure that all pending work
    46		 * items have been completed.
    47		 */
    48		while (ti_work & EXIT_TO_USER_MODE_WORK_LOOP) {
    49	
    50			local_irq_enable_exit_to_user(ti_work);
    51	
    52			if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
  > 53				if (!rseq_grant_slice_extension(ti_work, TIF_SLICE_EXT_DENY))
    54					schedule();
    55			}
    56	
    57			if (ti_work & _TIF_UPROBE)
    58				uprobe_notify_resume(regs);
    59	
    60			if (ti_work & _TIF_PATCH_PENDING)
    61				klp_update_patch_state(current);
    62	
    63			if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
    64				arch_do_signal_or_restart(regs);
    65	
    66			if (ti_work & _TIF_NOTIFY_RESUME)
    67				resume_user_mode_work(regs);
    68	
    69			/* Architecture specific TIF work */
    70			arch_exit_to_user_mode_work(regs, ti_work);
    71	
    72			/*
    73			 * Disable interrupts and reevaluate the work flags as they
    74			 * might have changed while interrupts and preemption was
    75			 * enabled above.
    76			 */
    77			local_irq_disable_exit_to_user();
    78	
    79			/* Check if any of the above work has queued a deferred wakeup */
    80			tick_nohz_user_enter_prepare();
    81	
    82			ti_work = read_thread_flags();
    83		}
    84	
    85		/* Return the latest work state for arch_exit_to_user_mode() */
    86		return ti_work;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
