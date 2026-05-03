Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D423C273D8D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777796299; cv=none; b=WWvShqPKv6V8ZNX7G3nwNSvhJM4Rz6gPnQaTWkjyj9kev+ym39QmRcqHEf1RiWe92hMTvGrw0aORlFJ1Xs9QrerXxtgSo/jlFNvoLbBR9or044FFL6WAMzNMHz9yYg9Ncrrib0CflgCWUYEahs42916BwYdLnbG7CoX3X2zj5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777796299; c=relaxed/simple;
	bh=L/bsWu3MGmRkL3a8bIqupuFiT6MKG4ojuR8fC8sbjKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=as8zPNgafGeriTzpCWpbuTlfZspI9c3Siqeed6Q4cBGhmwqFFN4eXas7wofzbF+dc0OgzZKh9F1DTfnMxNrhAgDYYUsSeUedu0pRTnG425KThTbsVG/XXu+B4nm4EYFFo6tYTZkngRFOvpl3P+UaAzFzxX8J4dwB9JxbNTrbO7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQ8oI6qu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQ8oI6qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777796298; x=1809332298;
  h=date:from:to:cc:subject:message-id;
  bh=L/bsWu3MGmRkL3a8bIqupuFiT6MKG4ojuR8fC8sbjKw=;
  b=RQ8oI6quRm2i/tpYk3uJ74UqRDSbQ7+9gQUPGSp3KU5ExLV1KW2XLXgL
   4dt/M9grhrzjVUU61NvcTO0nKPNF1rZHKHsKWIMPaaIYQfv8poHoMO1eY
   /x32C3PeKlqXdot6/9sD16yQ37Q5qhXjZZh0Ql5VVCRmHlvBZzBohO7Ww
   JDHA6Pnl0TJNfEggWvcdDqgC8kMiTGvkiQwuTDbGLVFTG/lKf3UNi34Qa
   jn9+MQYpH5Ejc5qirrqBLxKjlORJXCf/DPzuHC6Ol4KQxdNPZ3sv7HfZW
   dQH9n8RFmRs1Z7NNzeZAYoZ8TwwQSJ0CBh7P59B65xb8ZhhothOS3x2ZA
   Q==;
X-CSE-ConnectionGUID: WT/d274MTwmgVr2rALR9wg==
X-CSE-MsgGUID: /iEoiZsGQ1SLft8xTM7TFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78590218"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78590218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:18:18 -0700
X-CSE-ConnectionGUID: JexY4zA0TFitElWiwBPbgA==
X-CSE-MsgGUID: Jw1eptfUTGaMyrSxlR+k7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="230644297"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 03 May 2026 01:18:16 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJS1l-000000005V3-2sUJ;
	Sun, 03 May 2026 08:18:13 +0000
Date: Sun, 03 May 2026 10:17:35 +0200
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ././include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_502' declared with attribute error: BUILD_BUG_ON
 failed: LRU_REFS_WIDTH < 2
Message-ID: <202605031010.oVT21x38-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-make-lru_zone_size-atomic-and-simplify-sanity-check/20260503-103454
head:   64b560f27addefdad180f484c4bd8ebf96e70a7a
commit: 1f4653a809ca4f16b4f7b5ea15b904032e0ca53b mm: remove PG_workingset
date:   6 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260503/202605031010.oVT21x38-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031010.oVT21x38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031010.oVT21x38-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'folio_mark_workingset_by_bit',
       inlined from 'shrink_active_list' at mm/vmscan.c:2142:3:
>> ././include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_502' declared with attribute error: BUILD_BUG_ON failed: LRU_REFS_WIDTH < 2
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   ././include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   ././include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   ./include/linux/mm_inline.h:253:9: note: in expansion of macro 'BUILD_BUG_ON'
     253 |         BUILD_BUG_ON(LRU_REFS_WIDTH < 2);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_502 +699 ././include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  685  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
