Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F03397323
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793836; cv=none; b=K+d9I6ffUApfed7IUQxOInuFx9eygo4/SjN5gqGF5m36Ril7eOhq/iCmFj6i+LmapeHMNUoSeoRtmMrW3QrZQeTz8xeeF2v6xPXpkr8dGyhrmZMOsXpq+I3MshYqJJNuvdlrk1OSeiLS3vIq5+2eGi1U/lMRJ0/GU5qOuDZeGzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793836; c=relaxed/simple;
	bh=vUdV8X3AsweO2htqSteDOK69z2vNsX+USONiZHgBszc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JQuQwxbUOFeeuD8cBF7nQ9cM1BGnTjt1M+NE1EkaBAtRS2RB1H5cQ8QzeqnQxZ8J6MIf9d2xAUvtmZcL0U0309GZbDG3XR+Zm9oflxWfPS/Qu9AAroVwdvY0mbNRY8UIaNbt4quTU+phqtxkyIRd4uigKP7vLnsbhOOFkW8k6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgIhZ+rc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgIhZ+rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793835; x=1810329835;
  h=date:from:to:cc:subject:message-id;
  bh=vUdV8X3AsweO2htqSteDOK69z2vNsX+USONiZHgBszc=;
  b=DgIhZ+rc8dMC2ZWm7fwjhEFLijbfUbiXivfb/ICoe5yMhXT6K0s9ytxe
   0VBmAUBvo0mviItlndvfhK4ilIBYpSzI214n6yHZ7m9TLMt47mVIQp3ym
   RNvVgbzHtW4yenjhgVDYAtLejXJ56SlKTqPGcymsN9NH9DiOTCATZA5vZ
   ut+li2+5/n4foheXWmg9okdEbKXEIHPQCAZ2BxreJDdL0awDj+mkioLbG
   DrIiOv8MAcaKNkbvJvPd+ybOQLyvc7BXIM2bUt57SRjzC88qs4yMMr5uk
   s25Z3X8e3yEHovMd7ENHuWdwXeqC+uWN9fZF3lX9/r/jEOchcMwblo4Ub
   g==;
X-CSE-ConnectionGUID: SblwMnhvRfOrsGohK4o7bg==
X-CSE-MsgGUID: IIQ4ve94TfqVGxfKPP6TYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603407"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603407"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:53 -0700
X-CSE-ConnectionGUID: I64m07zoQWyaHuay9EvXdQ==
X-CSE-MsgGUID: xymLs4lJQaK//6PqPr/MDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458965"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX2-0000000001N-33Xt;
	Thu, 14 May 2026 21:23:48 +0000
Date: Fri, 15 May 2026 04:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.all 11/11]
 include/linux/compiler_types.h:699:45: error: call to
 '__compiletime_assert_436' declared with attribute error: BUILD_BUG_ON
 failed: 21 - 1 != HWEIGHT32( (VALID_OPENAT2_FLAGS & ~(O_NONBLOCK | O_NDELAY))
 | __FMODE_EXEC)
Message-ID: <202605150430.Z7M4cUSt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   1202b9c177076b8c00ba826717a8d7023e4c8f98
commit: 1202b9c177076b8c00ba826717a8d7023e4c8f98 [11/11] Merge branch 'vfs-7.2.misc' into vfs.all
config: openrisc-randconfig-r072-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150430.Z7M4cUSt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150430.Z7M4cUSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150430.Z7M4cUSt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/fcntl.c: In function 'fcntl_init':
>> include/linux/compiler_types.h:699:45: error: call to '__compiletime_assert_436' declared with attribute error: BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPENAT2_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC)
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


vim +/__compiletime_assert_436 +699 include/linux/compiler_types.h

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
