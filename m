Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A12EAB8E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973538; cv=none; b=iFKUcpOcGbTH5/EgspKu/xNFVHe6/zlnUdEA5TEuq5rPvN++2unIIeg8THZtQEvrZt0ysYLMMGKE0KK0FeUNTFtAGbDdZ+zt4zZOAmmTDa5xgLir2opBtJSoxotLX6NyllUk38W7YcGUOfdBkx5IevOQVYZAcszwy8f6laHov5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973538; c=relaxed/simple;
	bh=2C5rVuGkFTaSM2Oen8imI1+CyKeXfsB65iGjm6mbxHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xx+ciIMkTbNdnXk71xHB5ZWER0G99en9XgoERFBogSfrGFdH8yxAlbCoxSt1oRgN0w8RwuiJK+bgmNmc3lJ4+fHCmlLl19yl12I7qmA71exE4imTTA+mll/f85Go5DaJ87BaQrHJVIzWP8Q1Tyedrk3SzIkmh1bQdNRnKcxv8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ks535+L9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ks535+L9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763973537; x=1795509537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2C5rVuGkFTaSM2Oen8imI1+CyKeXfsB65iGjm6mbxHc=;
  b=ks535+L91nKEHiAnfuI8Q2EYOs/aP+1iHwCemwW81n9RB3PDaKTNJzSi
   YbKWdV6q8/JgsJyPqQKCUFscfS+axLKmcSmrRJVengLGOOemLLS6FAKJ1
   EjAyNAPLDtt8RZtkAQ6vC0/S8IoWKJ9Lr88CxAmvaTzGr+VrZP0Rh/c1H
   iP1LlP8xUK7S3HKCT90hVSoVYwW8iiacYvCFA+PV161iAq+RIw2i4NZVx
   E4CTk6jG3mKiMohAT2cHI5xQnYV0nqkDIrai0mN+JweWu5oI4Ex3N9IKN
   651XND5yfsPEB3NCA0HDqLhA4yRP/kJlwitU/qjF3k9KogN8KIvK6ckki
   w==;
X-CSE-ConnectionGUID: fXwUvzxGSgGoodG88Zu2PQ==
X-CSE-MsgGUID: NPs5qoD5QMWLFZc4cdcNIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77329069"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="77329069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:38:56 -0800
X-CSE-ConnectionGUID: iQyDMvd9T0Kh8ams8KetZw==
X-CSE-MsgGUID: dCQFDI1aTq+/epFKcHcLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="197391053"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2025 00:38:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNS60-000000000Wt-1wH5;
	Mon, 24 Nov 2025 08:38:52 +0000
Date: Mon, 24 Nov 2025 16:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: include/linux/compiler_types.h:572:38: error: call to
 '__compiletime_assert_596' declared with attribute error: BUILD_BUG_ON
 failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
Message-ID: <202511241637.BoBE5PKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
commit: c090868f59ce888db838cf543d18f731d13ed498 Revert "hugetlb: make hugetlb depends on SYSFS or SYSCTL"
date:   2 months ago
config: mips-randconfig-r054-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241637.BoBE5PKN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241637.BoBE5PKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241637.BoBE5PKN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/mips/mm/init.c: In function 'arch_mm_preinit':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_596' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT)
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
     553 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/mips/mm/init.c:434:2: note: in expansion of macro 'BUILD_BUG_ON'
     434 |  BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (PFN_PTE_SHIFT > PAGE_SHIFT));
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_596 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
