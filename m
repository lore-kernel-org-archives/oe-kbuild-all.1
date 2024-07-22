Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856024C7D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721629459; cv=none; b=U0NfxbLv/dIsvuGdbkWES0ZJgHa+cSVYhwHNjnwZ83019V6D04z3wAkyLWvo1FFMDRR/CcR/7MQ3p1XXgfUlkjWqkWk+3gxW8IrWZsKDwEzaPbAp3YlTP0P+0/TLOSRAY9+jl8ktYYEaolpaj4t2s6KMBZrGpUJzslgnqFE9v4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721629459; c=relaxed/simple;
	bh=RCl3ria3LlNb3MN9VOaHGBDyaAyXrEpmeFxNHEWJTW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTMV9vLqFa+jLr58uG8DPtqafCt5GzkTpB0cZIL1iufCG7KjA/Xo1m089zu70jI8etHZ7g4mGXryPyn9bcIoOfKIt4PnPXukLe3TPF1hprzJN/Z6K3WOC9OiJohl41ih09FeeQXbuoS+hGuOV1Y83/18y6F1514QXp3VO/O7teI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1jlHw3y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1jlHw3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721629457; x=1753165457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCl3ria3LlNb3MN9VOaHGBDyaAyXrEpmeFxNHEWJTW8=;
  b=Z1jlHw3y1xP6OmPQrW5aqTK/TCaPBMjtg7TBamzAaREx3Xoq33LvFpSb
   JjcSy9qrSl68DEElnMT+8gOA8bmCfJsL+eC943GEWINX3778V+MEGSxpu
   6zsQt5aIglIc/uThJku4FRxIW4PQwkW0E9KGTG6KVMUzPwBMpCH3HHUKy
   E0wu1KClyYsd6Ck2cwb82a45PV3eXICmXRR2bFK9rqH61kuNJ5tuBiAtb
   wS8L0MvM9mmxFA7n7PznaaMeiGnRndATqrByw9xwqs0zm7ji2FMruKy77
   gLOV9GBZfUL/HMzkcGBjy60mbDEfjisqinxT3azNSLmNkb0Qg/SMl2Fa5
   Q==;
X-CSE-ConnectionGUID: 8YUWR/V6R/Ojc3pPYIq/Ew==
X-CSE-MsgGUID: hxhThS8OSDaM8nGAAC0FxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19026208"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="19026208"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 23:24:17 -0700
X-CSE-ConnectionGUID: iwRWW2GJSrCk0GcUAGckCg==
X-CSE-MsgGUID: Enphr4PvS+WZoqMvDGTvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56618554"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jul 2024 23:24:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVmSz-000kvc-2b;
	Mon, 22 Jul 2024 06:24:13 +0000
Date: Mon, 22 Jul 2024 14:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 42/42] include/linux/mm.h:3025:28: error:
 implicit declaration of function 'pmd_page'; did you mean 'p4d_page'?
Message-ID: <202407221421.58JHGFOc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   0dc6582fabc5dcd9239957e6e6501344fd99714a
commit: 0dc6582fabc5dcd9239957e6e6501344fd99714a [42/42] mm/pgtable: prepare for pte_free_defer and its caller callee
config: arm-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221421.58JHGFOc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221421.58JHGFOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221421.58JHGFOc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   include/linux/mm.h: In function 'pmd_pgtable_page':
   include/linux/mm.h:3019:32: error: 'PTRS_PER_PMD' undeclared (first use in this function); did you mean 'PTRS_PER_P4D'?
    3019 |         unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
         |                                ^~~~~~~~~~~~
         |                                PTRS_PER_P4D
   include/linux/mm.h:3019:32: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/mm.h: In function 'pmd_ptdesc':
>> include/linux/mm.h:3025:28: error: implicit declaration of function 'pmd_page'; did you mean 'p4d_page'? [-Wimplicit-function-declaration]
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                            ^~~~~~~~
   include/linux/mm_types.h:510:52: note: in definition of macro 'page_ptdesc'
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                    ^
>> include/linux/mm_types.h:510:51: error: '_Generic' selector of type 'int' is not compatible with any association
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   include/linux/mm.h:3025:16: note: in expansion of macro 'page_ptdesc'
    3025 |         return page_ptdesc(pmd_page(*pmd));
         |                ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=843080883
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2 shuffle=843080883
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=843080883
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=843080883
   make: Target 'prepare' not remade because of errors.


vim +3025 include/linux/mm.h

  3022	
  3023	static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
  3024	{
> 3025		return page_ptdesc(pmd_page(*pmd));
  3026	}
  3027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
