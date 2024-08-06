Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9515DBD8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920571; cv=none; b=VOrot1w5mDRVOMTgnko3vz2blyKASifTpoHlngZox1F+FrzL9fmpC7mp18cCe3UMTOU6SKVphgmzX0ssRs2Wops2Rh7sLCuedWB4QmPTsGlcvWGLn/hHiMPkszYnDk7khq9bKC6AfE5MQJjLkMllKC1rhHkOusHzwwZGvB65iPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920571; c=relaxed/simple;
	bh=8W6Ak2oUnS5Lx3NALrYx4jUPx2vejZGDTaes2Z6wX24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jGb1y7hN93iTdJq0fQNA4qKZGevdtSRMHsLqR3K90Ad3moIBe0w/yr91cRE+Gz3jkY1cmOcdSmj7GCU/briLT075X6t/QV088DEuZraGXq7lQfaW/Fj8xjTjud9AOqwB5CI3BjQy4skMf7l3Pzu/aqSoMWDD74fokpHcsenYbRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcRKPvTw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcRKPvTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722920570; x=1754456570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8W6Ak2oUnS5Lx3NALrYx4jUPx2vejZGDTaes2Z6wX24=;
  b=AcRKPvTwFKnvEa8IpfYHeiCk4BRaX9tPu3dAIvEPFyz/KjQbaoFycD14
   jvPWglh/DDjH57/Cl0YABMUm9U2R+xjNiq+IOYMPDwhApKJkJ/x9q0sb9
   Niv4VDVq5uKqxWUg+rx8kZV7KNjLwpkeQqP66lQC+0OrDPFI2ucFhw8kF
   b3FSBpP6AfzKFW5rvjor7WtJj9n34RcO9cKerEcbaAetK3gK4JFqUQwcr
   RI1Em8HT5jmv0DHKjzS/aGB5KvnxbIuBISeOVt3Fh6L8SDmM+W5I3LV2U
   NFwFMDy++nYS3C0fKYIwMsNDonfAahNjx7C/EvD56UAbiX5XzXUrL6JFw
   A==;
X-CSE-ConnectionGUID: 5oshlqNUQWySgwdQbDXVWg==
X-CSE-MsgGUID: z04RftprRde6C4zefWhuVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20790902"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20790902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 22:02:48 -0700
X-CSE-ConnectionGUID: FaYtfIWqQ/GQjkIF3eqaug==
X-CSE-MsgGUID: FGlwpsfXTla4JFBFkKPiUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="61244198"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2024 22:02:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbCLM-0004AJ-0m;
	Tue, 06 Aug 2024 05:02:44 +0000
Date: Tue, 6 Aug 2024 13:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-misc-updates 11/11]
 arch/arm64/include/asm/mmu_context.h:256:33: warning:
 'task_cpu_possible_mask' is static but used in inline function
 'task_allowed_on_cpu' which is not static
Message-ID: <202408061228.nqAcIngu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-misc-updates
head:   b561219e25d098ec7bf3dea5342a01c294b5e1a8
commit: b561219e25d098ec7bf3dea5342a01c294b5e1a8 [11/11] sched_ext: Make task_can_run_on_remote_rq() use common task_allowed_on_cpu()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240806/202408061228.nqAcIngu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061228.nqAcIngu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061228.nqAcIngu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mmu_context.h:5,
                    from include/linux/cpuset.h:18,
                    from include/linux/sched/isolation.h:5,
                    from kernel/sched/core.c:34:
>> arch/arm64/include/asm/mmu_context.h:256:33: warning: 'task_cpu_possible_mask' is static but used in inline function 'task_allowed_on_cpu' which is not static
     256 | #define task_cpu_possible_mask  task_cpu_possible_mask
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmu_context.h:28:65: note: in expansion of macro 'task_cpu_possible_mask'
      28 | # define task_cpu_possible(cpu, p)      cpumask_test_cpu((cpu), task_cpu_possible_mask(p))
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:2540:42: note: in expansion of macro 'task_cpu_possible'
    2540 |         if (!(p->flags & PF_KTHREAD) && !task_cpu_possible(cpu, p))
         |                                          ^~~~~~~~~~~~~~~~~
>> include/linux/mmu_context.h:28:41: warning: 'cpumask_test_cpu' is static but used in inline function 'task_allowed_on_cpu' which is not static
      28 | # define task_cpu_possible(cpu, p)      cpumask_test_cpu((cpu), task_cpu_possible_mask(p))
         |                                         ^~~~~~~~~~~~~~~~
   kernel/sched/sched.h:2540:42: note: in expansion of macro 'task_cpu_possible'
    2540 |         if (!(p->flags & PF_KTHREAD) && !task_cpu_possible(cpu, p))
         |                                          ^~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:88:
   kernel/sched/sched.h:2536:14: warning: 'cpumask_test_cpu' is static but used in inline function 'task_allowed_on_cpu' which is not static
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |              ^~~~~~~~~~~~~~~~


vim +256 arch/arm64/include/asm/mmu_context.h

39bc88e5e38e9b Catalin Marinas 2016-09-02  244  
d82158fa6df423 Will Deacon     2021-07-30  245  static inline const struct cpumask *
d82158fa6df423 Will Deacon     2021-07-30  246  task_cpu_possible_mask(struct task_struct *p)
d82158fa6df423 Will Deacon     2021-07-30  247  {
d82158fa6df423 Will Deacon     2021-07-30  248  	if (!static_branch_unlikely(&arm64_mismatched_32bit_el0))
d82158fa6df423 Will Deacon     2021-07-30  249  		return cpu_possible_mask;
d82158fa6df423 Will Deacon     2021-07-30  250  
d82158fa6df423 Will Deacon     2021-07-30  251  	if (!is_compat_thread(task_thread_info(p)))
d82158fa6df423 Will Deacon     2021-07-30  252  		return cpu_possible_mask;
d82158fa6df423 Will Deacon     2021-07-30  253  
d82158fa6df423 Will Deacon     2021-07-30  254  	return system_32bit_el0_cpumask();
d82158fa6df423 Will Deacon     2021-07-30  255  }
d82158fa6df423 Will Deacon     2021-07-30 @256  #define task_cpu_possible_mask	task_cpu_possible_mask
d82158fa6df423 Will Deacon     2021-07-30  257  

:::::: The code at line 256 was first introduced by commit
:::::: d82158fa6df4237c9859b27d719c53b4fe09e69e arm64: Implement task_cpu_possible_mask()

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
