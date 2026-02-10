Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50117BB21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770765366; cv=none; b=INjVQfXYayPPiSCtDKOH8FNY6FrOxG1/tLodFMl6TQqHQUzbTR4W2Ta7zU+W0rFdsXRU3UXLlR6RwXSSQVxnmnWUyKlxDwpOz8z+n2Pa8JkwJlmNSiZS9wNCzdz2eYFRRbHrRbrvWAgYdpb+EjrGcTDgKq1rCFgK94Ybrz9dCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770765366; c=relaxed/simple;
	bh=DYlPgWtkSBOBPym+99H89YsYT+DTaCBKBIdxTsenvrE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QHB0pzcl7/QWw8Fw0HRW9TUWHSoCkU66acvEwqM25DMpNYfSHeb/k31r+XcdcrQpQO8SMufKVg4GXXLQXdDt0t3Gkid+zXZgLYH8QtUpuCRyDGJGB/2j8/ThG+F3sxokGR9AG+z+wa0ZQ2P3El2N7bXDzUxD96yhkLO4Q/rEzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jjct0A7S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jjct0A7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770765366; x=1802301366;
  h=date:from:to:cc:subject:message-id;
  bh=DYlPgWtkSBOBPym+99H89YsYT+DTaCBKBIdxTsenvrE=;
  b=Jjct0A7SRG+8SWYRCvIWnoT3tViyuHuB2mixuvZj/PvJ5gyWMB0tzjNA
   ZJP12QYfNHE440x57n5RGuZ/DpmVVIzu+c8U4vLq5K6doQg7vMbcS2LL2
   dkVp2pIKLsSP8jU64EdsFrFeV9o3FSMy7OHqmryWAAOlcDwsb5ARQgytg
   JAqMnyq9X3cgzV6x5rKxboReQYGs811LHI/aVXrgwq9hvYL2Y7vd51Foi
   Mm1DnAXA8uLYmaxYn1m8xRNCHxTJKMTtnji0q2eRiwFfEA5jCRhIuTyI5
   RZLfu1lFLHviNqbtu9BiE9HkgcufAiuA2CS3DlmVdtoUSj27drh6Yy/et
   g==;
X-CSE-ConnectionGUID: dInKIfm5S1epOLSpuyJjDQ==
X-CSE-MsgGUID: N2TeJaFIQiyqiSuEX5+3hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75751704"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75751704"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:16:05 -0800
X-CSE-ConnectionGUID: H4L2ZP4ZTseZboYZfNGkgw==
X-CSE-MsgGUID: pLlNAGxJSPOTXmZMw60Ufg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211163697"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Feb 2026 15:16:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpwxd-00000000pUy-0vbs;
	Tue, 10 Feb 2026 23:16:01 +0000
Date: Wed, 11 Feb 2026 07:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 9199/12313]
 include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
Message-ID: <202602110708.x7AYvCN7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd9678829d6dd0c10fde080b536abf4b1121c346
commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 [9199/12313] printf: convert test_hashed into macro
config: parisc-randconfig-r122-20260211 (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110708.x7AYvCN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110708.x7AYvCN7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/tests/printf_kunit.c: In function 'errptr.part.1':
>> include/linux/compiler_types.h:617:38: error: call to '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON failed: IS_ERR(PTR)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:598:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:617:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   lib/tests/printf_kunit.c:758:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(IS_ERR(PTR));
     ^~~~~~~~~~~~


vim +/__compiletime_assert_304 +617 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  603  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  604  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  605  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  606  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  607  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  608   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  609   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  610   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  611   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  612   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  613   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  614   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  615   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  616  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @617  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  

:::::: The code at line 617 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
