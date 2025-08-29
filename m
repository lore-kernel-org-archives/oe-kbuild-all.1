Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F0B676
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756504846; cv=none; b=YeqILER14GRoPE8vWq7Kl6Iw1RtvCBVxERsbVjdEH0AlY6plNrtcRM0VrkTJ3rztLPHhaL2e0p7OFKRrcPofpJxCXtRRrHORD8uDcugy1bwCycNxicUxR38H3SlBS8FETdUxENCgVRed/49/7aYVRjNtfLgE10TiI4D2tBiNugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756504846; c=relaxed/simple;
	bh=asYPBgdnFJlrbBXbrdRTpYb13H2dXP5iSjU8VnfPs5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JR3Pyun7hiAQWdhRM7pqCZYJexE9RIo8TAdUWycCoHdzTMin2TikPVdTx7pCOnV+LE7QYMurWeBRNk2CShz3+l11rU97mMk4ibvIoLXl1vMv14o259iTd46bMqHJggsJskdS+TeuVs8k5SbpMVN4QKq8PRtVJJLGBk/4nC52mkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7VZ8AvR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7VZ8AvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756504845; x=1788040845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=asYPBgdnFJlrbBXbrdRTpYb13H2dXP5iSjU8VnfPs5k=;
  b=E7VZ8AvRwyri+qC2YLs56L7UdTdrE6LleU9/p8j28BcAVPrdjXoKnGiu
   FAmfnSbgUqULI5Qw8O62c+jxqBBHmDX9ITeq0Y2vxyKTGVCT5eNCteyCr
   FRISVTS0bRyIpMcAVyHXSrdptFGAeJIAVAePTRppIsRdQo2Xw/72nt/y+
   ZS/4sg+mZFBToWYsVKR6hFagVPBRUYTstkczDG5d5Cha2wT1T+h7Y18aK
   XdjZZeZzSK1V0yokQMNtFKrchBGpT2m7Xe1oSa15bQsAEkY3dE8VNHmJN
   JLTjLg/UTwFoqwDHv8zUg1JT+Epeov7Z2nQ+nippeqcuK1Uf08sxTeLYp
   g==;
X-CSE-ConnectionGUID: TEqAhh+NT8+JaD8wejX4YA==
X-CSE-MsgGUID: qswnWr4kSaOn7W9ELCymZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58870225"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58870225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 15:00:44 -0700
X-CSE-ConnectionGUID: byy5oWMMRZ2tZ2ZC7cBzOw==
X-CSE-MsgGUID: f2wME9VhQV2MvuZFNkG93g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Aug 2025 15:00:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us78J-000Uzz-0H;
	Fri, 29 Aug 2025 22:00:04 +0000
Date: Sat, 30 Aug 2025 05:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 33/34]
 include/linux/compiler_types.h:572:45: error: call to
 '__compiletime_assert_30' declared with attribute error: BUILD_BUG failed
Message-ID: <202508300525.V8Dg0EgY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   fbb816ad5a7780a27bde18e3090b30552b6068f9
commit: 44d4d9e727e7ebec1aaeb896756a1671016bbd52 [33/34] iommupt: Add a kunit test for the SW bits
config: x86_64-buildonly-randconfig-002-20250829 (https://download.01.org/0day-ci/archive/20250830/202508300525.V8Dg0EgY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300525.V8Dg0EgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300525.V8Dg0EgY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iommu/generic_pt/fmt/x86_64.h: In function 'x86_64_pt_sw_bit':
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_30' declared with attribute error: BUILD_BUG failed
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/x86_64.h:182:25: note: in expansion of macro 'BUILD_BUG'
     182 |                         BUILD_BUG();
         |                         ^~~~~~~~~


vim +/__compiletime_assert_30 +572 include/linux/compiler_types.h

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
