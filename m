Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851023;
	b=V5Uh7+JOewcWKLLwJyhGzk64PIB876bL5ov75Y0r/fpvBXqBEnXuhbrBBp95FPR6IRi4
	 DHm1W7yAjkwicHeQ3aGR5NgxpCPGEKISpZvBcz0++Gzbb4ehgo+UT67+PDmyO9mI+Utr+
	 6sPCku7vu1QWseNQic4+BosL2V2woCz31HqaLeTbNrIctw+lf+grC5D4yH5kr6+GGIXwY
	 9IbdVOzQcFy3O4gaq1ct93EdE5X4fqtUVmt7X1/Z9IOc4AQeGI1ozubAKgISLyWV5nipq
	 ozAvpzfR5Qd78LPK5Io4fwy/NrTbLlXsK6//nWCDZTutwTVqEFh5SoGPa13wbccFufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851023;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=icoFFkHWbeiPY2bMMC/IL18p/ddSAOluxAGjp0oI7sA=;
	b=MV3QyKoT++AoYa6ya1yIZvDrjYY3AuxqMo/2811TX1UfzgDkrkf4X95m8+iPUa6MUQZK
	 6oGEafpWNXDbxS6OV3m9lX5JBCG9rJ58kBoLM0q7qD/Fpy/e64dXRQbrZXkdobIFR/8C/
	 fBD2ES0252bPR42LQXwsW5L6hJtGJc4HQdYAfLas0Mw9zlOQelR1h59LV5YZdHnAiVRHj
	 VzdEqp65oMfTSkPvJzVGekL4At1D207Vyrhd37O9ZS428wS9qdNvdYYyN2Ib7j4l1aKEU
	 uMRyNAZUYCH1ozf6gaePfv7wwO+gSgaRf1bXSJ8ApJKFropwGtOQll/EkU6rwiqQ6cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWi9pRz7;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCCD606A323
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 17:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCCD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWi9pRz7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794851023; x=1826387023;
  h=date:from:to:cc:subject:message-id;
  bh=aFJMHOhkMy/t7f1BhVK9CYE8g5brfYQbVWxJfQP/6gI=;
  b=lWi9pRz7poP3liumL763yoomu5//HsGwH1Es8/nFOpk7DhfZkDnLvy1Z
   kU+KQD0PAQ4kU3UxDc9dGQPSr5ibxv+dVHaNqEDccLM7hGEKaFHn4LULF
   GqF+q8zzVwuGVmYQbVUGfLy+FRUE2vQ4k4N/iwWj7By4Gf5rnFmA80L6E
   +y0w9Nsy8QkX+yHc3WPf+tNRAcUTcnymEV+VZZAYUV3ynslY63cswu1c2
   Aoqb5I1nDm22sA2aRVj3JRxaziaTOi/j4Pncg7s6aBELZTO26EBCMNIBJ
   qU0NWKPQx33ZUABIIc3GKFnZ87NQ5298NAY93hUwcWaNwIE8lqPkHHA6F
   Q==;
X-CSE-ConnectionGUID: rAJ3pyyiQa+W149g7N694A==
X-CSE-MsgGUID: zJapPwlTR0iFr0fpotlAuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3612890"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3612890"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:43:42 -0800
X-CSE-ConnectionGUID: ZJ4qfSMUTn6XyfV5jCsskw==
X-CSE-MsgGUID: CoLoGwnETwa3K5rr7zdyqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9676622"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2026 09:43:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT0jy-000000002lJ-2KmW;
	Mon, 16 Nov 2026 17:43:38 +0000
Date: Mon, 16 Nov 2026 18:43:23 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:rqspinlock-owner 3/6]
 kernel/bpf/rqspinlock.c:100:17: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202611161854.1jL5IjB7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux rqspinlock-owner
head:   787c48e2339e09a361f608825a3512d489674602
commit: 32788ba923e3c67f77297e9db5968d6171b5b2c5 [3/6] rqspinlock: Track the owner while retaining byte release
config: i386-randconfig-2302-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161854.1jL5IjB7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161854.1jL5IjB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161854.1jL5IjB7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/rqspinlock.c:100:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned int * @@
   kernel/bpf/rqspinlock.c:100:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:100:17: sparse:     got unsigned int *
   kernel/bpf/rqspinlock.c:115:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:115:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:115:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:136:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:136:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:136:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:147:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:147:51: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:147:51: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:662:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:662:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:662:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:681:17: sparse: sparse: symbol 'bpf_res_spin_lock' was not declared. Should it be static?
   kernel/bpf/rqspinlock.c:697:18: sparse: sparse: symbol 'bpf_res_spin_unlock' was not declared. Should it be static?
   kernel/bpf/rqspinlock.c:703:17: sparse: sparse: symbol 'bpf_res_spin_lock_irqsave' was not declared. Should it be static?
   kernel/bpf/rqspinlock.c:722:18: sparse: sparse: symbol 'bpf_res_spin_unlock_irqrestore' was not declared. Should it be static?

vim +100 kernel/bpf/rqspinlock.c

    86	
    87	#if RQ_OWNER_BITS
    88	/*
    89	 * Fill in each CPU's owner value for the lock word. Per-CPU memory for every
    90	 * possible CPU exists from setup_per_cpu_areas() on, and an early initcall
    91	 * runs before secondary CPUs are brought up and before regular initcalls,
    92	 * including the BPF and locktorture users. Initialize the cache before use:
    93	 * the static initializer supplies CPU0's complete acquisition value.
    94	 */
    95	static int __init rqspinlock_init_owner(void)
    96	{
    97		int cpu;
    98	
    99		for_each_possible_cpu(cpu)
 > 100			per_cpu(rqspinlock_held_locks.owner, cpu) = (cpu << RQ_OWNER_OFFSET) | RQ_LOCKED_VAL;
   101		return 0;
   102	}
   103	early_initcall(rqspinlock_init_owner);
   104	#endif
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
