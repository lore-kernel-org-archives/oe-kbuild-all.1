Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3C2F37
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745264522; cv=none; b=r1FEBXQSWSB45SZITSALNxRy3VYVJp0s3nGRhx/kC/JsQwrq4srMoARdiQI6NOPWqEVGUwHdxyWGudv6lMQ//nmv2Ba72wKEI7jS4yUNbJ/Kkghi7yJTL7DALrTJbdmYlYZwxv59wJLIIAU4coxnqRgW7gYYlhyvP44vfUKHoHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745264522; c=relaxed/simple;
	bh=G9iW/i6JuTz3WeSZ2ldGXmi8HQkmlVGnkdk8NixhnVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GagyVMQGhQbaanKgzIf+UQsxsLgmd/PtIEB0lrw4hXe3xmrrVr+qmxZfR6tZcxiiE8ACQqOWQSzQBMHDz97+mgOuih7aHdlwzGa9lvQ5cg10WjlxPf3QU0KyEqWL8DIO2WUXDloMmCr8foXs3U6caVInvtDgx+gVVvktadMEu90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RV1G+M67; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RV1G+M67"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745264521; x=1776800521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G9iW/i6JuTz3WeSZ2ldGXmi8HQkmlVGnkdk8NixhnVg=;
  b=RV1G+M67jBmrZAkxcDO7ddYepPCgBzByKZDNbqyFcCUtzK0WMGgu4Xn8
   iYHYP/Np/lebixZAqLGoowFQUDcx4Zxu0taIA9DuMOktsHeWbE8AqiAmn
   iIzVnnqOeVx/GaPU7/0LQVp4ne3+dPlr58j23dMm2aCB/or0LkS94JIYM
   rZNzIe2Ks0EFFWe6FlXoENjfqTwbCNT8HCY/ckjz4FPMAdhVEdKZKoBCL
   sTo45cdNO4guAEyIBLItui2BugfJcEmr24EkbylsNL60FxgL5X7SIwu7Y
   Y9cdl57EBgWXsz9RTa6NTnpEEMd3tL6ftvI6oE53cQayRd1AB0f5SQLpZ
   A==;
X-CSE-ConnectionGUID: BMzTgfmwQbmj9/poEmc54w==
X-CSE-MsgGUID: LDP7I+q9Rkiyl4fMga+A/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46039092"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="46039092"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 12:41:59 -0700
X-CSE-ConnectionGUID: nyVoqCthRXOACtLKTzL22Q==
X-CSE-MsgGUID: bBX/lxvGQ9+J5ejYyrfFSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="154984212"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Apr 2025 12:41:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6x1g-0000Lz-0w;
	Mon, 21 Apr 2025 19:41:56 +0000
Date: Tue, 22 Apr 2025 03:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/5] sched: Cache aware load-balancing
Message-ID: <202504220301.VyLmHJcf-lkp@intel.com>
References: <391c48836585786ed32d66df9534366459684383.1745199017.git.yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <391c48836585786ed32d66df9534366459684383.1745199017.git.yu.c.chen@intel.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on akpm-mm/mm-everything peterz-queue/sched/core linus/master v6.15-rc3 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu/sched-Cache-aware-load-balancing/20250421-113804
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/391c48836585786ed32d66df9534366459684383.1745199017.git.yu.c.chen%40intel.com
patch subject: [RFC PATCH 1/5] sched: Cache aware load-balancing
config: alpha-randconfig-r121-20250421 (https://download.01.org/0day-ci/archive/20250422/202504220301.VyLmHJcf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250422/202504220301.VyLmHJcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220301.VyLmHJcf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function '__update_mm_sched':
>> kernel/sched/fair.c:1217:34: warning: division by zero [-Wdiv-by-zero]
      n = (delta + EPOCH_PERIOD - 1) / EPOCH_PERIOD;
                                     ^
   In file included from include/asm-generic/percpu.h:7,
                    from arch/alpha/include/asm/percpu.h:17,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2217,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/energy_model.h:5,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'task_cache_work':
   kernel/sched/fair.c:1321:38: error: 'sd_llc' undeclared (first use in this function); did you mean 'd_alloc'?
       struct sched_domain *sd = per_cpu(sd_llc, cpu);
                                         ^~~~~~
   include/linux/percpu-defs.h:220:47: note: in definition of macro '__verify_pcpu_ptr'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                  ^~~
   include/linux/percpu-defs.h:272:29: note: in expansion of macro 'per_cpu_ptr'
    #define per_cpu(var, cpu) (*per_cpu_ptr(&(var), cpu))
                                ^~~~~~~~~~~
   kernel/sched/fair.c:1321:30: note: in expansion of macro 'per_cpu'
       struct sched_domain *sd = per_cpu(sd_llc, cpu);
                                 ^~~~~~~
   kernel/sched/fair.c:1321:38: note: each undeclared identifier is reported only once for each function it appears in
       struct sched_domain *sd = per_cpu(sd_llc, cpu);
                                         ^~~~~~
   include/linux/percpu-defs.h:220:47: note: in definition of macro '__verify_pcpu_ptr'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                  ^~~
   include/linux/percpu-defs.h:272:29: note: in expansion of macro 'per_cpu_ptr'
    #define per_cpu(var, cpu) (*per_cpu_ptr(&(var), cpu))
                                ^~~~~~~~~~~
   kernel/sched/fair.c:1321:30: note: in expansion of macro 'per_cpu'
       struct sched_domain *sd = per_cpu(sd_llc, cpu);
                                 ^~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c:1325:20: error: implicit declaration of function 'sched_domain_span'; did you mean 'perf_domain_span'? [-Werror=implicit-function-declaration]
       for_each_cpu(i, sched_domain_span(sd)) {
                       ^~~~~~~~~~~~~~~~~
   include/linux/find.h:586:41: note: in definition of macro 'for_each_set_bit'
     for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                            ^~~~
   include/linux/cpumask.h:333:24: note: in expansion of macro 'cpumask_bits'
     for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
                           ^~~~~~~~~~~~
   kernel/sched/fair.c:1325:4: note: in expansion of macro 'for_each_cpu'
       for_each_cpu(i, sched_domain_span(sd)) {
       ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/find.h:586:41: note: in definition of macro 'for_each_set_bit'
     for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                            ^~~~
   include/linux/cpumask.h:333:24: note: in expansion of macro 'cpumask_bits'
     for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
                           ^~~~~~~~~~~~
   kernel/sched/fair.c:1325:4: note: in expansion of macro 'for_each_cpu'
       for_each_cpu(i, sched_domain_span(sd)) {
       ^~~~~~~~~~~~
   include/linux/find.h:586:62: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                                                 ^
   include/linux/cpumask.h:333:2: note: in expansion of macro 'for_each_set_bit'
     for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:1325:4: note: in expansion of macro 'for_each_cpu'
       for_each_cpu(i, sched_domain_span(sd)) {
       ^~~~~~~~~~~~
   In file included from include/asm-generic/percpu.h:7,
                    from arch/alpha/include/asm/percpu.h:17,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/sched.h:2217,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/energy_model.h:5,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c:1335:19: error: 'sd_llc_id' undeclared (first use in this function)
              per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
                      ^~~~~~~~~
   include/linux/percpu-defs.h:220:47: note: in definition of macro '__verify_pcpu_ptr'
     const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL; \
                                                  ^~~
   include/linux/percpu-defs.h:272:29: note: in expansion of macro 'per_cpu_ptr'
    #define per_cpu(var, cpu) (*per_cpu_ptr(&(var), cpu))
                                ^~~~~~~~~~~
   kernel/sched/fair.c:1335:11: note: in expansion of macro 'per_cpu'
              per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
              ^~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:


vim +1217 kernel/sched/fair.c

  1208	
  1209	static inline void __update_mm_sched(struct rq *rq, struct mm_sched *pcpu_sched)
  1210	{
  1211		lockdep_assert_held(&rq->cpu_epoch_lock);
  1212	
  1213		unsigned long n, now = jiffies;
  1214		long delta = now - rq->cpu_epoch_next;
  1215	
  1216		if (delta > 0) {
> 1217			n = (delta + EPOCH_PERIOD - 1) / EPOCH_PERIOD;
  1218			rq->cpu_epoch += n;
  1219			rq->cpu_epoch_next += n * EPOCH_PERIOD;
  1220			__shr_u64(&rq->cpu_runtime, n);
  1221		}
  1222	
  1223		n = rq->cpu_epoch - pcpu_sched->epoch;
  1224		if (n) {
  1225			pcpu_sched->epoch += n;
  1226			__shr_u64(&pcpu_sched->runtime, n);
  1227		}
  1228	}
  1229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
