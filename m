Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062D7260F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 May 2026 01:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780191596; cv=none; b=TpoRR50IPNkv5SQ/z7O6ZxGcYLXTBQ0ZSQX/GAbipwbZZUiyD5Mm+Xudc2CXzXJEzmRzZTJ3OGgFlX+B34Dl0DmxMtK8Arkw1Ez2KzbderTXTdVDoXDjTT4pLQa57GDMTq9UySuaifl9jwmYsBCG24b+0NTPRTE/sIx6pzioAZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780191596; c=relaxed/simple;
	bh=vYYl7ftjlfGSc8cp89JQehw7GOGkK/+QYHj0otmARDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lxfc2slWwSwImOa018ByXZe8xdziXIHD96B8LG6QOvfMOslVg5lT1zSJshUFChdLP4tJTv9YYV7s9MCEc8G1k4C3OBwnlVjJQz7BQeKup91a8v6Xq8VDxkr2HZC1LofeKHfojSyNI9Mw8wTXwtOUh7N2epYh9rQ8LzyneAdwK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WX1OJAgr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WX1OJAgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780191595; x=1811727595;
  h=date:from:to:cc:subject:message-id;
  bh=vYYl7ftjlfGSc8cp89JQehw7GOGkK/+QYHj0otmARDY=;
  b=WX1OJAgrZGf11O/dYoTo1wguBa3beWPcPnp4LTDhvsrqZ6xkoSKJKm47
   +YRFiwWHktyUKNbNfHF0LKj/FMH9c5S7ijB2AQBsAqWpbSyoWuyMJdtKm
   I8gOMegDcfdjH1KlUW1RUY97GoBtlLboIEPv7h6ifmY+TyjeiMp2tvRFF
   FTW73ktmcBdMdbDkVGIcAwpBN2W1slH0g5kheiMSOk7yoc+qnFksG2d3+
   A0o4Ul610uWfH//k4W4o76fiNMH7zCMlOuiW5k0csuY+vxmy+4lQU50oY
   r0c7GczeDUhf3dRdpdDATl+TKdfQHT3A1TvbqUIckcIR6SccCsKHqDYzK
   Q==;
X-CSE-ConnectionGUID: P4bjtgdjTfeyUVdKuIWIFg==
X-CSE-MsgGUID: MK7B3+QOSd2bSIXf/DThzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="84852577"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="84852577"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 18:39:54 -0700
X-CSE-ConnectionGUID: EsG0nVpuQTOpdJXJZcFM6g==
X-CSE-MsgGUID: Ff00W0bySoetdsxIFSCzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="281328320"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 May 2026 18:39:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTV9Z-0000000095W-2jUR;
	Sun, 31 May 2026 01:39:49 +0000
Date: Sun, 31 May 2026 09:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Emil Tsalapatis <emil@etsalapatis.com>
Subject: [linux-next:master 7433/9870]
 kernel/sched/ext.c:626:undefined reference to `bpf_arena_map_kern_vm_start'
Message-ID: <202605310926.APXMc0RJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: abdc2516f100d8f9e637a49e4fdfd2d09a318680 [7433/9870] sched_ext: Convert ops.set_cmask() to arena-resident cmask
config: parisc-randconfig-r134-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310926.APXMc0RJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310926.APXMc0RJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605310926.APXMc0RJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_arena_scan_prog':
   kernel/sched/ext.c:7995:(.text+0x4b44): undefined reference to `bpf_prog_arena'
   hppa-linux-ld: kernel/sched/build_policy.o: in function `scx_call_op_set_cpumask':
>> kernel/sched/ext.c:626:(.text+0x1dcec): undefined reference to `bpf_arena_map_kern_vm_start'


vim +626 kernel/sched/ext.c

   602	
   603	/**
   604	 * scx_call_op_set_cpumask - invoke ops.set_cpumask / ops_cid.set_cmask for @task
   605	 * @sch: scx_sched being invoked
   606	 * @rq: rq to update as the currently-locked rq, or NULL
   607	 * @task: task whose affinity is changing
   608	 * @cpumask: new cpumask
   609	 *
   610	 * For cid-form schedulers, translate @cpumask to a cmask via the per-cpu
   611	 * scratch in ext_cid.c and dispatch through the ops_cid union view. Caller
   612	 * must hold @rq's rq lock so this_cpu_ptr is stable across the call.
   613	 */
   614	static inline void scx_call_op_set_cpumask(struct scx_sched *sch, struct rq *rq,
   615						   struct task_struct *task,
   616						   const struct cpumask *cpumask)
   617	{
   618		WARN_ON_ONCE(current->scx.kf_tasks[0]);
   619		current->scx.kf_tasks[0] = task;
   620		if (rq)
   621			update_locked_rq(rq);
   622	
   623		if (scx_is_cid_type()) {
   624			struct scx_cmask *kern_va = *this_cpu_ptr(sch->set_cmask_scratch);
   625			unsigned long uaddr = (unsigned long)kern_va -
 > 626				bpf_arena_map_kern_vm_start(sch->arena_map);
   627			/*
   628			 * Build the per-CPU arena cmask and hand BPF the uaddr. Caller
   629			 * holds the rq lock with IRQs disabled, which makes us the sole
   630			 * user of the scratch area.
   631			 */
   632			scx_cpumask_to_cmask(cpumask, kern_va);
   633			sch->ops_cid.set_cmask(task, (struct scx_cmask *)uaddr);
   634		} else {
   635			sch->ops.set_cpumask(task, cpumask);
   636		}
   637	
   638		if (rq)
   639			update_locked_rq(NULL);
   640		current->scx.kf_tasks[0] = NULL;
   641	}
   642	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
