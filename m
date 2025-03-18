Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7AA211494
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742318906; cv=none; b=MQdTm8ODd6mXVByz6FKTbgNnJ5UN0YWOU2wH02mSghokfiizq44m3MGLjQ0r3b5jaEfa4Fls1Epc84PHdkBgzynwsajhDGU3tSuN5BZ6hgCxXkTZTQb4PKbtoQ1lTNsYUpXJePsIywrOs1NdquAr1P8az0wVQMX/EixIb8R+rjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742318906; c=relaxed/simple;
	bh=Tx3tEx2F3DPD+Ib1q9PyFsCRoY85Bvc9gBpi0JuDtj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s1zmydTcL3Trsc2lQIyZ0wl8K9tzHGqALh4UZbe//yBXWE2sjTekFXXacFsGzNjQ6A7iuOJl/PdFofUdK2HPIgK51NfzdEn9PFkmigRpOjVBxnRFq0I8AOW0kPw+niEBRfZkiwP5ADeeA78qUAyQbImk/lBIfbjbP0O346jx5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npgAI6om; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npgAI6om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742318904; x=1773854904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tx3tEx2F3DPD+Ib1q9PyFsCRoY85Bvc9gBpi0JuDtj0=;
  b=npgAI6omKUgzc+JWlnkpe5hUSzeZ20JUWcS+b9tEYOjzrBMW5y+Tqvlv
   7SGVeiWczPiS4ceHpUfP1czfhGXcUq2wn/7H9soV6uza4N47V7v1jTzM4
   rjAFwm410fxIm1Pr46P5MONRMtcpfU/jgYs/G0ntLICTbMzUDk+Pe5q88
   bEsRgQj5JLEL+Sa84tZs25TqSpSZ3ppJyjeLcg7mZIhXCqXnF3GYwmxux
   D7J3z3klBeaf//NhHe4XZ0IAlub9+aEfwMs0/P0Zr5L0DndT/vgLR+5xN
   I4omqWFpVA3uh/6+W+A9or/iHPUhGKlg6FiIJqWHS/J1EO1wtMsHc+EoI
   g==;
X-CSE-ConnectionGUID: bR96A7D6RtmKJBUwpFotQw==
X-CSE-MsgGUID: cvW1aHaoTWOIfzqbIj/TUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="31058195"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="31058195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 10:28:24 -0700
X-CSE-ConnectionGUID: S9LkIa/lRruVzNyfi6Vzmw==
X-CSE-MsgGUID: hrKIyewrRrmDBF8S7lnxcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122345568"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2025 10:28:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuajk-000E1W-2F;
	Tue, 18 Mar 2025 17:28:20 +0000
Date: Wed, 19 Mar 2025 01:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/prjc 24/24] kernel/sched/alt_core.c:4492:6: error:
 implicit declaration of function 'preempt_mask_check'; did you mean
 'cpumask_check'?
Message-ID: <202503190147.aiQGCspq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/prjc
head:   f6e4e5191cff5f87f3e907894608cd747a81f10c
commit: f6e4e5191cff5f87f3e907894608cd747a81f10c [24/24] sched/alt: Fix priority inversion for overloaded queues
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250319/202503190147.aiQGCspq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190147.aiQGCspq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190147.aiQGCspq-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c: In function 'balance_select_task_rq':
>> kernel/sched/alt_core.c:4492:6: error: implicit declaration of function 'preempt_mask_check'; did you mean 'cpumask_check'? [-Werror=implicit-function-declaration]
         preempt_mask_check(&mask, &mask, task_sched_prio(p))) {
         ^~~~~~~~~~~~~~~~~~
         cpumask_check
>> kernel/sched/alt_core.c:4493:10: error: implicit declaration of function 'best_mask_cpu'; did you mean 'set_task_cpu'? [-Werror=implicit-function-declaration]
      return best_mask_cpu(cpu, &mask);
             ^~~~~~~~~~~~~
             set_task_cpu
   kernel/sched/alt_core.c: In function 'prio_balance':
>> kernel/sched/alt_core.c:4519:9: error: 'struct rq' has no member named 'online'
     if (!rq->online)
            ^~
   kernel/sched/alt_core.c: In function 'choose_next_task':
   kernel/sched/alt_core.c:4592:2: error: implicit declaration of function 'hrtick_start'; did you mean 'hrtimer_start'? [-Werror=implicit-function-declaration]
     hrtick_start(rq, next->time_slice);
     ^~~~~~~~~~~~
     hrtimer_start
   cc1: some warnings being treated as errors


vim +4492 kernel/sched/alt_core.c

  4484	
  4485	static inline int balance_select_task_rq(struct task_struct *p)
  4486	{
  4487		cpumask_t mask;
  4488		int cpu = task_cpu(p);
  4489	
  4490		if (cpumask_empty(sched_idle_mask) &&
  4491		    cpumask_and(&mask, p->cpus_ptr, cpu_active_mask) &&
> 4492		    preempt_mask_check(&mask, &mask, task_sched_prio(p))) {
> 4493			return best_mask_cpu(cpu, &mask);
  4494		}
  4495	
  4496		return cpu;
  4497	}
  4498	
  4499	static inline void
  4500	__move_queued_task(struct rq *rq, struct task_struct *p, struct rq *dest_rq, int dest_cpu)
  4501	{
  4502		WRITE_ONCE(p->on_rq, TASK_ON_RQ_MIGRATING);
  4503		dequeue_task(p, rq, 0);
  4504		set_task_cpu(p, dest_cpu);
  4505	
  4506		sched_mm_cid_migrate_to(dest_rq, p);
  4507	
  4508		sched_task_sanity_check(p, dest_rq);
  4509		enqueue_task(p, dest_rq, 0);
  4510		WRITE_ONCE(p->on_rq, TASK_ON_RQ_QUEUED);
  4511		wakeup_preempt(dest_rq);
  4512	}
  4513	
  4514	static inline void prio_balance(struct rq *rq)
  4515	{
  4516		struct task_struct *p, *next;
  4517		int cpu, dest_cpu;
  4518	
> 4519		if (!rq->online)
  4520			return;
  4521	
  4522		if (0 == rq->prio_balance_time)
  4523			return;
  4524	
  4525		if (rq->clock - rq->prio_balance_time < sysctl_sched_base_slice << 2)
  4526			return;
  4527	
  4528		rq->prio_balance_time = rq->clock;
  4529		cpu = cpu_of(rq);
  4530	
  4531		if (!cpumask_empty(sched_idle_mask))
  4532			return;
  4533	
  4534		p = sched_rq_next_task(rq->curr, rq);
  4535		while (p != rq->idle) {
  4536			next = sched_rq_next_task(p, rq);
  4537			if (!is_migration_disabled(p) && (dest_cpu = balance_select_task_rq(p)) != cpu) {
  4538				struct rq *dest_rq;
  4539	
  4540				dest_rq = cpu_rq(dest_cpu);
  4541	
  4542				if (do_raw_spin_trylock(&dest_rq->lock)) {
  4543					spin_acquire(&dest_rq->lock.dep_map,
  4544						     SINGLE_DEPTH_NESTING, 1, _RET_IP_);
  4545	
  4546					__move_queued_task(rq, p, dest_rq, dest_cpu);
  4547	
  4548					spin_release(&dest_rq->lock.dep_map, _RET_IP_);
  4549					do_raw_spin_unlock(&dest_rq->lock);
  4550				}
  4551			}
  4552			p = next;
  4553		}
  4554	}
  4555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
