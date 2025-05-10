Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D5278C91
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746893739; cv=none; b=P67lhUA5cm8mgZJixfWuRP67PSlAR/CmZMkkjhY/tMRwx2GzFItTsL58QmHUZV5MQ+OfPVCGi9IcgRZ4lX6yE066fC2o7l3ScJdQbjShlFQr045XJR0doqgDuXqJqMstg2hpZ39lrzXgFwNcP+SSdYAX4Ydj8QSMYSj3XAhTvrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746893739; c=relaxed/simple;
	bh=H8hy1BWw1BZTCaITZJ2tfCB3tnvI3D9IE6liOZ1WHFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MA/jXSgK3oiTonBv55EkywOq0VPkprDZS/3RYE4XjISTGZqlxVNrPDM3PKq4noUcWTd3DZEVs5Lx+oR9/X+aMF6usoDEnbZLV56e0MbJo8DOBu4mqDT4qUgaK4KQaQl4e7++Y9vOSwpOnY9ACQe40OLmvrkxGm6iuUO2DfvhA/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPzxOgel; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPzxOgel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746893736; x=1778429736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H8hy1BWw1BZTCaITZJ2tfCB3tnvI3D9IE6liOZ1WHFU=;
  b=bPzxOgel5Ojz4UgiAbVu2aZIs5k4gTJcKCBr3fnrhi9TzDz1JwuricbI
   xNBEzwNNAJPPyClN4fcEuHIpunp62jvPScKXSyhGKexKzuL5hkuR37x7U
   slN4CaJ8TBf5w5Btow5zt/AUdnG53+Vqrfl5F01WTZymk8sA+Rm0RNUNI
   eBOrEIdP24wOxp1c9OC1EPiqaLTE+r9iKSsn6ocAwbEsR9JFTNM/NBmrv
   lGsmslmA5baT4yD33lpGXzUHXgdF1xw5+oQzrZiaRlpIdxwjg0xKbdCA0
   DjDsJvo/xPGEV9MPABRBZWOLj49YPGDSgM3Xtyi8LQeIO2td788c2eV1n
   A==;
X-CSE-ConnectionGUID: BTc8J92KRGq/5fikTnWaPg==
X-CSE-MsgGUID: KfLVZUK0RHWadQdjx1UxVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48837339"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48837339"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 09:15:35 -0700
X-CSE-ConnectionGUID: omMePZWkSh+dqhCsaiTvHw==
X-CSE-MsgGUID: qJpuAUyWQgqySdu3hMTfqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="141674640"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2025 09:15:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDmrL-000DD5-38;
	Sat, 10 May 2025 16:15:31 +0000
Date: Sun, 11 May 2025 00:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 174/187]
 include/linux/compiler_types.h:557:45: error: call to
 '__compiletime_assert_470' declared with attribute error: min(next,
 find_next_bit(bitmap, ca->mi.nbuckets, bucket.offset)) signedness error
Message-ID: <202505110031.6nFzAUHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   0b718ed532a370235329ca5f36395331a60d1b13
commit: a172785a3c9a0f2908949bf2dd6fcc5dec4be733 [174/187] bcachefs: "buckets with backpointer mismatches" now allocated on demand
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250511/202505110031.6nFzAUHh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110031.6nFzAUHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110031.6nFzAUHh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/bcachefs/backpointers.c: In function 'backpointer_node_has_missing':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_470' declared with attribute error: min(next, find_next_bit(bitmap, ca->mi.nbuckets, bucket.offset)) signedness error
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
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/bcachefs/backpointers.c:985:48: note: in expansion of macro 'min'
     985 |                                         next = min(next, find_next_bit(bitmap,
         |                                                ^~~
--
   In file included from <command-line>:
   backpointers.c: In function 'backpointer_node_has_missing':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_470' declared with attribute error: min(next, find_next_bit(bitmap, ca->mi.nbuckets, bucket.offset)) signedness error
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
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   backpointers.c:985:48: note: in expansion of macro 'min'
     985 |                                         next = min(next, find_next_bit(bitmap,
         |                                                ^~~


vim +/__compiletime_assert_470 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
