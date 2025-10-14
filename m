Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8101524DCEF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760470317; cv=none; b=XX6Iz7XFHQUjtKgX3VhcBekNgV9GCU5/kIkuu+8YF5Ed4CmFV79iCh0b2eEB1wj8I51+S0S0M3dCiEWjB8EWTHzYjgNKoprT0SH8lVHv30wvs3XZzynrvXKYiaEH2gnnOEgk7x6uE9HlyDMCmRJdMCGPLxUmZy1YeMaJmsnWGk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760470317; c=relaxed/simple;
	bh=LhXF0R5ZtoEpckWmR/tjBAEL1cwkdWwQLWUgbuYqbHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8czPo6UDWK7ar7oDBy6cCY/n/E4SKZCHac8miqDADF0p7lK2iXrx6n7FqytwxSVko/4rAimwHcGYUAGkNONwW0I3gyoYVZ7WXE7rRGaD2FGszEX+YuJq9Z5PJM9utiOwILs52TX5m05yegfdthoWhr7rYvPSrRlwYdjy0vyiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJmCYk/K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJmCYk/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760470315; x=1792006315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhXF0R5ZtoEpckWmR/tjBAEL1cwkdWwQLWUgbuYqbHo=;
  b=HJmCYk/KEb+9Q1l9fb5eU6SVF7wzFNI/AVjfsu+irdYl2vJd5ajgEuNh
   OBQ2RuYqZncViiSnQntjQjIK6d2mN4hCDbTplsI+ogxuz+0jjjqREDsJU
   jfTonr6G0XaAjPGwFfB5tdmw3oDs5/tT5huFi8+O+b0i/bAUOoNkBhDW/
   uuddNNU+jze8Yz1W2h/SfIS/AuiebhXnmpLFYhBOtCDZhed9mvHLYuAdl
   9V1iN30jI9cRA5Dr6zOJMjQ2CDvucTlhl9UKCEKdg2Dat3gL6bDfCaCX8
   YsClk+c7Z4GQHovhUVm1GZOyzJo9xi5UsMydDBgkqPg8co5PnMnQu8RJx
   A==;
X-CSE-ConnectionGUID: trrUY1UuRIqgMjS98YHdrw==
X-CSE-MsgGUID: Hipe63v8QSiHpgnA9qi91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62673241"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62673241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:31:52 -0700
X-CSE-ConnectionGUID: jzjaq/TcQgCFsYczSdOA9Q==
X-CSE-MsgGUID: XH/43ir8RcSTZ9gFK8Pohw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="212585782"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2025 12:31:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8kkO-00037X-2n;
	Tue, 14 Oct 2025 19:31:48 +0000
Date: Wed, 15 Oct 2025 03:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Finn Thain <fthain@linux-m68k.org>
Subject: [arnd-playground:to-build 5/9] include/linux/instrumented.h:71:9:
 error: implicit declaration of function 'WARN_ON_ONCE'
Message-ID: <202510150353.GZykYFxI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   b24255b1afbf1c9f6fd6e9baaa5ace64e4d2e94c
commit: bd9bfac7160b3f7ff7cb190bcf2b5c0108bddf5b [5/9] atomic: Add alignment check to instrumented atomic operations
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20251015/202510150353.GZykYFxI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150353.GZykYFxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150353.GZykYFxI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   include/linux/instrumented.h: In function 'instrument_atomic_read':
>> include/linux/instrumented.h:71:9: error: implicit declaration of function 'WARN_ON_ONCE' [-Wimplicit-function-declaration]
      71 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
         |         ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/WARN_ON_ONCE +71 include/linux/instrumented.h

    58	
    59	/**
    60	 * instrument_atomic_read - instrument atomic read access
    61	 * @v: address of access
    62	 * @size: size of access
    63	 *
    64	 * Instrument an atomic read access. The instrumentation should be inserted
    65	 * before the actual read happens.
    66	 */
    67	static __always_inline void instrument_atomic_read(const volatile void *v, size_t size)
    68	{
    69		kasan_check_read(v, size);
    70		kcsan_check_atomic_read(v, size);
  > 71		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
