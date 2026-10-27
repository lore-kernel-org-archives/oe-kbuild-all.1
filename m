Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126715;
	b=pRNivf7inSNaxveLCt8W0Bf82Xm1bqIjE9N9wVTN4N27/jUOEClXC0TNzOeg2vmm6ci2
	 dQm5iPGvdRMmWicN1snvDLajkUoEnE8bx1XUQHRUmR1qXDuQPtnCpUoN7RGSLrSHCUJwR
	 uRcV6SG3cQ16eG5u+kUp7S6jOeR2Lr5yjo/cBazQPc/ysSOg7oN4qg4Y/QZaIEy6ku/23
	 XbT8iOBQI6UtaWfmWB2VVFfNaVnMwk5GbNsxcdNwRFRagTPkD7WfOTnU1EudBKSkfT6Ma
	 PmlpmVJo7C/LPaVQ0Q0OAAzXQbX0DvkyOAEB4VCPor/tksrN2yXyHH3jvByqWCzZERg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126715;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=f0A2ObWo7o0O67W0+nbBE5vRd5quvrKciUyjTxttwSM=;
	b=vXkKzdDRdvrAh/CKzbze2wwH/2MDgZjnrUj1SaUyIu+Ccmd4vKdKwqWfE8tFizbJf5N8
	 Ss82uvSrq7YRoY92NLRT6ijFTtaX7AmF9webeYihfOClD3Cvx/lNFAcKjc+T3Uqg8VQV2
	 VyEEjfKiWyaSxJ/hXHYPKb2SH5F2JEC9NwZjcuUTFDc4AO3j14tjtYCg3UbXX+7FIciNq
	 2FLZUjfApao5u05cHcitAPBLrNiWVyJk8cu0sOHn/y16P7O6ytgGvFLAC3h4N0uOpJVzK
	 qjBHNJa22mA7Yas7bi4Ukb2YqHyoISYthqN72MMntQp2yJHQ/wg4kDnHbjcPtKPu9lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XVwyCVcJ;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109FC606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 18:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 109FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XVwyCVcJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793126715; x=1824662715;
  h=date:from:to:cc:subject:message-id;
  bh=MVNkZmBSAs3G1MDcWqPZQn+OohMWIC3Dbhp/gFBOWZA=;
  b=XVwyCVcJOzObjtNSvmJH2ynK/c/uwxMZ1/M6LrI2L0h5va0zeFMMy4cM
   o/BdSNDybyg8dVbk6F/6kKjjZVBtvPCeiZp/irqmBHuGAM4QQsfduhqvz
   mimFxyE7EOnFQuFwIOaPybmvexpnc56VaxTaZDjxYKRm5z6kLUMHL1Ugm
   whRAqLc0xVt/IrUB1qAxZKm7Q6wgHpFbZ5RCYlV/6qwyvsFJ5rwaiIORh
   e/GziWE5z/Il+Ja1JB9rtcZSCKyqq94CKIAEOzN9Q6+0dgneux4KSL6ah
   0aYFuU2ELAhsTfH/wAGcp52Natnkuii5uhYX5+uPJlqY7Smo6jnrfiYEe
   A==;
X-CSE-ConnectionGUID: aR4aHMoaT22KOMNCjIlUzA==
X-CSE-MsgGUID: 9Mz4s8JqTR2QMuitnB5Lpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1866105"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1866105"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 11:45:15 -0700
X-CSE-ConnectionGUID: Mvqni8OySiy25BQNF8mPrA==
X-CSE-MsgGUID: S9m8GC01Q6mjzohpdQXc1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5015495"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Oct 2026 11:45:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLmAY-00000000XbU-1j6y;
	Tue, 27 Oct 2026 18:45:10 +0000
Date: Wed, 28 Oct 2026 02:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_74' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202610280207.7fUp3BXs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
commit: d70242427110123b65c095594eb74a703d3af156 ARM: rework ARM11 CPU selection logic
date:   4 months ago
config: arm-randconfig-1002-20261027 (https://download.01.org/0day-ci/archive/20261028/202610280207.7fUp3BXs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280207.7fUp3BXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70242427110 ("ARM: rework ARM11 CPU selection logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280207.7fUp3BXs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'amdv1pt_install_leaf_entry',
       inlined from '__do_map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:757:3,
       inlined from '__map_single_page0.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_74' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:91:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:220:5: note: in expansion of macro 'FIELD_PREP'
        FIELD_PREP(AMDV1PT_FMT_OA,
        ^~~~~~~~~~
   In function 'amdv1pt_install_leaf_entry',
       inlined from '__do_map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:757:3,
       inlined from '__map_single_page1.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_74' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:91:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:220:5: note: in expansion of macro 'FIELD_PREP'
        FIELD_PREP(AMDV1PT_FMT_OA,
        ^~~~~~~~~~
   In function 'amdv1pt_install_leaf_entry',
       inlined from '__do_map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:757:3,
       inlined from '__map_single_page2.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_74' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:91:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:220:5: note: in expansion of macro 'FIELD_PREP'
        FIELD_PREP(AMDV1PT_FMT_OA,
        ^~~~~~~~~~
   In function 'amdv1pt_install_leaf_entry',
       inlined from '__do_map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:757:3,
       inlined from '__map_single_page3.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_74' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:91:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:220:5: note: in expansion of macro 'FIELD_PREP'
        FIELD_PREP(AMDV1PT_FMT_OA,
        ^~~~~~~~~~
   In function 'amdv1pt_install_leaf_entry',
       inlined from '__do_map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:757:3,
       inlined from '__map_single_page4.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_74' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:91:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:220:5: note: in expansion of macro 'FIELD_PREP'
        FIELD_PREP(AMDV1PT_FMT_OA,
        ^~~~~~~~~~
   In function 'amdv1pt_install_leaf_entry',
       inlined from '__do_map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:757:3,
       inlined from '__map_single_page5.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1,
       inlined from '__map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_iter.h:408:9,
       inlined from 'do_map.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:915:9:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_74' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:91:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:138:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/amdv1.h:220:5: note: in expansion of macro 'FIELD_PREP'
        FIELD_PREP(AMDV1PT_FMT_OA,
        ^~~~~~~~~~


vim +/__compiletime_assert_74 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
