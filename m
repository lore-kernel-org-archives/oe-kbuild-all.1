Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D4C431E7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949130; cv=none; b=QuYD+V1AXTj9H9mArgm5M4wUqEHKIIJF0ppsh52CLXf9LkUTEZD/xCFACYRan18s/gShrE2lWpHAUYh4eTC8HTYXQN2BgxMZgxcGF0rsvqkb7vZnah+LqayzEHiKDMZYU8+d9Tgb0HP5XMF01GaG3PPkU1LLROFyQ/tHc33HHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949130; c=relaxed/simple;
	bh=tSLWyN7+lJVpEo7KvS3iMv2BrRpQzFAXg5ewtB8DkfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CWlMb1r6tY7jw+KFNglLdOVhjMQ+g7E+hWe3jCzHtumzCGcW2VZuHvzWJUwSQB+FmaoEJBLaWs2HdwyfR+XP0r7V/A+Fw8XygPZwA0s8ybj47DK5e1zBhqUkEwXrnakzNko9BhO6NYSUp9PRu0ANNDBvePIIy9C9+PfXdGc/EEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThqpG/Hj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThqpG/Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783949127; x=1815485127;
  h=date:from:to:cc:subject:message-id;
  bh=tSLWyN7+lJVpEo7KvS3iMv2BrRpQzFAXg5ewtB8DkfE=;
  b=ThqpG/HjvqOowOiJYBWNcPywRMnfep1HJcJnon7i+J+4EqUZdE8bVV9h
   vqv69NpprCD1vpZ5nVTLiY8bt+vWfo9nv8wxTxkVxua8WUsyT5/Q7/dTb
   ovtUnFhwCdn3SLTO8tJu1SwuHOrUFJzZiDgnPQpsWmF7dSW6o5hcy3ruy
   mgtMUGxwFrCMbt3Q9N/4u9L7otMmzcjS6k7m/tyq0vCuPz2JK5bX7KUjn
   0zV1t2LQ12rOGJytrJyv9hnB08N+esrvRWrq+VB9Y/mXrnRLqq9Rxvv0N
   ZKrbbWL1StbAhjPYX4JaLs1AaHvclLDtYq73OpiKatKidgt8ohimIbIDy
   Q==;
X-CSE-ConnectionGUID: 4zppD+RNSPO6K2eK749cog==
X-CSE-MsgGUID: Aj/g5hArRnG5x0LabPkqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83535562"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83535562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 06:25:20 -0700
X-CSE-ConnectionGUID: zy1pjxe6Tc25bbIPHVFNPw==
X-CSE-MsgGUID: h6soM2OAQGS2edgvevMICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259136815"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Jul 2026 06:25:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjGeq-00000000Lif-0ECJ;
	Mon, 13 Jul 2026 13:25:16 +0000
Date: Mon, 13 Jul 2026 21:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 22/59]
 arch/x86/kernel/apm_32.c:957:17: error: implicit declaration of function
 'default_idle'; did you mean 'default_gfp'?
Message-ID: <202607132109.MhqdwW4x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 5d4d9accd52166913ded860e2bb84076340e3d1a [22/59] x86/idle: Move idle declarations out of processor.h
config: i386-randconfig-141-20260713 (https://download.01.org/0day-ci/archive/20260713/202607132109.MhqdwW4x-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607132109.MhqdwW4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607132109.MhqdwW4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/apm_32.c: In function 'apm_cpu_idle':
>> arch/x86/kernel/apm_32.c:957:17: error: implicit declaration of function 'default_idle'; did you mean 'default_gfp'? [-Wimplicit-function-declaration]
     957 |                 default_idle();
         |                 ^~~~~~~~~~~~
         |                 default_gfp


vim +957 arch/x86/kernel/apm_32.c

^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  891  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  892  /**
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  893   * apm_cpu_idle		-	cpu idling for APM capable Linux
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  894   *
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  895   * This is the idling function the kernel executes when APM is available. It
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  896   * tries to do BIOS powermanagement based on the average system idle time.
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  897   * Furthermore it calls the system default idle routine.
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  898   */
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  899  
dd8af076262cc1 arch/x86/kernel/apm_32.c Len Brown           2013-02-09  900  static int apm_cpu_idle(struct cpuidle_device *dev,
dd8af076262cc1 arch/x86/kernel/apm_32.c Len Brown           2013-02-09  901  	struct cpuidle_driver *drv, int index)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  902  {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  903  	static int use_apm_idle; /* = 0 */
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  904  	static unsigned int last_jiffies; /* = 0 */
f7dcd63de44219 arch/x86/kernel/apm_32.c Frederic Weisbecker 2017-01-31  905  	static u64 last_stime; /* = 0 */
f7dcd63de44219 arch/x86/kernel/apm_32.c Frederic Weisbecker 2017-01-31  906  	u64 stime, utime;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  907  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  908  	int apm_idle_done = 0;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  909  	unsigned int jiffies_since_last_check = jiffies - last_jiffies;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  910  	unsigned int bucket;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  911  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  912  recalc:
f7dcd63de44219 arch/x86/kernel/apm_32.c Frederic Weisbecker 2017-01-31  913  	task_cputime(current, &utime, &stime);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  914  	if (jiffies_since_last_check > IDLE_CALC_LIMIT) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  915  		use_apm_idle = 0;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  916  	} else if (jiffies_since_last_check > idle_period) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  917  		unsigned int idle_percentage;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  918  
f7dcd63de44219 arch/x86/kernel/apm_32.c Frederic Weisbecker 2017-01-31  919  		idle_percentage = nsecs_to_jiffies(stime - last_stime);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  920  		idle_percentage *= 100;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  921  		idle_percentage /= jiffies_since_last_check;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  922  		use_apm_idle = (idle_percentage > idle_threshold);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  923  		if (apm_info.forbid_idle)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  924  			use_apm_idle = 0;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  925  	}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  926  
6fac4829ce0ef9 arch/x86/kernel/apm_32.c Frederic Weisbecker 2012-11-13  927  	last_jiffies = jiffies;
6fac4829ce0ef9 arch/x86/kernel/apm_32.c Frederic Weisbecker 2012-11-13  928  	last_stime = stime;
6fac4829ce0ef9 arch/x86/kernel/apm_32.c Frederic Weisbecker 2012-11-13  929  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  930  	bucket = IDLE_LEAKY_MAX;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  931  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  932  	while (!need_resched()) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  933  		if (use_apm_idle) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  934  			unsigned int t;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  935  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  936  			t = jiffies;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  937  			switch (apm_do_idle()) {
3f4380a1e0ea44 arch/x86/kernel/apm_32.c Cyrill Gorcunov     2008-01-30  938  			case 0:
3f4380a1e0ea44 arch/x86/kernel/apm_32.c Cyrill Gorcunov     2008-01-30  939  				apm_idle_done = 1;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  940  				if (t != jiffies) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  941  					if (bucket) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  942  						bucket = IDLE_LEAKY_MAX;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  943  						continue;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  944  					}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  945  				} else if (bucket) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  946  					bucket--;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  947  					continue;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  948  				}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  949  				break;
3f4380a1e0ea44 arch/x86/kernel/apm_32.c Cyrill Gorcunov     2008-01-30  950  			case 1:
3f4380a1e0ea44 arch/x86/kernel/apm_32.c Cyrill Gorcunov     2008-01-30  951  				apm_idle_done = 1;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  952  				break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  953  			default: /* BIOS refused */
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  954  				break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  955  			}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  956  		}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16 @957  		default_idle();
7f424a8b08c26d arch/x86/kernel/apm_32.c Peter Zijlstra      2008-04-25  958  		local_irq_disable();
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  959  		jiffies_since_last_check = jiffies - last_jiffies;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  960  		if (jiffies_since_last_check > idle_period)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  961  			goto recalc;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  962  	}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  963  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  964  	if (apm_idle_done)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  965  		apm_do_busy();
7f424a8b08c26d arch/x86/kernel/apm_32.c Peter Zijlstra      2008-04-25  966  
dd8af076262cc1 arch/x86/kernel/apm_32.c Len Brown           2013-02-09  967  	return index;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  968  }
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds      2005-04-16  969  

:::::: The code at line 957 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
