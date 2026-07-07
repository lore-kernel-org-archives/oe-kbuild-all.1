Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F421638D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466167; cv=none; b=qF3jweIcz9vdeA0rNZoYxvdIwkG5voJAYwaUjgaLgCJqrobLFOFVDJBdPu/DplJwA/7P9l8/eRsbkO1PCJRb2Y+QwqzExGl0PtD+nBy4GhPXkIrnUtcYGYL0+UbP7XG8NBwwilsqVM/Hz+Xe3EhpTvPZTGwgcVi9d53by0w/W1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466167; c=relaxed/simple;
	bh=cpnEPG3PP+Gfe5H++1TYb4QQsNeO8yd5Hv7jV7HJl/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GuuOnYRATyvPyLsnqo5oefgykkfF9Mrr7dBgw2c8srC+LH69CP84ZklOuJhYv+zqh7DyjzQ7CHIZ9hKHX6nzb+vzigKjrYkjHpkHw0O3Vngb6nXMxd8FTGglPS8aJzDxo1D2lYkxU2KxGmjAzx7L2XWvbP/z2nGjxf4scUcMdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqv5atK+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqv5atK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783466165; x=1815002165;
  h=date:from:to:cc:subject:message-id;
  bh=cpnEPG3PP+Gfe5H++1TYb4QQsNeO8yd5Hv7jV7HJl/o=;
  b=mqv5atK++Zv3y2hm3tCXeCHAflDz9OS8hRzHKj/ZQD5W/RGkUR9IOmkD
   hXhb9oyhXxpN17JGGeZkBr26LhXt/LCv2CXi7KxHcrIyhMbCyR1p+SsWA
   mQERCvpr/23W7UhY986ONPFBYSN8CyjGMNcjkYRHXduTcOpunKVRqUPrh
   uUc1gB2stzl1RT/Vw5eJD3GFaIyqPK23sMw64O50jguRXc8T1KVc6kDlv
   3OSAhz5XaSM/ZYYOzPFft5q0OlyUkzY+jrnVShohfeo6zx8FVh25wyh5u
   bU7zMtNe/hg0IJ+PmjHLvOxGP9rEPPTMAGK6OHNHNkCRsJQsv/7vsJW3E
   g==;
X-CSE-ConnectionGUID: oihW1jd5Tm6T2Y5OS+399Q==
X-CSE-MsgGUID: aqq7ezZKQ+SsRNOZA4LuMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84096639"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84096639"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 16:16:05 -0700
X-CSE-ConnectionGUID: pKj5cjvISki3M5lV4PDiBA==
X-CSE-MsgGUID: tb1DElV0TFmKuSixK/KEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254773567"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Jul 2026 16:16:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whF1C-00000000FlE-3T7Q;
	Tue, 07 Jul 2026 23:15:59 +0000
Date: Wed, 08 Jul 2026 07:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 4/30]
 include/linux/kern_levels.h:5:18: warning: format '%llu' expects argument of
 type 'long long unsigned int', but argument 2 has type 'int'
Message-ID: <202607080736.WYo1RXif-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   489202b3db0a02f59477f8ec63009dc3d998341f
commit: b77633efe7c6ef49465e89432b3fd7d1541d3b3a [4/30] arm64/fpsimd: Decide to save ZT0 and streaming mode FFR at bind time
config: arm64-randconfig-003-20260708 (https://download.01.org/0day-ci/archive/20260708/202607080736.WYo1RXif-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080736.WYo1RXif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080736.WYo1RXif-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:67,
                    from include/linux/bitmap.h:8,
                    from arch/arm64/kernel/fpsimd.c:9:
   arch/arm64/kernel/fpsimd.c: In function 'fpsimd_save_user_state':
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:483:11: note: in definition of macro 'printk_index_wrap'
     483 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/linux/printk.h:544:2: note: in expansion of macro 'printk'
     544 |  printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   include/linux/kern_levels.h:10:19: note: in expansion of macro 'KERN_SOH'
      10 | #define KERN_CRIT KERN_SOH "2" /* critical conditions */
         |                   ^~~~~~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'KERN_CRIT'
     544 |  printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   arch/arm64/kernel/fpsimd.c:517:4: note: in expansion of macro 'pr_crit'
     517 |    pr_crit("%llu %llu\n",
         |    ^~~~~~~
   arch/arm64/kernel/fpsimd.c:517:16: note: format string is defined here
     517 |    pr_crit("%llu %llu\n",
         |             ~~~^
         |                |
         |                long long unsigned int
         |             %u
   In file included from include/asm-generic/bug.h:31,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:67,
                    from include/linux/bitmap.h:8,
                    from arch/arm64/kernel/fpsimd.c:9:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:483:11: note: in definition of macro 'printk_index_wrap'
     483 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/linux/printk.h:544:2: note: in expansion of macro 'printk'
     544 |  printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   include/linux/kern_levels.h:10:19: note: in expansion of macro 'KERN_SOH'
      10 | #define KERN_CRIT KERN_SOH "2" /* critical conditions */
         |                   ^~~~~~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'KERN_CRIT'
     544 |  printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   arch/arm64/kernel/fpsimd.c:517:4: note: in expansion of macro 'pr_crit'
     517 |    pr_crit("%llu %llu\n",
         |    ^~~~~~~
   arch/arm64/kernel/fpsimd.c:517:21: note: format string is defined here
     517 |    pr_crit("%llu %llu\n",
         |                  ~~~^
         |                     |
         |                     long long unsigned int


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
