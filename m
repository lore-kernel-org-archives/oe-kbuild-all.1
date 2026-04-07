Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475783AB292
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559568; cv=none; b=pqJvCD2cVoywrDJNtmR9f5wv1eFprCcTT18mVr0NdBfRlghPHW15a+X8p9wgmiGaKRVt0IvzFXgvgMNtMFtRZCVkeYwFS98hnLweN4Cv9YdEtMnMPX8ALhdRVGcDm+k/np8WLTmhzlkkPQy2je7mGSky5OkFNBPY3pZFSUXyung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559568; c=relaxed/simple;
	bh=A5+HBBcTqKVlknTZzZiKwpBu2B7h1Df/ai/jWJL5K6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tCGdv3gNJzq2vNu5u7TySC7MZKXQAkjYRftTOHC5rsPl+G/uOwXhanH/4iQjcX+iZNsAEXw4xp9RObmz6nKz8FklHod1TZ6EF1C6dJdHo3sGVm1CX6trHx3jTGvUU30oCpgk93cKbHwCCvkrEluFpzKgHVwsSs8Kcxe1GkSQp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkxqrQhq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkxqrQhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775559566; x=1807095566;
  h=date:from:to:cc:subject:message-id;
  bh=A5+HBBcTqKVlknTZzZiKwpBu2B7h1Df/ai/jWJL5K6Q=;
  b=PkxqrQhqVe1lgvo6XqeOzJWaHsrRhEYuL2jdvizU1V7BB3vttRrm3fk3
   SxeK/Zi8r0Om/vwsSwVLvV/FSH6OmPjdSOt4l1s4fhqlDwjvID37t+fEB
   kAPUpdNiiYdn2KLWdeR7yPMS75i2EqzYICTxwH4A++qiAgtX760uVswbh
   yTbuRfwxwLF/u8NFVAJtLf1tFB4GCOupBIbnIbvds7c9edPusF6NHLZ9X
   ATRxVagNEXKIMqjz2TSHbP8TMGv1wX0gAeMNrNAYRTD4jlIxMRWqRqMTm
   OLmXwwFBjzjkyvNa5DJDg5y5I5EwWopqa8UwRL6uWSTYUlpJJS0XWF3Eb
   Q==;
X-CSE-ConnectionGUID: NHDvsZX3QB+S4NfMfCj7Kg==
X-CSE-MsgGUID: EE1DgRqxQjOvHX8zQIOi0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80377563"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80377563"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:59:25 -0700
X-CSE-ConnectionGUID: ZCPKOjEMRFS5IeRJFd94Jw==
X-CSE-MsgGUID: HkahhJgqTXavTFYgNBtOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223350015"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2026 03:59:23 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA49R-000000000VC-0fXR;
	Tue, 07 Apr 2026 10:59:21 +0000
Date: Tue, 07 Apr 2026 18:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:assert 6/6] drivers/acpi/acpi_pad.c:88:8: error:
 unknown type name 'cpumask'; did you mean 'cpumask_t'?
Message-ID: <202604071800.JGAqypQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux assert
head:   5e88fbeeb3c7355139ca86067d68ea8c77534b92
commit: 5e88fbeeb3c7355139ca86067d68ea8c77534b92 [6/6] acpi_pad
config: i386-randconfig-002-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071800.JGAqypQy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071800.JGAqypQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071800.JGAqypQy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/acpi/acpi_pad.c:88:8: error: unknown type name 'cpumask'; did you mean 'cpumask_t'?
      88 | static cpumask pad_busy_cpus;
         |        ^~~~~~~
         |        cpumask_t
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from drivers/acpi/acpi_pad.c:9:
   drivers/acpi/acpi_pad.c: In function 'round_robin_cpu':
>> include/linux/cpumask_types.h:18:37: error: request for member 'bits' in something not a structure or union
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:584:48: note: in definition of macro 'for_each_set_bit'
     584 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:380:31: note: in expansion of macro 'cpumask_bits'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   drivers/acpi/acpi_pad.c:102:9: note: in expansion of macro 'for_each_cpu'
     102 |         for_each_cpu(cpu, &pad_busy_cpus)
         |         ^~~~~~~~~~~~
   include/linux/find.h:584:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     584 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:380:9: note: in expansion of macro 'for_each_set_bit'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   drivers/acpi/acpi_pad.c:102:9: note: in expansion of macro 'for_each_cpu'
     102 |         for_each_cpu(cpu, &pad_busy_cpus)
         |         ^~~~~~~~~~~~
>> drivers/acpi/acpi_pad.c:107:54: error: passing argument 3 of 'cpumask_andnot' from incompatible pointer type [-Wincompatible-pointer-types]
     107 |                 cpumask_andnot(tmp, cpu_online_mask, &pad_busy_cpus);
         |                                                      ^~~~~~~~~~~~~~
         |                                                      |
         |                                                      int *
   include/linux/cpumask.h:774:43: note: expected 'const struct cpumask *' but argument is of type 'int *'
     774 |                     const struct cpumask *src2p)
         |                     ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/acpi/acpi_pad.c:121:58: error: passing argument 2 of 'cpumask_clear_cpu' from incompatible pointer type [-Wincompatible-pointer-types]
     121 |                 cpumask_clear_cpu(tsk_in_cpu[tsk_index], &pad_busy_cpus);
         |                                                          ^~~~~~~~~~~~~~
         |                                                          |
         |                                                          int *
   include/linux/cpumask.h:629:72: note: expected 'struct cpumask *' but argument is of type 'int *'
     629 | static __always_inline void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
         |                                                        ~~~~~~~~~~~~~~~~^~~~
>> drivers/acpi/acpi_pad.c:123:40: error: passing argument 2 of 'cpumask_set_cpu' from incompatible pointer type [-Wincompatible-pointer-types]
     123 |         cpumask_set_cpu(preferred_cpu, &pad_busy_cpus);
         |                                        ^~~~~~~~~~~~~~
         |                                        |
         |                                        int *
   include/linux/cpumask.h:600:56: note: expected 'struct cpumask *' but argument is of type 'int *'
     600 | void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
         |                                        ~~~~~~~~~~~~~~~~^~~~
   drivers/acpi/acpi_pad.c: In function 'exit_round_robin':
   drivers/acpi/acpi_pad.c:135:58: error: passing argument 2 of 'cpumask_clear_cpu' from incompatible pointer type [-Wincompatible-pointer-types]
     135 |                 cpumask_clear_cpu(tsk_in_cpu[tsk_index], &pad_busy_cpus);
         |                                                          ^~~~~~~~~~~~~~
         |                                                          |
         |                                                          int *
   include/linux/cpumask.h:629:72: note: expected 'struct cpumask *' but argument is of type 'int *'
     629 | static __always_inline void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
         |                                                        ~~~~~~~~~~~~~~~~^~~~
   drivers/acpi/acpi_pad.c: In function 'idlecpus_show':
>> drivers/acpi/acpi_pad.c:335:52: error: 'pad_busy_cpus_bits' undeclared (first use in this function); did you mean 'pad_busy_cpus'?
     335 |         return cpumap_print_to_pagebuf(false, buf, pad_busy_cpus_bits);
         |                                                    ^~~~~~~~~~~~~~~~~~
         |                                                    pad_busy_cpus
   drivers/acpi/acpi_pad.c:335:52: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/acpi/acpi_pad.c:336:1: warning: control reaches end of non-void function [-Wreturn-type]
     336 | }
         | ^


vim +88 drivers/acpi/acpi_pad.c

    85	
    86	static unsigned long cpu_weight[NR_CPUS];
    87	static int tsk_in_cpu[NR_CPUS] = {[0 ... NR_CPUS-1] = -1};
  > 88	static cpumask pad_busy_cpus;
    89	
    90	static void round_robin_cpu(unsigned int tsk_index)
    91	{
    92		cpumask_var_t tmp;
    93		int cpu;
    94		unsigned long min_weight = -1;
    95		unsigned long preferred_cpu;
    96	
    97		if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
    98			return;
    99	
   100		mutex_lock(&round_robin_lock);
   101		cpumask_clear(tmp);
   102		for_each_cpu(cpu, &pad_busy_cpus)
   103			cpumask_or(tmp, tmp, topology_sibling_cpumask(cpu));
   104		cpumask_andnot(tmp, cpu_online_mask, tmp);
   105		/* avoid HT siblings if possible */
   106		if (cpumask_empty(tmp))
 > 107			cpumask_andnot(tmp, cpu_online_mask, &pad_busy_cpus);
   108		if (cpumask_empty(tmp)) {
   109			mutex_unlock(&round_robin_lock);
   110			free_cpumask_var(tmp);
   111			return;
   112		}
   113		for_each_cpu(cpu, tmp) {
   114			if (cpu_weight[cpu] < min_weight) {
   115				min_weight = cpu_weight[cpu];
   116				preferred_cpu = cpu;
   117			}
   118		}
   119	
   120		if (tsk_in_cpu[tsk_index] != -1)
 > 121			cpumask_clear_cpu(tsk_in_cpu[tsk_index], &pad_busy_cpus);
   122		tsk_in_cpu[tsk_index] = preferred_cpu;
 > 123		cpumask_set_cpu(preferred_cpu, &pad_busy_cpus);
   124		cpu_weight[preferred_cpu]++;
   125		mutex_unlock(&round_robin_lock);
   126	
   127		set_cpus_allowed_ptr(current, cpumask_of(preferred_cpu));
   128	
   129		free_cpumask_var(tmp);
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
