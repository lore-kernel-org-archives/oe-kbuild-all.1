Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278A306484
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607676; cv=none; b=NR8n+K4vMfcozQHVVTcWrZBaBJS4eCkqbQx5p6NgerD1mtNoGH+9WJiCinLTUHWwEvRAgjZajLBb/DenIRE+IP+dwMg7c7eRCsz9bvF28HwZ4zI9OOBYBkYyDdwIpzi5SGoWwCwsFc/QjhfaQakFaFs7XOIvngKEarZ2wc0wR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607676; c=relaxed/simple;
	bh=6XGTKh/NePq95FfBFpsqI9bVxtw/IXJWc/cVygnvANQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2gn3CTAJOEQk8bt/ICb4nlcTOPaLyaEhf7m/AzSKEAtfnNLW7Di7gTvXBTYLPrQnMzeGX4RSV7h69a0GwiIpIWxN4lKu+ND74RAEBEMFohhKjArVDx7pRgaQkVE2LGFKk7taAY3fCjgZXi1lSEGaDrE6Ha5RbPUUjJXJJix5t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wrr76Lfy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wrr76Lfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760607673; x=1792143673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XGTKh/NePq95FfBFpsqI9bVxtw/IXJWc/cVygnvANQ=;
  b=Wrr76LfyDs0CDyLHe4IwqzHTspJfCMpjReY6M1g8bxKhsJSuVN0gXf4B
   pmHiesWQ72yRCGW9HtmBPqKYimW5dV8ChyhNKZ2RJgXjIlEpkxQKQYduN
   za/LGBxHiBmO/uVljiSRA3tOBaRYMfXtYwdYfJenmjwKIb9zCbqAz699p
   6F19tQRqn8AhJHPAe5aXautdVmtchtH6RJa/gOcKLBwehBRQLAOcpuMdd
   Q7OFs5wZ/vFcH4oTmdGsuYCKXnW2y2f4enX+Tfs+jBymn2hFGU9dnsgPS
   524r0orCQjT7/nWq7xHYvtOhuSg0SsezBLiOFiGCESKeLsY61OtNzRB36
   Q==;
X-CSE-ConnectionGUID: h/ltEEv4Qa2CW70xzRcStg==
X-CSE-MsgGUID: SKHIRcUMTseuyX3BQjbUEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="50361544"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="50361544"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 02:41:12 -0700
X-CSE-ConnectionGUID: axhw3cEFRn2oxnh/KVpQog==
X-CSE-MsgGUID: f7u7U8lmS+2nNb+gngR4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="187693087"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2025 02:41:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9KTs-0004fB-2m;
	Thu, 16 Oct 2025 09:41:08 +0000
Date: Thu, 16 Oct 2025 17:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 28/45]
 include/linux/rseq_entry.h:133:undefined reference to `__get_user_bad'
Message-ID: <202510161702.YBQketUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   0ebe124897768fa69e448b1f5f9dfe3ea6627377
commit: e06986897fa345330d59a0e5482344c4f3dfa3cf [28/45] rseq: Provide and use rseq_update_user_cs()
config: arm-multi_v5_defconfig (https://download.01.org/0day-ci/archive/20251016/202510161702.YBQketUz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161702.YBQketUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161702.YBQketUz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/rseq.o: in function `rseq_debug_update_user_cs':
>> include/linux/rseq_entry.h:133:(.text+0x664): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: include/linux/rseq_entry.h:140:(.text+0x69c): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: include/linux/rseq_entry.h:150:(.text+0x6ec): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: include/linux/rseq_entry.h:163:(.text+0x744): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: kernel/rseq.o: in function `rseq_update_user_cs':
   include/linux/rseq_entry.h:226:(.text+0x8a8): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: kernel/rseq.o:include/linux/rseq_entry.h:227: more undefined references to `__get_user_bad' follow


vim +133 include/linux/rseq_entry.h

    84	
    85	/*
    86	 * Check whether there is a valid critical section and whether the
    87	 * instruction pointer in @regs is inside the critical section.
    88	 *
    89	 *  - If the critical section is invalid, terminate the task.
    90	 *
    91	 *  - If valid and the instruction pointer is inside, set it to the abort IP
    92	 *
    93	 *  - If valid and the instruction pointer is outside, clear the critical
    94	 *    section address.
    95	 *
    96	 * Returns true, if the section was valid and either fixup or clear was
    97	 * done, false otherwise.
    98	 *
    99	 * In the failure case task::rseq_event::fatal is set when a invalid
   100	 * section was found. It's clear when the failure was an unresolved page
   101	 * fault.
   102	 *
   103	 * If inlined into the exit to user path with interrupts disabled, the
   104	 * caller has to protect against page faults with pagefault_disable().
   105	 *
   106	 * In preemptible task context this would be counterproductive as the page
   107	 * faults could not be fully resolved. As a consequence unresolved page
   108	 * faults in task context are fatal too.
   109	 */
   110	
   111	#ifdef RSEQ_BUILD_SLOW_PATH
   112	/*
   113	 * The debug version is put out of line, but kept here so the code stays
   114	 * together.
   115	 *
   116	 * @csaddr has already been checked by the caller to be in user space
   117	 */
   118	bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs, unsigned long csaddr)
   119	{
   120		struct rseq_cs __user *ucs = (struct rseq_cs __user *)(unsigned long)csaddr;
   121		u64 start_ip, abort_ip, offset, cs_end, head, tasksize = TASK_SIZE;
   122		unsigned long ip = instruction_pointer(regs);
   123		u64 __user *uc_head = (u64 __user *) ucs;
   124		u32 usig, __user *uc_sig;
   125	
   126		if (!user_rw_masked_begin(ucs))
   127			return false;
   128	
   129		/*
   130		 * Evaluate the user pile and exit if one of the conditions is not
   131		 * fulfilled.
   132		 */
 > 133		unsafe_get_user(start_ip, &ucs->start_ip, fail);
   134		if (unlikely(start_ip >= tasksize))
   135			goto die;
   136		/* If outside, just clear the critical section. */
   137		if (ip < start_ip)
   138			goto clear;
   139	
   140		unsafe_get_user(offset, &ucs->post_commit_offset, fail);
   141		cs_end = start_ip + offset;
   142		/* Check for overflow and wraparound */
   143		if (unlikely(cs_end >= tasksize || cs_end < start_ip))
   144			goto die;
   145	
   146		/* If not inside, clear it. */
   147		if (ip >= cs_end)
   148			goto clear;
   149	
   150		unsafe_get_user(abort_ip, &ucs->abort_ip, fail);
   151		/* Ensure it's "valid" */
   152		if (unlikely(abort_ip >= tasksize || abort_ip < sizeof(*uc_sig)))
   153			goto die;
   154		/* Validate that the abort IP is not in the critical section */
   155		if (unlikely(abort_ip - start_ip < offset))
   156			goto die;
   157	
   158		/*
   159		 * Check version and flags for 0. No point in emitting deprecated
   160		 * warnings before dying. That could be done in the slow path
   161		 * eventually, but *shrug*.
   162		 */
   163		unsafe_get_user(head, uc_head, fail);
   164		if (unlikely(head))
   165			goto die;
   166	
   167		/* abort_ip - 4 is >= 0. See abort_ip check above */
   168		uc_sig = (u32 __user *)(unsigned long)(abort_ip - sizeof(*uc_sig));
   169		unsafe_get_user(usig, uc_sig, fail);
   170		if (unlikely(usig != t->rseq.sig))
   171			goto die;
   172	
   173		/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
   174		if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
   175			/* If not in interrupt from user context, let it die */
   176			if (unlikely(!t->rseq.event.user_irq))
   177				goto die;
   178		}
   179	
   180		unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, fail);
   181		user_access_end();
   182	
   183		instruction_pointer_set(regs, (unsigned long)abort_ip);
   184	
   185		rseq_stat_inc(rseq_stats.fixup);
   186		rseq_trace_ip_fixup(ip, start_ip, offset, abort_ip);
   187		return true;
   188	clear:
   189		unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, fail);
   190		user_access_end();
   191		rseq_stat_inc(rseq_stats.clear);
   192		return true;
   193	die:
   194		t->rseq.event.fatal = true;
   195	fail:
   196		user_access_end();
   197		return false;
   198	}
   199	#endif /* RSEQ_BUILD_SLOW_PATH */
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
