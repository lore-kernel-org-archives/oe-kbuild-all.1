Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340328C85B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 06:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753164252; cv=none; b=KIAGXtHSC/bQc1XUdVI/YO9xruKO4pSGlXZW2mkwN5MH+BrB5ClYd/TBcmfEoQW/StTRVocviDzAhs7KOK99h24V5h+67t/FwBcOLVzDjZfvtCz2AI6LKG1GksCQ+5Qxxkx9dmLHdc+SZuaY0MiiWVs+rTgNlcwUlOz5vLawHLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753164252; c=relaxed/simple;
	bh=aLJIoJW7+ABF276ozIEji1Fl7YF7kukQKLCujwqcpmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SF5tgPBfmiped/bACIkWekUsRBk0NcMiBu6FKzLVjm3NRa65AnBJ13xCz3NdS3dBbaaZG+MZ+/u+N4lcOgELv0YmAr9ZZ6tpOT816w5gGRaqd2DaESSYWmcjk7bvKmVWAdye4P08uJjJ83n9I1vn/+D4pvQBv4YWe8GYdE3y1/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVC6ehdA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVC6ehdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753164250; x=1784700250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLJIoJW7+ABF276ozIEji1Fl7YF7kukQKLCujwqcpmY=;
  b=LVC6ehdA73LmYzerJyGdRS11LmYkI5Uq2jnyeEedPBstuaufsTIfqKdD
   lmpTUEwO+N8gUsO6rVEl0SHk6qaJWAVtlNkuJ42b7MYAUWnTpSbF9TP0r
   FO7kTocYs4ThDUFWR6EKSudO1G4wDwQn/NkjJjhfdf6XFP0ZbkNrEZqpg
   tJZcoW51Iy3tO+pHa8i5z+CJLhztuuNhG++L/EChBJstjdA8hlhnCKkn+
   ZWlgH0Vmvevnkvr1NaJ6PlFYz7Vrt0JCFzxyX6wlO3GARvE/bOJfV6zNU
   c0PoYWMb6riDbntBCTBYxINsIzchusjewyhEeqfvX7ZaP6Cacz9PU+n4m
   A==;
X-CSE-ConnectionGUID: NWzc31h6SXS/nleeC07beg==
X-CSE-MsgGUID: u/hN+2kASZqGE0/qXbWKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="80842610"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="80842610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 23:02:17 -0700
X-CSE-ConnectionGUID: oQwUpigLT3W02dExa/Q7iw==
X-CSE-MsgGUID: MA7V2sQzQe+i8bO77Agsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="163093521"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2025 23:02:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue64r-000HVY-1D;
	Tue, 22 Jul 2025 06:02:13 +0000
Date: Tue, 22 Jul 2025 14:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3057/3057]
 include/linux/compiler_types.h:323:38: error: call to
 '__compiletime_assert_185' declared with attribute error: BUILD_BUG failed
Message-ID: <202507221308.DZYoMnj7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c7145692e02f70323d6e5d618ddaca0d62fb5b69
commit: 611b93b7366a1e0c9df51c4628ea51bfe6db74d9 [3057/3057] clocksource/arm_arch_timer: Add build-time guards for unhandled register accesses
config: arm64-randconfig-004-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221308.DZYoMnj7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221308.DZYoMnj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221308.DZYoMnj7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   In function 'arch_timer_reg_read_cp15',
       inlined from 'erratum_set_next_event_tval_generic' at drivers/clocksource/arm_arch_timer.c:157:7:
>> include/linux/compiler_types.h:323:38: error: call to '__compiletime_assert_185' declared with attribute error: BUILD_BUG failed
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:304:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                        ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/arch_timer.h:159:2: note: in expansion of macro 'BUILD_BUG'
     BUILD_BUG();
     ^~~~~~~~~
   In function 'arch_timer_reg_write_cp15',
       inlined from 'erratum_set_next_event_tval_generic' at drivers/clocksource/arm_arch_timer.c:122:3:
   include/linux/compiler_types.h:323:38: error: call to '__compiletime_assert_182' declared with attribute error: BUILD_BUG failed
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:304:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                        ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/arch_timer.h:130:3: note: in expansion of macro 'BUILD_BUG'
      BUILD_BUG();
      ^~~~~~~~~


vim +/__compiletime_assert_185 +323 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  309  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  310  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  311  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  312  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  313  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  314   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  315   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  316   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  317   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  318   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  319   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  320   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  321   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  322  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @323  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  324  

:::::: The code at line 323 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
