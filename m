Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D25AEC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880866; cv=none; b=n0CwihfTr1Dry3CgzjSngIDcT65K8YldUIJ+vMkXAoU9T5UCdtFtnaDGV+asYF95BA2wVLa4tqizSQ8YSm6qzSKlVXzhaD7Zm2VLX6FihKL4zRthoSa/q5BqYPsNXsDbPCOuQPJ5mEf2khpLpqS3NbpoYiiMPYBzfXGTbchlCtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880866; c=relaxed/simple;
	bh=VwW4x74zn6I+8IwUa2d4lbyqP6u9v2VvPh5jb5hrvAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+IAwRV8+HvnwSGKGBmLm9Erc1jyjoiDVvfPUDhnKmZrOnXOshsY8LNXbXWerlkWbDrMSHrGal7g5spNGxDWNXACVphJRYfitFSuKuQi495gVC8EF+WffzxJLGv6DYyw+aBmqIYynSbLMQPuUuLzzgmns2IrXbsQNcMu/Xc3sro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQQQohZf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQQQohZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747880865; x=1779416865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VwW4x74zn6I+8IwUa2d4lbyqP6u9v2VvPh5jb5hrvAQ=;
  b=IQQQohZfSLi23gFboeQPyPckU3K7EhpNB7Zn/ncwLjs2EHB9F2uPP6Tx
   8U3q55WK5dsdfr7N19CY3ehiRFbhg8q8aCogJpR//TErBHfkPRZ4HgNlu
   Eb9wUkGxPX4e++iDVj06bBsJLDrxeNoDE4QP7I8OYMZNJBDwH9cbaEvQq
   FS9iO5atI9f/WVYBdigAHmFt1+U70zemeXIZJYSEhjI0ivWqMIk4Isla7
   pJ2c0d2xjZ7rYIVBq5HjKNc3wdZpGth0ScoOqvjFKvXH+cjl6DVHs0Uw/
   UKlZE5pIcqo+UN5SV/2liEfFkFXcJHA7Zl3hC+dFXnXXPNxhghtjh2Pu6
   A==;
X-CSE-ConnectionGUID: bqFuN9ijTVadt5KXiVIY4w==
X-CSE-MsgGUID: mpqnRGFAQmStiZ0qnLzWuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60936517"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60936517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:27:44 -0700
X-CSE-ConnectionGUID: +s/fA+wtTbqoMtprSECMog==
X-CSE-MsgGUID: 2kqLHAySRvmYb616v5Rsiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145219196"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2025 19:27:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHvem-000OqI-1W;
	Thu, 22 May 2025 02:27:40 +0000
Date: Thu, 22 May 2025 10:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 259/260]
 arch/m68k/include/asm/string.h:49:25: warning: 'memset' used with constant
 zero length parameter; this could be due to transposed parameters
Message-ID: <202505221059.VB4PoKbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6a62e6f0f866f2175751cdec81ae87ab573c8185
commit: e9d60153964008eaaa01f3bf287438dcff4c0d07 [259/260] fs: dcache exlusion between overlayfs, casefolding
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250522/202505221059.VB4PoKbz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221059.VB4PoKbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221059.VB4PoKbz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:2213,
                    from include/linux/ratelimit.h:6,
                    from fs/dcache.c:18:
   fs/dcache.c: In function 'd_casefold_enable':
>> arch/m68k/include/asm/string.h:49:25: warning: 'memset' used with constant zero length parameter; this could be due to transposed parameters [-Wmemset-transposed-args]
      49 | #define memset(d, c, n) __builtin_memset(d, c, n)
         |                         ^~~~~~~~~~~~~~~~
   fs/dcache.c:3307:9: note: in expansion of macro 'memset'
    3307 |         memset(e, sizeof(*e), 0);
         |         ^~~~~~
   fs/dcache.c: In function 'vfs_caches_init':
   fs/dcache.c:3454:65: warning: '%s' directive argument is null [-Wformat-overflow=]
    3454 |                 panic("error initializing no_casefold_dentries: %s\n", errname(ret));
         |                                                                 ^~


vim +/memset +49 arch/m68k/include/asm/string.h

ea61bc461d09e8 Greg Ungerer 2010-09-07  46  
ea61bc461d09e8 Greg Ungerer 2010-09-07  47  #define __HAVE_ARCH_MEMSET
ea61bc461d09e8 Greg Ungerer 2010-09-07  48  extern void *memset(void *, int, __kernel_size_t);
ea61bc461d09e8 Greg Ungerer 2010-09-07 @49  #define memset(d, c, n) __builtin_memset(d, c, n)
ea61bc461d09e8 Greg Ungerer 2010-09-07  50  

:::::: The code at line 49 was first introduced by commit
:::::: ea61bc461d09e8d331a307916530aaae808c72a2 m68k/m68knommu: merge MMU and non-MMU string.h

:::::: TO: Greg Ungerer <gerg@snapgear.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
