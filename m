Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2011BBBFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 02:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777516711; cv=none; b=QuiWI2j8s4LzHc5BC+yENk6QyfywwDuwtUWHSqJw/py2tDDACrW4YegHwijz5NIFxnUvRHiuqC0MLTQK+37dDo+nO0RQx7x67FVQo3fKkbD0HgYUTenx8rm+xxTJ+3n1p123juyv+hLW6rjVmapc4qq8py7VZUQbnOh51hKTpcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777516711; c=relaxed/simple;
	bh=V8OEzsIzacz8JaEoeZAtxfT5AoWAvXPCuBQnXZxmsU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lz7+9Q3qonQN+3SOPLKG2KjZShpdmD84YuStbmA2N5RBpyjwh08W6TNzVZoVf2UNtbYnh15sqnZRYq0Y49pmuuHJNKGxvt6TD2Veph6PtYrYf9aDIA9Zv8qAJSUVmGbdjpP2VKdxJ1OYDiUtbSt9I7y2yda1RksL53Z0y1xtq/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ud6NWYHZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ud6NWYHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777516710; x=1809052710;
  h=date:from:to:cc:subject:message-id;
  bh=V8OEzsIzacz8JaEoeZAtxfT5AoWAvXPCuBQnXZxmsU4=;
  b=Ud6NWYHZfvnBp1f8XDuExAyHrKdXK83aCP3p+wvyRT6welPP1Ca2+2Hl
   BA1ZkErayp0zSBlu/VwEJuUuU53OWjCdnGqk0WqSmOOKP23J8kmOX3rxu
   11bwyB4022CpHKu+0a7RdVOMVLZVGEpiVbV15hDLg2IetbEIS7o+U0p+5
   xWoOoU3ZthpHS9NaNB3NB18yPes16mPxGzlIIzO/xe/Dvb9+MUVCkRL+S
   6sxSVvXbN+/vyYVyOUe3Nuou11RGNxBUboh+5yTwPVlFbENQiXxMfmci2
   2xeaPNbZIOHe14xtNwCChNJemNQOz7Ih7amMe5iCj4AMbWgjAmSZTGSq5
   g==;
X-CSE-ConnectionGUID: +6cYfuIPRU6K/BiD/lMKIQ==
X-CSE-MsgGUID: ezv2Zh5UQSK/YhFLAlpciA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89552660"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89552660"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:38:30 -0700
X-CSE-ConnectionGUID: aGvHVlNrTa6xhwCdcQ6kRw==
X-CSE-MsgGUID: QcEacJ3fShqqD3K7uFH1Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239434580"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2026 19:38:28 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIHIG-00000000Bpm-41Q9;
	Thu, 30 Apr 2026 02:38:24 +0000
Date: Thu, 30 Apr 2026 10:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-7.2.reopen 1/2]
 include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_396' declared with attribute error: BUILD_BUG_ON
 failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) |
 __FMODE_EXEC)
Message-ID: <202604301053.5Axle7Cg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs-7.2.reopen
head:   89f1e153b6fa4a7a1e2f3d5a4ede7d9c3108c099
commit: 097b1e297e41636d34856f987875e9f80b381813 [1/2] vfs: add O_EMPTYPATH to openat(2)/openat2(2)
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604301053.5Axle7Cg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301053.5Axle7Cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301053.5Axle7Cg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/fcntl.c: In function 'fcntl_init':
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_396' declared with attribute error: BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC)
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:680:25: note: in definition of macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/fcntl.c:1172:9: note: in expansion of macro 'BUILD_BUG_ON'
    1172 |         BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_396 +699 include/linux/compiler_types.h

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

:::::: The code at line 699 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
