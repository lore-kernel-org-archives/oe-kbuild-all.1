Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEAC1C54B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740769390; cv=none; b=Ndo95PGojZ6E1rAjTQs8T1UVBBcJ5a6DuL1DFrSqvGpmtiSsQHvwNfhzvzd3PtQssn9Q0Tbhp2cEztKyi763tFwTdjcnQA7wfJrLaYqEpqvBujBQQJh3IHWZaDnNPpdH+J3bvPa2oW9g0/Ib4mn5jGwFQbGYKrYOveqqz9WW7CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740769390; c=relaxed/simple;
	bh=MIdpC/CK8b30LYwX0EhQaH93AfE9i1Ps5U+OeVTddQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cV9ljSA/NQ3S3PkmSPoc/QKoaWAWY3EuUrLDgnS5cOL8toGLswXa1z3H2xZ/BhFi/mPJ4RJpGalEvJagAcvMWMWsJo7tOWadLJQakySo6Ky0Gpjt13bD13zVWMdAh2PvSDsbBW4r6B7Z5Ro18B6dIFJIVxPBpxUo6cRgAd9+TkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIsucuYb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIsucuYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740769389; x=1772305389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MIdpC/CK8b30LYwX0EhQaH93AfE9i1Ps5U+OeVTddQc=;
  b=LIsucuYbGYGVEzOS4PTMSYq+KrtruN6aUQ5SUPNDLkuQkBi5bZbMze0D
   vJf98yp3uZbmWPNhyWfhpD5pjtKh38IvnxkrYkQRHcUKlL+tfOONC8fpx
   3NtdWk+rGdH6LBxArhGhVLOUVc0i+vmq92lSMSMow5gEectq80fharcJe
   qG9ePIZk0UNlfIaPvRsjRmIIomP17axJrJVRzogtO3Ii6hkF4enOJ8nLK
   AuuOGiIvrVzrnqJmdQoWTcmGYwDWAtRxAQ8B/i3wq9nVsUKqg1fw68sfX
   J1e7gq4igYC2eS4XLY/HdE3SjMeDItM3xbYF2rzvEdTen6z1XT47IuH7h
   g==;
X-CSE-ConnectionGUID: RR7/6UsbT7eXJcWvT1x5Cw==
X-CSE-MsgGUID: 41HmD086RKOtRZ4rh4GIWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41594646"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="41594646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 11:03:08 -0800
X-CSE-ConnectionGUID: pvRauEkKRVaGf7BlZLkLIg==
X-CSE-MsgGUID: O2bSWsdLQrugdULZlgz2nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="122550279"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Feb 2025 11:03:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to5cr-000FNM-1C;
	Fri, 28 Feb 2025 19:02:40 +0000
Date: Sat, 1 Mar 2025 03:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [linux-next:master 6787/7423] include/linux/compiler_types.h:542:45:
 error: call to '__compiletime_assert_416' declared with attribute error:
 min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
Message-ID: <202503010236.Qn8S2j6G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 60ee7393a44c3feb91962dc08c3a3c1f11252982 [6787/7423] btrfs: prepare extent_io.c for future larger folio support
config: xtensa-randconfig-001-20250228 (https://download.01.org/0day-ci/archive/20250301/202503010236.Qn8S2j6G-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010236.Qn8S2j6G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010236.Qn8S2j6G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/btrfs/extent_io.c: In function 'extent_write_locked_range':
>> include/linux/compiler_types.h:542:45: error: call to '__compiletime_assert_416' declared with attribute error: min(folio_pos(folio) + folio_size(folio) - 1, end) signedness error
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:523:25: note: in definition of macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/btrfs/extent_io.c:2497:27: note: in expansion of macro 'min'
    2497 |                 cur_end = min(folio_pos(folio) + folio_size(folio) - 1, end);
         |                           ^~~


vim +/__compiletime_assert_416 +542 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  528  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  529  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  530  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  531  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  532  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  533   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  534   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  535   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  536   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  537   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  538   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  539   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  540   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  541  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @542  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  

:::::: The code at line 542 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
