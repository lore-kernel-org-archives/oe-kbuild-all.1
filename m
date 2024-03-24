Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687EDDBC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 22:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711318624; cv=none; b=GBt4iEF91LLmC9EC/YqBqW70Ixpt6Ny0k+ak0NXYKAcCwmYEe6VKiTdNyytATBdMq3useYJUecJlHlB3fVHr5gRd3PlYXem/CM0rugOs1OjF2aM8RNe44obcLQMxKZP87YEdT0quXxuTfkLhTKpEt79BmjXJan+nHnCCySjWTvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711318624; c=relaxed/simple;
	bh=iQC6e7TtZLyHXSbgf3iYBHbR/NJSv7my2p48OlwGRpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NyZJaunjV3OUcT9E30ZDlu4RsjNCs/0gtnPwmCSdqVlZFqI8b+ceGbOMm79zmYotW1P/foV7m0T0sxEBR6gN+Wzf9wLCCw3qTEzZ6q7k45bqfBxNAhKHEIzU/gclwXj+4qTNRgpZZdUrAMjYXK2pBIcM8hHdEUDTk49G7/uwQ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdyYXkQ8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdyYXkQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711318622; x=1742854622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQC6e7TtZLyHXSbgf3iYBHbR/NJSv7my2p48OlwGRpM=;
  b=GdyYXkQ8bjQMGUVrE7kZzx139+MWF1GnNcP58Zb+ubH3kZOJ9N8MAITM
   xXpyDGy5TmrF6Iaj17ycO9sVBGX3gF+Wzvm9+l1+2BuIxbXoLE6Fv8u2o
   V1GsPyTB6ewNnI7svJB8eM/HnGTSmDNP3RRbzexl6wJyM/lYBdGKk8HFK
   +EQEeRzo6jd64PlwFc5JlZX4Y5JPs3N4H0+RerZit87zBdU9gzsEjKmqH
   WIUoqekJPNC4vkTwsvkNuJyX601vK1hHjg9RgB878u5UatXBrFVX6S9Zc
   BBT2n1LQZqexTAGgQGTAa2QnfwXlnkJjxHK1dFOjmiWydSZviUmJXUrjf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6161796"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6161796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 15:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="15340871"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Mar 2024 15:17:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roW9B-000M2f-36;
	Sun, 24 Mar 2024 22:16:57 +0000
Date: Mon, 25 Mar 2024 06:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache 1/10]
 include/linux/compiler_types.h:449:45: error: call to
 '__compiletime_assert_255' declared with attribute error: BUILD_BUG_ON
 failed: PAGE_FRAG_CACHE_MAX_ORDER > PAGE_ALLOC_COSTLY_ORDER
Message-ID: <202403250611.K6xIOlNE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache
head:   b18c35c75e141b9cf0d8ac75d687d434946f78be
commit: 0ad335791851e6c5c19f19174d7ad527946bccb1 [1/10] mm: Move the page fragment allocator from page_alloc into its own file
config: xtensa-iss_defconfig (https://download.01.org/0day-ci/archive/20240325/202403250611.K6xIOlNE-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403250611.K6xIOlNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403250611.K6xIOlNE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/page_frag_alloc.c: In function '__page_frag_cache_drain':
>> include/linux/compiler_types.h:449:45: error: call to '__compiletime_assert_255' declared with attribute error: BUILD_BUG_ON failed: PAGE_FRAG_CACHE_MAX_ORDER > PAGE_ALLOC_COSTLY_ORDER
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:430:25: note: in definition of macro '__compiletime_assert'
     430 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:449:9: note: in expansion of macro '_compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/page_frag_alloc.c:59:9: note: in expansion of macro 'BUILD_BUG_ON'
      59 |         BUILD_BUG_ON(PAGE_FRAG_CACHE_MAX_ORDER > PAGE_ALLOC_COSTLY_ORDER);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_255 +449 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  435  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  436  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  437  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  438  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  439  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  440   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  441   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  442   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  443   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  444   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  445   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  446   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  447   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  448  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @449  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  450  

:::::: The code at line 449 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
