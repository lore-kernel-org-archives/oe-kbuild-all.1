Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8D257845
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166125; cv=none; b=dMCpmdMtt4dloEIuXChKQmHoJ1j9XF4Na/sUyotVdq1WxzptqL+7S4lUQIkEEP4PjGvLxMIYaKVBHaMdJhtXFw8+j3bJ0sCcw9v6gg2A3/0IUjOBfuYDXRF58G2E3xHfzGB9/onV7hlLLwZ5bNygNPBx+8yivC8kp1YYnXZ1MUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166125; c=relaxed/simple;
	bh=+92RW9LzfUXie/qB6p4Wi4tA131SJdL8RGLnb+hxCcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqCFUe6nSXwElKlsl/WR+hBNDD7jypfheGecsUMyR5b0dbK5T1ng8UblLwB7PR0uC9DnUmHrDuZ4+rW5QeItOlJCEQYk/27gmXq9wiqoaik78FJzcEXaPHimtV4J94M4A3GIGJXarKDYM2OiCt+4/QO269JEYtUa8L4yE3/eFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaGVyRJ4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaGVyRJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792166123; x=1823702123;
  h=date:from:to:cc:subject:message-id;
  bh=+92RW9LzfUXie/qB6p4Wi4tA131SJdL8RGLnb+hxCcY=;
  b=jaGVyRJ4mnkvwdh0vrjzp3n9riSjTRX4pR2RUbmgbNBYTkw909sxan/P
   oPBpobL3h5BF2QZ+4OLjSV/mIsbYoWZFACIBHBwtlyK35mjDiep6Er7bQ
   bKoi985yeHKDiowWzVJb5eUSjVi1pGGHj1NPV/jYbbwVWiReAuO5KShrS
   jwJdt9+p1zQVEtOOymT2buolJ3Lr1GGPPfcURk+fAIdnkv3EgxItZBOcT
   dr+m6Qt8TPvE2Mv3uOwlMrM5+OGNuGDcEMxjzvfj98pSEZiBtMbsyFui9
   SfAfe2yg4E/iBa/tq/QusG743Z4nEwRaHJoECCz4tWm9OSDMiyiSXaPX8
   g==;
X-CSE-ConnectionGUID: RDHCtz1HRninxgGyK1SKLQ==
X-CSE-MsgGUID: k1qYm/esQXeodgOwpf5Dhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="955597"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="955597"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 08:55:23 -0700
X-CSE-ConnectionGUID: rEwtPQVESHO3QWBpyKQbVA==
X-CSE-MsgGUID: YHMsfD8mTL21iW0hdUCcSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2341932"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2026 08:55:22 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHkH9-00000000CI3-1pho;
	Fri, 16 Oct 2026 15:55:19 +0000
Date: Fri, 16 Oct 2026 17:54:54 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:rqspinlock-owner 25/25]
 kernel/bpf/rqspinlock.c:98:17: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202610161715.UkQUIkfo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux rqspinlock-owner
head:   b7b5b7c8a79dfa5564b7f98ad4691e53e1de0123
commit: ae7807cc237a7422d939f3692b9a3095a10ef881 [25/25] rqspinlock: Cache the owner value in the held-locks table
config: i386-randconfig-2300-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161715.UkQUIkfo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161715.UkQUIkfo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161715.UkQUIkfo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/rqspinlock.c:98:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned int * @@
   kernel/bpf/rqspinlock.c:98:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:98:17: sparse:     got unsigned int *
   kernel/bpf/rqspinlock.c:112:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:112:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:112:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:133:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:133:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:133:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:146:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:146:51: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:146:51: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:681:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:681:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:681:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:705:17: sparse: sparse: symbol 'bpf_res_spin_lock' was not declared. Should it be static?
   kernel/bpf/rqspinlock.c:721:18: sparse: sparse: symbol 'bpf_res_spin_unlock' was not declared. Should it be static?
   kernel/bpf/rqspinlock.c:727:17: sparse: sparse: symbol 'bpf_res_spin_lock_irqsave' was not declared. Should it be static?
   kernel/bpf/rqspinlock.c:746:18: sparse: sparse: symbol 'bpf_res_spin_unlock_irqrestore' was not declared. Should it be static?

vim +98 kernel/bpf/rqspinlock.c

    85	
    86	/*
    87	 * Fill in each CPU's owner value for the lock word. Per-CPU memory for every
    88	 * possible CPU exists from setup_per_cpu_areas() on, and an early initcall
    89	 * runs before secondary CPUs are brought up and long before user space, which
    90	 * is what every rqspinlock user needs to issue an acquisition. A copy left at
    91	 * zero would still form a valid lock word (see struct rqspinlock_held).
    92	 */
    93	static int __init rqspinlock_init_owner(void)
    94	{
    95		int cpu;
    96	
    97		for_each_possible_cpu(cpu)
  > 98			per_cpu(rqspinlock_held_locks.owner, cpu) = cpu << RQ_OWNER_OFFSET;
    99		return 0;
   100	}
   101	early_initcall(rqspinlock_init_owner);
   102	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
