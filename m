Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA463A6EE2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009781; cv=none; b=QJpn9fFPMWwHNlIr5X2r5sPyGmFl+6EBPMrM3SHZT0BmgzbCVGc9XV1pqLpm9EYB4+14LwCc9mksj7VrTfhn5lZXYOgL88ucwkAKnBnkBG3t+1Ig25Rv851JSLcnA1MfhvrH1sul+zzPoxSuU2F658+nnbw7bL11dKc3A0cd7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009781; c=relaxed/simple;
	bh=9HiU3b7vrVBt9inB2si0oOTmxZWSd+EKacqYLPVblZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rn6WmKnUHsyPK7YuMQyeo3gOHeyxNSXXN19DVZcQIfflp2kOowOCLa+aNKd3nv7ycvDwjxgLEsux3lTrfcr4/bK8dxXat2huprbm4K1pOfQeRvjC7PRSdeQ7P483XXFnXkbCEDzC2bxtCVtyAQYwsqOJokBZapcbLPHaTTk1e/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhoA3m7h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhoA3m7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774009779; x=1805545779;
  h=date:from:to:cc:subject:message-id;
  bh=9HiU3b7vrVBt9inB2si0oOTmxZWSd+EKacqYLPVblZk=;
  b=jhoA3m7huwZ8EHrGtuiTyE96ny1pzjkcwygCWzRjurwN3MRUk2uoLwds
   smAP33SN26KBfXAmWaFS/5j51OD9yyt3bA558xUVLNGXjkEZGF7EsW4qy
   rfBjyf/xWlKxdWg44AEplsvDSXzjZuZNnmCaXAGLiflWIxCK835R7AujY
   w5PzIV7okFbDPV75fdQh013RaHYHjgaH8LV2CyM3nEmjfCJugpuAB6Uzk
   dvvIET7nqiBH4n/76v8kDqzscV21bMLC4ttXN3hEPQ/9Q4DeRNQikafKm
   8coZbGoI6D2BeOkCEaEVIT22V1dRd3x7pUO9SB/6MF9c7VNDBlHgGYzDm
   A==;
X-CSE-ConnectionGUID: ByRo4CvsRMO3QIqiSRi3hg==
X-CSE-MsgGUID: YA4Bt/LXR5m4rtqEYPjlng==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74273375"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74273375"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 05:29:38 -0700
X-CSE-ConnectionGUID: zoknpYiMQj+WiwTFk7Ni7w==
X-CSE-MsgGUID: eXDKXhIwSoKV2joyUDUCTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228001097"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 05:29:36 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3YyX-000000002Lx-0CFM;
	Fri, 20 Mar 2026 12:29:18 +0000
Date: Fri, 20 Mar 2026 20:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:upstreamtest 2/2]
 include/asm-generic/bitops/instrumented-atomic.h:112:16: error: implicit
 declaration of function 'arch_test_bit'; did you mean 'arch_set_bit'?
Message-ID: <202603202024.Zs1tVN8x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git upstreamtest
head:   5c38ae7e5c475be0eb737e7e77f6982529e0ef4f
commit: 5c38ae7e5c475be0eb737e7e77f6982529e0ef4f [2/2] asm-generic/bitops: Move test_bit{_acquire}() to instrumented-atomic.h
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603202024.Zs1tVN8x-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202024.Zs1tVN8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202024.Zs1tVN8x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bitops/atomic.h:68,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/asm-generic/bitops/instrumented-atomic.h: In function '_test_bit':
>> include/asm-generic/bitops/instrumented-atomic.h:112:16: error: implicit declaration of function 'arch_test_bit'; did you mean 'arch_set_bit'? [-Wimplicit-function-declaration]
     112 |         return arch_test_bit(nr, addr);
         |                ^~~~~~~~~~~~~
         |                arch_set_bit
   include/asm-generic/bitops/instrumented-atomic.h: In function '_test_bit_acquire':
>> include/asm-generic/bitops/instrumented-atomic.h:124:16: error: implicit declaration of function 'arch_test_bit_acquire'; did you mean '_test_bit_acquire'? [-Wimplicit-function-declaration]
     124 |         return arch_test_bit_acquire(nr, addr);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                _test_bit_acquire
   make[3]: *** [scripts/Makefile.build:184: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +112 include/asm-generic/bitops/instrumented-atomic.h

   102	
   103	/**
   104	 * _test_bit - Determine whether a bit is set
   105	 * @nr: bit number to test
   106	 * @addr: Address to start counting from
   107	 */
   108	static __always_inline bool
   109	_test_bit(unsigned long nr, const volatile unsigned long *addr)
   110	{
   111		instrument_atomic_read(addr + BIT_WORD(nr), sizeof(long));
 > 112		return arch_test_bit(nr, addr);
   113	}
   114	
   115	/**
   116	 * _test_bit_acquire - Determine, with acquire semantics, whether a bit is set
   117	 * @nr: bit number to test
   118	 * @addr: Address to start counting from
   119	 */
   120	static __always_inline bool
   121	_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
   122	{
   123		instrument_atomic_read(addr + BIT_WORD(nr), sizeof(long));
 > 124		return arch_test_bit_acquire(nr, addr);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
