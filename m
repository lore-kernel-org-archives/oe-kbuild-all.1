Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D635962
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 04:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614821; cv=none; b=tbSq8vqcQzLDnbgLnGx3PY+WS76XASd5Y/Tqoc3vZR3ahm9nyy7nbOuLCQtUsnjyaSePva4P0UwG/yYKTEOHVbGE6eh+8gVG/+VjMAw7nd9Im8HumXq+kqz9Rdbw3PMh2qCrilSHFKoiJI2kxsfiQWwBnMQAKyxnzi0Ddx5/r6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614821; c=relaxed/simple;
	bh=0A4g/1MOfX4UwcL8HXNHsZuJT5Xkj5EfrNbD+LHFIYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7UNO4XtVl9r9rkKRsJXgrtiOM7f2v8AnB0667hJTf7lBSE1Pyj8/M4kfOzxCnZMq4zmo54ZtLco9n9lWqGtctCa8s8YNsxW3yyGxxHulzVrUk5UKkgwxyEZjKOCsJgDGz1Y9P7fcNSSWnq0LiDxLzRNKz2qajk+R5bkdwahw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LtZiL8/7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LtZiL8/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749614819; x=1781150819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0A4g/1MOfX4UwcL8HXNHsZuJT5Xkj5EfrNbD+LHFIYw=;
  b=LtZiL8/7EAYAD1pLa3xjdGxX0j8mBZAIB18W3An050JTsrzQxSvbW2bg
   UbukEE1kBhvrQDMjKVnFXqg7q/y9OgQ1jgwjuJTUVakOQSZ35zmPQrhxO
   duqzkxu6E23HuPVRsG8BpOX1l5NIfRNiBiXxGHkuFi5latz+XgCriRSl1
   Y+kvsfk6mcbb+Yl2XT/35q5pAvwUeBRZhU+asvPxdvmH69IC7eWQNDyUX
   AguGFZInULnsnixowPc2hTlOU1G1qXTfJPCZtoS0vdstq1fDjcLXdysNM
   ZPDp+tGlXPTQfPc854Kd8afyx9n9GgdFK3rHR46knF2z3pdHgMWsDJ/Io
   g==;
X-CSE-ConnectionGUID: Xj2d9UPgSSaK7kM2/BGSHA==
X-CSE-MsgGUID: c0T0dWLaSn+a1TyEkpFcZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51735050"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51735050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 21:06:47 -0700
X-CSE-ConnectionGUID: nieh6O4LRPaa20xUHeYieA==
X-CSE-MsgGUID: WK5weQCLTDiyDEpu0/Unyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="147016812"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jun 2025 21:06:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPCjc-0009zo-0T;
	Wed, 11 Jun 2025 04:06:44 +0000
Date: Wed, 11 Jun 2025 12:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] random: use offstack cpumask when necessary
Message-ID: <202506111146.aZm5lzhz-lkp@intel.com>
References: <20250610092712.2641547-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092712.2641547-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc1 next-20250610]
[cannot apply to crng-random/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/random-use-offstack-cpumask-when-necessary/20250610-173051
base:   linus/master
patch link:    https://lore.kernel.org/r/20250610092712.2641547-1-arnd%40kernel.org
patch subject: [PATCH] random: use offstack cpumask when necessary
config: hexagon-randconfig-r051-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111146.aZm5lzhz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111146.aZm5lzhz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/random.c:1315:11-12: Unneeded semicolon

vim +1315 drivers/char/random.c

  1287	
  1288	/*
  1289	 * If we have an actual cycle counter, see if we can generate enough entropy
  1290	 * with timing noise.
  1291	 */
  1292	static void __cold try_to_generate_entropy(void)
  1293	{
  1294		enum { NUM_TRIAL_SAMPLES = 8192, MAX_SAMPLES_PER_BIT = HZ / 15 };
  1295		u8 stack_bytes[sizeof(struct entropy_timer_state) + SMP_CACHE_BYTES - 1];
  1296		struct entropy_timer_state *stack = PTR_ALIGN((void *)stack_bytes, SMP_CACHE_BYTES);
  1297		unsigned int i, num_different = 0;
  1298		unsigned long last = random_get_entropy();
  1299		cpumask_var_t timer_cpus;
  1300		int cpu = -1;
  1301	
  1302		for (i = 0; i < NUM_TRIAL_SAMPLES - 1; ++i) {
  1303			stack->entropy = random_get_entropy();
  1304			if (stack->entropy != last)
  1305				++num_different;
  1306			last = stack->entropy;
  1307		}
  1308		stack->samples_per_bit = DIV_ROUND_UP(NUM_TRIAL_SAMPLES, num_different + 1);
  1309		if (stack->samples_per_bit > MAX_SAMPLES_PER_BIT)
  1310			return;
  1311	
  1312		atomic_set(&stack->samples, 0);
  1313		timer_setup_on_stack(&stack->timer, entropy_timer, 0);
  1314		if (!alloc_cpumask_var(&timer_cpus, GFP_KERNEL))
> 1315			goto out;;
  1316	
  1317		while (!crng_ready() && !signal_pending(current)) {
  1318			/*
  1319			 * Check !timer_pending() and then ensure that any previous callback has finished
  1320			 * executing by checking timer_delete_sync_try(), before queueing the next one.
  1321			 */
  1322			if (!timer_pending(&stack->timer) && timer_delete_sync_try(&stack->timer) >= 0) {
  1323				unsigned int num_cpus;
  1324	
  1325				/*
  1326				 * Preemption must be disabled here, both to read the current CPU number
  1327				 * and to avoid scheduling a timer on a dead CPU.
  1328				 */
  1329				preempt_disable();
  1330	
  1331				/* Only schedule callbacks on timer CPUs that are online. */
  1332				cpumask_and(timer_cpus, housekeeping_cpumask(HK_TYPE_TIMER), cpu_online_mask);
  1333				num_cpus = cpumask_weight(timer_cpus);
  1334				/* In very bizarre case of misconfiguration, fallback to all online. */
  1335				if (unlikely(num_cpus == 0)) {
  1336					*timer_cpus = *cpu_online_mask;
  1337					num_cpus = cpumask_weight(timer_cpus);
  1338				}
  1339	
  1340				/* Basic CPU round-robin, which avoids the current CPU. */
  1341				do {
  1342					cpu = cpumask_next(cpu, timer_cpus);
  1343					if (cpu >= nr_cpu_ids)
  1344						cpu = cpumask_first(timer_cpus);
  1345				} while (cpu == smp_processor_id() && num_cpus > 1);
  1346	
  1347				/* Expiring the timer at `jiffies` means it's the next tick. */
  1348				stack->timer.expires = jiffies;
  1349	
  1350				add_timer_on(&stack->timer, cpu);
  1351	
  1352				preempt_enable();
  1353			}
  1354			mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
  1355			schedule();
  1356			stack->entropy = random_get_entropy();
  1357		}
  1358		mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
  1359	
  1360		free_cpumask_var(timer_cpus);
  1361	out:
  1362		timer_delete_sync(&stack->timer);
  1363		timer_destroy_on_stack(&stack->timer);
  1364	}
  1365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
