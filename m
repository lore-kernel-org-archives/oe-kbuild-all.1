Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3829E7FBA2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768055284; cv=none; b=EpkhgUDEh7ZQEXsP/7sVbmfF8zRlhR2oJJmZclRuX/3ani1TvRDQnTk8sr8d8e5edg0ficNyGIz6MJrh1AmxBYThTtv4nYWF42oo49AudfjGacSEmsx7ZMCAKydQKU8Tscd7KKfmzNN6HKzg6NKk6w8KKimePbfhY6884gbMmoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768055284; c=relaxed/simple;
	bh=hUvmAL/7A36KdkKbOCYGTsDQLj3JKF/rZkSbsB9z5pQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jJ2fPriNIdI/yK/0SWVDfb9zXbNe7XlWBlBLL9s56ZouRZyIr4hAgBQ3Syf0Euy+6MmphvoEpHErZSU5KdNWBdRMSSsp9mxgHH2Sa5OWqTpG5+jppmtip8iyS8JHOBNlbBXCfKBsE/EdPORk/6rq0rXihxxBx1E1WaWqsVgix2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGe+aztR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGe+aztR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768055283; x=1799591283;
  h=date:from:to:cc:subject:message-id;
  bh=hUvmAL/7A36KdkKbOCYGTsDQLj3JKF/rZkSbsB9z5pQ=;
  b=iGe+aztR3ye/WRjKeh6D1x7C07wXd6zkjcPinHzT9wJG3Xaa5biXaT6q
   94ZYyrCqHhEoLAX879nbyDe+X48mYdg03zy5ijWifXoWi3AB7zzg7EBgE
   uOm4eEMVXgukRLiliRW5cXVKJDmVwhUqgoiJkCRNyFn2RKVHsjNf9dLUD
   fE90jjpA4wds7EqDJzIdjU0p90lz0eD9kGgGYpNkkG0uO5D546N+cJree
   Szl7PNR67CkMg7wsn2I0T7OrqvTvqPEtDV6Re3OyawrdCD5tcUn5I4+Mz
   FehqRN/HeNmeGKVJo8Z/+NuBcdIfYhm9l5izKFluWOm3Of8y3Gz+R/V2w
   g==;
X-CSE-ConnectionGUID: sIOE9GutSI+wOgH/ba/zBw==
X-CSE-MsgGUID: hAWzxiJTTIKRWxIcOVKZsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80773575"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80773575"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 06:28:02 -0800
X-CSE-ConnectionGUID: HjvVaek1ReOpAQ/XwDk/Tw==
X-CSE-MsgGUID: Pjae/KfHTAW273pZut4PuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203495252"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2026 06:27:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veZwb-000000008kG-2knT;
	Sat, 10 Jan 2026 14:27:57 +0000
Date: Sat, 10 Jan 2026 22:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 56/178]
 include/linux/compiler_types.h:572:38: error: call to
 '__compiletime_assert_683' declared with attribute error: min(min_durability,
 d) signedness error
Message-ID: <202601102238.s6KkCDAh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   af2e18a32ff0ee83f028b504e0ff92450377ff24
commit: bb607bab68909fd73d5484c2c8344a43ed743ed4 [56/178] bcachefs: bch2_extent_ptr_durability() can return transaction restarts
config: mips-randconfig-r061-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102238.s6KkCDAh-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102238.s6KkCDAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601102238.s6KkCDAh-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
   {standard input}:21: Error: found '(', expected: ')'
   {standard input}:21: Error: found '(', expected: ')'
   {standard input}:21: Error: non-constant expression in ".if" statement
   {standard input}:21: Error: junk at end of line, first unrecognized character is `('
   {standard input}:4087: Error: found '(', expected: ')'
   {standard input}:4087: Error: found '(', expected: ')'
   {standard input}:4087: Error: non-constant expression in ".if" statement
   {standard input}:4087: Error: junk at end of line, first unrecognized character is `('
   In file included from <command-line>:
   fs/bcachefs/data/reconcile.c: In function 'bch2_bkey_needs_reconcile.isra.38':
>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_683' declared with attribute error: min(min_durability, d) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   fs/bcachefs/data/reconcile.c:630:20: note: in expansion of macro 'min'
      min_durability = min(min_durability, d);
                       ^~~
   {standard input}:4209: Error: found '(', expected: ')'
   {standard input}:4209: Error: found '(', expected: ')'
   {standard input}:4209: Error: non-constant expression in ".if" statement
   {standard input}:4209: Error: junk at end of line, first unrecognized character is `('


vim +/__compiletime_assert_683 +572 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  559  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  560  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  561  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  562  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  563   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  564   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  565   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  566   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  567   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  568   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  569   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  570   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  571  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @572  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  573  

:::::: The code at line 572 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
