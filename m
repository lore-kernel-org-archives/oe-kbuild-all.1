Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B617A302
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 17:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826255; cv=none; b=H8UIYWccOtPfKZpdKg+FqZ+Qq/80OwaFs5/HY9VGMRa5kzMsn368VvEAHS2jZfY7nI+EdBsMQcbUYJn0t0nlXjlFhqHh643gnMGSvtC/NyjJgUkO00GNmzo+8xQfSN4Ju3pkbZuLixXJ1YVYJGD/mk5F3GZjBbEaysO/MFei7yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826255; c=relaxed/simple;
	bh=ZQI43CwlVeJ/bl+QuY851aGg2z9XO65+FiWc1crUgWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDOFKTYthWibHMRN8rLq+2zXAo4Atolnv8cWhqjMhhXzl6DUiz7uyu+SSUilnjlR8qa1DrBNkVLxgL5rLX+M6tX77LtBuVIatLO5a8/+Kzma9JSOMkXLpbFlMTXVN/X9Ay0W8Mt+7vyGhR+GWFZHH8kkr7dy1Gp3k1GoTSROjko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlcZes3y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlcZes3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744826253; x=1776362253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQI43CwlVeJ/bl+QuY851aGg2z9XO65+FiWc1crUgWo=;
  b=IlcZes3yt0Q7pga04Nuh8LWEYHdUpBJb67OxH5E00c8E/lttmunkB+cV
   9aKP8j8oU/rCUr5kQ6HjdnOYqkX4qsx0w2tBULAqWae574icuYXFk6PLw
   KChA2YLjQxUR01GA8PUn7XAUDH+mRZ83Z69OrHJ0sN1ggCI4H0eQaODnE
   0o5sBbZjYhOED0JFvwKCltOZNS75SZbu1xsLL6cDzAsLfaX+yLeL8514L
   fFszkRpO/7XWLmB9M8gRouZ9l0pZdWGnWc4etBtn8HtjaIXLtmFYzagvV
   8tsJ6SHW1BIw8YAYEm099JjVODI6TyJVJ42TcZLceuwXdEkshPTEihFGy
   A==;
X-CSE-ConnectionGUID: KdKyvoQxT+WnMlGsB+zamw==
X-CSE-MsgGUID: nP86HCS4SVWTzsITJm2BYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50213606"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50213606"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:57:33 -0700
X-CSE-ConnectionGUID: WBtwKzDgQi6cJwxDVeK2Uw==
X-CSE-MsgGUID: mFVx2L27Sc+Zg4T7gUAGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135634359"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2025 10:57:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u570q-000KAY-2z;
	Wed, 16 Apr 2025 17:57:28 +0000
Date: Thu, 17 Apr 2025 01:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sven/smc-v4 4/9] include/linux/compiler_types.h:557:45:
 error: call to '__compiletime_assert_422' declared with attribute error:
 FIELD_PREP: mask is zero
Message-ID: <202504170158.D161YYBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sven/smc-v4
head:   682159b095a70eca3ef9bdd5bb513aae5aa992b6
commit: fff9f4467d52393012e4d98dd77d390299a98173 [4/9] WIP: mfd: Add Apple Silicon SMC driver
config: i386-buildonly-randconfig-003-20250417 (https://download.01.org/0day-ci/archive/20250417/202504170158.D161YYBP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170158.D161YYBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170158.D161YYBP-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/build_bug.h:21:9: note: in expansion of macro 'BUILD_BUG_ON'
      21 |         BUILD_BUG_ON(((n) & ((n) - 1)) != 0)
         |         ^~~~~~~~~~~~
   include/linux/bitfield.h:75:17: note: in expansion of macro '__BUILD_BUG_ON_NOT_POWER_OF_2'
      75 |                 __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:76:56: note: in expansion of macro '__bf_shf'
      76 |                                               (1ULL << __bf_shf(_mask))); \
         |                                                        ^~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:484:17: note: in expansion of macro 'FIELD_GET'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                 ^~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:484:27: note: in expansion of macro 'SMC_DATA'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                           ^~~~~~~~
   include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/bitfield.h:156:44: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:484:27: note: in expansion of macro 'SMC_DATA'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                           ^~~~~~~~
   include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bitfield.h:156:44: note: in definition of macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:484:27: note: in expansion of macro 'SMC_DATA'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                           ^~~~~~~~
   include/uapi/linux/bits.h:7:37: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                     ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/mfd/macsmc.c:484:17: note: in expansion of macro 'FIELD_GET'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                 ^~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:484:27: note: in expansion of macro 'SMC_DATA'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                           ^~~~~~~~
   include/uapi/linux/bits.h:7:56: warning: right shift count is negative [-Wshift-count-negative]
       7 | #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                                                        ^~
   include/linux/bitfield.h:45:38: note: in definition of macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/mfd/macsmc.c:484:17: note: in expansion of macro 'FIELD_GET'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                 ^~~~~~~~~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/mfd/macsmc.c:37:41: note: in expansion of macro 'GENMASK'
      37 | #define SMC_DATA                        GENMASK(63, 32)
         |                                         ^~~~~~~
   drivers/mfd/macsmc.c:484:27: note: in expansion of macro 'SMC_DATA'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                           ^~~~~~~~
   drivers/mfd/macsmc.c: In function 'apple_smc_write_atomic':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_422' declared with attribute error: FIELD_PREP: mask is zero
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:361:16: note: in expansion of macro 'FIELD_PREP'
     361 |                FIELD_PREP(SMC_DATA, key));
         |                ^~~~~~~~~~
   drivers/mfd/macsmc.c: In function 'apple_smc_rtkit_recv':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_458' declared with attribute error: FIELD_GET: mask is zero
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:484:17: note: in expansion of macro 'FIELD_GET'
     484 |         event = FIELD_GET(SMC_DATA, message);
         |                 ^~~~~~~~~
   drivers/mfd/macsmc.c: In function 'apple_smc_cmd_locked.constprop':
   include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_362' declared with attribute error: FIELD_PREP: mask is zero
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:67:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:17: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~
   drivers/mfd/macsmc.c:71:16: note: in expansion of macro 'FIELD_PREP'
      71 |                FIELD_PREP(SMC_DATA, arg));
         |                ^~~~~~~~~~


vim +/__compiletime_assert_422 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
