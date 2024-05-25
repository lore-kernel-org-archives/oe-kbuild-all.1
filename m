Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9597B644
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716664076; cv=none; b=LJyYHPhJDaIGm/cZ9JsaHRqRMk8rzBhYLDywXJAZEncRlEYIF4M+y8ZuwCOlcskjlMNnPcdUTafU/67O6H1+5UxGtFIcI+VmxNWtZt1E4Bvz57MAoaCN8b7IYywb1D7Pc4dLBZRupTq+9CdLPr5BYTyXsOP9r7NBFwceHkyVPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716664076; c=relaxed/simple;
	bh=zPFKHDS1QqJPMiqlH5leva71HPhJGvleedYiMP1rB/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1AfTi6vk5dNa/V+aMCYhP/5iTckGXYheZdR8d8h2N81lURW/l5ptRB1rgYkEzbh0f1JYKHLGtNyBlfyAx43eNsMFakAfTot259lYW5kZ/qSS9etsN9djOG4eNAzwEGdpgShn0dWE29WyXHAN1oiSgiOS0jX0hTrmGsA5JgDxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htx7kmbO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htx7kmbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716664074; x=1748200074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPFKHDS1QqJPMiqlH5leva71HPhJGvleedYiMP1rB/s=;
  b=htx7kmbOgqYMa+UY4EDf7qrCLj6kCsScvUPV5mfkkyCe9BsTTHSCR4Ap
   cvxFcEwYHJFJRbYRJlmSWS28otSwtJxy+gm5fTzL+zTM4ucspW+DGFoEG
   bTp3Z4DC7K2oO06GMbZP0Y/ABkPvM4+Nqcn6finfDIxz94XCP6y0S7hbs
   zh+2pQD0MlxEWJQ0YKu1MecL54cLEg4DPzX0yhGKaR7aYV3gK58JCdQ33
   F3g56aiUbiazrFWHKmQmM4b95tvGBQ5Mywoym2hlofp0a1OUgDQ2TUHPk
   ICwGIpU8Kx/saf7qCZgGOfkeJZMuBJLawwzLjKwp6f6w3/xjsIyMqv408
   w==;
X-CSE-ConnectionGUID: d+Fh2a/5S82EEqEJqSCxdw==
X-CSE-MsgGUID: RkVh+Wr3Si2ScL9N83Gv5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="24433679"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="24433679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 12:07:53 -0700
X-CSE-ConnectionGUID: tE9NI5TiR+SNhtngKjYguA==
X-CSE-MsgGUID: kAkOuZ1USSu/kN9NRLz6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="34427481"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 May 2024 12:07:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAwkA-0007LD-0V;
	Sat, 25 May 2024 19:07:50 +0000
Date: Sun, 26 May 2024 03:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask-types 2/3] include/linux/sched.h:1781:14: error:
 implicit declaration of function 'cpuamsk_bits'; did you mean
 'cpumask_bits'?
Message-ID: <202405260312.H6MP3TNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask-types
head:   04d10bebce942cfc9871eca228852a351b276a06
commit: 6f595fbdf7c6cb328300eb821e124737a32bb382 [2/3] cpumask_types
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240526/202405260312.H6MP3TNo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260312.H6MP3TNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260312.H6MP3TNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/alpha/kernel/asm-offsets.c:10:
   include/linux/sched.h: In function 'set_cpus_allowed_ptr':
>> include/linux/sched.h:1781:14: error: implicit declaration of function 'cpuamsk_bits'; did you mean 'cpumask_bits'? [-Werror=implicit-function-declaration]
    1781 |         if (*cpuamsk_bits(new_mask) & 1 == 0)
         |              ^~~~~~~~~~~~
         |              cpumask_bits
>> include/linux/sched.h:1781:13: error: invalid type argument of unary '*' (have 'int')
    1781 |         if (*cpuamsk_bits(new_mask) & 1 == 0)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1781 include/linux/sched.h

  1761	
  1762	/**
  1763	 * set_cpus_allowed_ptr - set CPU affinity mask of a task
  1764	 * @p: the task
  1765	 * @new_mask: CPU affinity mask
  1766	 *
  1767	 * Return: zero if successful, or a negative error code
  1768	 */
  1769	extern int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask);
  1770	extern int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src, int node);
  1771	extern void release_user_cpus_ptr(struct task_struct *p);
  1772	extern int dl_task_check_affinity(struct task_struct *p, const struct cpumask *mask);
  1773	extern void force_compatible_cpus_allowed_ptr(struct task_struct *p);
  1774	extern void relax_compatible_cpus_allowed_ptr(struct task_struct *p);
  1775	#else
  1776	static inline void do_set_cpus_allowed(struct task_struct *p, const struct cpumask *new_mask)
  1777	{
  1778	}
  1779	static inline int set_cpus_allowed_ptr(struct task_struct *p, const struct cpumask *new_mask)
  1780	{
> 1781		if (*cpuamsk_bits(new_mask) & 1 == 0)
  1782			return -EINVAL;
  1783		return 0;
  1784	}
  1785	static inline int dup_user_cpus_ptr(struct task_struct *dst, struct task_struct *src, int node)
  1786	{
  1787		if (src->user_cpus_ptr)
  1788			return -EINVAL;
  1789		return 0;
  1790	}
  1791	static inline void release_user_cpus_ptr(struct task_struct *p)
  1792	{
  1793		WARN_ON(p->user_cpus_ptr);
  1794	}
  1795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
