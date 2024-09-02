Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9D41CB501
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290531; cv=none; b=FvY6SSzRmqRvBuSNuc0cLLDoVFaqCZELVcfUBRche9PvsIa/ClD2hypvq3VzCnVz+vC9AMKiwijfV4m7Gw5iOdt3uSgKwOhUF9mIsmO4GTGnAGELZbAzZPs1n2yWK/MCAKf1opVKHultE1ouZOoKS78H58WMU3hljYgmupCvRS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290531; c=relaxed/simple;
	bh=m54lpUm3g3LKde+BcQE2sb7EXgm2e0mqX0cAY0ZqEUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfR4NXagF1bBgyu1XQtoKiwkcPGGGJ1r5UrCUrX1tmMutJ45AbIR4rg4BSFO5K/XjAjfSYiegDKpOy3vBQfSeuAbVJ7vilTzsZVdJXgRxg9jHeD6130RnIDWFYjLVe5nmTJaYB7iCrR9QxkTfGF+f+SXU2ghA0vXNlJ+vthNh3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgnNkhNP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgnNkhNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725290529; x=1756826529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m54lpUm3g3LKde+BcQE2sb7EXgm2e0mqX0cAY0ZqEUA=;
  b=hgnNkhNPV5gah+3H+KR/l5ErN6D32lO26KOVOWEaxsq44jQ43P3Vo2XK
   cCRfgg7sUHhxoQJRTSp1VuZ/MFAl3OYI7xD8h63b5kUfeMU9t/OFNd8x6
   9V45oiQvBgtnyhyYCXpvqthQg/XbcTOcpCQMo3umfW5W9u/tIC6czuL1L
   ari1ggTQNVQTusMNLwQtM2go1YBRjEpsEyj1k2sq8n6vneZJRBFMXbPAu
   aWuedBolinnHbZFNSrCcg/fj2Vbd44SF0wq5v2fhPPbRpd8AiPQstwqac
   TjN2PH/UnVLmf6378vP2bZfa7SMrcTzZG/MK5JhUoq1ZLbENSA7ngMlYU
   A==;
X-CSE-ConnectionGUID: lHKnQgnJQzuM9Osqpy9R/Q==
X-CSE-MsgGUID: 1ZJ4Jj0DSCeKAVsG7EHlJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23390603"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23390603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 08:22:08 -0700
X-CSE-ConnectionGUID: ylx2yGAZT1S+6fIpbjIbCA==
X-CSE-MsgGUID: kq2fNC1oT+qKluk5/pekxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69275132"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2024 08:22:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl8sX-0005fG-0C;
	Mon, 02 Sep 2024 15:22:05 +0000
Date: Mon, 2 Sep 2024 23:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-next:master 7055/8400] include/linux/compiler_types.h:510:45:
 error: call to '__compiletime_assert_303' declared with attribute error:
 BUILD_BUG_ON failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
Message-ID: <202409022326.gjEmSP9K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: 2f2b9a3adc66e978a1248ffb38df8477e8e97c57 [7055/8400] powerpc/32s: Reduce default size of module/execmem area
config: powerpc-buildonly-randconfig-r006-20220613 (https://download.01.org/0day-ci/archive/20240902/202409022326.gjEmSP9K-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409022326.gjEmSP9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409022326.gjEmSP9K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/powerpc/mm/book3s32/mmu.c: In function 'mmu_mark_initmem_nx':
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_303' declared with attribute error: BUILD_BUG_ON failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s32/mmu.c:226:9: note: in expansion of macro 'BUILD_BUG_ON'
     226 |         BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_303 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
