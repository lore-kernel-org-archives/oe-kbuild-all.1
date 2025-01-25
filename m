Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068041547F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737789571; cv=none; b=hg2rBNu2JwyKAwy0CETZRy7Wj4aSTVyMZJSvp75bDwNNUy/+xU8rNV/DI8WyFvwao2bEtokYHu2eHtqAb7fsbhwMNEWQSehNc+szqjOvz2tWZjQvuq+1uW8s/2ztTjoH4mTOZ2fJfeDkOJQE5BMNVgGnM/LKyJxomRdZBANL9B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737789571; c=relaxed/simple;
	bh=PspPsdE93xRh2WSrYb5DxD215ntPvpPRxPO4t+rUEjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iT6eYLOJGDpYHhqLNNNg5OCkkvlHgRXUdugsF8NL8BnPqxnNdUuXkGUWDLGeqfguQzKyYyggU54n9F3Dq0mm1SyVk33nj3WkQ3jON7yPuN3ZQMjrrtUHIt6PXeXRgdTa8zhqMNDmGJeiTVGVJTRi7s0Bs6Nvkk6Oo42LYNeqaIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2rFkPKn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2rFkPKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737789569; x=1769325569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PspPsdE93xRh2WSrYb5DxD215ntPvpPRxPO4t+rUEjQ=;
  b=k2rFkPKn2m7LiLNyJ3AfLOg/FWPK2zD7JUaTEafmcbmEEg2zWl3RVV8a
   4oYZPMcAGf/QqSNi3JOszF83v7ffT3ISR6taU+75jb6qnBQ6ooM8LOrpx
   izFIu4yaOsAR0UjCHCo8gnTXC+nhXPztTgM9FuN45tLrfeJiTGiwgCwM8
   TuI3Mh1/vX6G+9iyv1jsVaJe6Iptjmy+x2bjuV7kTfK6JKwMJSOoS60j3
   7/7AcYkYaD2plFwkfGq7F5RYfykC0LMij/Y2B+sX8zXfKLvD351Hq8e60
   ZpszP1KnHFBwidmRFxSnG5OHCpH30BnS/s4u+oTcgZcZnE35q8Qo7JHmc
   g==;
X-CSE-ConnectionGUID: YJMhX4/xSbmvb6mjkKOEig==
X-CSE-MsgGUID: rBDDGTxpTJK9B4Hj1w4GGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42256927"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="42256927"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 23:19:28 -0800
X-CSE-ConnectionGUID: ecoFIZC+QHOwLKOS8lgKEA==
X-CSE-MsgGUID: aVjTzWFYQ++UG/MPhY9BzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112589252"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2025 23:19:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbaRx-000db9-0P;
	Sat, 25 Jan 2025 07:19:25 +0000
Date: Sat, 25 Jan 2025 15:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 6/8] kernel/compat.c:222:6: error:
 conflicting types for 'compat_get_cpumask'; have 'long int(struct cpumask_t
 *, const compat_ulong_t *, unsigned int)' {aka 'long int(struct cpumask_t *,
 const unsigned int *, unsigned int)'}
Message-ID: <202501251523.60XNGysa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux compat_get_cpumask
head:   b7162e407638adc57cdf6d6f1acea90f9d84a638
commit: 2dc86881c56e6ed3f0b9640c3a402631aaeca482 [6/8] compat: add compat_get_cpumask
config: arm64-randconfig-002-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251523.60XNGysa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251523.60XNGysa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251523.60XNGysa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/compat.c:12:
   include/linux/compat.h:955:32: warning: 'struct cpumask_t' declared inside parameter list will not be visible outside of this definition or declaration
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^~~~~~~~~
>> kernel/compat.c:222:32: warning: 'struct cpumask_t' declared inside parameter list will not be visible outside of this definition or declaration
     222 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^~~~~~~~~
>> kernel/compat.c:222:6: error: conflicting types for 'compat_get_cpumask'; have 'long int(struct cpumask_t *, const compat_ulong_t *, unsigned int)' {aka 'long int(struct cpumask_t *, const unsigned int *, unsigned int)'}
     222 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |      ^~~~~~~~~~~~~~~~~~
   include/linux/compat.h:955:6: note: previous declaration of 'compat_get_cpumask' with type 'long int(struct cpumask_t *, const compat_ulong_t *, unsigned int)' {aka 'long int(struct cpumask_t *, const unsigned int *, unsigned int)'}
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |      ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:13,
                    from arch/arm64/include/asm/cpufeature.h:27,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10:
   kernel/compat.c: In function 'compat_get_cpumask':
>> include/linux/cpumask_types.h:18:37: error: invalid use of undefined type 'struct cpumask_t'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/compat.c:228:33: note: in expansion of macro 'cpumask_bits'
     228 |         ret = compat_get_bitmap(cpumask_bits(cpumask), umask, ncpus);
         |                                 ^~~~~~~~~~~~
>> kernel/compat.c:230:36: error: passing argument 1 of 'cpumask_clear_from' from incompatible pointer type [-Wincompatible-pointer-types]
     230 |                 cpumask_clear_from(cpumask, ncpus);
         |                                    ^~~~~~~
         |                                    |
         |                                    struct cpumask_t *
   include/linux/cpumask.h:631:64: note: expected 'struct cpumask *' but argument is of type 'struct cpumask_t *'
     631 | static __always_inline void cpumask_clear_from(struct cpumask *dstp, unsigned long cpu)
         |                                                ~~~~~~~~~~~~~~~~^~~~


vim +222 kernel/compat.c

   221	
 > 222	long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
   223				unsigned int len)
   224	{
   225		unsigned long ncpus = min(large_cpumask_bits, len * BITS_PER_BYTE);
   226		long ret;
   227	
   228		ret = compat_get_bitmap(cpumask_bits(cpumask), umask, ncpus);
   229		if (ret == 0 && ncpus < large_cpumask_bits)
 > 230			cpumask_clear_from(cpumask, ncpus);
   231	
   232		return ret;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
