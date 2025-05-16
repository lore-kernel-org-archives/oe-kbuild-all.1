Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE6B19CCEA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747428208; cv=none; b=YT5Bjnqze1I2kGEO2gHkXgy/8exssbwhAcAh83+d9r+xq4pbX+LtPfakoz1NugQw3yY9evnMuq3Dz+TjYvlTtdXOF1rrQu2QDSZoozqYO7sT8/d4jyKhdDxa13fuEKIi8GQgbOhNvzPIDyQSc72ZnN2DJnT3n+LRhZ6fO3TwSLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747428208; c=relaxed/simple;
	bh=0iQ6viawjy83ioombBOEAA7MtDXvo8w8egXA94gHZPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b++0tm3tQ6uFmQ3Lz1Lne4Fbcs4ufsePR0umkSooJ6B1C0SIeKupYOxs3se0DxK/zY0gEOUOTj1pYrCR9OQ+JOP97kX0Hhgb94aFjbVTqgOffWDviCfQasNjvMxIuFWNS5Qb61Cb6UJBH5N5El4qRw55q3Mz7RI2VARMKkz+Dyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGXtxg0g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGXtxg0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747428206; x=1778964206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0iQ6viawjy83ioombBOEAA7MtDXvo8w8egXA94gHZPg=;
  b=WGXtxg0g362JGj0vkK7osiD/Cwo2JFUaRwgT5/l9L7ll0T0LiWXRXquk
   2XnB8NkxQTmsxJeePIdZvaV08t/Rs/K6fXfXOZDrq2i+uzmSe30y8bq/i
   vtIzxjz7RarCIEW40ulU0P1O3dbaMNJDuEhD6gFNWCNAt5+VQlE/3a18U
   ktbrRomv6iTN4iyXQTzy4bsBDUC0TbsojWfhZlV6EcR+3M1WO1EIuAfKE
   6uESafwSp8G0PPInB8yS8mRea5s3Fv9eXdqljAQiu/aBwUTsYbMA7nB2S
   u7gc9THCDTku8FhUoWXYrTFL03+ZDrPW6D1ZxQMw3div50CzJVLxaiinR
   A==;
X-CSE-ConnectionGUID: 0lgTRJoCR4O1M6cFQ8AC8w==
X-CSE-MsgGUID: l1j8fgksTlWnM2EBopr5Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60751708"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="60751708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 13:43:25 -0700
X-CSE-ConnectionGUID: cEjryotQR3SsEOPxN/Njfw==
X-CSE-MsgGUID: gydO+mXZS4qbOskiodC8TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="138705506"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2025 13:43:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG1tp-000Jh1-3A;
	Fri, 16 May 2025 20:43:21 +0000
Date: Sat, 17 May 2025 04:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next 18/33] drivers/char/random.c:1328:42: error:
 passing argument 2 of 'const_test_bit' from incompatible pointer type
Message-ID: <202505170454.YoR1hNoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next
head:   0577ced82818590ec7abe2f40119b340c1124a55
commit: bfbba7ffa299bfe3c5cb94b41ebf3a0c747d363c [18/33] random: optimize try_to_generate_entropy()
config: arm-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170454.YoR1hNoU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170454.YoR1hNoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170454.YoR1hNoU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2213,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
   drivers/char/random.c: In function 'try_to_generate_entropy':
>> include/linux/cpumask.h:122:28: warning: passing argument 3 of 'cpumask_any_and_but' makes integer from pointer without a cast [-Wint-conversion]
    #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
                              ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/random.c:1325:43: note: in expansion of macro 'cpu_online_mask'
         housekeeping_cpumask(HK_TYPE_TIMER), cpu_online_mask);
                                              ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:441:19: note: expected 'unsigned int' but argument is of type 'const struct cpumask *'
         unsigned int cpu)
         ~~~~~~~~~~~~~^~~
   In file included from include/linux/thread_info.h:27,
                    from include/linux/sched.h:14,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
>> drivers/char/random.c:1328:42: error: passing argument 2 of 'const_test_bit' from incompatible pointer type [-Werror=incompatible-pointer-types]
       else if (test_bit(smp_processor_id(), housekeeping_cpumask(HK_TYPE_TIMER)))
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:17: note: in definition of macro 'bitop'
      const##op(nr, addr) : op(nr, addr))
                    ^~~~
   drivers/char/random.c:1328:13: note: in expansion of macro 'test_bit'
       else if (test_bit(smp_processor_id(), housekeeping_cpumask(HK_TYPE_TIMER)))
                ^~~~~~~~
   In file included from include/linux/bitops.h:28,
                    from include/linux/thread_info.h:27,
                    from include/linux/sched.h:14,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
   include/asm-generic/bitops/generic-non-atomic.h:166:64: note: expected 'const volatile long unsigned int *' but argument is of type 'const struct cpumask *'
    const_test_bit(unsigned long nr, const volatile unsigned long *addr)
                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/thread_info.h:27,
                    from include/linux/sched.h:14,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
>> drivers/char/random.c:1328:42: error: passing argument 2 of 'generic_test_bit' from incompatible pointer type [-Werror=incompatible-pointer-types]
       else if (test_bit(smp_processor_id(), housekeeping_cpumask(HK_TYPE_TIMER)))
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      const##op(nr, addr) : op(nr, addr))
                                   ^~~~
   drivers/char/random.c:1328:13: note: in expansion of macro 'test_bit'
       else if (test_bit(smp_processor_id(), housekeeping_cpumask(HK_TYPE_TIMER)))
                ^~~~~~~~
   In file included from include/linux/bitops.h:28,
                    from include/linux/thread_info.h:27,
                    from include/linux/sched.h:14,
                    from include/linux/utsname.h:6,
                    from drivers/char/random.c:28:
   include/asm-generic/bitops/generic-non-atomic.h:121:66: note: expected 'const volatile long unsigned int *' but argument is of type 'const struct cpumask *'
    generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/const_test_bit +1328 drivers/char/random.c

  1285	
  1286	/*
  1287	 * If we have an actual cycle counter, see if we can generate enough entropy
  1288	 * with timing noise.
  1289	 */
  1290	static void __cold try_to_generate_entropy(void)
  1291	{
  1292		enum { NUM_TRIAL_SAMPLES = 8192, MAX_SAMPLES_PER_BIT = HZ / 15 };
  1293		u8 stack_bytes[sizeof(struct entropy_timer_state) + SMP_CACHE_BYTES - 1];
  1294		struct entropy_timer_state *stack = PTR_ALIGN((void *)stack_bytes, SMP_CACHE_BYTES);
  1295		unsigned int i, num_different = 0;
  1296		unsigned long last = random_get_entropy();
  1297		int cpu;
  1298	
  1299		for (i = 0; i < NUM_TRIAL_SAMPLES - 1; ++i) {
  1300			stack->entropy = random_get_entropy();
  1301			if (stack->entropy != last)
  1302				++num_different;
  1303			last = stack->entropy;
  1304		}
  1305		stack->samples_per_bit = DIV_ROUND_UP(NUM_TRIAL_SAMPLES, num_different + 1);
  1306		if (stack->samples_per_bit > MAX_SAMPLES_PER_BIT)
  1307			return;
  1308	
  1309		atomic_set(&stack->samples, 0);
  1310		timer_setup_on_stack(&stack->timer, entropy_timer, 0);
  1311		while (!crng_ready() && !signal_pending(current)) {
  1312			/*
  1313			 * Check !timer_pending() and then ensure that any previous callback has finished
  1314			 * executing by checking try_to_del_timer_sync(), before queueing the next one.
  1315			 */
  1316			if (!timer_pending(&stack->timer) && try_to_del_timer_sync(&stack->timer) >= 0) {
  1317				/*
  1318				 * Preemption must be disabled here, both to read the current CPU number
  1319				 * and to avoid scheduling a timer on a dead CPU.
  1320				 */
  1321				preempt_disable();
  1322	
  1323				/* Only schedule callbacks on timer CPUs that are online. */
  1324				cpu = cpumask_any_and_but(smp_processor_id(),
  1325						housekeeping_cpumask(HK_TYPE_TIMER), cpu_online_mask);
  1326				if (cpu < nr_cpu_ids)
  1327					/* fall through */ ;
> 1328				else if (test_bit(smp_processor_id(), housekeeping_cpumask(HK_TYPE_TIMER)))
  1329					cpu = smp_processor_id();
  1330				else
  1331					/*
  1332					 * In very bizarre case of misconfiguration,
  1333					 * fallback to all online.
  1334					 */
  1335					cpu = cpumask_first(cpu_online_mask);
  1336	
  1337				/* Expiring the timer at `jiffies` means it's the next tick. */
  1338				stack->timer.expires = jiffies;
  1339	
  1340				add_timer_on(&stack->timer, cpu);
  1341	
  1342				preempt_enable();
  1343			}
  1344			mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
  1345			schedule();
  1346			stack->entropy = random_get_entropy();
  1347		}
  1348		mix_pool_bytes(&stack->entropy, sizeof(stack->entropy));
  1349	
  1350		timer_delete_sync(&stack->timer);
  1351		destroy_timer_on_stack(&stack->timer);
  1352	}
  1353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
