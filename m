Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AC3224
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737792094; cv=none; b=opNWlw5yxWvhaAJbL4YRmaWkpwDs4jt+FStcmCA7GgmiLIs/cTtZ4VejpFr4pkR01WDPDNbejtPohDRSZV4ENDXEik1ALjCDQZO2U8eZmDX6b8q+pV+ZwnF5gtULi4WAUyG1/OMg7ECxcwdzKa8RL9t/Ig4NZ+7J7mLh6Sl2o9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737792094; c=relaxed/simple;
	bh=zEL48JsWe67oOewEfHTUAEuXwNo6tIHyj3rmGQDhqXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TxUnEu8XlrLf3SgVcdCNzmgCz529ClqPsOGpcOmka5us4e4pYPZ5pJ34NPpx+Kh2BXNoxMrIrauhUbH3M53X6BJZSpr0sQNAIWeYKFLtPL61dl59qV9EpD5ZCu50JKmYQcSlNI5cyjasaGkFJls78uqFzOjSAYSxP2uTz/qS9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeDRRO2S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeDRRO2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737792092; x=1769328092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEL48JsWe67oOewEfHTUAEuXwNo6tIHyj3rmGQDhqXY=;
  b=HeDRRO2SF8Yfz9KAgvX8i+/oCAC5pt7eQDZXacrTCzoYS6BUe++QQw9n
   PxEEya1TVgQmbi9+PRXTEFoSmkeIj5+TB7QLg0nB6u+QKFqo+zexMRg9T
   wkJfvuEgmBuHTreX+oMnquPBATIvAiRF+sjYOqRUYBCUk5xiRitJqqTg2
   tJfpiDhxAL52V/erSgEkEstHzt4qI+vkfFdZZd8PpzmooeMP2DzdB9b08
   UvkXym0OvyS607MSa01mr9pK2Tq215Y+OB2PXrMITHXN88cap0YG7uV9Y
   74idRvQ8wcm2M69q//4FKwI5CSVpaZQUrsZmld/YjFnWt865F5+W8n7l1
   g==;
X-CSE-ConnectionGUID: FEGqKxFsRDGpA3oFip1SWw==
X-CSE-MsgGUID: 5emKEFOsTz+eebBCMg7SVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="25926902"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="25926902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 00:01:32 -0800
X-CSE-ConnectionGUID: 05VBTYOHR9maXerkx10WzA==
X-CSE-MsgGUID: Cilg0AvdTN+7naNT1Rt2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138835448"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jan 2025 00:01:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbb6f-000dcv-0G;
	Sat, 25 Jan 2025 08:01:29 +0000
Date: Sat, 25 Jan 2025 16:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 8/8] kernel/compat.c:120:37: error:
 passing argument 1 of 'compat_get_cpumask' from incompatible pointer type
Message-ID: <202501251547.LqczwrrY-lkp@intel.com>
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
commit: b7162e407638adc57cdf6d6f1acea90f9d84a638 [8/8] kernel/compat
config: arm64-randconfig-002-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251547.LqczwrrY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251547.LqczwrrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251547.LqczwrrY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/compat.c:12:
   include/linux/compat.h:955:32: warning: 'struct cpumask_t' declared inside parameter list will not be visible outside of this definition or declaration
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^~~~~~~~~
   kernel/compat.c: In function '__do_compat_sys_sched_setaffinity':
>> kernel/compat.c:120:37: error: passing argument 1 of 'compat_get_cpumask' from incompatible pointer type [-Wincompatible-pointer-types]
     120 |         retval = compat_get_cpumask(new_mask, user_mask_ptr, len);
         |                                     ^~~~~~~~
         |                                     |
         |                                     cpumask_var_t {aka struct cpumask *}
   include/linux/compat.h:955:43: note: expected 'struct cpumask_t *' but argument is of type 'cpumask_var_t' {aka 'struct cpumask *'}
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                         ~~~~~~~~~~~~~~~~~~^~~~~~~
   kernel/compat.c: At top level:
   kernel/compat.c:208:32: warning: 'struct cpumask_t' declared inside parameter list will not be visible outside of this definition or declaration
     208 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^~~~~~~~~
   kernel/compat.c:208:6: error: conflicting types for 'compat_get_cpumask'; have 'long int(struct cpumask_t *, const compat_ulong_t *, unsigned int)' {aka 'long int(struct cpumask_t *, const unsigned int *, unsigned int)'}
     208 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
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
   include/linux/cpumask_types.h:18:37: error: invalid use of undefined type 'struct cpumask_t'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/compat.c:214:33: note: in expansion of macro 'cpumask_bits'
     214 |         ret = compat_get_bitmap(cpumask_bits(cpumask), umask, ncpus);
         |                                 ^~~~~~~~~~~~
   kernel/compat.c:216:36: error: passing argument 1 of 'cpumask_clear_from' from incompatible pointer type [-Wincompatible-pointer-types]
     216 |                 cpumask_clear_from(cpumask, ncpus);
         |                                    ^~~~~~~
         |                                    |
         |                                    struct cpumask_t *
   include/linux/cpumask.h:631:64: note: expected 'struct cpumask *' but argument is of type 'struct cpumask_t *'
     631 | static __always_inline void cpumask_clear_from(struct cpumask *dstp, unsigned long cpu)
         |                                                ~~~~~~~~~~~~~~~~^~~~


vim +/compat_get_cpumask +120 kernel/compat.c

   109	
   110	COMPAT_SYSCALL_DEFINE3(sched_setaffinity, compat_pid_t, pid,
   111			       unsigned int, len,
   112			       compat_ulong_t __user *, user_mask_ptr)
   113	{
   114		cpumask_var_t new_mask;
   115		int retval;
   116	
   117		if (!alloc_cpumask_var(&new_mask, GFP_KERNEL))
   118			return -ENOMEM;
   119	
 > 120		retval = compat_get_cpumask(new_mask, user_mask_ptr, len);
   121		if (retval)
   122			goto out;
   123	
   124		retval = sched_setaffinity(pid, new_mask);
   125	out:
   126		free_cpumask_var(new_mask);
   127		return retval;
   128	}
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
