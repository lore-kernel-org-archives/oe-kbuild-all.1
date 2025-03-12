Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933AA1A7264
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 05:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741758086; cv=none; b=QQ55baKy/rD4EE7iuwRZTzQ2r1qxNUuvVFY75MYyMTttIVsD7jgYOorppcN9m+5N8pY5ZCmKsv+rR5iUVahNKqVjKaz04M5M1tiqe8DWGNN9ki6Cg9faFOZrPMaFiLTrnMAQwNm8+flTwHdm0lGcfUqTlNcMZUlxrhzTvfsTz7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741758086; c=relaxed/simple;
	bh=UHIHNjRDAW3fKNs2E11boROeKIYjxdolCXDPViN5H5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bF7BDP6zt5zVG7E69rcMSpdoceK1Axvq2wkHfQEMgDtG/I1eqrX2rnuFgr2eIkm0dmlN+oQy5TBeB6u0RdMgHIoEgmUWxOZ/kjTVV1POPxOq4miiTaB3g25UP2ehEsdpPXmVInjd8h2dfIlBQYHPV2g4Re6pDHskKzRjCXSqS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byESJZPt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byESJZPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741758085; x=1773294085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHIHNjRDAW3fKNs2E11boROeKIYjxdolCXDPViN5H5o=;
  b=byESJZPtmPGDRgJTiR0N9ytPJCV06EVkU+E7QVSzlYou0uuhvZsyn81F
   3f05RbjY1kp5E2lyDkCX73DG6PGlYdbO0sAqmWv1UZ05fL+OMEaUq9eKs
   CpISe9cyX9xkbbTMR9cNIF1QW5g3/cXCg2KqHYXymH1KSd+ex9AJC8F4W
   RejU+tfraXP1G8V+fvFaiK+mNj6/7yEif10fWyzyYiJ0COhZxDlT616AO
   pMfOO0OOd4lQZ/AuY8e5BwTWJypd8BlFowU1Q45xtzlDi42A8zFXUv2Vf
   y2dLYeiaSyjjhmc7Of9JKyOgyja2qsJAd808f+xomJ3+04eWLS+2j4pCH
   w==;
X-CSE-ConnectionGUID: tqXLsVbwR9iiEmRbHJm/zw==
X-CSE-MsgGUID: yUt7UnPmQm295d7eu19meg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54208346"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="54208346"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 22:41:24 -0700
X-CSE-ConnectionGUID: Wl9wJOcKRF6Mp65XVpF8lg==
X-CSE-MsgGUID: Ub7/0XVBSFG8LOObtMtbEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120487876"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2025 22:41:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsEqG-00089w-0z;
	Wed, 12 Mar 2025 05:41:20 +0000
Date: Wed, 12 Mar 2025 13:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 64/70] include/linux/kern_levels.h:5:25: warning: format
 '%d' expects a matching 'int' argument
Message-ID: <202503121326.MX2TcjIq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   d2e2e629f0a887e71446afa03ead92dc5a4af57c
commit: 1f2e18de8214b240046f219f0c37aeeee89a48b0 [64/70] dyndbg: split __dyndbg_sites section out from __dyndbg_descriptors
config: i386-buildonly-randconfig-003-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121326.MX2TcjIq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121326.MX2TcjIq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121326.MX2TcjIq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:258,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from include/linux/moduleloader.h:6,
                    from kernel/module/main.c:12:
   kernel/module/main.c: In function 'find_module_sections':
   include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'printk'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   kernel/module/main.c:2640:17: note: in expansion of macro 'pr_err'
    2640 |                 pr_err("module: %s section-pair lengths: %d != %d: __dyndbg_{descriptors,codeorgs}\n",
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 3 has type 'char *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'printk'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   kernel/module/main.c:2640:17: note: in expansion of macro 'pr_err'
    2640 |                 pr_err("module: %s section-pair lengths: %d != %d: __dyndbg_{descriptors,codeorgs}\n",
         |                 ^~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects a matching 'int' argument [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'printk'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   kernel/module/main.c:2640:17: note: in expansion of macro 'pr_err'
    2640 |                 pr_err("module: %s section-pair lengths: %d != %d: __dyndbg_{descriptors,codeorgs}\n",
         |                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
