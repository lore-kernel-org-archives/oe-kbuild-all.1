Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B915D1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747533946; cv=none; b=cGeJCWv9V3d6BE/ch3+O8nBrHKMASce5t+X3wWBz2szp4juZxWH1coV9np+EBmxKeL39B+LCGgY3ceikX6/eUcUq4YHGOIIiPX23R2dk2vizYrL7guYpA3nbV37zq61Ts5fjc7LwTp/YvvpepyZIHc/nDiHSROBbWfJX0mVo/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747533946; c=relaxed/simple;
	bh=RiCYvvq9tCWvkFOzctahrgZlhqc2uAWGOQfnv7ZxhyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C6qpMoJeAIOsji1Nvak/gf3qUhL0g7XWnvlTrDqyiePbv0AJcnLX/UiQzcM9I7cl2P3OvESxXGPbl7//9/iUfUEUPZoZtgJkl25lsFBVtJj26NoEnJ+OasEUVhYfggPqEnn5EfuKmy/gfAzLOjXAch8AYS1ZfeygbfOwgmIDBDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrfwOQYm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrfwOQYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747533944; x=1779069944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RiCYvvq9tCWvkFOzctahrgZlhqc2uAWGOQfnv7ZxhyI=;
  b=IrfwOQYmI2F8Et4Ik3m1RyKag4zS+Cy4+KE6iHsRkNoazl6+pIviS0mn
   ygqJcgsyNZt2thfSaE2LdBcLaC5TFi/AFRFYaVSVgSqK7JrOewuqfxwX6
   zYvmAZMSFE5UmtNCwE3Xm5NIKl8uL6lJr9yKiqS8p3NtJA5XoBS6gyz5S
   u0SVWcx2QaRFMFAg1pg3UMqT70Us7nfCgkHbfe1gqUl8t6G0c0a8iH19u
   UZHtFCpGEMKTEhGI0ZmgJD9hcnpkN/sutO0zQyK0aKegIMjKsD0nEs2bW
   Y32+2MiQYb/9TUeGChMKAXf8E0el23dSuDlJ4uGhP29CZ9vk5Hhfj7YMl
   A==;
X-CSE-ConnectionGUID: wEqitmlzTEGtomy7MMim0Q==
X-CSE-MsgGUID: L1PRUECjTe2r+9t+DeBdTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49341038"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49341038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:05:43 -0700
X-CSE-ConnectionGUID: 9g2EebMrQ5qEn/EHtrkNZQ==
X-CSE-MsgGUID: G1zus3CoRxS61AYnc+fASQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139438862"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2025 19:05:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGTPH-000KYR-36;
	Sun, 18 May 2025 02:05:39 +0000
Date: Sun, 18 May 2025 10:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bmfn 33/40] include/linux/cpumask.h:566:23: error: 'start'
 undeclared
Message-ID: <202505180924.qfNUf5uX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bmfn
head:   e80ff5a175d941429ee9aa5404826b34ca122014
commit: f8edbd65065ef89648780b354cad71fd1f328012 [33/40] cpumask: add cpumask_clear_cpus()
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20250518/202505180924.qfNUf5uX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180924.qfNUf5uX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180924.qfNUf5uX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2213,
                    from arch/arc/kernel/asm-offsets.c:6:
   include/linux/cpumask.h: In function 'cpumask_clear_cpus':
>> include/linux/cpumask.h:566:23: error: 'start' undeclared (first use in this function)
     566 |         cpumask_check(start + ncpus - 1);
         |                       ^~~~~
   include/linux/cpumask.h:566:23: note: each undeclared identifier is reported only once for each function it appears in
   make[3]: *** [scripts/Makefile.build:98: arch/arc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/start +566 include/linux/cpumask.h

   556	
   557	/**
   558	 * cpumask_clear_cpus - clear cpus in a cpumask
   559	 * @dstp:  the cpumask pointer
   560	 * @cpu:   cpu number (< nr_cpu_ids)
   561	 * @ncpus: number of cpus to clear (< nr_cpu_ids)
   562	 */
   563	static __always_inline void cpumask_clear_cpus(struct cpumask *dstp,
   564							unsigned int cpu, unsigned int ncpus)
   565	{
 > 566		cpumask_check(start + ncpus - 1);
   567		bitmap_clear(cpumask_bits(dstp), cpumask_check(start), cpumask_check(ncpus));
   568	}
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
