Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356681D6193
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763987350; cv=none; b=K01wolhz/HCter0x6LHpqqniVn6gK6Kf+d83pvJwcXtU/vPa6hZ9xGT9Bip5MbQKx5cl6ofkyEL1ToLaTtyu9EAAR4g6fyIiUTKyL0uKvYfv5/NU3Xgh1/Tqv9E9vVRG2FAvYiWMyn9nkkb8iJZkLxUqQjVimG4xpGiQl9l3gJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763987350; c=relaxed/simple;
	bh=54UHRhqSJ9agc7OCjOZHMfe8pIR/h8kjnnUoUfwVZ88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nqysV0lMR6/EOlcKBJkhlqEFmgr+Tqym8jmgHvkXc81A+0AxAtrYobbITdrWTQmr4sbNDdkc9Oy+/n1UaWgpnGz2KbctsT29eESjTQLMCuACShaN3TI+SDr0DCS7QH6Z4HCT/8lnkGYXOSTri91SjsuNHf98IHs+payVAOnEpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4onzEXO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4onzEXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763987348; x=1795523348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54UHRhqSJ9agc7OCjOZHMfe8pIR/h8kjnnUoUfwVZ88=;
  b=Z4onzEXOtkM0soRlUHUfslrEPEiQ3lU8LtWxmS7STdod8XVOlQEqV+Zj
   r2cmnI/9ZL0izQgAoTp5XnUo5Tm7Xz8277HbjCu8NHETzuNtH741Z3dFA
   /9sYnT1tUJiBcVLEU+DuMCPsa8dMJjoDgQwfm3Zh89pXx4rrar++4njNN
   7U+pmMLBDwo1M87I5slzi5G0NqlDJefMPCwb+WEKhuxwx+v7RmdzD54IK
   3dJe0zuQB7UH8jKM3Cmlz96QvJ84FD27yJIxcrncHHMTbZMiYHtdY4qDy
   OUh5eUdEi7oTpvNHKQr9YY8FmAx8IdcF1ijeXND3r0rBykeJ48fMRZCv0
   A==;
X-CSE-ConnectionGUID: bYG6tF1wTnSA3dnPBS39+A==
X-CSE-MsgGUID: hz6vJsVvTDOZ4+4BQ+hK1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91468871"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="91468871"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:29:07 -0800
X-CSE-ConnectionGUID: EaP4AtmjTpirCfZ3Dtu1fA==
X-CSE-MsgGUID: +AdFXuZ9Q6uZSfgyzURchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="223288695"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2025 04:29:06 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNVgl-000000000ip-2n95;
	Mon, 24 Nov 2025 12:29:03 +0000
Date: Mon, 24 Nov 2025 20:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 5383/11041]
 include/linux/compiler_types.h:597:45: error: call to
 '__compiletime_assert_30' declared with attribute error: BUILD_BUG failed
Message-ID: <202511242012.I7g504Ab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 6303c0187f03ab47c748302f020789558d825f70 [5383/11041] iommupt: Add a kunit test for the SW bits
config: x86_64-buildonly-randconfig-003-20251124 (https://download.01.org/0day-ci/archive/20251124/202511242012.I7g504Ab-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511242012.I7g504Ab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511242012.I7g504Ab-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iommu/generic_pt/fmt/x86_64.h: In function 'x86_64_pt_sw_bit':
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_30' declared with attribute error: BUILD_BUG failed
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:578:25: note: in definition of macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/x86_64.h:189:25: note: in expansion of macro 'BUILD_BUG'
     189 |                         BUILD_BUG();
         |                         ^~~~~~~~~


vim +/__compiletime_assert_30 +597 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  583  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  584  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  585  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  586  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  587  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  588   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  589   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  590   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  591   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  592   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  593   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  594   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  595   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  596  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @597  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  598  

:::::: The code at line 597 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
