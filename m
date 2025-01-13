Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7CB235BF4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761584; cv=none; b=jfwE9ZmxVjzGOBRbg819hcF7OpwBjbQE+h/exJDE1tCJ5pytR1zudQTltlbJq7XpYqqUsmyRCWUXRLmq9IVqD+n/blgDs1IzahO4qNCGHGTwyQKrudDm0CTDorPb4qQqurHp6XJEx3/NQU+ERx6lJQJqUbDxc+It7QVETdtSiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761584; c=relaxed/simple;
	bh=QnUy8FgJKbQpdYO/TeQfbe4CM9tjYs+hN0rNTpQ0MiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Il4lGLljdoORIFUmNdnhxP97FYzneX2PQ/dhZHrv7QGsu2HQboLwXpecuqF0dtYhuw65J2YvW7NnQ8+GZjDXHDW5nDFS+/iSNlSS3Rqz/FWZuV7TfHVW6nAzS4thhoeKrKtaEAWWEmsK070nFn/xsd5LUrRP1oYrQi4h4qMLkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhFj6ktD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhFj6ktD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736761582; x=1768297582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QnUy8FgJKbQpdYO/TeQfbe4CM9tjYs+hN0rNTpQ0MiY=;
  b=YhFj6ktDSWw0RPK3LdxmQuPob6mHcysSQJHxN1j6wzC8e7guMVxfRMcG
   M8sX26r/2OdpIHZNvO8sPWqBklJf8qwmSuV1z2jfpN2R+FX0OUImQKbrp
   fAtgejFiSdghS6DQMHjavhb+eeSoHMBAvIVQ2eVUU/xe6sYFuA9QJpIl4
   LjhjrtFp1wiv6yLcSkSO/D8hZg42jXyvNba0xqFRLdopMFCTqiTKBCYvz
   022IMYXNaLgzTQslpgaZCXNCAvu7o5Ce0nsA0cTRqRGaTgyv/52iE41TH
   OEH3PuQW/iJuOHxkccFMcPSeb3qV/cB9P5mCXSASFszjv66Hyn8vUrhHX
   w==;
X-CSE-ConnectionGUID: IU4JLjLHQrOuOOBYFU4LQA==
X-CSE-MsgGUID: 521+2YDCT6qFYlTL0L0LlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36895772"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36895772"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:46:22 -0800
X-CSE-ConnectionGUID: AMhkiDkERU6DiDPPB5E7UQ==
X-CSE-MsgGUID: srGZI3elQCWQK4Qlv9/Z4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104933148"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2025 01:46:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXH1W-000MyR-0m;
	Mon, 13 Jan 2025 09:46:18 +0000
Date: Mon, 13 Jan 2025 17:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] cpumask: Implement "random" version of
 cpumask_any_but()
Message-ID: <202501131732.I9VU5v0r-lkp@intel.com>
References: <20250113061839.22131-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113061839.22131-1-richard120310@gmail.com>

Hi Hsin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc7 next-20250113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/I-Hsin-Cheng/cpumask-Implement-random-version-of-cpumask_any_but/20250113-142111
base:   linus/master
patch link:    https://lore.kernel.org/r/20250113061839.22131-1-richard120310%40gmail.com
patch subject: [RFC PATCH] cpumask: Implement "random" version of cpumask_any_but()
config: i386-buildonly-randconfig-002-20250113 (https://download.01.org/0day-ci/archive/20250113/202501131732.I9VU5v0r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131732.I9VU5v0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131732.I9VU5v0r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/cpumask.h: In function 'cpumask_any_but':
>> include/linux/cpumask.h:407:18: error: implicit declaration of function 'cpumask_weight'; did you mean 'cpumask_next'? [-Werror=implicit-function-declaration]
     407 |         weight = cpumask_weight(mask);
         |                  ^~~~~~~~~~~~~~
         |                  cpumask_next
>> include/linux/cpumask.h:408:13: error: implicit declaration of function 'get_random_u32' [-Werror=implicit-function-declaration]
     408 |         n = get_random_u32() % weight;
         |             ^~~~~~~~~~~~~~
>> include/linux/cpumask.h:415:13: error: implicit declaration of function 'cpumask_nth'; did you mean 'cpumask_next'? [-Werror=implicit-function-declaration]
     415 |         i = cpumask_nth(n, mask);
         |             ^~~~~~~~~~~
         |             cpumask_next
   include/linux/cpumask.h: At top level:
>> include/linux/cpumask.h:450:14: error: conflicting types for 'cpumask_nth'; have 'unsigned int(unsigned int,  const struct cpumask *)'
     450 | unsigned int cpumask_nth(unsigned int cpu, const struct cpumask *srcp)
         |              ^~~~~~~~~~~
   include/linux/cpumask.h:415:13: note: previous implicit declaration of 'cpumask_nth' with type 'int()'
     415 |         i = cpumask_nth(n, mask);
         |             ^~~~~~~~~~~
>> include/linux/cpumask.h:779:37: error: conflicting types for 'cpumask_weight'; have 'unsigned int(const struct cpumask *)'
     779 | static __always_inline unsigned int cpumask_weight(const struct cpumask *srcp)
         |                                     ^~~~~~~~~~~~~~
   include/linux/cpumask.h:407:18: note: previous implicit declaration of 'cpumask_weight' with type 'int()'
     407 |         weight = cpumask_weight(mask);
         |                  ^~~~~~~~~~~~~~
   In file included from include/linux/nodemask.h:98,
                    from include/linux/mmzone.h:18,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17:
>> include/linux/random.h:42:5: error: conflicting types for 'get_random_u32'; have 'u32(void)' {aka 'unsigned int(void)'}
      42 | u32 get_random_u32(void);
         |     ^~~~~~~~~~~~~~
   include/linux/cpumask.h:408:13: note: previous implicit declaration of 'get_random_u32' with type 'int()'
     408 |         n = get_random_u32() % weight;
         |             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3780167214
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=3780167214
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3780167214
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3780167214
   make: Target 'prepare' not remade because of errors.


vim +407 include/linux/cpumask.h

   317	
   318	/**
   319	 * for_each_cpu_wrap - iterate over every cpu in a mask, starting at a specified location
   320	 * @cpu: the (optionally unsigned) integer iterator
   321	 * @mask: the cpumask pointer
   322	 * @start: the start location
   323	 *
   324	 * The implementation does not assume any bit in @mask is set (including @start).
   325	 *
   326	 * After the loop, cpu is >= nr_cpu_ids.
   327	 */
   328	#define for_each_cpu_wrap(cpu, mask, start)				\
   329		for_each_set_bit_wrap(cpu, cpumask_bits(mask), small_cpumask_bits, start)
   330	
   331	/**
   332	 * for_each_cpu_and - iterate over every cpu in both masks
   333	 * @cpu: the (optionally unsigned) integer iterator
   334	 * @mask1: the first cpumask pointer
   335	 * @mask2: the second cpumask pointer
   336	 *
   337	 * This saves a temporary CPU mask in many places.  It is equivalent to:
   338	 *	struct cpumask tmp;
   339	 *	cpumask_and(&tmp, &mask1, &mask2);
   340	 *	for_each_cpu(cpu, &tmp)
   341	 *		...
   342	 *
   343	 * After the loop, cpu is >= nr_cpu_ids.
   344	 */
   345	#define for_each_cpu_and(cpu, mask1, mask2)				\
   346		for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
   347	
   348	/**
   349	 * for_each_cpu_andnot - iterate over every cpu present in one mask, excluding
   350	 *			 those present in another.
   351	 * @cpu: the (optionally unsigned) integer iterator
   352	 * @mask1: the first cpumask pointer
   353	 * @mask2: the second cpumask pointer
   354	 *
   355	 * This saves a temporary CPU mask in many places.  It is equivalent to:
   356	 *	struct cpumask tmp;
   357	 *	cpumask_andnot(&tmp, &mask1, &mask2);
   358	 *	for_each_cpu(cpu, &tmp)
   359	 *		...
   360	 *
   361	 * After the loop, cpu is >= nr_cpu_ids.
   362	 */
   363	#define for_each_cpu_andnot(cpu, mask1, mask2)				\
   364		for_each_andnot_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
   365	
   366	/**
   367	 * for_each_cpu_or - iterate over every cpu present in either mask
   368	 * @cpu: the (optionally unsigned) integer iterator
   369	 * @mask1: the first cpumask pointer
   370	 * @mask2: the second cpumask pointer
   371	 *
   372	 * This saves a temporary CPU mask in many places.  It is equivalent to:
   373	 *	struct cpumask tmp;
   374	 *	cpumask_or(&tmp, &mask1, &mask2);
   375	 *	for_each_cpu(cpu, &tmp)
   376	 *		...
   377	 *
   378	 * After the loop, cpu is >= nr_cpu_ids.
   379	 */
   380	#define for_each_cpu_or(cpu, mask1, mask2)				\
   381		for_each_or_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
   382	
   383	/**
   384	 * for_each_cpu_from - iterate over CPUs present in @mask, from @cpu to the end of @mask.
   385	 * @cpu: the (optionally unsigned) integer iterator
   386	 * @mask: the cpumask pointer
   387	 *
   388	 * After the loop, cpu is >= nr_cpu_ids.
   389	 */
   390	#define for_each_cpu_from(cpu, mask)				\
   391		for_each_set_bit_from(cpu, cpumask_bits(mask), small_cpumask_bits)
   392	
   393	/**
   394	 * cpumask_any_but - return a "random" in a cpumask, but not this one.
   395	 * @mask: the cpumask to search
   396	 * @cpu: the cpu to ignore.
   397	 *
   398	 * Often used to find any cpu but smp_processor_id() in a mask.
   399	 * Return: >= nr_cpu_ids if no cpus set.
   400	 */
   401	static __always_inline
   402	unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
   403	{
   404		unsigned int i, n, weight;
   405	
   406		cpumask_check(cpu);
 > 407		weight = cpumask_weight(mask);
 > 408		n = get_random_u32() % weight;
   409	
   410		/* If we accidentally pick "n" equal to "cpu",
   411		 * then simply choose "n + 1"th cpu.
   412		 */
   413		if (n == cpu)
   414			n = (n + 1) % weight;
 > 415		i = cpumask_nth(n, mask);
   416		return i;
   417	}
   418	
   419	/**
   420	 * cpumask_any_and_but - pick a "random" cpu from *mask1 & *mask2, but not this one.
   421	 * @mask1: the first input cpumask
   422	 * @mask2: the second input cpumask
   423	 * @cpu: the cpu to ignore
   424	 *
   425	 * Returns >= nr_cpu_ids if no cpus set.
   426	 */
   427	static __always_inline
   428	unsigned int cpumask_any_and_but(const struct cpumask *mask1,
   429					 const struct cpumask *mask2,
   430					 unsigned int cpu)
   431	{
   432		unsigned int i;
   433	
   434		cpumask_check(cpu);
   435		i = cpumask_first_and(mask1, mask2);
   436		if (i != cpu)
   437			return i;
   438	
   439		return cpumask_next_and(cpu, mask1, mask2);
   440	}
   441	
   442	/**
   443	 * cpumask_nth - get the Nth cpu in a cpumask
   444	 * @srcp: the cpumask pointer
   445	 * @cpu: the Nth cpu to find, starting from 0
   446	 *
   447	 * Return: >= nr_cpu_ids if such cpu doesn't exist.
   448	 */
   449	static __always_inline
 > 450	unsigned int cpumask_nth(unsigned int cpu, const struct cpumask *srcp)
   451	{
   452		return find_nth_bit(cpumask_bits(srcp), small_cpumask_bits, cpumask_check(cpu));
   453	}
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
