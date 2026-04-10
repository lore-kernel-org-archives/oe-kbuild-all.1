Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB23386575
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802737; cv=none; b=mhb2idiHeJrChz6RPaOoD83qRvhiS88eb51pBT9wJyRTdiSMMVktDfGRtnRtmdAHsLpx55WCmh2Uh4pFanJ56Ls21UjcsFtZraSmOofGk8kjIIdYqZSq0GpcGgxmHeM9ceSAaQTUWl/HUcVQTz1S4iFhB/g2JAYM//qsVllx1GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802737; c=relaxed/simple;
	bh=GLRN83x0HxZtVAC8uRHCVsDMKyeoqwvGbd06DN7p3D8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WXN5OvHtxyCjuW556yygjyQpLQkEJYFL9VREnzmYh9m2MB3guvA9iwgYSM/7x45Q0FCoWtG9OjstWaOI4FRhpd6nctUqTYdl5yBlptXOn49/NLrK+F5GkXl9cTq22fW7iNZF5vZWvCeFaAii7oY84oZrAckwsQtoHV1n09JmZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YV0WLwu7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YV0WLwu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775802736; x=1807338736;
  h=date:from:to:cc:subject:message-id;
  bh=GLRN83x0HxZtVAC8uRHCVsDMKyeoqwvGbd06DN7p3D8=;
  b=YV0WLwu7SU6uoATCaedje0qzT5uVgeniUbUH4LNyHLTYhSRwMdYmP3c3
   fJHMwGWgqRgWZBNBYon9r5T0lz1eI3qaw2qpQtlcGfCcGdcgPhCTpdnMd
   cvdj/+DVju33doyhkW3v59WWIGMPbJo9qvCK9A1ACO0wfJ5dZ4D1tmvSQ
   qyeKVRAsv3g6/DYeyf6HFXY4f6X0uJgKz6VX9V5S9L/redSTSDyF7besi
   qm3B3jlB8AVnY0Ha4lIOts8LNwTaHL4fsGExC+m9xTK94TvWndJmCaLFK
   9PX4SN79qA/t5cij+WWN0GSQqS92J74vpiVfOQpUZpOMVr9v9JFFMZR8g
   A==;
X-CSE-ConnectionGUID: vjo8BXv/SHiZWixFH9+DWQ==
X-CSE-MsgGUID: m1YD/Xp7SPiH4XSQMMLAYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87105136"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87105136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 23:32:16 -0700
X-CSE-ConnectionGUID: 8maU/W2XR02hErlDJorIpw==
X-CSE-MsgGUID: rT+5EX7AQASqcwF8H9HHwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226284533"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Apr 2026 23:32:13 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB5PX-000000003P3-2FmH;
	Fri, 10 Apr 2026 06:32:11 +0000
Date: Fri, 10 Apr 2026 14:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 56/332]
 include/linux/compiler_types.h:572:38: error: call to
 '__compiletime_assert_655' declared with attribute error: min(min_durability,
 d) signedness error
Message-ID: <202604101428.x2nrt3Ao-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: bb607bab68909fd73d5484c2c8344a43ed743ed4 [56/332] bcachefs: bch2_extent_ptr_durability() can return transaction restarts
config: parisc-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101428.x2nrt3Ao-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101428.x2nrt3Ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101428.x2nrt3Ao-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/bcachefs/data/reconcile.c: In function 'bch2_bkey_needs_reconcile':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_655' declared with attribute error: min(min_durability, d) signedness error
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
     553 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     572 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |  BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
         |  ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
      98 |  __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y) __careful_cmp(min, x, y)
         |                   ^~~~~~~~~~~~~
   fs/bcachefs/data/reconcile.c:630:20: note: in expansion of macro 'min'
     630 |   min_durability = min(min_durability, d);
         |                    ^~~


vim +/__compiletime_assert_655 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
