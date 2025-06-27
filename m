Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE16A218858
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751063515; cv=none; b=E6Vava9t97ZObii41ZwvelwJooESfC4GhwITgLquUCIc6KsfxEFTev/VbW3YCbT/v+2Tdf+4pcZRvbzALefJJHg1O7bvfHvpRJWDQZ7KP2kBX/15CVMashmUGT9sRNa3DLgGkFYSTF36Vt63ZAmvcVMkyrBZqTIgF/NC7sPrwic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751063515; c=relaxed/simple;
	bh=RmfQi6AueK6TNNsUL7PzdEMIXxftPk6zpb5VA849Ns4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sB7QmqSV29WbQcuaDXJrm72aQli2/LK7p+STeS9W5kXf9O/MRnpaF9+G/Hr0+fedwTTq+v+DPce6u36xEDzS9jN4hrD5FDuCfoOHPzWIUATKUqccgMcvQqEEFtvWPg+vaFoc+Pw7ZGsqXKwWwgYjC+sRe8pIWVx3/mYMh6NQ/rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEqEXaqQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEqEXaqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751063514; x=1782599514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmfQi6AueK6TNNsUL7PzdEMIXxftPk6zpb5VA849Ns4=;
  b=oEqEXaqQ1BSWq1WX3Wa9wQJAexLWrZe2QilrFLWmcERf8hEEFrdEnnx6
   iRkde0eYzNayevwWmPf6YF+uS5zfup7U4DYBJs+gJbsVe4njm0iB1vDqI
   43fzyUtNxfmVAaSUh/5VL5VBUlf0MtJ0gisO9WpbByJpkMARbzhGawYoC
   M7fH4LcGSj/k8XOu/kQbKCCAClbuMq9K5MOPuN4OCMiqBYT4mDztPc2UJ
   vWkwc+sCGR7IbVvXmKGt8iNEX3dr7M6OF76xB0Tu+ZpbxwDLVRYFDyM3J
   jJeSe2A8PBzubqc+CXPvcrDRuVru77+I7emI7D45AsRl3IvJd0nmO1b8l
   w==;
X-CSE-ConnectionGUID: hk5josEpRuGCkCK6NAUemg==
X-CSE-MsgGUID: kOVJ3Lw5TUSf7GpPUqpMrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53469200"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53469200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 15:31:53 -0700
X-CSE-ConnectionGUID: Jf7Y5z6zQ9uumnac5LatAA==
X-CSE-MsgGUID: GLgCRn2QTNqpLp5ZoOoztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="157460775"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jun 2025 15:31:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVHbp-000Wai-1t;
	Fri, 27 Jun 2025 22:31:49 +0000
Date: Sat, 28 Jun 2025 06:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:smp4 14/16] kernel/smp.c:834:21: error: 'nr_cpu' undeclared;
 did you mean 'nr_cpus'?
Message-ID: <202506280658.RVUnVkkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux smp4
head:   a5517966eb5af6592ccf95dff81778efa7828357
commit: 2a93ac837c4d184b40d46a2ed2a30313fd1984e1 [14/16] smp: Defer cpumask_ipi cleanup to where it is actually used
config: i386-buildonly-randconfig-003-20250628 (https://download.01.org/0day-ci/archive/20250628/202506280658.RVUnVkkM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280658.RVUnVkkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506280658.RVUnVkkM-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/smp.c: In function 'smp_call_function_many_cond':
>> kernel/smp.c:834:21: error: 'nr_cpu' undeclared (first use in this function); did you mean 'nr_cpus'?
     834 |                 if (nr_cpu == 1) {
         |                     ^~~~~~
         |                     nr_cpus
   kernel/smp.c:834:21: note: each undeclared identifier is reported only once for each function it appears in


vim +834 kernel/smp.c

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
   812		for_each_cpu(cpu, cfd->cpumask) {
   813			call_single_data_t *csd = per_cpu_ptr(cfd->csd, cpu);
   814	
   815			if (cond_func && !cond_func(cpu, info)) {
   816				__cpumask_clear_cpu(cpu, cfd->cpumask);
   817				continue;
   818			}
   819	
   820			csd_lock(csd);
   821			if (wait)
   822				csd->node.u_flags |= CSD_TYPE_SYNC;
   823			csd->func = func;
   824			csd->info = info;
   825	#ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
   826			csd->node.src = smp_processor_id();
   827			csd->node.dst = cpu;
   828	#endif
   829			trace_csd_queue_cpu(cpu, _RET_IP_, func, csd);
   830	
   831			if (!llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu)))
   832				continue;
   833	
 > 834			if (nr_cpu == 1) {
   835				cpumask_clear(cfd->cpumask_ipi);
   836				__cpumask_set_cpu(last_cpu, cfd->cpumask_ipi);
   837			}
   838	
   839			__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
   840			nr_cpus++;
   841			last_cpu = cpu;
   842		}
   843	
   844		/*
   845		 * Choose the most efficient way to send an IPI. Note that the
   846		 * number of CPUs might be zero due to concurrent changes to the
   847		 * provided mask.
   848		 */
   849		if (nr_cpus == 1)
   850			send_call_function_single_ipi(last_cpu);
   851		else if (likely(nr_cpus > 1))
   852			send_call_function_ipi_mask(cfd->cpumask_ipi);
   853		else
   854			run_remote = false;
   855	
   856	local_exec:
   857		/* Check if we need local execution. */
   858		if ((scf_flags & SCF_RUN_LOCAL) && cpumask_test_cpu(this_cpu, mask) &&
   859		    (!cond_func || cond_func(this_cpu, info))) {
   860			unsigned long flags;
   861	
   862			local_irq_save(flags);
   863			csd_do_func(func, info, NULL);
   864			local_irq_restore(flags);
   865		}
   866	
   867		if (!run_remote || !wait)
   868			return;
   869	
   870		for_each_cpu(cpu, cfd->cpumask) {
   871			call_single_data_t *csd;
   872	
   873			csd = per_cpu_ptr(cfd->csd, cpu);
   874			csd_lock_wait(csd);
   875		}
   876	}
   877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
