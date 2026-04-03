Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619237DEAE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205902; cv=none; b=VSx7dZKoIDVfzWqX200eROf1mMxv74fI3kxUnrC6TVz+IV1P+E5PnVwi/gcg0wToDRqrdaz/LH/6e7JplABsg5JmWrs9bfAigWlBWNlXa6bso6p5RKY3IOOI8CCyvGY7zs2QfJ85TdyJWoecC2adNCN/cuhzZLLruIn+9m9H9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205902; c=relaxed/simple;
	bh=M0vzDySw7j/2rNXbESdSJvfVaBMwQJra32l3mDqlK90=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYseoInvoSgRLLzT1gqcbr4piTvkGL7aE/3xS8QydHE/nBqYg9zowO+60r0Y0A1c2QzQJaR0yODZcTiZLJtbUCu3XETfJBNZRV1VlKnskF5dY1ZiyQPv6GrgoBKkvfwW1ZPmaSoibyZvS9v1G/GrdW9+tmJ6PeCSFnEOX7+6dGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6NUrRXx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6NUrRXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205901; x=1806741901;
  h=date:from:to:cc:subject:message-id;
  bh=M0vzDySw7j/2rNXbESdSJvfVaBMwQJra32l3mDqlK90=;
  b=Y6NUrRXxYIDz/HGP0sC8FQFNhJGuGd0y8anReDfyFqrgfP3HKb2YguDd
   piPJMUnrXLxdGwxmWNtECz11bIYBedyH4oskKE0FQ/FGw3Dj/cy+zI9B4
   ACNdU0JlTi7KUM2vAOED5hKBDIKFr4BegpKMNuBMvsoFQSeXmHj625jUd
   lKVN6G8jPId8WzXNsg/biNrpmiNA6KGNffNO42PSZr9VHb7qpHrp6jOL+
   eO/KdaYjnbrWV+0xCfABr03jH0KDEo570ZBMaOd38wPLGk3cWvWYg7dx5
   7U2VSwUjGWUZA5KAmgd5jZa4HRyJ1lil6MVuDdec3381Nmo9QAJht0GKs
   g==;
X-CSE-ConnectionGUID: EGJdHtyjQxSJsu5zwZB4OQ==
X-CSE-MsgGUID: lGNbOgbFSSmw+A6u87y0WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86974167"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86974167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:00 -0700
X-CSE-ConnectionGUID: +p0mYua1S4KpBlthGw4/rw==
X-CSE-MsgGUID: viLwCDAkTY6DdzfYYY0hrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228834579"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 01:44:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015Y-1YRc;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 03 Apr 2026 16:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: include/linux/compiler_types.h:617:38: error: call to
 '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON
 failed: IS_ERR(PTR)
Message-ID: <202604030636.NqjaJvYp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tamir,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
commit: 9bfa52dac27a20b43bcb73e56dc45aba6b9aaff1 printf: convert test_hashed into macro
date:   9 weeks ago
config: xtensa-randconfig-002-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030636.NqjaJvYp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030636.NqjaJvYp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9bfa52dac27a ("printf: convert test_hashed into macro")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030636.NqjaJvYp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/tests/printf_kunit.c: In function 'errptr.part.2':
>> include/linux/compiler_types.h:617:38: error: call to '__compiletime_assert_304' declared with attribute error: BUILD_BUG_ON failed: IS_ERR(PTR)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:598:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:617:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   lib/tests/printf_kunit.c:758:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(IS_ERR(PTR));
     ^~~~~~~~~~~~


vim +/__compiletime_assert_304 +617 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  603  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  604  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  605  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  606  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  607  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  608   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  609   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  610   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  611   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  612   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  613   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  614   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  615   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  616  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @617  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  618  

:::::: The code at line 617 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
