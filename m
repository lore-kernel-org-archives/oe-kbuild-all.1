Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616033;
	b=DF2r2g+RbXn6dBSNfBWP85enh71u9vZOnGCCk4MgI/xEnsmXUBh5l3HNB/yjWLLBseEx
	 +Qzl4uCLDWJ2LZipaR6pK+iZnHUcnYoq+/iKC6fNo8d+ge+SdkuOanPPDAqhikFzOrdXO
	 cBVdgeObIy4QiGEWkfCh+DwJOYyljn8UwrJGq+ff7e/qzXIaPt430iHpWpnNwtHUrB95W
	 z6qyDR4+PVTMVByLCNhFbFH6RbXwwuJZGwP4/nmIaTO/6+iqLZIEVZWo6eB3ixn6VSH1H
	 Bk6xJnLRmPebWTlq2sEDeOnxhX2Rt2wRNKfPtXhj7pSCZ+pBwelHiCSacKuQsl9ECTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616033;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=B+Z5tpkcaj1+zJnq2qpGqkLsXGb+NGD+G0czFiODwTU=;
	b=OKKqG4t49OXJcU5IlAEa72RTfCWiuwvm4IfsN1bm9M7lzI5gieiJQO9e92PUdaBHcu3l
	 geAtGhJUs95cS4WVdupgepGMq6jk4uiopW5MG13h1hEO69gRnEHPLempCVtJmMfUY/HGF
	 PyqlkIxISjwupB/u+KoC5w72vsRjkJwge/SxMqHowzshinO0lZhpCLyMH9gxt1KDo7hpY
	 jCe4kvJ2Mwtj5Hfy4ChX1eWW4Fa+dTEjspQIL6MXzVg3XBOUWcZmiFWA1hrFAa/IjgU6U
	 hOZ+Zq7OAEC+lCpZOK7ydJtfJjoqjjoQJO3EHNHTaJWpgh99WQ1RD/gwFh4AW3oSRcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Esx4VvgJ;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C5606A330
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 14:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58C5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Esx4VvgJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795616033; x=1827152033;
  h=date:from:to:cc:subject:message-id;
  bh=B6IZ8/omBquni5BpxTAXqzhy+D1Tc7w9Ou4meQeXK+Q=;
  b=Esx4VvgJBTaZE73ZtK5239gV2dX+iZkYyxveTpd37TeWpupp+mT1MLh2
   2Z7Muc75fBSC8LXusaTAb5+5J53goTYbHdxbMPwlpMmESIRwqov6SXPZO
   CY3tJ8AXAfB45zONKs+AsVYIs/X8GSk5M22pwcNgsQ/O53OJDAMMqDPAG
   GSJqOfD7EMvOntIocTjWYqAuEugmPMWi66r1XMelS152YjsC0JuF9nZiq
   qQ6i++sOwM3TM6ze3/JlQgHItC7aJQTA+kNC6VSa706cuMx1FDobwYKdy
   oTBZtLGxX6QgNVqv4y3MX4blFIX4W7zyiNbn2+8OtLgjYADXrsFxw1zDN
   g==;
X-CSE-ConnectionGUID: w6/49sMdSk2OcCOsys9U/w==
X-CSE-MsgGUID: xVQOB1SRQYuhPmj1MAOxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4354703"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4354703"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:13:52 -0800
X-CSE-ConnectionGUID: Pf7Q2JN+TqegicPq4g6TXA==
X-CSE-MsgGUID: AVeibcgrSWmI8BjZkicxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12017222"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2026 06:13:49 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWDkp-0000000008t-2h5U;
	Wed, 25 Nov 2026 14:13:47 +0000
Date: Wed, 25 Nov 2026 15:13:11 +0100
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_80' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <20261125151202.OUuYjG2H-lkp@intel.com>
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
head:   4dce97c6c265544342e716e62fd24bbb232590c5
commit: b290b5bff8505b0eafa04684b10c50cccfc64013 s390/Kconfig: remove PCI dependency from HAS_IOMEM
date:   6 weeks ago
config: s390-randconfig-r2102-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125151202.OUuYjG2H-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125151202.OUuYjG2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b290b5bff850 ("s390/Kconfig: remove PCI dependency from HAS_IOMEM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125151202.OUuYjG2H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'amdv1pt_install_leaf_entry',
       inlined from '__do_map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:757:3,
       inlined from '__map_single_page0.constprop' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_80' declared with attribute error: FIELD_PREP: value too large for the field
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
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_80' declared with attribute error: FIELD_PREP: value too large for the field
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
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_80' declared with attribute error: FIELD_PREP: value too large for the field
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
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_80' declared with attribute error: FIELD_PREP: value too large for the field
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
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_80' declared with attribute error: FIELD_PREP: value too large for the field
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
       inlined from '__map_single_page5.isra.12' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1,
       inlined from '__map_single_page' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:768:1,
       inlined from 'pt_walk_range' at drivers/iommu/generic_pt/fmt/../pt_iter.h:408:9,
       inlined from 'do_map.isra.16' at drivers/iommu/generic_pt/fmt/../iommu_pt.h:915:9:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_80' declared with attribute error: FIELD_PREP: value too large for the field
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


vim +/__compiletime_assert_80 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
