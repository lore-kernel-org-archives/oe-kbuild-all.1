Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F272F1FF6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750914082; cv=none; b=ta+QwKarl+qKsaJVQo9wsn1DzggQ9g+fYp1c6pySD+CSYmVOMXoJY1Jp3CLBIj9Tnaf/nVuLa5riNfnlj/p6aEdXtsPI6qNskh8gJRb2fWeXeUdB7pyz7wZ1f/NK9j2WzU+Zm7NKf6FwZmhKZQ5pbnnagG9P/F7WbwO9n/zURCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750914082; c=relaxed/simple;
	bh=kMm+E7l37j6wSDOHsZ4fK+YpEJu7d7fO9iUl3GZwRBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bntxg1ZMNjveR+2NIfn3tC1yKEUSEEeOMCiH0QZrZE/8EVWI1n31aSV5otoF+OIx96JFTCZCVyw4NEu5eL/hwD9H2x0+B/GfLXGHdzRhydi/3FSZGrgl2jMnYARUbIj6Qhb2Gok05Zy/e+PjXNQO/PqeK0wn8iAmW/JQ3HljhD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0azmkNS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0azmkNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750914081; x=1782450081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kMm+E7l37j6wSDOHsZ4fK+YpEJu7d7fO9iUl3GZwRBI=;
  b=P0azmkNS+t4XQpQDSVFzerpVWrv2Gai31g56gMKv0GLimXszh3SxMWum
   tZCdGp6Y1MAfY/G49v/yONpIJKbt42hP+0LdbYncGPwK8qG4rEc+estb6
   LXXZZdai4YPHBTsG3lwgC/RNwlFThUFODD7gekQqtWLRvEHpTnQldl/wl
   /gEhfixqOaHn8odPyzkXoGGY9xrIApX36SEh9Osv/ew9ont9UkqMcJD/Z
   xIDKZ7ly7ZH49WNZgaOUzICI/KzVPlAdZCs9dv83C6sFHgMzZu5fdBHIl
   T7ttBHIhNDywx9LN6pahpbAxxnS6LgqhjIEPRO0R5NUShmPTHmDU3+6tD
   g==;
X-CSE-ConnectionGUID: KPVkeC+NTMSjpJpkTX8owg==
X-CSE-MsgGUID: SbQ0v3N9Q7+u3QhhQL5BPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53293619"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53293619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 22:01:20 -0700
X-CSE-ConnectionGUID: dXKOPMmOQsOoRa8JsIpgXQ==
X-CSE-MsgGUID: HBHKWX+5SgSRZq/vxYnbkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152707385"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2025 22:01:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUejd-000Tk0-0L;
	Thu, 26 Jun 2025 05:01:17 +0000
Date: Thu, 26 Jun 2025 13:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:smp4 9/15] kernel/smp.c:832:17: warning: this 'if' clause
 does not guard...
Message-ID: <202506261231.DO8WZ5ap-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux smp4
head:   f4b86696cf011ee576d79e4ea53b0fb3ebea6017
commit: 21f3b4c48b93669f2e9398f292b64ed2ffb43c34 [9/15] reverse logic save indent
config: arc-randconfig-002-20250626 (https://download.01.org/0day-ci/archive/20250626/202506261231.DO8WZ5ap-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261231.DO8WZ5ap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261231.DO8WZ5ap-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/smp.c: In function 'smp_call_function_many_cond':
   kernel/smp.c:832:84: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     832 |                 if (!llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu)));
         |                                                                                    ^
>> kernel/smp.c:832:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     832 |                 if (!llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu)));
         |                 ^~
   kernel/smp.c:833:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     833 |                         continue;
         |                         ^~~~~~~~


vim +/if +832 kernel/smp.c

   771	
   772	static void smp_call_function_many_cond(const struct cpumask *mask,
   773						smp_call_func_t func, void *info,
   774						unsigned int scf_flags,
   775						smp_cond_func_t cond_func)
   776	{
   777		int cpu, last_cpu, this_cpu = smp_processor_id();
   778		struct call_function_data *cfd;
   779		bool wait = scf_flags & SCF_WAIT;
   780		int nr_cpus = 0;
   781		bool run_remote = false;
   782	
   783		lockdep_assert_preemption_disabled();
   784	
   785		/*
   786		 * Can deadlock when called with interrupts disabled.
   787		 * We allow cpu's that are not yet online though, as no one else can
   788		 * send smp call function interrupt to this cpu and as such deadlocks
   789		 * can't happen.
   790		 */
   791		if (cpu_online(this_cpu) && !oops_in_progress &&
   792		    !early_boot_irqs_disabled)
   793			lockdep_assert_irqs_enabled();
   794	
   795		/*
   796		 * When @wait we can deadlock when we interrupt between llist_add() and
   797		 * arch_send_call_function_ipi*(); when !@wait we can deadlock due to
   798		 * csd_lock() on because the interrupt context uses the same csd
   799		 * storage.
   800		 */
   801		WARN_ON_ONCE(!in_task());
   802	
   803		/* Check if we need remote execution, i.e., any CPU excluding this one. */
   804		if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids)
   805			goto local_exec;
   806	
   807		run_remote = true;
   808		cfd = this_cpu_ptr(&cfd_data);
   809		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
   810		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
   811	
   812		cpumask_clear(cfd->cpumask_ipi);
   813		for_each_cpu(cpu, cfd->cpumask) {
   814			call_single_data_t *csd = per_cpu_ptr(cfd->csd, cpu);
   815	
   816			if (cond_func && !cond_func(cpu, info)) {
   817				__cpumask_clear_cpu(cpu, cfd->cpumask);
   818				continue;
   819			}
   820	
   821			csd_lock(csd);
   822			if (wait)
   823				csd->node.u_flags |= CSD_TYPE_SYNC;
   824			csd->func = func;
   825			csd->info = info;
   826	#ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
   827			csd->node.src = smp_processor_id();
   828			csd->node.dst = cpu;
   829	#endif
   830			trace_csd_queue_cpu(cpu, _RET_IP_, func, csd);
   831	
 > 832			if (!llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu)));
   833				continue;
   834	
   835			__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
   836			nr_cpus++;
   837			last_cpu = cpu;
   838		}
   839	
   840		/*
   841		 * Choose the most efficient way to send an IPI. Note that the
   842		 * number of CPUs might be zero due to concurrent changes to the
   843		 * provided mask.
   844		 */
   845		if (nr_cpus == 1)
   846			send_call_function_single_ipi(last_cpu);
   847		else if (likely(nr_cpus > 1))
   848			send_call_function_ipi_mask(cfd->cpumask_ipi);
   849		else
   850			run_remote = false;
   851	
   852	local_exec:
   853		/* Check if we need local execution. */
   854		if ((scf_flags & SCF_RUN_LOCAL) && cpumask_test_cpu(this_cpu, mask) &&
   855		    (!cond_func || cond_func(this_cpu, info))) {
   856			unsigned long flags;
   857	
   858			local_irq_save(flags);
   859			csd_do_func(func, info, NULL);
   860			local_irq_restore(flags);
   861		}
   862	
   863		if (!run_remote || !wait)
   864			return;
   865	
   866		for_each_cpu(cpu, cfd->cpumask) {
   867			call_single_data_t *csd;
   868	
   869			csd = per_cpu_ptr(cfd->csd, cpu);
   870			csd_lock_wait(csd);
   871		}
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
