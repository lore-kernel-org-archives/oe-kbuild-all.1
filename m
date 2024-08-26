Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81857CBA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664174; cv=none; b=DCCuPWlzpn5ltGqkgpx6lGKEBLAqJLo78KVtbMnqAwU/eXfvfIYemAmukuvir5cwL611l7vYQjXkMmHkPnP4Pt96zItUPWpBlBq8cDt47cg+FRaEoCiNAhcmJSJphY5Wx6yOdd1CkpuClg0Qr/RFybaGFsRei4sNRsAe5G3ojiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664174; c=relaxed/simple;
	bh=kNpeULUI88X2FtzoorTTIfhiAjeIDlBk8Gvxqn/jwJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=axK9PcObEIG7ntVwrwdH2jGvPbY0rBtAgz0WDUsMW3hf7rp2seR3u0+PCK7xstr37Z4SlhTZy6GUnWKdNDbDJeMPJ0JJ5lKJkV9pFU9Q00YxgvINqVaQK0ogHKNVhEEMbD7+/zziSrnET3oL4Ppu4ueKUaEUrmOI8QLiNhHskNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vqr2qRzm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vqr2qRzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724664173; x=1756200173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kNpeULUI88X2FtzoorTTIfhiAjeIDlBk8Gvxqn/jwJo=;
  b=Vqr2qRzmG+7iUpJdRqFFp6pQQrduLQcVnNMPHPMbvpw+t/Qp/QUjnfqf
   pL22MVqW5n3pJ2DWSccbLbXGGpqQJqh3soAR6BFUHsS6wfXi+EbRSv2lM
   zrbOBQlmu2CNH74vkmJtD/2FySmuzXpXoX/2GmXKwW1YnTxcYG71G8tg9
   xaNcvu1LMvXaaS2eUex7cJwpFQyPNKnp5b3PN6ov1AXxNXjUUXjGvulW0
   Y9EM4MlxtkVZr7GLUDr9/LGK8qemr5lrckgpnj2WF0iIA9YJWw3kGWW3D
   mF8rgLQgFABE9o/FASicYvxyWb01RD8ir1/jdTKy+vw8eCE1vRKw5JrFF
   g==;
X-CSE-ConnectionGUID: Z4zwslRRQ9WcrPyrfNvxuA==
X-CSE-MsgGUID: R7eFMYWPSDam/CIruwEpPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33696173"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33696173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 02:22:53 -0700
X-CSE-ConnectionGUID: 7yTUUD1rTXKj9b7uLG7uTg==
X-CSE-MsgGUID: PgLoGPvoQ+6g769EvB8FUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62424229"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Aug 2024 02:22:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siVw1-000GpT-1c;
	Mon, 26 Aug 2024 09:22:49 +0000
Date: Mon, 26 Aug 2024 17:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:net-next-page_frag_cache_v14 5/12]
 include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_242' declared with attribute error: BUILD_BUG_ON
 failed: PAGE_FRAG_CACHE_MAX_ORDER > PAGE_FRAG_CACHE_ORDER_MASK
Message-ID: <202408261721.H6MAStKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git net-next-page_frag_cache_v14
head:   9dabcec31187fb32e0622e35a4e7e5c8041eb33a
commit: e18dc658cca744459b639a9de3ef12d0376a4ac7 [5/12] mm: page_frag: reuse existing space for 'size' and 'pfmemalloc'
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20240826/202408261721.H6MAStKB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408261721.H6MAStKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408261721.H6MAStKB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'page_frag_encode_page',
       inlined from '__page_frag_cache_refill' at mm/page_frag_cache.c:45:21,
       inlined from '__page_frag_alloc_align' at mm/page_frag_cache.c:83:10:
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_242' declared with attribute error: BUILD_BUG_ON failed: PAGE_FRAG_CACHE_MAX_ORDER > PAGE_FRAG_CACHE_ORDER_MASK
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/page_frag_cache.h:33:9: note: in expansion of macro 'BUILD_BUG_ON'
      33 |         BUILD_BUG_ON(PAGE_FRAG_CACHE_MAX_ORDER > PAGE_FRAG_CACHE_ORDER_MASK);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_242 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
