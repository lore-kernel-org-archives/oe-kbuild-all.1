Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033C32860F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 01:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315175; cv=none; b=o5OqjBcddRU1euXs8fPut2eZnWwJYg/rov00DjWFH0fUeg96b4vDX5LyPSbfaJAONYX0xfYB8oby5ogy0gGwZAqJxY2HZE9d9d8Wsy1jR7iMWXfKLrRmbtmUVHuvd6T89Eiu3JKbblIlc7ZDKFVmck/Ud+/rdiD3BDFh9iCuJWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315175; c=relaxed/simple;
	bh=zRMDmuE/NhBmADCGXSczsrHAOvDgIGRYHSaGipxXKwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f0GoH+wExUwPA5T9V81VYX8enP5OrJlwojtdqaAl1ll2NIUyJuGyGkvA8NSAqQqtomt3Dzsi271xqXwBk+UefSzG1sqaCqga+YJLK0hdAQSrLPp5LRo2YYxkLwD6YAt8DrbMSoPe6WoVNUK3GNL2SClCcBUYzJHwgBOcrM5gSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cw3wB3rK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cw3wB3rK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774315175; x=1805851175;
  h=date:from:to:cc:subject:message-id;
  bh=zRMDmuE/NhBmADCGXSczsrHAOvDgIGRYHSaGipxXKwQ=;
  b=Cw3wB3rKB5jmnQ/dhZcQRnki7ZZt/BnzT1I/OoigBqX5+pBlPVG3Nds+
   kFwo8wHbRmtYUxyWbrUkFEI3hySzQ+rReIVO1hfXwuDOhtsfzd4Gi/djk
   Fx3HvCh+YiGvitoqpcyuUCuQjHCtgVZRBJKmo64SG+ThCtDEoaqPaM1f/
   BHylOZbJKoFJvXX6RGYsKBpx+KZJ8ALGcVDC7lK6ELNfH/fG6wMODEneA
   pFviE3FQnqIdYzhigRBz3jZZgLo5kJPd39LmZoRz5nsQA6Xiam3NsKZCy
   lvXa3h+060bdd2q7HGEu8PKUvXVkp5P8gDTrq+tBcy9Jq7gaYmoBCCBtN
   w==;
X-CSE-ConnectionGUID: VUWz7R/hT42KPPYuNPsj8g==
X-CSE-MsgGUID: u/mu3eAsQrKeISUHvjOC1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86796929"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86796929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:19:32 -0700
X-CSE-ConnectionGUID: MU1UjRBJQJmMn8ub/l9BXw==
X-CSE-MsgGUID: 6mvPPd4zQlGIIIXZ4FwxOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224209257"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 18:19:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qQa-000000003V3-08x6;
	Tue, 24 Mar 2026 01:19:28 +0000
Date: Tue, 24 Mar 2026 09:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dvyukov:pr/4 1/1] kernel/sched/membarrier.c:337:41: error:
 'struct mm_mm_cid' has no member named 'fence_seq'
Message-ID: <202603240952.18iaUtep-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/dvyukov/linux pr/4
head:   1284e3723047cb5afd247f75c53de43efc18db82
commit: 1284e3723047cb5afd247f75c53de43efc18db82 [1/1] rseq: always overwrite cpu_id after membarrier
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603240952.18iaUtep-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240952.18iaUtep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240952.18iaUtep-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/membarrier.c: In function 'membarrier_private_expedited':
>> kernel/sched/membarrier.c:337:41: error: 'struct mm_mm_cid' has no member named 'fence_seq'
     337 |                 atomic64_inc(&mm->mm_cid.fence_seq);
         |                                         ^


vim +337 kernel/sched/membarrier.c

   316	
   317	static int membarrier_private_expedited(int flags, int cpu_id)
   318	{
   319		cpumask_var_t tmpmask;
   320		struct mm_struct *mm = current->mm;
   321		smp_call_func_t ipi_func = ipi_mb;
   322	
   323		if (flags == MEMBARRIER_FLAG_SYNC_CORE) {
   324			if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE))
   325				return -EINVAL;
   326			if (!(atomic_read(&mm->membarrier_state) &
   327			      MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE_READY))
   328				return -EPERM;
   329			ipi_func = ipi_sync_core;
   330			prepare_sync_core_cmd(mm);
   331		} else if (flags == MEMBARRIER_FLAG_RSEQ) {
   332			if (!IS_ENABLED(CONFIG_RSEQ))
   333				return -EINVAL;
   334			if (!(atomic_read(&mm->membarrier_state) &
   335			      MEMBARRIER_STATE_PRIVATE_EXPEDITED_RSEQ_READY))
   336				return -EPERM;
 > 337			atomic64_inc(&mm->mm_cid.fence_seq);
   338			rseq_force_update();
   339			ipi_func = ipi_rseq;
   340		} else {
   341			WARN_ON_ONCE(flags);
   342			if (!(atomic_read(&mm->membarrier_state) &
   343			      MEMBARRIER_STATE_PRIVATE_EXPEDITED_READY))
   344				return -EPERM;
   345		}
   346	
   347		if (flags != MEMBARRIER_FLAG_SYNC_CORE &&
   348		    (atomic_read(&mm->mm_users) == 1 || num_online_cpus() == 1))
   349			return 0;
   350	
   351		/*
   352		 * Matches memory barriers after rq->curr modification in
   353		 * scheduler.
   354		 *
   355		 * On RISC-V, this barrier pairing is also needed for the
   356		 * SYNC_CORE command when switching between processes, cf.
   357		 * the inline comments in membarrier_arch_switch_mm().
   358		 */
   359		smp_mb();	/* system call entry is not a mb. */
   360	
   361		if (cpu_id < 0 && !zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
   362			return -ENOMEM;
   363	
   364		SERIALIZE_IPI();
   365		cpus_read_lock();
   366	
   367		if (cpu_id >= 0) {
   368			struct task_struct *p;
   369	
   370			if (cpu_id >= nr_cpu_ids || !cpu_online(cpu_id))
   371				goto out;
   372			rcu_read_lock();
   373			p = rcu_dereference(cpu_rq(cpu_id)->curr);
   374			if (!p || p->mm != mm) {
   375				rcu_read_unlock();
   376				goto out;
   377			}
   378			rcu_read_unlock();
   379		} else {
   380			int cpu;
   381	
   382			rcu_read_lock();
   383			for_each_online_cpu(cpu) {
   384				struct task_struct *p;
   385	
   386				p = rcu_dereference(cpu_rq(cpu)->curr);
   387				if (p && p->mm == mm)
   388					__cpumask_set_cpu(cpu, tmpmask);
   389			}
   390			rcu_read_unlock();
   391		}
   392	
   393		if (cpu_id >= 0) {
   394			/*
   395			 * smp_call_function_single() will call ipi_func() if cpu_id
   396			 * is the calling CPU.
   397			 */
   398			smp_call_function_single(cpu_id, ipi_func, NULL, 1);
   399		} else {
   400			/*
   401			 * For regular membarrier, we can save a few cycles by
   402			 * skipping the current cpu -- we're about to do smp_mb()
   403			 * below, and if we migrate to a different cpu, this cpu
   404			 * and the new cpu will execute a full barrier in the
   405			 * scheduler.
   406			 *
   407			 * For SYNC_CORE, we do need a barrier on the current cpu --
   408			 * otherwise, if we are migrated and replaced by a different
   409			 * task in the same mm just before, during, or after
   410			 * membarrier, we will end up with some thread in the mm
   411			 * running without a core sync.
   412			 *
   413			 * For RSEQ, don't invoke rseq_sched_switch_event() on the
   414			 * caller.  User code is not supposed to issue syscalls at
   415			 * all from inside an rseq critical section.
   416			 */
   417			if (flags != MEMBARRIER_FLAG_SYNC_CORE) {
   418				preempt_disable();
   419				smp_call_function_many(tmpmask, ipi_func, NULL, true);
   420				preempt_enable();
   421			} else {
   422				on_each_cpu_mask(tmpmask, ipi_func, NULL, true);
   423			}
   424		}
   425	
   426	out:
   427		if (cpu_id < 0)
   428			free_cpumask_var(tmpmask);
   429		cpus_read_unlock();
   430	
   431		/*
   432		 * Memory barrier on the caller thread _after_ we finished
   433		 * waiting for the last IPI. Matches memory barriers before
   434		 * rq->curr modification in scheduler.
   435		 */
   436		smp_mb();	/* exit from system call is not a mb */
   437	
   438		return 0;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
