Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B968F34A791
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 08:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765872377; cv=none; b=UWsZ9BOa8k9KtJZbxRN2wEQ1kua7PmtSDG6wzdeq78JboqDER1Gps2e4qUjAd0e92wE13BFS0vF9fC6f1aTNv61wZesAfDiEo9pmtUN67eK1bSlbI6IiF1VcYrxOiJ1hXzn0JaWDqeQIWWl7vLGf3VHYJycFNk9WVn6L2U77Y+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765872377; c=relaxed/simple;
	bh=zM/gb0D8/9YLE35prfcgtJmtbsvcABgH88TTCfcWvQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qn/7xRjAvTCFDJ1Ovhbk/BDK1GgKA1A06rs4hhLUmw77vwsbnzcmwMqtJjChp1t4TTM1ojO938qoYxyk7emaJcDb4OA3UZUOCIMoeT1yKJJs9c+DQUOaj9fgd25bEe4Wca28rihnjLwUP7l1QBj6NoDmji89nsB8g8s5wkeiic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jl/RUR7z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jl/RUR7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765872376; x=1797408376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zM/gb0D8/9YLE35prfcgtJmtbsvcABgH88TTCfcWvQE=;
  b=jl/RUR7zGgLiGK3do19w9xsFIm35kSgipGIqXnGYdAawiC/FU2EEstUD
   h4i6LW6BumGn/ziKGwHOzeQ1IJc/WOWlRwbKjRvhDR+uJJsDpFbx93a5o
   Ji0SbpCJdWjYydYFh/Q7z3/PU/1ADiGhbQ3y6XESbVLXHhnuL3mCX8jiN
   zw8vystyGjhzGPYIsAg2Ew9pRN2zrdqBPKXtNxDV/B9BWVbTgB66/nK+g
   WW81SOORAkJFEpjc4+CpVywquaK6ZDYfzVPLK3Q1hedvmBAbKEsUxli92
   FPQy5ovE2HCO/sLRiLdJ+HO+dLBTxRu7pITJfG2FSnpoR9tcQvin6lJdx
   Q==;
X-CSE-ConnectionGUID: eddntPIOTlGUifj++FUpLg==
X-CSE-MsgGUID: rzfsxRKnSz2o+1dcOzV3aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55353688"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="55353688"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:06:15 -0800
X-CSE-ConnectionGUID: JwVpBYL/SSW41kWvzJJqyw==
X-CSE-MsgGUID: LYXvs3d9R/674BTs9SIEKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202362579"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 00:06:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQ4R-00000000336-3Q7U;
	Tue, 16 Dec 2025 08:06:11 +0000
Date: Tue, 16 Dec 2025 09:05:42 +0100
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1617/1848] include/linux/compiler_types.h:630:45:
 error: call to '__compiletime_assert_612' declared with attribute error:
 min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
Message-ID: <202512160948.O7QqxHj2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   563c8dd425b59e44470e28519107b1efc99f4c7b
commit: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 [1617/1848] fs: use min() or umin() instead of min_t()
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20251216/202512160948.O7QqxHj2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160948.O7QqxHj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160948.O7QqxHj2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'fuse_wr_pages',
       inlined from 'fuse_perform_write' at fs/fuse/file.c:1347:27:
>> include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_612' declared with attribute error: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:611:25: note: in definition of macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   fs/fuse/file.c:1326:16: note: in expansion of macro 'min'
    1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
         |                ^~~


vim +/__compiletime_assert_612 +630 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  616  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @630  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  631  

:::::: The code at line 630 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
