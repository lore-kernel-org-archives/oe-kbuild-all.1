Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB526CE28
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757548104; cv=none; b=QYaj44itqXn9ogcjm6lEkkAvrnS2JMWpa1WNX9dETw/csUSGbird3ilCfmIbHKvmL9eXMl/N7RvL9i1jv4rnxohWvKmVsIZhKHC90IgTqdMV8Ki9EkT+V10iVkCDuKUfP30J4l+4ATfCLMqtUO/3s8UU071fzL/XYdHhtxH033A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757548104; c=relaxed/simple;
	bh=QevkYdBoBhU9h0Su1WTXFTCspLRf/nkZqd0Hz2v7PTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFqgUWRgjzzUjkux4Lu3QqzXllLpGq1Arm8ZdgAd24liqp8IG42vva7AuOIPL7HaQKR7kWEb0bmFTxKxZ7Tw4T1zIonvJBLKYevk75/q/xG0jDJd+QSagH4P90o/Qx3mzu+2+a4wONwHKofeQ6xLRp7QeVZsr+U+rLqkhljYaMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFe61/jJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFe61/jJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757548102; x=1789084102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QevkYdBoBhU9h0Su1WTXFTCspLRf/nkZqd0Hz2v7PTQ=;
  b=OFe61/jJ8WvhIZzPoZan8GiFWS/+Jbl9CuSZ2ciish8eg9/iFRXhg5g/
   yGgag3vYE2V62UrSFjAmv1dh1Bo8lIZsTHlcMHhoGPwjOYyhDonKfjGjP
   79mjIGvvPhbjaBMhT35nkh79DPFPOXXk68lAD/833V0b8u+pXLLBjAsbR
   tS+c452ei2ItkXQc2dlJnaig5vunHnqyHBCgS11BTkb7MSdme0Y9m5cuK
   cyv+Y42yn/tokG4k3F1Gi3xH1wfDYvwbYv/c6WRfcTZyHzXAi2i2J0Fdz
   /IaBvXg5zYmPQpejxfAZiZcGaLwBBq864x34cQjzsN+OdIvmvNIW+2akQ
   w==;
X-CSE-ConnectionGUID: qhYOvSDKRumaXv4p8wDgQw==
X-CSE-MsgGUID: xUGwofakSDynayBwOerKhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59096117"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="59096117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 16:48:19 -0700
X-CSE-ConnectionGUID: Br/0NSeFQvyA2Rjiu9jDGQ==
X-CSE-MsgGUID: HJMU+u4lRtuHLlj7DC1skQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="173602472"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2025 16:48:18 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwUXv-0006Mp-1F;
	Wed, 10 Sep 2025 23:48:15 +0000
Date: Thu, 11 Sep 2025 07:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 400/411] include/linux/compiler_types.h:572:38:
 error: call to '__compiletime_assert_486' declared with attribute error:
 BUILD_BUG failed
Message-ID: <202509110742.wWjLDz1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   3a0afa6640282ff559b6f4ff432cffc3ecc2bc77
commit: 5e59d4de7ff923ce84158f3357c4e964d2ec46af [400/411] mm/migrate_device: implement THP migration of zone device pages
config: powerpc64-randconfig-003-20250911 (https://download.01.org/0day-ci/archive/20250911/202509110742.wWjLDz1Q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110742.wWjLDz1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110742.wWjLDz1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/migrate_device.c: In function '__migrate_device_pages':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_486' declared with attribute error: BUILD_BUG failed
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                        ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
    #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                               ^~~~~~~~~
   include/linux/huge_mm.h:117:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
    #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                             ^~~~~~~~~~~~~~~
   include/linux/huge_mm.h:118:26: note: in expansion of macro 'HPAGE_PMD_ORDER'
    #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                             ^~~~~~~~~~~~~~~
   mm/migrate_device.c:1101:10: note: in expansion of macro 'HPAGE_PMD_NR'
        nr = HPAGE_PMD_NR;
             ^~~~~~~~~~~~


vim +/__compiletime_assert_486 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
