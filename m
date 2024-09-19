Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029914A09A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 23:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726790110; cv=none; b=Lb1gp5rSXam0v2LIdB3itbePuX+0sPFBRWOMgAsiBqBKEEaloxEn4t8RymFIBr04EFVAapOO7uHWYdfrkFfStOenrPPEe3xHOi+A9CNgrBBUkJZjsUP9d5NX0ZAhwqeURms6OHVUBGj2EULKFrSCo9yo/G3aPrLTK/yJ8EcYQHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726790110; c=relaxed/simple;
	bh=010gGXtRDyTbs2FhMGB30RlIWBenyGXnIBTVaKNMuGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUMirX0GptxEAuzdtD6jwKh9GioCz49qztgpcJGAvkeKRZJocVda/ZcH6IoF57XGZhdl5esBC2Ps1+4Y9F+rrBHw8oDCPnx8Bl4Om0HBbVqwKa4gizTCDeXICBKec9aZ8+DyR9cGKv9lw7iYd/B33wY+iUMOd40hsguKI3yLElI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=illrpTl0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="illrpTl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726790109; x=1758326109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=010gGXtRDyTbs2FhMGB30RlIWBenyGXnIBTVaKNMuGY=;
  b=illrpTl0bRHBhaCRKBl4mPG5fRoJIfZS/xdBlkTOpOAYrzqENBylNRc8
   hBQepQCPLUMKjxAtV3Fc28p1L+ntopW0BHc4qd/2HQG0MLe9E4pMEsies
   7OOUEyI8droJeJKPTfUgQHkjtqB4aaBHu4FE0h1uR2ssmKbiPWZwI0phN
   KMY7tyWypfc5LiqgzdDVDI1MO2XAKuGsXkgTYpDSeNWlAtgxboyYcI2rf
   J+Uph3UZdC/2txApqkPC7KTWW8D6H59shyPCU01pt/ipHpcJHZI6HDzwV
   qmOgJIzv/lGNcLLspKRbK660i+djCLjBkcSuBVX13lEGhRJ3YVPP1/bHM
   Q==;
X-CSE-ConnectionGUID: I3oI6XaBTCipw/UvAZPn4g==
X-CSE-MsgGUID: 7qApuIL9R3SWEIdFAndTdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25657760"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25657760"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 16:55:08 -0700
X-CSE-ConnectionGUID: 2AejzqCZRhuyfu32Gzly7g==
X-CSE-MsgGUID: ZoWvN8rERTCt873qZqdaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="74460537"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2024 16:55:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srQzE-000Dng-16;
	Thu, 19 Sep 2024 23:55:00 +0000
Date: Fri, 20 Sep 2024 07:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 4/4]
 include/linux/compiler_types.h:375:45: error: call to
 '__compiletime_assert_259' declared with attribute error: BUILD_BUG_ON
 failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
Message-ID: <202409200715.TqxmZpOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   345e3e5b6400f9ee03b8fad705e399b05d46ef1a
commit: 345e3e5b6400f9ee03b8fad705e399b05d46ef1a [4/4] ANDROID: mm: Fix gfp bit position of __GFP_NO_INIT_ON_ALLOC
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240920/202409200715.TqxmZpOo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409200715.TqxmZpOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409200715.TqxmZpOo-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/radix-tree.c:288:6: warning: no previous prototype for 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   lib/radix-tree.c: In function 'radix_tree_init':
>> include/linux/compiler_types.h:375:45: error: call to '__compiletime_assert_259' declared with attribute error: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:356:25: note: in definition of macro '__compiletime_assert'
     356 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:375:9: note: in expansion of macro '_compiletime_assert'
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/radix-tree.c:1596:9: note: in expansion of macro 'BUILD_BUG_ON'
    1596 |         BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_259 +375 include/linux/compiler_types.h

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
