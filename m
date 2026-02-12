Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54F3EBF31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 03:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866825; cv=none; b=d0606rDjO6G+cnoFogEN2/1fdgfdoYBj3z21AjN7QXmTYew26HKiXrPANE2w2m7B0CSo03w7YRmMm5TTk9j9HUTTt+SyfVhiW8IFHkwKrSD5TiKmvH4hJV+J7pGSEiaPQoABLytXnwYSQwWn/dfxUoR7a6o8rpm/TCRwNyIbNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866825; c=relaxed/simple;
	bh=rz/gz3gQoWerIXlGgSDlkyQuXqqDGVCNBVvJYQ5Nsfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nl/i/1BZ86tb0WXb66KnTwu+pGwTZIyShAIOvD0xvZTPKrD8O4GdtAL1QWE4YcuqBCKQ2RgAW5mCKYPT4BJw3bJd4AFuTjJUpq1qEPd3yR+V+tfdvxlJCdVVMUbuQmdOPNmesXgnyRRh23lmxfJUJZhyU+fSA594nhJTUz7xgL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVkfoeqp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVkfoeqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770866824; x=1802402824;
  h=date:from:to:cc:subject:message-id;
  bh=rz/gz3gQoWerIXlGgSDlkyQuXqqDGVCNBVvJYQ5Nsfc=;
  b=gVkfoeqpN0eM8+8nEm0cYmZRH8c9fyYrq1w/6Tyl4f+5odunckDFhfm2
   evXu+i688ugm/c5vERkOX6zhELF7ozZina30uRLN7N7yEYOZZiae4NRqX
   WMPLzKShJDt8XOGt32pWy2gFn6HC54kP5OI/ihM3G2oMiqTFL0o79+Sz0
   LpjjPPa0jkm6thZB7r7gX0hwntXom6kS+1KnAiQFRT04R4o5sSYGx2CGm
   DD1e3bfOB6epqh33Dycx6kl9/gIji1iFZowSUvw9dCTvsWJjfyRSfdKqN
   p8Uwtc1wfedIZttBEoMXpQZ7BydTnbCTp1zMqeXYa9HFZQfFwNeYhcGpM
   A==;
X-CSE-ConnectionGUID: 4628n6t2Q1yiRRbOXEGC8w==
X-CSE-MsgGUID: Rij4xmAyTnCwrLt+saW/gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71234634"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71234634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 19:27:03 -0800
X-CSE-ConnectionGUID: aoA87KUWQ4my0C83DmdV2g==
X-CSE-MsgGUID: 5ixxoxrgSVeLlHqrC2j03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="212559279"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2026 19:27:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqNM3-00000000qbd-16vT;
	Thu, 12 Feb 2026 03:26:59 +0000
Date: Thu, 12 Feb 2026 11:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 7/7]
 kernel/sched/fair.c:290:undefined reference to `__aeabi_uldivmod'
Message-ID: <202602121142.Uey70p22-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   84230c0ac1cf76372e5558aeb30d65ff679aa0d6
commit: 84230c0ac1cf76372e5558aeb30d65ff679aa0d6 [7/7] sched/fair: Use full weight to __calc_delta()
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20260212/202602121142.Uey70p22-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121142.Uey70p22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121142.Uey70p22-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/sched/fair.o: in function `__calc_delta':
>> kernel/sched/fair.c:290:(.text+0x10e8): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: kernel/sched/fair.c:290:(.text+0x21a4): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.c:290:(.text+0x21c8): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.c:290:(.text+0x2314): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.c:290:(.text+0x4824): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.o:kernel/sched/fair.c:290: more undefined references to `__aeabi_uldivmod' follow


vim +290 kernel/sched/fair.c

   248	
   249	/*
   250	 * delta_exec * weight / lw.weight
   251	 *   OR
   252	 * (delta_exec * (weight * lw->inv_weight)) >> WMULT_SHIFT
   253	 *
   254	 * Either weight := NICE_0_LOAD and lw \e sched_prio_to_wmult[], in which case
   255	 * we're guaranteed shift stays positive because inv_weight is guaranteed to
   256	 * fit 32 bits, and NICE_0_LOAD gives another 10 bits; therefore shift >= 22.
   257	 *
   258	 * Or, weight =< lw.weight (because lw.weight is the runqueue weight), thus
   259	 * weight/lw.weight <= 1, and therefore our shift will also be positive.
   260	 */
   261	static u64 __calc_delta(u64 delta_exec, unsigned long weight, struct load_weight *lw)
   262	{
   263		u64 fact = scale_load_down(weight);
   264		u32 fact_hi = (u32)(fact >> 32);
   265		int shift = WMULT_SHIFT;
   266		int fs;
   267	
   268		__update_inv_weight(lw);
   269	
   270		if (unlikely(fact_hi)) {
   271			fs = fls(fact_hi);
   272			shift -= fs;
   273			fact >>= fs;
   274		}
   275	
   276		fact = mul_u32_u32(fact, lw->inv_weight);
   277	
   278		fact_hi = (u32)(fact >> 32);
   279		if (fact_hi) {
   280			fs = fls(fact_hi);
   281			shift -= fs;
   282			fact >>= fs;
   283		}
   284	
   285		return mul_u64_u32_shr(delta_exec, fact, shift);
   286	}
   287	#else
   288	static u64 __calc_delta(u64 delta_exec, unsigned long weight, struct load_weight *lw)
   289	{
 > 290		return (delta_exec * weight) / lw->weight;
   291	}
   292	#endif
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
