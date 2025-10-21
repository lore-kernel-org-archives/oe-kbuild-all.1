Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDE6242D7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761059663; cv=none; b=AQ6+dEcwjBcWyXVb7KPZPHo22V9y0o6om0FtcHvM6jmm97glag4VNk7mLNfYrYClOz2qNtWqUxIeMwa/MydSHoPxCMqRVwAe1AbYYPsJhccnt1WrTzZEoqgQTPpVJAyWVUd85oYXe5Zga+4u0fM6mBX0M1S+HbJT0Mkul8Q6vdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761059663; c=relaxed/simple;
	bh=I8wvv824i7on8AWnEJeBGZnAeJJDOg+lqUtP5Q5E2T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIq21YtYFe0bN2ssDZi33HApQxrRcuOuzxj9aaTyZS9Alhhv4PewXCnWlvbqmODLW1jxlavWCQRZ3MGQQxPpgZ3UXQ82OQMjDyy7dIYaN4XBMihTWdAj7cxzf8uyCxOAdAn0dZKUXSgXrH3luoJFe6Zg7Gjq+RHys3BIFrkDXTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnUOzk4P; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnUOzk4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761059661; x=1792595661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8wvv824i7on8AWnEJeBGZnAeJJDOg+lqUtP5Q5E2T0=;
  b=hnUOzk4PTb4eVYR0aU1+799tRiqajMkUxDgFASZTdTsNpK7hsbCLHR7T
   kLMCQS/bbj6wZedIvwqByVtjnXrG0UNGt2J1pzh5ogeLSsmlzbpRaekCG
   ZFL219uCyIKGNnx4FcbGDhL1aCyJfx2+/DMkz7CSgxe3ByRPafFb0u4pP
   aNpYrw9df7BUGHy/S2PCtiYlUitEuStR6Faqtf1GimeEDwUpVCo1V3u5K
   tyg4IvJWr79ayQgNiCN/MV9vkMHDX7oT2YELME+gQGogVujps7JznBCqj
   cw6AMRMpjwEdHZtxWZt261x9YZN4XZL8yccUCSz4z/axG7Q0Y6yyXzpsg
   w==;
X-CSE-ConnectionGUID: /QDz2EOtR5qxIj0//g9Qyg==
X-CSE-MsgGUID: tbRwTbhGRoyNx0WN82a3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63085752"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63085752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:14:21 -0700
X-CSE-ConnectionGUID: U3LD4rOEQK6oaLQpCMh2Nw==
X-CSE-MsgGUID: AktMo/AsQciDW8kK8MwlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187651229"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Oct 2025 08:14:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBE42-000AwD-0L;
	Tue, 21 Oct 2025 15:14:18 +0000
Date: Tue, 21 Oct 2025 23:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 31/43] include/linux/rseq_entry.h:132:3:
 error: invalid operand for instruction
Message-ID: <202510212355.qQpqeYr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   3adaf1f58eb5a8c6c7464ec637d091e6f90135ab
commit: 4b6bff9cb7bae31d53b12c242c6e0063e1fad056 [31/43] rseq: Provide and use rseq_update_user_cs()
config: powerpc-randconfig-r073-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212355.qQpqeYr1-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212355.qQpqeYr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510212355.qQpqeYr1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rseq.c:75:
>> include/linux/rseq_entry.h:132:3: error: invalid operand for instruction
                   unsafe_get_user(start_ip, &ucs->start_ip, efault);
                   ^
   include/linux/uaccess.h:606:2: note: expanded from macro 'unsafe_get_user'
           arch_unsafe_get_user(x, ptr, local_label);      \
           ^
   arch/powerpc/include/asm/uaccess.h:458:2: note: expanded from macro 'arch_unsafe_get_user'
           __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
           ^
   arch/powerpc/include/asm/uaccess.h:282:2: note: expanded from macro '__get_user_size_goto'
           __get_user_size_allowed(x, ptr, size, __gus_retval);    \
           ^
   arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
           case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
                   ^
   arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
                   "       li %1+1,0\n"                    \
                    ^
   <inline asm>:7:5: note: instantiated into assembly here
           li 31+1,0
              ^
   1 error generated.


vim +132 include/linux/rseq_entry.h

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
   118	bool rseq_debug_update_user_cs(struct task_struct *t, struct pt_regs *regs,
   119				       unsigned long csaddr)
   120	{
   121		struct rseq_cs __user *ucs = (struct rseq_cs __user *)(unsigned long)csaddr;
   122		u64 start_ip, abort_ip, offset, cs_end, head, tasksize = TASK_SIZE;
   123		unsigned long ip = instruction_pointer(regs);
   124		u64 __user *uc_head = (u64 __user *) ucs;
   125		u32 usig, __user *uc_sig;
   126	
   127		scoped_masked_user_rw_access(ucs, efault) {
   128			/*
   129			 * Evaluate the user pile and exit if one of the conditions
   130			 * is not fulfilled.
   131			 */
 > 132			unsafe_get_user(start_ip, &ucs->start_ip, efault);
   133			if (unlikely(start_ip >= tasksize))
   134				goto die;
   135			/* If outside, just clear the critical section. */
   136			if (ip < start_ip)
   137				goto clear;
   138	
   139			unsafe_get_user(offset, &ucs->post_commit_offset, efault);
   140			cs_end = start_ip + offset;
   141			/* Check for overflow and wraparound */
   142			if (unlikely(cs_end >= tasksize || cs_end < start_ip))
   143				goto die;
   144	
   145			/* If not inside, clear it. */
   146			if (ip >= cs_end)
   147				goto clear;
   148	
   149			unsafe_get_user(abort_ip, &ucs->abort_ip, efault);
   150			/* Ensure it's "valid" */
   151			if (unlikely(abort_ip >= tasksize || abort_ip < sizeof(*uc_sig)))
   152				goto die;
   153			/* Validate that the abort IP is not in the critical section */
   154			if (unlikely(abort_ip - start_ip < offset))
   155				goto die;
   156	
   157			/*
   158			 * Check version and flags for 0. No point in emitting
   159			 * deprecated warnings before dying. That could be done in
   160			 * the slow path eventually, but *shrug*.
   161			 */
   162			unsafe_get_user(head, uc_head, efault);
   163			if (unlikely(head))
   164				goto die;
   165	
   166			/* abort_ip - 4 is >= 0. See abort_ip check above */
   167			uc_sig = (u32 __user *)(unsigned long)(abort_ip - sizeof(*uc_sig));
   168			unsafe_get_user(usig, uc_sig, efault);
   169			if (unlikely(usig != t->rseq.sig))
   170				goto die;
   171	
   172			/* rseq_event.user_irq is only valid if CONFIG_GENERIC_IRQ_ENTRY=y */
   173			if (IS_ENABLED(CONFIG_GENERIC_IRQ_ENTRY)) {
   174				/* If not in interrupt from user context, let it die */
   175				if (unlikely(!t->rseq.event.user_irq))
   176					goto die;
   177			}
   178			unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
   179			instruction_pointer_set(regs, (unsigned long)abort_ip);
   180			rseq_stat_inc(rseq_stats.fixup);
   181			break;
   182		clear:
   183			unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
   184			rseq_stat_inc(rseq_stats.clear);
   185			abort_ip = 0ULL;
   186		}
   187	
   188		if (unlikely(abort_ip))
   189			rseq_trace_ip_fixup(ip, start_ip, offset, abort_ip);
   190		return true;
   191	die:
   192		t->rseq.event.fatal = true;
   193	efault:
   194		return false;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
