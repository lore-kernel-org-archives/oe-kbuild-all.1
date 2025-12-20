Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D80427FD48
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246246; cv=none; b=AynwLbVNBRYBQzCfuHU8zHSx0W0QViVSCHI8Bw7b0MICbvrtnIIEslJe8DCgE4IV699FPrHBpDQG9xzbB+lEfenYWCl2LN3kSZj0/Vk22gWQ3G0duBHCvAQ5hvhWz5AoiNCOmGnxDuaoX0v3iYJD/tp7IgEOwKxDvbmh1bfP2Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246246; c=relaxed/simple;
	bh=FUNzKGMFQdEZXV7GXD9Ey7qQ5/hCALgSQ0CPIVv4VOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nO+nvhYBWjGjEUaahWhyUfr24BGrSnHeDyv6vzC3G1cGvsySfEIzX47V0tdmGNGCRkGSee4oYuBTSh+3mgH1PeOabR9neufMsAz5ShqqtbIWQnd3mDPnQrbVx0gnJ/2hnQD1e/mgdUu24oYBZQOrGrWa99j9gOvqdJITOhm0QHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPT0e/Pj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPT0e/Pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246245; x=1797782245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUNzKGMFQdEZXV7GXD9Ey7qQ5/hCALgSQ0CPIVv4VOI=;
  b=PPT0e/PjgCJcYnH/AnnMg/6FoT/OfUgd62RRU/SmWYCVMQphxOKiAcvL
   bfDWagCDLFbZLe8N7VLtP/1BgkiZ8jCCIHUomIB/LqaYBoEb/Zz3VUvdI
   JPq99uScopXCL1jx5m5qLlBznseyFq/pJV9+5Z3heTT1Tcizbvhbl4usJ
   zxEGWbS/V6yHZ8tG8spbx+JUDMIg4LuAMlL/gkUG7dB2Fx/93N6fjj7Fg
   H6fucDg0d5RXVMUKiPJjgQbOWRk9vhecBTM8Z+1luQjfRcRsFnA0CIuq8
   9Udd61FSTxAzLIwZ7fzH1IyjEBnc5ykdVDoNtAT+S5/BVB08td6G2WOLC
   Q==;
X-CSE-ConnectionGUID: TU/a/jpeQqyb5pM45v6WHg==
X-CSE-MsgGUID: Esxo5h7/RX6sFSHjDS+sOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72037332"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72037332"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:57:22 -0800
X-CSE-ConnectionGUID: SJvoSJOfQa2L0pQdmjhOOw==
X-CSE-MsgGUID: EOMh/uYhTVem9j+/i0Icrg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 07:57:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzKY-000000004o1-35N6;
	Sat, 20 Dec 2025 15:57:18 +0000
Date: Sat, 20 Dec 2025 23:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1525/2671] include/linux/compiler_types.h:630:45:
 error: call to '__compiletime_assert_588' declared with attribute error:
 min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
Message-ID: <202512202322.0kwyiXce-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 [1525/2671] fs: use min() or umin() instead of min_t()
config: i386-randconfig-015-20251219 (https://download.01.org/0day-ci/archive/20251220/202512202322.0kwyiXce-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202322.0kwyiXce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202322.0kwyiXce-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'fuse_wr_pages',
       inlined from 'fuse_perform_write' at fs/fuse/file.c:1347:27:
>> include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_588' declared with attribute error: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
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


vim +/__compiletime_assert_588 +630 include/linux/compiler_types.h

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
