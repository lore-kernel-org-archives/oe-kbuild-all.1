Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC75346AFD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785599481; cv=none; b=DWOJgpSUyesbBtfjAl2zQhXF0TePjURBu7O6izfufJLeJZwTRDwxnN3eZG5s0Pi1r/O9hgqAgW/KWgU2cdYIDWHMnhABr6VIM5PGrZGQ1H+pTyrQYQidRglTyT6BRIJ4uz670gUqr7hUiry/fiDMfEIqZSM79cpgwO73anG5AiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785599481; c=relaxed/simple;
	bh=4jIT31bTqw7Rw/Qyon4tLh6v874Zj4fCv4mBGKahZj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U7T4HZeeudZloY5bRUisfeH3lbhNYdi7KA5tuomZ3RqgT/K7syF9KxwZQyfbvW7q9K1Aif3IpbN/UgQ+QFBQ9DssKW47KW5NpN8Q7efn+4xQIegQlzeecp3FxDkzUv6O9pXwHo248msNVlUy1Z5HtAv9fPOG7srl9ViZQjvT2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNaD0t3S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNaD0t3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785599480; x=1817135480;
  h=date:from:to:cc:subject:message-id;
  bh=4jIT31bTqw7Rw/Qyon4tLh6v874Zj4fCv4mBGKahZj4=;
  b=XNaD0t3SsPoM8s8LyIiOt1rQChzmlFQ5iXxgqTRnmxVahWFftAN/q2Hq
   +Kb72kuaz3lP4raBiMWqdnxmD6guRUa3+u7DyNprfvTQriTGEm10fO4QF
   dmu3kI/2wxARF9yPGkYbDZgGL/1Su9cv/BlnqSK6pgHM4tvPRkJOA2Z/0
   y8F5f2jqG7T3pTbairB9S5Xb2eZ24762Gvis5g0v5/seIiSXxlrAJWiRt
   y0QFC1g34WjFOq6Yxm+bxzp2DD1fjLEJY9lWRGq4bAwQmLkzIbP+wUECu
   qsmv/fHIrDeuoqmwN2JO14/QqSBSg+a6Q6IXjM7fC11wt8Mhm0cEOOYLZ
   g==;
X-CSE-ConnectionGUID: TmC7/GldRdKr5iZXO6MoWg==
X-CSE-MsgGUID: +RGWnNduSm2moSrR90j3sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86063488"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86063488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 08:51:19 -0700
X-CSE-ConnectionGUID: 7tAngI3lT1idM4x8kvtXlQ==
X-CSE-MsgGUID: OEZen8QAScGzmrS2kx75Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="290764451"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Aug 2026 08:51:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqBzW-000000003XJ-3tjB;
	Sat, 01 Aug 2026 15:51:14 +0000
Date: Sat, 01 Aug 2026 23:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 85/93]
 include/linux/compiler_types.h:568:45: error: call to
 '__compiletime_assert_407' declared with attribute error: BUILD_BUG_ON
 failed: RPDFS_BLOCK_SIZE != PAGE_SIZE
Message-ID: <202608012357.VdppP81b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   7dd9571ed4664ad741e8519b4a4369a2d84523f6
commit: 2f7d4b4295890ece08df31aa8e2d0150594c6c07 [85/93] rpdfs: update inode code
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260801/202608012357.VdppP81b-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608012357.VdppP81b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608012357.VdppP81b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/rpdfs/aops.c: In function 'recv_block_read_result':
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_407' declared with attribute error: BUILD_BUG_ON failed: RPDFS_BLOCK_SIZE != PAGE_SIZE
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/rpdfs/aops.c:99:9: note: in expansion of macro 'BUILD_BUG_ON'
      99 |         BUILD_BUG_ON(RPDFS_BLOCK_SIZE != PAGE_SIZE);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   fs/rpdfs/meta.c: In function 'rpdfs_meta_get_folio':
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_401' declared with attribute error: BUILD_BUG_ON failed: PAGE_SIZE != RPDFS_BLOCK_SIZE
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/rpdfs/meta.c:182:9: note: in expansion of macro 'BUILD_BUG_ON'
     182 |         BUILD_BUG_ON(PAGE_SIZE != RPDFS_BLOCK_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_407 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569  

:::::: The code at line 568 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
