Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B41CEEAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726321685; cv=none; b=jioGRGLtLF/arlQdU0aUwcBxsuLKw5hC6p2viSl0p6iVTfBfJfhXFPymO2gE5396PuzwFjxz+Prx840swwTMXaXlkSeyZeYtMZL4c7vnhruvf1lWr/xlKv6vKoHXTqTMs3qMMMma5Cj+iaXlJ+2MnHBvIg7EzQpyBVLZbyX8tKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726321685; c=relaxed/simple;
	bh=znCDGR/1I3uZJmx5nX/kZLRTvWflBaMzIgAybI6mI7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6B9R5i1bm+UlWa63iYTPDgcqUyiaph72XK3ouizwzYRK1ikanCEI0QlNftsVxwYhUyx/ufLT+OzFETHUYnCRAVEXGLJ+91iLCkLbawcWxryOi+Us4h/v8+XKNAZ4F4cpzBNpef9Rit+Gn6uqgkD7uE9RAT4rUGHRS+oOFt3lMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2gfJUOf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2gfJUOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726321684; x=1757857684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=znCDGR/1I3uZJmx5nX/kZLRTvWflBaMzIgAybI6mI7Y=;
  b=K2gfJUOfmaIT9EsDCSwtBCpevap2TUgSX22B0Yst6x6fUIIuwkvoKA/S
   t++Yb20bgFp5eBoahSgLKRM0pIxpYFqteCkW1do+TwlIaOZeJa8oEYxmS
   nQTccYD5De/XvnMnzDmAoD6hdIS+ovf1gszX+qEWfDCulg9gp6Xs+URUl
   BctHcCwwL/4C97kdSP6xq/+rfI1yz+VxlCteF/9jRICwzDlYjjCzxiqs1
   ui88Kt2mBVh+0RdSw/0/LqnWym+sywepnhvP9FnryOaXQen1yoxjuCsru
   mfmQKQAHqlSKDideqkzvTN/L0xtoe9cI1qmHlzBeSocz6kcaT2XztAZkW
   g==;
X-CSE-ConnectionGUID: L/phlAFdQyC0FGfwUnnwkg==
X-CSE-MsgGUID: 52cWj/IQSOSRkL3+YA4umg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="13527089"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="13527089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 06:48:02 -0700
X-CSE-ConnectionGUID: zpLOYR4XRPCwq9aW/Xd4wg==
X-CSE-MsgGUID: isVdNTEtR1+s1Cn1QAILow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68395336"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Sep 2024 06:48:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spT82-0007nf-1f;
	Sat, 14 Sep 2024 13:47:58 +0000
Date: Sat, 14 Sep 2024 21:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240912 5/15]
 include/linux/build_bug.h:78:41: error: static assertion failed: "struct
 member likely outside of struct_group_tagged()"
Message-ID: <202409142117.35sIzcUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240912
head:   f2ca068393cf1157c12ab08556b05824eec16511
commit: 06f3631525808b4ce559a30508e178bae26acb3c [5/15] RDMA/uverbs: Use static_assert() to check struct sizes
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409142117.35sIzcUJ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142117.35sIzcUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142117.35sIzcUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/infiniband/core/nldev.c:33:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "struct member likely outside of struct_group_tagged()"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/rdma/uverbs_ioctl.h:643:1: note: in expansion of macro 'static_assert'
     643 | static_assert(offsetof(struct uverbs_attr_bundle, attrs) == sizeof(struct uverbs_attr_bundle_hdr),
         | ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
