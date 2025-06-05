Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9C136E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 04:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096618; cv=none; b=iEiukXz/4EFWguEZGZ90MI2p3dMh+OUYBtbeNZlnhbeq2J2tG5a/NZooEJPKEHD4C8NJ4uBNy5E+TldtyYfE9cd0DFccrbxsWjydm810eRY9dvxo6UTy9MLRNqpXSgPj8eIckNEI6yB5GE6XPB0iS/6mnMJw4viURPmsixUzm50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096618; c=relaxed/simple;
	bh=S4JQ2yMjKRWNoN2VG4w5PHYQv87CScMT7Ul1pchVNPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=twn4yQ07Pem9RNKPVcvU8CC3Mm9IDJj0fHdBVTK77hXRa3lBnOoYKHA4gC1mc85GBn6ZnF/3ABP6jHRLELtTWmqJ62kxSt/8OWsa/vB9TL1o1+/wNWxkIp2tdH/wbQBn3wHEpe5N3t7VpLDs+mrsQzE0+wSvVfjO7NRHZ6zPEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8P4f6GJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8P4f6GJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749096617; x=1780632617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4JQ2yMjKRWNoN2VG4w5PHYQv87CScMT7Ul1pchVNPk=;
  b=H8P4f6GJpeHREik6pTrQWl2yhTp4DiID1Sb6YKEKG2uBMllx9G/ZuKGX
   zoIE6UED5ZCXecsCdGdVsJld/LGUnrkjJkA6OCm8vqU4YAUvXXG5mQhl5
   SHUP8E88BqU4aIMDZBuJ+imAc/qpDqbH39Nky0gmR7TsiH0+LJ5qTmujL
   n0X9iPG7ojwxzFu/oZfZtfnLguaR/sBekVYmHbe4Isvm8R7P96qMlwSX6
   LJu7DJdTtOLh6xzYBPneWk+uq7znj3zpimate4UQ+vsuAz2JEsATk/6Ra
   zQIMdOrQu4sS1BLNJXc2suQ9CZIos98NW2BplEai9C1ECKzHNLvXdxgJN
   w==;
X-CSE-ConnectionGUID: xwfZ80DTQ7akcoUHULHryA==
X-CSE-MsgGUID: k/dVZ8E0R9OazsOTQSmGgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62590244"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="62590244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 21:10:12 -0700
X-CSE-ConnectionGUID: eMSFgtp6QhmS/tT6KzzKKw==
X-CSE-MsgGUID: o2YtbzMHRuG4t76Hcr08hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="145727476"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jun 2025 21:10:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN1vc-0003iD-18;
	Thu, 05 Jun 2025 04:10:08 +0000
Date: Thu, 5 Jun 2025 12:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next2 24/24] kernel/smp.c:750:24: warning: unused
 variable 'nodemask'
Message-ID: <202506051207.5SxwUarX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next2
head:   75aab1f3dc12efa381f38208ada2336898c5fc89
commit: 75aab1f3dc12efa381f38208ada2336898c5fc89 [24/24] smp: improve locality on smp_call_function_any()
config: arc-randconfig-001-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051207.5SxwUarX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506051207.5SxwUarX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051207.5SxwUarX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/smp.c: In function 'smp_call_function_any':
>> kernel/smp.c:750:24: warning: unused variable 'nodemask' [-Wunused-variable]
     const struct cpumask *nodemask;
                           ^~~~~~~~


vim +/nodemask +750 kernel/smp.c

d7877c03f1b62d Frederic Weisbecker 2014-02-24  732  
2ea6dec4a22a6f Rusty Russell       2009-11-17  733  /*
2ea6dec4a22a6f Rusty Russell       2009-11-17  734   * smp_call_function_any - Run a function on any of the given cpus
2ea6dec4a22a6f Rusty Russell       2009-11-17  735   * @mask: The mask of cpus it can run on.
2ea6dec4a22a6f Rusty Russell       2009-11-17  736   * @func: The function to run. This must be fast and non-blocking.
2ea6dec4a22a6f Rusty Russell       2009-11-17  737   * @info: An arbitrary pointer to pass to the function.
2ea6dec4a22a6f Rusty Russell       2009-11-17  738   * @wait: If true, wait until function has completed.
2ea6dec4a22a6f Rusty Russell       2009-11-17  739   *
2ea6dec4a22a6f Rusty Russell       2009-11-17  740   * Returns 0 on success, else a negative status code (if no cpus were online).
2ea6dec4a22a6f Rusty Russell       2009-11-17  741   *
2ea6dec4a22a6f Rusty Russell       2009-11-17  742   * Selection preference:
2ea6dec4a22a6f Rusty Russell       2009-11-17  743   *	1) current cpu if in @mask
75aab1f3dc12ef Yury Norov          2025-06-04  744   *	2) nearest cpu in @mask based, on NUMA topology
2ea6dec4a22a6f Rusty Russell       2009-11-17  745   */
2ea6dec4a22a6f Rusty Russell       2009-11-17  746  int smp_call_function_any(const struct cpumask *mask,
3a5f65df5a0fcb David Howells       2010-10-27  747  			  smp_call_func_t func, void *info, int wait)
2ea6dec4a22a6f Rusty Russell       2009-11-17  748  {
2ea6dec4a22a6f Rusty Russell       2009-11-17  749  	unsigned int cpu;
2ea6dec4a22a6f Rusty Russell       2009-11-17 @750  	const struct cpumask *nodemask;
2ea6dec4a22a6f Rusty Russell       2009-11-17  751  	int ret;
2ea6dec4a22a6f Rusty Russell       2009-11-17  752  
2ea6dec4a22a6f Rusty Russell       2009-11-17  753  	/* Try for same CPU (cheapest) */
2ea6dec4a22a6f Rusty Russell       2009-11-17  754  	cpu = get_cpu();
75aab1f3dc12ef Yury Norov          2025-06-04  755  	if (!cpumask_test_cpu(cpu, mask))
75aab1f3dc12ef Yury Norov          2025-06-04  756  		cpu = sched_numa_find_nth_cpu(mask, 0, cpu_to_node(cpu));
2ea6dec4a22a6f Rusty Russell       2009-11-17  757  
2ea6dec4a22a6f Rusty Russell       2009-11-17  758  	ret = smp_call_function_single(cpu, func, info, wait);
2ea6dec4a22a6f Rusty Russell       2009-11-17  759  	put_cpu();
2ea6dec4a22a6f Rusty Russell       2009-11-17  760  	return ret;
2ea6dec4a22a6f Rusty Russell       2009-11-17  761  }
2ea6dec4a22a6f Rusty Russell       2009-11-17  762  EXPORT_SYMBOL_GPL(smp_call_function_any);
2ea6dec4a22a6f Rusty Russell       2009-11-17  763  

:::::: The code at line 750 was first introduced by commit
:::::: 2ea6dec4a22a6f66f6633876212fd4d195cf8277 generic-ipi: Add smp_call_function_any()

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
