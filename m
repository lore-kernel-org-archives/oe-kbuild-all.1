Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F301DDC14
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301715; cv=none; b=QdwD368GUBseXlNgwRqE32gzW9LBL3IGBJgkEdxFn9498H3a2ZLXYg2ncAlEWh/AZQ5N+jEPfXdQHc5w+KlyIcm1XEY6gC8sEVUtDPmnahpnrRcU/hB1wrTab6JuLU9ep9iKmG6qQyDU77x86o9rIBegNaVtOSLAHo4tCuvcI3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301715; c=relaxed/simple;
	bh=03CWnKsMONAjgt0xb1V6qtOcPj94FgJoEUgjzHv5338=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aU/RZ5vljAYVP+AqGFtT+RBpF0qaVei4lFaZe7+fD62gZ3kBfUZs5M8R16rlnekY9fAxjKztyal7j4VU1Oe1nu1Veg62ZQpnEzO7Eu9xwpK5P14ugyyX3DCYfNsMkIJPNO2bh9Tna4hAnynKLU/u0aUSGKn7vdemB0ezj0Jw2s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gv5jxKW+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gv5jxKW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739301714; x=1770837714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03CWnKsMONAjgt0xb1V6qtOcPj94FgJoEUgjzHv5338=;
  b=gv5jxKW+9LHGeFzAjmtnQI3rfT68rwx2BBFqw9MmUxjobGHpE/krlFDx
   dt2RdGNAT0pCbvUQPmZjEOy1QHXw0voQn/tv+RTUioFZV+VGMjhh20ekN
   7ZU/ZSU7a0Ma1pY4awzoY98lR6paO2wb1NXX15SOkyyzjbyBGMEPzlCox
   pWhuYFJ+/LKdWs7qJumAqhKLWEbXqVqqGIL6nNqseKcnoSdJc0Jyom927
   1hFCMRSHbUgsE49gOIKk4gK+bm1xbR534P/PZU0qlBL8OR5LG+ZfwHT8V
   mdWPsTL7vZQDwIFORnGOqnp3sA7B21esOhXItoCy/cOlVjNwGz6Z3y7FT
   Q==;
X-CSE-ConnectionGUID: 5BvaOlT/QMqNMzDluWQtBg==
X-CSE-MsgGUID: OzzkPAZeTBSHPapPJ38wag==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62405276"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="62405276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:21:54 -0800
X-CSE-ConnectionGUID: NxOPZKNfSvyAiCtJ90W/nw==
X-CSE-MsgGUID: eVfdd1TwRyGBLlJyvCh49g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="113112837"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2025 11:21:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thvpN-0014b9-0e;
	Tue, 11 Feb 2025 19:21:49 +0000
Date: Wed, 12 Feb 2025 03:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [kees:for-next/hardening 3/4] include/linux/thread_info.h:224:1:
 error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_MAYBE'
Message-ID: <202502120311.IShvXiun-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   b6518de35d6fbca63d88dbc7e5059924cc82afdb
commit: 3d22200404765145fbbe2a0b5189c0a8f83dab29 [3/4] mm: security: Check early if HARDENED_USERCOPY is enabled
config: sh-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120311.IShvXiun-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120311.IShvXiun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120311.IShvXiun-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/sh/kernel/asm-offsets.c:14:
>> include/linux/thread_info.h:224:1: warning: data definition has no type or storage class
     224 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/thread_info.h:224:1: error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_MAYBE' [-Wimplicit-int]
>> include/linux/thread_info.h:225:28: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
     225 |                            validate_usercopy_range);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'check_object_size':
   include/linux/thread_info.h:231:13: error: implicit declaration of function 'static_branch_maybe' [-Wimplicit-function-declaration]
     231 |             static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |             ^~~~~~~~~~~~~~~~~~~
>> include/linux/thread_info.h:231:33: error: 'CONFIG_HARDENED_USERCOPY_DEFAULT_ON' undeclared (first use in this function); did you mean 'CONFIG_HARDENED_USERCOPY'?
     231 |             static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 CONFIG_HARDENED_USERCOPY
   include/linux/thread_info.h:231:33: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/thread_info.h:232:34: error: 'validate_usercopy_range' undeclared (first use in this function)
     232 |                                 &validate_usercopy_range)) {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets.s] Error 1 shuffle=75124454
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=75124454
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=75124454
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=75124454
   make: Target 'prepare' not remade because of errors.


vim +224 include/linux/thread_info.h

   219	
   220	#ifdef CONFIG_HARDENED_USERCOPY
   221	extern void __check_object_size(const void *ptr, unsigned long n,
   222						bool to_user);
   223	
 > 224	DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
 > 225				   validate_usercopy_range);
   226	
   227	static __always_inline void check_object_size(const void *ptr, unsigned long n,
   228						      bool to_user)
   229	{
   230		if (!__builtin_constant_p(n) &&
 > 231		    static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
   232					&validate_usercopy_range)) {
   233			__check_object_size(ptr, n, to_user);
   234		}
   235	}
   236	#else
   237	static inline void check_object_size(const void *ptr, unsigned long n,
   238					     bool to_user)
   239	{ }
   240	#endif /* CONFIG_HARDENED_USERCOPY */
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
