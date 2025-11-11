Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7442E6CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875727; cv=none; b=SWTODDDmz63/8cCVJoGeMsgX2H2C30jLG8zWVo7yKFWECIqr7dU2ik9VxpnUlmk8RAfBPk5x9e8M37oTr18CSVglCDgi+dZk3g5T1cQtzp1ghiQ3MHPR8+UUoSkrEy0Sce3s/vYofeUFusd3jOieRQVq9nnaXTVBaIBBn5icnA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875727; c=relaxed/simple;
	bh=M0Rg3IB3JbEKOZhZjcd7f5EcRqsWrRQDt65SatjnNhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9DU1McdCqb9PDqElmrXKoY4KWfb9slRkuI3w7q9yveXOd7UdedseymQ9ZzjKGFWE9YTTvtVNg6hEU1vZJHWwNYXfeJEXcBzo4M//71fK3yzG4Q3b0oufQ/+v4U272w7MyVTuG0TQKkNzc6giZD1jghK4F3xriFW95zumzfzHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7ISpb+a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7ISpb+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762875725; x=1794411725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M0Rg3IB3JbEKOZhZjcd7f5EcRqsWrRQDt65SatjnNhk=;
  b=h7ISpb+aoAgEeONWeZrJFipi7X6ij0drgCrzO1wlWrYur3jFC8nIQByb
   nEWGRPxX5WZUJ/pFWe2Gl8Ue9MYSv2cq+eUCaC5i+a9eRnjfYC85MbbYv
   yY6AJPyJxVXz2lu/OYt1wrVaQl9B4F8Lz73DQIuyV7I5+xRln36QFim8I
   N4JMnSI+6xf5cJ4R+NOpsFscf1P7+5dm26dP7t5YeKgQfKcwJBV8KpkN6
   JaUEZKttjDAgEjKHSal/7owudKX6x3P3GMwAhh0wNQGR+kthmeAPAIsRA
   EOazuXKaqOkq2/NdfXkw7VuGtCYuPJV6CkGeDcx1EbZgj6OVby25R5Or3
   A==;
X-CSE-ConnectionGUID: mQH4Gl5ZR5SWVWl7P+6Taw==
X-CSE-MsgGUID: ZCu98QZCR1+ZVcB+ed0YoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64144158"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64144158"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 07:42:05 -0800
X-CSE-ConnectionGUID: sZMogspUS+axXNyM8GTDzA==
X-CSE-MsgGUID: JMLc87CbQXS7m7rpWOHUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189246787"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2025 07:42:03 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vIqVN-000000004AW-1RN3;
	Tue, 11 Nov 2025 15:42:01 +0000
Date: Tue, 11 Nov 2025 16:41:30 +0100
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [tj-sched-ext:scx-bypass-scalability-v2 33/37]
 kernel/watchdog.c:206:21: error: implicit declaration of function
 'scx_hardlockup'; did you mean 'is_hardlockup'?
Message-ID: <202511111612.jSWrytRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-bypass-scalability-v2
head:   27ab0bfd9e10121f25b6dd1b5500c7b627c5d215
commit: 2b9c2213630da8f6f2a256005f9ce9070e39847f [33/37] sched_ext: Hook up hardlockup detector
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251111/202511111612.jSWrytRN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111612.jSWrytRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111612.jSWrytRN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/watchdog.c: In function 'watchdog_hardlockup_check':
>> kernel/watchdog.c:206:21: error: implicit declaration of function 'scx_hardlockup'; did you mean 'is_hardlockup'? [-Wimplicit-function-declaration]
     206 |                 if (scx_hardlockup())
         |                     ^~~~~~~~~~~~~~
         |                     is_hardlockup


vim +206 kernel/watchdog.c

   178	
   179	void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
   180	{
   181		if (per_cpu(watchdog_hardlockup_touched, cpu)) {
   182			per_cpu(watchdog_hardlockup_touched, cpu) = false;
   183			return;
   184		}
   185	
   186		/*
   187		 * Check for a hardlockup by making sure the CPU's timer
   188		 * interrupt is incrementing. The timer interrupt should have
   189		 * fired multiple times before we overflow'd. If it hasn't
   190		 * then this is a good indication the cpu is stuck
   191		 */
   192		if (is_hardlockup(cpu)) {
   193			unsigned int this_cpu = smp_processor_id();
   194			unsigned long flags;
   195	
   196	#ifdef CONFIG_SYSFS
   197			++hardlockup_count;
   198	#endif
   199			/*
   200			 * A poorly behaving BPF scheduler can trigger hard lockup by
   201			 * e.g. putting numerous affinitized tasks in a single queue and
   202			 * directing all CPUs at it. The following call can return true
   203			 * only once when sched_ext is enabled and will immediately
   204			 * abort the BPF scheduler and print out a warning message.
   205			 */
 > 206			if (scx_hardlockup())
   207				return;
   208	
   209			/* Only print hardlockups once. */
   210			if (per_cpu(watchdog_hardlockup_warned, cpu))
   211				return;
   212	
   213			/*
   214			 * Prevent multiple hard-lockup reports if one cpu is already
   215			 * engaged in dumping all cpu back traces.
   216			 */
   217			if (sysctl_hardlockup_all_cpu_backtrace) {
   218				if (test_and_set_bit_lock(0, &hard_lockup_nmi_warn))
   219					return;
   220			}
   221	
   222			/*
   223			 * NOTE: we call printk_cpu_sync_get_irqsave() after printing
   224			 * the lockup message. While it would be nice to serialize
   225			 * that printout, we really want to make sure that if some
   226			 * other CPU somehow locked up while holding the lock associated
   227			 * with printk_cpu_sync_get_irqsave() that we can still at least
   228			 * get the message about the lockup out.
   229			 */
   230			pr_emerg("CPU%u: Watchdog detected hard LOCKUP on cpu %u\n", this_cpu, cpu);
   231			printk_cpu_sync_get_irqsave(flags);
   232	
   233			print_modules();
   234			print_irqtrace_events(current);
   235			if (cpu == this_cpu) {
   236				if (regs)
   237					show_regs(regs);
   238				else
   239					dump_stack();
   240				printk_cpu_sync_put_irqrestore(flags);
   241			} else {
   242				printk_cpu_sync_put_irqrestore(flags);
   243				trigger_single_cpu_backtrace(cpu);
   244			}
   245	
   246			if (sysctl_hardlockup_all_cpu_backtrace) {
   247				trigger_allbutcpu_cpu_backtrace(cpu);
   248				if (!hardlockup_panic)
   249					clear_bit_unlock(0, &hard_lockup_nmi_warn);
   250			}
   251	
   252			if (hardlockup_panic)
   253				nmi_panic(regs, "Hard LOCKUP");
   254	
   255			per_cpu(watchdog_hardlockup_warned, cpu) = true;
   256		} else {
   257			per_cpu(watchdog_hardlockup_warned, cpu) = false;
   258		}
   259	}
   260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
