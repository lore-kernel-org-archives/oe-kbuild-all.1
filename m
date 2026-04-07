Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9337649C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534379; cv=none; b=P8UsmrczVNc1P6vJTs8ABQXpxd+cDWDVQkGU2LPS8OFuTl3yADhPm8j3b77szfyBXRcnP5nEJCAA/4vtfnq1vqi636VIJ7hiNQrKgKIYwyOHmpx0oNOJin19J2rWx7LkbmJkYpxqlVfUU9jTktz/s5eKBqBOKchDyvbBfH48MmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534379; c=relaxed/simple;
	bh=9bz9c5bK7ww3Ah3ziJ3BP1j5qpiPAx/pnOl+MgOqBrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCRxKgrnBjb4DFW4+Arhr+UCU4PU/WWK8+0cQblGwFd5WjUeiV2/+pX6TXLbG8IFgP7PNhhvExrTW16J1PEAY7jkw5SZlfe2SLySX3XBcnDaSp8qk8EOZwe6uu38yGvQ/CIJ0+PgcbcaSt9WgPN8Qfp+qTVeKEqNB34Ujmkq6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFMkJOI2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFMkJOI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534377; x=1807070377;
  h=date:from:to:cc:subject:message-id;
  bh=9bz9c5bK7ww3Ah3ziJ3BP1j5qpiPAx/pnOl+MgOqBrY=;
  b=gFMkJOI22rzhVr79gucINhikemCu9jlLvPW15+L53ocbpDl1IPfD0u3k
   5E/8tPKDw0pjmBMjLLhPM41PiN2WyURZAvZnmzqDUpmz2gXFe2HT7ebgJ
   yVVU+Js1z51dsMqMP3k3gpFLdnJl1fjuVunIm7RRDOc3jE1ofSDloZSn6
   u9SKOJsXFpmhav1MyoFIsGc4ZQ4KkcNIfN6bhs95CcQ2BjXLEa9e6j+t1
   VeAbd+0MdWiA/W5VRQsAicN9fTD9RosnwqGWjxC6DLV3GYZ1t5cxfRV7T
   SzVM7nS0gTjGK+wVK/1dEeT2DCdKq89taOcfXTqrrcYW176PLuNhmMmkT
   Q==;
X-CSE-ConnectionGUID: FZFCC9h1RbWzvjJbgMQYAA==
X-CSE-MsgGUID: 8XU7iv0PSCOFd2IqAiIUYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76204318"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76204318"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:59:36 -0700
X-CSE-ConnectionGUID: V33yfg80Rh2HlOzW2XJ07Q==
X-CSE-MsgGUID: hYw8aehXSuepwVdDDQnv4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251193022"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:59:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xbB-0000000006p-1TiF;
	Tue, 07 Apr 2026 03:59:33 +0000
Date: Tue, 07 Apr 2026 11:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/prjc 13/22] kernel/sched/alt_core.c:3092:13:
 error: static declaration of 'sched_mm_cid_fork' follows non-static
 declaration
Message-ID: <202604051620.LDzREpAp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/prjc
head:   14ff03aebefa493a7d7ecfcbff66ded1147dba3e
commit: 6a25699be0085c1c1ba0db370149e7256773b2e1 [13/22] sched/alt: [Sync] f0189d49282e sched/mmcid: Prevent CID stalls due to concurrent forks
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260405/202604051620.LDzREpAp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051620.LDzREpAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051620.LDzREpAp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/alt_core.c:3092:13: error: static declaration of 'sched_mm_cid_fork' follows non-static declaration
    3092 | static void sched_mm_cid_fork(struct task_struct *t);
         |             ^~~~~~~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2351:6: note: previous declaration of 'sched_mm_cid_fork' with type 'void(struct task_struct *)'
    2351 | void sched_mm_cid_fork(struct task_struct *t);
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6220:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6220 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6220:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6220 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12:
   include/linux/cpumask.h:155:73: note: expected 'const struct cpumask *' but argument is of type 'int'
     155 | static __always_inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6222:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6196:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6196 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6222:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6197:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6197 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:932:63: note: expected 'const struct cpumask *' but argument is of type 'int'
     932 | void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/cpumask.h:13:
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:6202:55: note: in expansion of macro 'cpumask_bits'
    6202 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6222:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~


vim +/sched_mm_cid_fork +3092 kernel/sched/alt_core.c

  3091	
> 3092	static void sched_mm_cid_fork(struct task_struct *t);
  3093	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
