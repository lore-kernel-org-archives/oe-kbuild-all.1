Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1358329F12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 15:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757517331; cv=none; b=jG0Lt4hH0KRspYzBgQEhY731QjFGK5n5qOElWh3N22XviUgdZtTwoz5tySQ8BUDuPlxbOSWIqOTJ3Y/vNXXgmxAGVoQrXePKoW9cJjTq5ZebMJv/mm1ZrSU9Rfp0Yu4fVSxobZEnKj6t6ZD9JRuEazDzXwBvUYeL8YbhXWAcqqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757517331; c=relaxed/simple;
	bh=qUMyCYym8gwRMcrCYrBqt3/BjetwBt7H4Ven4qkRios=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EANtV8c4s7ATfg20cm6rZ63g4le4jKomD1Y670R9rVJSbxXBqIlfZVVwubtWZggRTzVR1IPUlqoeb6DHwTaUT/aL0ZgVArQtyvfNC8jo+I0XLmBDlxAVmfpBMiDB9ABE5kOIjO/AXxeLZ6QJynLl5q+XxN0j576bH4w1qMX037o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rc7uWCSx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rc7uWCSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757517330; x=1789053330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUMyCYym8gwRMcrCYrBqt3/BjetwBt7H4Ven4qkRios=;
  b=Rc7uWCSxPd8YmL5vTteh8obNNSeGCRqa+MxM4pZ3gq5B9MAI0+W1vtQJ
   MJDdHrtv2/JwFayj5mX0XF+ncMABV+q4lOsc8EXyGdoGEQr5+d2xEgpV8
   7HFLM2xIgKqrCtcZ6w1qe9SzEhHvVh9UF0IOXAYkjSFSg5UitwvphtHS1
   FjWbd7Ue+8s0blwFBHHqH3Mw+Wbcq7Rr8SnXsH4PGxsvmbaXDbjfOri4B
   bJL25YCrSg816QT0csbrLUP9drhMK5YtWXwiOXPOmli8r/6juQHZm1c26
   qzL9FZdtg6WqhZbEi1QsOhm2+gfxdNV3Egzd+GtKLnXN55apOGVYri1Ae
   g==;
X-CSE-ConnectionGUID: 7QpGZn8/TpWJmWp+EBXXHg==
X-CSE-MsgGUID: 7kC1DaDFRT+NXFCo5FB6sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58872925"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="58872925"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 08:15:29 -0700
X-CSE-ConnectionGUID: MepWXGceTA2J1SzFJ0+9XA==
X-CSE-MsgGUID: Q4dhT8pRQHGFicKm7Ds87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="173013445"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2025 08:15:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwMXe-000637-0n;
	Wed, 10 Sep 2025 15:15:26 +0000
Date: Wed, 10 Sep 2025 23:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 53/58] kernel/rseq.c:570:14: warning:
 comparison between pointer and integer ('long' and 'long (*)(void)')
Message-ID: <202509102224.f8Ni9XwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   b9025298977a359f4b407e221158b3e47e8de250
commit: 211674584253a1e743bca13b2d1701b8c2835986 [53/58] rseq: Implement syscall entry work for time slice extensions
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250910/202509102224.f8Ni9XwE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509102224.f8Ni9XwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509102224.f8Ni9XwE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/rseq.c:570:17: error: use of undeclared identifier '__NR_rseq_slice_yield'; did you mean 'sys_rseq_slice_yield'?
     570 |             syscall != __NR_rseq_slice_yield)
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        sys_rseq_slice_yield
   include/linux/syscalls.h:960:17: note: 'sys_rseq_slice_yield' declared here
     960 | asmlinkage long sys_rseq_slice_yield(void);
         |                 ^
>> kernel/rseq.c:570:14: warning: comparison between pointer and integer ('long' and 'long (*)(void)') [-Wpointer-integer-compare]
     570 |             syscall != __NR_rseq_slice_yield)
         |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +570 kernel/rseq.c

   526	
   527	/*
   528	 * Invoked from syscall entry if a time slice extension was granted and the
   529	 * kernel did not clear it before user space left the critical section.
   530	 */
   531	void rseq_syscall_enter_work(long syscall)
   532	{
   533		struct task_struct *curr = current;
   534		bool granted = curr->rseq.slice.state.granted;
   535	
   536		clear_task_syscall_work(curr, SYSCALL_RSEQ_SLICE);
   537	
   538		if (static_branch_unlikely(&rseq_debug_enabled))
   539			rseq_slice_validate_ctrl(granted ? RSEQ_SLICE_EXT_GRANTED : 0);
   540	
   541		/*
   542		 * The kernel might have raced, revoked the grant and updated
   543		 * userspace, but kept the SLICE work set.
   544		 */
   545		if (!granted)
   546			return;
   547	
   548		rseq_stat_inc(rseq_stats.s_yielded);
   549	
   550		/*
   551		 * Required to make set_tsk_need_resched() correct on PREEMPT[RT]
   552		 * kernels.
   553		 */
   554		scoped_guard(preempt) {
   555			/*
   556			 * Now that preemption is disabled, quickly check whether
   557			 * the task was already rescheduled before arriving here.
   558			 */
   559			if (!curr->rseq.event.sched_switch)
   560				rseq_slice_set_need_resched(curr);
   561		}
   562	
   563		curr->rseq.slice.state.granted = false;
   564		/*
   565		 * Clear the grant in user space and check whether this was the
   566		 * correct syscall to yield. If the user access fails or the task
   567		 * used an arbitrary syscall, terminate it.
   568		 */
   569		if (put_user_masked_u32(0U, &curr->rseq.usrptr->slice_ctrl) ||
 > 570		    syscall != __NR_rseq_slice_yield)
   571			force_sig(SIGSEGV);
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
