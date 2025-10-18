Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088A16F288
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760795443; cv=none; b=slpU1ruvQl2h3L8NN3udKdFvAcBvD7FxkqBOJu4Er5sZn7VDwM5oan83SRiqqf4d+bU5bDrC6XwDkCFyRWipiKTzPzaa0aS0C7tMQU654sWT40YhA5YNQebC9XEhxWAQf1N8sRAR98VxV9T4lkxtfgMKcoQEDKme9EmIeeiQrYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760795443; c=relaxed/simple;
	bh=BUL636YTSQKeSKYZw02QXNHKNvZfNBT3a2JyGI2O6x4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HiefI6FeSrD1Zwgr7EZGt271iXPixlzduvWBMRv8vnU6lIyQkWSKkPts1i5+7UJRBUP/FiO5p5w7aZ3yFr/gkcuYsKtCUljQylWC1epqBzuzOEn5UCWC2Uy2QF8P9Nb7W1EnfJ6SELDhnsCppRn5qOLWgKcB/puErwnOoO/CtOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXJXGwGp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXJXGwGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760795441; x=1792331441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BUL636YTSQKeSKYZw02QXNHKNvZfNBT3a2JyGI2O6x4=;
  b=gXJXGwGplOAZvx+GoAccscBT021wiuzdSS5e2rvWAE0a1XrT87apjlDJ
   b0pnit66BMBfn6cUGQRpEsJpgFySPYUmqW+IHaZu8H48w6JOZvAGpbaXS
   zUoDhrq6eJOCabfesAvMZDMBFWSz7Qa3Og3baNXKWT9B1OyjbcVrvnyT3
   pE1kOzZ+VzTmoqznqbqfE6dje7OaL35L5SUxWhGlDHgP3tgzOkZ3ZHXLg
   42RiBEP/v3b7j0tKQZnK/bfopcEaYWqePYK3Ch5sCsEsQH919xbMdt0z/
   qJjOTyZbp3IthpHQLFdyZmZwZ2GOOkved7CA69SU78tC2K5D8g7RDaSXt
   w==;
X-CSE-ConnectionGUID: klJtOZp3SmqCSJO1LSxBNw==
X-CSE-MsgGUID: MBAUCDI+T6GKe4Nkl0s0bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66823099"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66823099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 06:50:40 -0700
X-CSE-ConnectionGUID: iet7SUk9RqG0yPCtIENuqA==
X-CSE-MsgGUID: OVOsAxRzQEeEGI7lVphPaA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Oct 2025 06:50:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA7KP-0008JJ-1n;
	Sat, 18 Oct 2025 13:50:37 +0000
Date: Sat, 18 Oct 2025 21:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:balloon 3/22]
 include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_354' declared with attribute error: BUILD_BUG failed
Message-ID: <202510182111.b9xRB0aV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux balloon
head:   7eef08e97c0bed3ecf03a02e2283be82b9bce389
commit: 3dfc835763a4371cf82fbd61365c129f20a11d6a [3/22] mm/balloon_compaction: centralize basic page migration handling
config: xtensa-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251018/202510182111.b9xRB0aV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182111.b9xRB0aV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182111.b9xRB0aV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/balloon_compaction.c: In function 'balloon_page_migrate':
>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_354' declared with attribute error: BUILD_BUG failed
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:578:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:597:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                        ^~~~~~~~~~~~~~~~
   mm/balloon_compaction.c:267:3: note: in expansion of macro 'BUILD_BUG'
      BUILD_BUG();
      ^~~~~~~~~


vim +/__compiletime_assert_354 +597 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  583  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  584  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  585  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  586  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  587  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  588   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  589   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  590   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  591   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  592   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  593   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  594   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  595   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  596  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @597  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  598  

:::::: The code at line 597 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
