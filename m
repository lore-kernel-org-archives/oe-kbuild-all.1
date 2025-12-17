Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E530FC0D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012403; cv=none; b=Ok5RphLmO06Ad2Qq/2olXH5/XRbSKMkb2jWs8PO86g7TNl/4P7murKoR5y8TLBCVuV72zQqKVNGMRyOsuwSrJK9BZgNrLXQQOX6AvSmJbCiOaE5/49vMKhiMPb0PQCMJMFxA4CuyDiui0LD1nIG+c2520wlku8+Zc+6UVmFGyNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012403; c=relaxed/simple;
	bh=b1WzXSAdJhWmF93+byBKTpMaizUE2yhwcPEwBkJTfiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I0ftE0qwydDbWwHYLHLgOAPaeDFf4+2O0ASBPVqzlPb/U2nhkzYF/+AAh+gYoEIKzeur9fkvDAJQlz1CU8y4XVbNjfkJ59sL/xtwcbLPpSmvblNKJGN4t2VmEjthctZLfFip5FA3WKW2P5k4jW/5xSIqHZDWlNa5iQdLXz9RtwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsVAjbR8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsVAjbR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766012401; x=1797548401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b1WzXSAdJhWmF93+byBKTpMaizUE2yhwcPEwBkJTfiU=;
  b=UsVAjbR8q39Gt3/XivSTv45PkFkTqch5jfRzfpf1m6J7xrM04r68s+T6
   feemMmJcazVVYKMclO8o2/WpTGU6nW+WzsJYpAp8pJ4kInAlvjcGSIRMF
   YAWKAw06WgIrNntoylKgxHBwAtS5uJ8YyB09bIpvTVVQbDQdSWLHZ5PLk
   BVNjJik8plp/zN1Oiu/iwYJSzXUi2K+AZzRaQN5uoEuaLLVpGzECavifP
   V+UBGDFDK4AQTTJ7pBoc0p5GwTh+HUgo9lqsKPNiakv87hP+yoD2ziBBg
   Xb1gR2aQplNXesTzGtVrYn0tdjMGyTP/2yYZBMjSJ8yOws4li4tuRHka0
   g==;
X-CSE-ConnectionGUID: Nm7AR59RTCClX6XV8uc1VQ==
X-CSE-MsgGUID: vA+3NKJxRdeZcPJBgSNirQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="70539325"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="70539325"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:00:00 -0800
X-CSE-ConnectionGUID: 1Inq1JwOQLWKoroiAlTsbw==
X-CSE-MsgGUID: B3NnbljQQEyObARhvFmZgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="202932099"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2025 15:00:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW0Uu-000000003i0-3CsB;
	Wed, 17 Dec 2025 22:59:56 +0000
Date: Wed, 17 Dec 2025 23:59:33 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40]
 ././include/linux/compiler_types.h:375:45: error: call to
 '__compiletime_assert_263' declared with attribute error: BUILD_BUG_ON
 failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
Message-ID: <202512172301.DgRzXTkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: 345e3e5b6400f9ee03b8fad705e399b05d46ef1a [40/40] ANDROID: mm: Fix gfp bit position of __GFP_NO_INIT_ON_ALLOC
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251217/202512172301.DgRzXTkx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172301.DgRzXTkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172301.DgRzXTkx-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/radix-tree.c:288:6: warning: no previous prototype for 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   lib/radix-tree.c: In function 'radix_tree_init':
>> ././include/linux/compiler_types.h:375:45: error: call to '__compiletime_assert_263' declared with attribute error: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   ././include/linux/compiler_types.h:356:25: note: in definition of macro '__compiletime_assert'
     356 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   ././include/linux/compiler_types.h:375:9: note: in expansion of macro '_compiletime_assert'
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/radix-tree.c:1596:9: note: in expansion of macro 'BUILD_BUG_ON'
    1596 |         BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_263 +375 ././include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  361  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  362  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  363  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  364  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  365  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  366   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  367   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  368   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  369   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  370   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  371   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  372   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  373   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  374  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @375  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  376  

:::::: The code at line 375 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
