Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E95C1DFF0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738327870; cv=none; b=sSWUozo6m2+H+n6GkxhEa4GM+fffx9lzMcP+FEMpSwgwLdz1jj4xNlyM7nLMavKIAF3DZzitG+KOWmZ+ln8uxC8MJxQea+Fq5dyGFP8Rjv44WWTe4UFd0YhdJA4HRNYk8Ekrv2xIU7+Y5Q4VHjYvWaqGXrJEuj8RCnMtAz+EjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738327870; c=relaxed/simple;
	bh=T+1TGjUu+MVe7U9o7Ef/iXl0f/uQRvtmd89YByHq0/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZmgWzezAdFtQSHJd/w4/SRqbOE0RhciCFe5DmUiLic820MmwbuXx8Q8ngoTD6R6n+5g7SPaA1NqAOtMxd70FMuxvHAilZLZrzodOf/nPGs7juG2slbugnkpTfU5F9cv+TWzlZKah80t0gjJnVrUnAf5SQa5FnKwXuf9zJoDMic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvesWKDa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvesWKDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738327869; x=1769863869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+1TGjUu+MVe7U9o7Ef/iXl0f/uQRvtmd89YByHq0/E=;
  b=jvesWKDaDjGqnAFXyZrqpH/cVBUYBWNrfdRd0pgRQcUaszKuB8PVDEQX
   i2Uyt9vKqM1FmN7gtmwRv0ykLU+36gQtLJ6+EzHkqkfe4qNyH2bNk4IUN
   6EbKukX17WD/KL08LJXPvCSqydPx+ys4WTXqc3lWI8Da+ApAIRAGJn2GL
   Q12y1F/GBMx2n5bFZzzkxB75SbBiHi+ExWbHzLo85qZ6N6ASvyt3ZKNVg
   2Dtz+OOCpIOQk0m6CPOf2DeEPLeUEJzXLxxvvJst0gBv6EH4qgRhMoXFz
   N1s/PkzvEr7umQZ32HCkLChn909d2fGqrXezu5rop7Six10cTzSDk74yp
   A==;
X-CSE-ConnectionGUID: D23lta47SwqYnEMWseZO+Q==
X-CSE-MsgGUID: 1jp7qN+AQsSi7RGP9ycZSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38776938"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="38776938"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:51:08 -0800
X-CSE-ConnectionGUID: MlbElI7PQLyJEx+qWo993A==
X-CSE-MsgGUID: pizMpPxqRj2S879F5hRp2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="109765490"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jan 2025 04:51:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdqUC-000mNf-0r;
	Fri, 31 Jan 2025 12:51:04 +0000
Date: Fri, 31 Jan 2025 20:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10518/10663] lib/stackinit_kunit.c:437:1: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202501312041.CZmuQno7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df4b2bbff898227db0c14264ac7edd634e79f755
commit: e71a29db79da194678630ebfcc53ff2aecc9d441 [10518/10663] stackinit: Add union initialization to selftests
config: alpha-randconfig-r121-20250131 (https://download.01.org/0day-ci/archive/20250131/202501312041.CZmuQno7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250131/202501312041.CZmuQno7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501312041.CZmuQno7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/stackinit_kunit.c:426:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:426:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:426:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:427:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:427:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:427:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:431:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:432:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:432:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:432:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:432:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:432:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:432:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:433:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:434:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:435:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:436:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:445:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:445:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:445:1: sparse: sparse: Using plain integer as NULL pointer
   lib/stackinit_kunit.c:447:1: sparse: sparse: Using plain integer as NULL pointer
>> lib/stackinit_kunit.c:437:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:437:1: sparse:   also defined here
>> lib/stackinit_kunit.c:437:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:437:1: sparse:   also defined here
   lib/stackinit_kunit.c:438:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:438:1: sparse:   also defined here
   lib/stackinit_kunit.c:438:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:438:1: sparse:   also defined here
   lib/stackinit_kunit.c:440:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:440:1: sparse:   also defined here
   lib/stackinit_kunit.c:440:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:440:1: sparse:   also defined here
   lib/stackinit_kunit.c:441:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:441:1: sparse:   also defined here
   lib/stackinit_kunit.c:441:1: sparse: sparse: Initializer entry defined twice
   lib/stackinit_kunit.c:441:1: sparse:   also defined here

vim +437 lib/stackinit_kunit.c

   380	
   381	#define DEFINE_SCALAR_TEST(name, init, xfail)			\
   382			DEFINE_TEST(name ## _ ## init, name, SCALAR,	\
   383				    init, xfail)
   384	
   385	#define DEFINE_SCALAR_TESTS(init, xfail)			\
   386			DEFINE_SCALAR_TEST(u8, init, xfail);		\
   387			DEFINE_SCALAR_TEST(u16, init, xfail);		\
   388			DEFINE_SCALAR_TEST(u32, init, xfail);		\
   389			DEFINE_SCALAR_TEST(u64, init, xfail);		\
   390			DEFINE_TEST(char_array_ ## init, unsigned char,	\
   391				    STRING, init, xfail)
   392	
   393	#define DEFINE_STRUCT_TEST(name, init, xfail)			\
   394			DEFINE_TEST(name ## _ ## init,			\
   395				    struct test_ ## name, STRUCT, init, \
   396				    xfail)
   397	
   398	#define DEFINE_UNION_TEST(name, init, xfail)			\
   399			DEFINE_TEST(name ## _ ## init,			\
   400				    union test_ ## name, STRUCT, init,	\
   401				    xfail)
   402	
   403	#define DEFINE_STRUCT_TESTS(init, xfail)			\
   404			DEFINE_STRUCT_TEST(small_hole, init, xfail);	\
   405			DEFINE_STRUCT_TEST(big_hole, init, xfail);	\
   406			DEFINE_STRUCT_TEST(trailing_hole, init, xfail);	\
   407			DEFINE_STRUCT_TEST(packed, init, xfail)
   408	
   409	#define DEFINE_STRUCT_INITIALIZER_TESTS(base, xfail)		\
   410			DEFINE_STRUCT_TESTS(base ## _ ## partial,	\
   411					    xfail);			\
   412			DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
   413	
   414	#define DEFINE_UNION_INITIALIZER_TESTS(base, xfail)		\
   415			DEFINE_UNION_TESTS(base ## _ ## partial,	\
   416					    xfail);			\
   417			DEFINE_UNION_TESTS(base ## _ ## all, xfail)
   418	
   419	#define DEFINE_UNION_TESTS(init, xfail)				\
   420			DEFINE_UNION_TEST(same_sizes, init, xfail);	\
   421			DEFINE_UNION_TEST(small_start, init, xfail);	\
   422			DEFINE_UNION_TEST(small_end, init, xfail);
   423	
   424	/* These should be fully initialized all the time! */
   425	DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
   426	DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
   427	DEFINE_STRUCT_TESTS(old_zero, ALWAYS_PASS);
   428	DEFINE_UNION_TESTS(zero, ALWAYS_PASS);
   429	DEFINE_UNION_TESTS(old_zero, ALWAYS_PASS);
   430	/* Struct initializers: padding may be left uninitialized. */
   431	DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
   432	DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
   433	DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
   434	DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
 > 435	DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
   436	DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
 > 437	DEFINE_UNION_INITIALIZER_TESTS(static, STRONG_PASS);
   438	DEFINE_UNION_INITIALIZER_TESTS(dynamic, STRONG_PASS);
   439	DEFINE_UNION_INITIALIZER_TESTS(runtime, STRONG_PASS);
   440	DEFINE_UNION_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
   441	DEFINE_UNION_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
   442	DEFINE_UNION_TESTS(assigned_copy, ALWAYS_FAIL);
   443	/* No initialization without compiler instrumentation. */
   444	DEFINE_SCALAR_TESTS(none, STRONG_PASS);
   445	DEFINE_STRUCT_TESTS(none, BYREF_PASS);
   446	/* Initialization of members with __user attribute. */
   447	DEFINE_TEST(user, struct test_user, STRUCT, none, USER_PASS);
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
