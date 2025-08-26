Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC929D280
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756208921; cv=none; b=uJbipUJL4GYMVx0n/Rt99BauuvvFgZFwoWuXQZC9E3Rs9xqsJhPwLjGdKyBQusRL6Khy5CSboP2lzEAe3nWOXxQUxm8XONl+sLBS6mJGmen3hF5tRBRy4OaDYOR5/G9a5Rk8/Wn5y68w+hGfVqcrmPePjp10/LutHBmree+CQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756208921; c=relaxed/simple;
	bh=R2r590RUbpUa/FsIM/ZKvcN37sYWqRjvVPp5QGuKJGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lm6zqcb34Qn3K880ujG1sV3f7QDj9W8o0WCQioxs8/NvAYEnBvo3TI5BvVtSWGAVofcmaLI8kQ4S87Umh0dFCdP4lEtO3iY3y5V9O/jFlP3W+viNz/QyWgneeORAhpAFSZDbRK+HvKWijAy8pLHAW2yJsncZX6KfwtScXRQRAJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1mtCfsV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1mtCfsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756208920; x=1787744920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R2r590RUbpUa/FsIM/ZKvcN37sYWqRjvVPp5QGuKJGw=;
  b=P1mtCfsVG/YOpMZ7jMzvWunGpVaqBAvGwTkX9g9cPUuVFZZznF/S7AAF
   gS5zLOIFxHQyL+LEW7hdZcU4wsGHaxbKqMNRD1ptClnopqy57ZWWaHcGN
   Nxe305kNSUlCMaXy7EfugFzv8w+KMSH4fbw58wKd0VME1sfF6mqrZf9uS
   LVYFigX4sLZYRrpwk1DZtJdhJmLcV52isO/ik45G6O3Yir38BQnKcodSN
   qStCNk6fnnw0QwQlSW0YEa9wI4np2qsUJ4ujEqckFgF4X7c/Vq46w4YDb
   Nj68cpo9NDPUdwd1Nh6y+8K2iazeSB8UDMidJN6sH5Fv9PQeF1Lb7LxvO
   g==;
X-CSE-ConnectionGUID: v9O3r8XJTGe3y+yJ7H8NMg==
X-CSE-MsgGUID: HH13Cj0VTzePY/WsG5EA3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62271563"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62271563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 04:48:39 -0700
X-CSE-ConnectionGUID: oyL+7fikSF2xQRxOKdPdrA==
X-CSE-MsgGUID: /5VrnjgKT0qj3WC03yHWLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173728609"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Aug 2025 04:48:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqsAG-000P65-1A;
	Tue, 26 Aug 2025 11:48:36 +0000
Date: Tue, 26 Aug 2025 19:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 29/47]
 include/linux/rseq_entry.h:135:undefined reference to `__get_user_bad'
Message-ID: <202508261940.zu6vL9CX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   3aaf1200ebca49bc745506e411f36c54754e1754
commit: 49d6c4d0d5b7e26c6080bc7f1139cf8ba71da1b3 [29/47] rseq: Provide and use rseq_update_user_cs()
config: arm-moxart_defconfig (https://download.01.org/0day-ci/archive/20250826/202508261940.zu6vL9CX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508261940.zu6vL9CX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261940.zu6vL9CX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/rseq.o: in function `rseq_debug_update_user_cs':
>> include/linux/rseq_entry.h:135:(.text+0xcb8): undefined reference to `__get_user_bad'
>> arm-linux-gnueabi-ld: include/linux/rseq_entry.h:142:(.text+0xd04): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: include/linux/rseq_entry.h:152:(.text+0xd64): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: include/linux/rseq_entry.h:165:(.text+0xdcc): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: kernel/rseq.o: in function `rseq_update_user_cs':
   include/linux/rseq_entry.h:227:(.text+0xfd0): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: kernel/rseq.o:include/linux/rseq_entry.h:228: more undefined references to `__get_user_bad' follow


vim +135 include/linux/rseq_entry.h

    86	
    87	/*
    88	 * Check whether there is a valid critical section and whether the
    89	 * instruction pointer in @regs is inside the critical section.
    90	 *
    91	 *  - If the critical section is invalid, terminate the task.
    92	 *
    93	 *  - If valid and the instruction pointer is inside, set it to the abort IP
    94	 *
    95	 *  - If valid and the instruction pointer is outside, clear the critical
    96	 *    section address.
    97	 *
    98	 * Returns true, if the section was valid and either fixup or clear was
    99	 * done, false otherwise.
   100	 *
   101	 * In the failure case task::rseq_event::fatal is set when a invalid
   102	 * section was found. It's clear when the failure was an unresolved page
   103	 * fault.
   104	 *
   105	 * If inlined into the exit to user path with interrupts disabled, the
   106	 * caller has to protect against page faults with pagefault_disable().
   107	 *
   108	 * In preemptible task context this would be counterproductive as the page
   109	 * faults could not be fully resolved. As a consequence unresolved page
   110	 * faults in task context are fatal too.
   111	 */
   112	
   113	#ifdef RSEQ_BUILD_SLOW_PATH
   114	/*
   115	 * The debug version is put out of line, but kept here so the code stays
   116	 * together.
   117	 *
   118	 * @csaddr has already been checked by the caller to be in user space
   119	 */
   120	bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs, unsigned long csaddr)
   121	{
   122		struct rseq_cs __user *ucs = (struct rseq_cs __user *)(unsigned long)csaddr;
   123		u64 start_ip, abort_ip, offset, cs_end, head, tasksize = TASK_SIZE;
   124		unsigned long ip = instruction_pointer(regs);
   125		u64 __user *uc_head = (u64 __user *) ucs;
   126		u32 usig, __user *uc_sig;
   127	
   128		if (!user_rw_masked_begin(ucs))
   129			return false;
   130	
   131		/*
   132		 * Evaluate the user pile and exit if one of the conditions is not
   133		 * fulfilled.
   134		 */
 > 135		unsafe_get_user(start_ip, &ucs->start_ip, fail);
   136		if (unlikely(start_ip >= tasksize))
   137			goto die;
   138		/* If outside, just clear the critical section. */
   139		if (ip < start_ip)
   140			goto clear;
   141	
 > 142		unsafe_get_user(offset, &ucs->post_commit_offset, fail);
   143		cs_end = start_ip + offset;
   144		/* Check for overflow and wraparound */
   145		if (unlikely(cs_end >= tasksize || cs_end < start_ip))
   146			goto die;
   147	
   148		/* If not inside, clear it. */
   149		if (ip >= cs_end)
   150			goto clear;
   151	
   152		unsafe_get_user(abort_ip, &ucs->abort_ip, fail);
   153		/* Ensure it's "valid" */
   154		if (unlikely(abort_ip >= tasksize || abort_ip < sizeof(*uc_sig)))
   155			goto die;
   156		/* Validate that the abort IP is not in the critical section */
   157		if (unlikely(abort_ip - start_ip < offset))
   158			goto die;
   159	
   160		/*
   161		 * Check version and flags for 0. No point in emitting deprecated
   162		 * warnings before dying. That could be done in the slow path
   163		 * eventually, but *shrug*.
   164		 */
   165		unsafe_get_user(head, uc_head, fail);
   166		if (unlikely(head))
   167			goto die;
   168	
   169		/* abort_ip - 4 is >= 0. See abort_ip check above */
   170		uc_sig = (u32 __user *)(unsigned long)(abort_ip - sizeof(*uc_sig));
   171		unsafe_get_user(usig, uc_sig, fail);
   172		if (unlikely(usig != t->rseq_sig))
   173			goto die;
   174	
   175		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
   176		if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
   177			/* If not in interrupt from user context, let it die */
   178			if (unlikely(!t->rseq_event.user_irq))
   179				goto die;
   180		}
   181	
   182		unsafe_put_user(0ULL, &t->rseq->rseq_cs, fail);
   183		user_access_end();
   184	
   185		instruction_pointer_set(regs, (unsigned long)abort_ip);
   186	
   187		rseq_stat_inc(rseq_stats.fixup);
   188		rseq_trace_ip_fixup(ip, start_ip, offset, abort_ip);
   189		return true;
   190	clear:
   191		unsafe_put_user(0ULL, &t->rseq->rseq_cs, fail);
   192		user_access_end();
   193		rseq_stat_inc(rseq_stats.clear);
   194		return true;
   195	die:
   196		t->rseq_event.fatal = true;
   197	fail:
   198		user_access_end();
   199		return false;
   200	}
   201	#endif /* RSEQ_BUILD_SLOW_PATH */
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
