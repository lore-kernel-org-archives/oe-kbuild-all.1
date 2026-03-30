Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D63C945C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870989; cv=none; b=TpyAgMWvx1K/TUo5YUInZFP3Blt/YQn4tLMS7UzCaEPlJf/bXCm2aoHAG+d+mjbendIwe5rJgYEraOPvwodMWGvhycMz/8BEfxk4Ku/TDUj0DMUplrQZdJ7k2gyxtBpFlGGMvI4y7J+rU1aMuIhsiuo3KHatyeYyeMhLn1n6Spk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870989; c=relaxed/simple;
	bh=IjYCiyl71AdWcTO3z54NPfMRteL+d5HNkAK1hGpn3is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nQbpkMcYPS6twj49g8/UMgQPefa2tckM/Fr67fc9DcmVKXcKUg6xeVJxTVYZeKs47psSZ4O/JAcN8XjWwwTnOWO7H3WT0opFPq9sLea3V1Mhm/4XDGMi3A+ZQd5XN/H9ZxbCEkP+e7JKsfyEMaueaCdqwWaKHUHcX/OpFPsZhIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFnd0tM2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFnd0tM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774870987; x=1806406987;
  h=date:from:to:cc:subject:message-id;
  bh=IjYCiyl71AdWcTO3z54NPfMRteL+d5HNkAK1hGpn3is=;
  b=LFnd0tM26+UVr0u+On/vgLQpNOsB1fPUmHApTSM2JeTQJe+/jz000hwq
   nlS5pPX+h2cdbMs5O9VJfdTNiUvzU4FhclXTBFFs7kDknHhARCA6gd40j
   Z6a7JliJXbDK5EOR83O+z1Bmyu+HUISk2spmTIrpaU6g4/yXR9F4UWY30
   nWfE5zBPN6RbUdYmquVpAZ3jjhCNA0pwQciZeujS/dSgFfnWlmkU1oiLq
   JYFJZgeV37t8mnHfP25Fv7bRmXA2KVvoNu7Q7MtmLClGUb6Il7/wjydhJ
   hKOSav3aINjNLmfiR7zIecFqxuiCvDUXp09H3bjcjBYbl1y2xutoXl/Tl
   A==;
X-CSE-ConnectionGUID: aqLbbFr1TmaDmjymFj4voQ==
X-CSE-MsgGUID: Wq8GCnMMSZa2SMyCcDWfdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75830493"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75830493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:43:04 -0700
X-CSE-ConnectionGUID: JpR08ieGRrKmZKN8iDTIoQ==
X-CSE-MsgGUID: ytmTLH9ATse73K6wROWvPQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 04:43:02 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7B1I-00000000123-1HRX;
	Mon, 30 Mar 2026 11:43:00 +0000
Date: Mon, 30 Mar 2026 19:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse:
 sparse: incompatible types for operation (==):
Message-ID: <202603301926.KR7OCMVO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: ce5971773651ad5c7e26aea29d72ea8887428774 drm/xe: Introduce IF_ARGS macro utility
date:   3 months ago
config: microblaze-randconfig-r133-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301926.KR7OCMVO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301926.KR7OCMVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301926.KR7OCMVO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/tests/xe_args_test.c:89:9: sparse: sparse: Expected ) after typeof
   drivers/gpu/drm/xe/tests/xe_args_test.c:89:9: sparse: sparse: got Q
   drivers/gpu/drm/xe/tests/xe_args_test.c:90:9: sparse: sparse: Expected ) after typeof
   drivers/gpu/drm/xe/tests/xe_args_test.c:90:9: sparse: sparse: got Q
   drivers/gpu/drm/xe/tests/xe_args_test.c:225:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/tests/xe_args_test.c:225:9: sparse: sparse: got false
   drivers/gpu/drm/xe/tests/xe_args_test.c:226:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/tests/xe_args_test.c:226:9: sparse: sparse: got false
   drivers/gpu/drm/xe/tests/xe_args_test.c:228:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/tests/xe_args_test.c:228:9: sparse: sparse: got no_args
   drivers/gpu/drm/xe/tests/xe_args_test.c:229:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/tests/xe_args_test.c:229:9: sparse: sparse: got no_args
   drivers/gpu/drm/xe/tests/xe_args_test.c:89:9: sparse: sparse: undefined identifier '__left'
   drivers/gpu/drm/xe/tests/xe_args_test.c:89:9: sparse: sparse: undefined identifier '__left'
   drivers/gpu/drm/xe/tests/xe_args_test.c:90:9: sparse: sparse: undefined identifier '__left'
   drivers/gpu/drm/xe/tests/xe_args_test.c:90:9: sparse: sparse: undefined identifier '__left'
   drivers/gpu/drm/xe/tests/xe_args_test.c:225:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:226:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:228:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:229:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse: sparse: undefined identifier '__VA_OPT__'
>> drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse: sparse: incompatible types for operation (==):
   drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse:    bad type const __left
   drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse:    int const __right
   drivers/gpu/drm/xe/tests/xe_args_test.c:235:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:235:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:235:9: sparse: sparse: incompatible types for operation (==):
   drivers/gpu/drm/xe/tests/xe_args_test.c:235:9: sparse:    bad type const __left
   drivers/gpu/drm/xe/tests/xe_args_test.c:235:9: sparse:    int const __right
   drivers/gpu/drm/xe/tests/xe_args_test.c:236:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:236:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:236:9: sparse: sparse: incompatible types for operation (==):
   drivers/gpu/drm/xe/tests/xe_args_test.c:236:9: sparse:    bad type const __left
   drivers/gpu/drm/xe/tests/xe_args_test.c:236:9: sparse:    int const __right
   drivers/gpu/drm/xe/tests/xe_args_test.c:237:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:237:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:237:9: sparse: sparse: incompatible types for operation (==):
   drivers/gpu/drm/xe/tests/xe_args_test.c:237:9: sparse:    bad type const __left
   drivers/gpu/drm/xe/tests/xe_args_test.c:237:9: sparse:    int const __right
   drivers/gpu/drm/xe/tests/xe_args_test.c:239:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:239:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:239:9: sparse: sparse: incompatible types for operation (==):
   drivers/gpu/drm/xe/tests/xe_args_test.c:239:9: sparse:    bad type const __left
   drivers/gpu/drm/xe/tests/xe_args_test.c:239:9: sparse:    int const __right
   drivers/gpu/drm/xe/tests/xe_args_test.c:242:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:242:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/tests/xe_args_test.c:242:9: sparse: sparse: incompatible types for operation (==):
   drivers/gpu/drm/xe/tests/xe_args_test.c:242:9: sparse:    bad type const __left
   drivers/gpu/drm/xe/tests/xe_args_test.c:242:9: sparse:    int const __right

vim +234 drivers/gpu/drm/xe/tests/xe_args_test.c

    88	
  > 89		KUNIT_EXPECT_EQ(test, bar, Z);
    90		KUNIT_EXPECT_EQ(test, buz, Q);
    91		KUNIT_EXPECT_STREQ(test, __stringify(bar), "Z");
    92		KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
    93	
    94	#undef foo
    95	#undef bar
    96	#undef buz
    97	}
    98	
    99	static void sep_comma_example(struct kunit *test)
   100	{
   101	#define foo(f)	f(X) f(Y) f(Z) f(Q)
   102	#define bar	DROP_FIRST_ARG(foo(ARGS_SEP_COMMA __stringify))
   103	#define buz	CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(foo(ARGS_SEP_COMMA)))
   104	
   105		static const char * const a[] = { bar };
   106	
   107		KUNIT_EXPECT_STREQ(test, a[0], "X");
   108		KUNIT_EXPECT_STREQ(test, a[1], "Y");
   109		KUNIT_EXPECT_STREQ(test, a[2], "Z");
   110		KUNIT_EXPECT_STREQ(test, a[3], "Q");
   111	
   112		KUNIT_EXPECT_EQ(test, buz, 4);
   113	
   114	#undef foo
   115	#undef bar
   116	#undef buz
   117	}
   118	
   119	#define NO_ARGS
   120	#define FOO_ARGS	X, Y, Z, Q
   121	#define MAX_ARGS	-1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12
   122	
   123	static void count_args_test(struct kunit *test)
   124	{
   125		int count;
   126	
   127		/* COUNT_ARGS() counts to 12 */
   128	
   129		count = COUNT_ARGS();
   130		KUNIT_EXPECT_EQ(test, count, 0);
   131	
   132		count = COUNT_ARGS(1);
   133		KUNIT_EXPECT_EQ(test, count, 1);
   134	
   135		count = COUNT_ARGS(a, b, c, d, e);
   136		KUNIT_EXPECT_EQ(test, count, 5);
   137	
   138		count = COUNT_ARGS(a, b, c, d, e, f, g, h, i, j, k, l);
   139		KUNIT_EXPECT_EQ(test, count, 12);
   140	
   141		/* COUNT_ARGS() does not expand params */
   142	
   143		count = COUNT_ARGS(NO_ARGS);
   144		KUNIT_EXPECT_EQ(test, count, 1);
   145	
   146		count = COUNT_ARGS(FOO_ARGS);
   147		KUNIT_EXPECT_EQ(test, count, 1);
   148	}
   149	
   150	static void call_args_test(struct kunit *test)
   151	{
   152		int count;
   153	
   154		count = CALL_ARGS(COUNT_ARGS, NO_ARGS);
   155		KUNIT_EXPECT_EQ(test, count, 0);
   156		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, NO_ARGS), 0);
   157		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FOO_ARGS), 4);
   158		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FOO_ARGS, FOO_ARGS), 8);
   159		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, MAX_ARGS), 12);
   160	}
   161	
   162	static void drop_first_arg_test(struct kunit *test)
   163	{
   164		int Y = -2, Z = -3, Q = -4;
   165		int a[] = { DROP_FIRST_ARG(FOO_ARGS) };
   166	
   167		KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(0, -1), -1);
   168		KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(DROP_FIRST_ARG(0, -1, -2)), -2);
   169	
   170		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, DROP_FIRST_ARG(FOO_ARGS)), 3);
   171		KUNIT_EXPECT_EQ(test, DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))), -4);
   172		KUNIT_EXPECT_EQ(test, a[0], -2);
   173		KUNIT_EXPECT_EQ(test, a[1], -3);
   174		KUNIT_EXPECT_EQ(test, a[2], -4);
   175	
   176	#define foo	DROP_FIRST_ARG(FOO_ARGS)
   177	#define bar	DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS))
   178	#define buz	DROP_FIRST_ARG(DROP_FIRST_ARG(DROP_FIRST_ARG(FOO_ARGS)))
   179	
   180		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, foo), 3);
   181		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, bar), 2);
   182		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, buz), 1);
   183		KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
   184	
   185	#undef foo
   186	#undef bar
   187	#undef buz
   188	}
   189	
   190	static void first_arg_test(struct kunit *test)
   191	{
   192		int X = -1;
   193		int a[] = { FIRST_ARG(FOO_ARGS) };
   194	
   195		KUNIT_EXPECT_EQ(test, FIRST_ARG(-1, -2), -1);
   196	
   197		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, FIRST_ARG(FOO_ARGS)), 1);
   198		KUNIT_EXPECT_EQ(test, FIRST_ARG(FOO_ARGS), -1);
   199		KUNIT_EXPECT_EQ(test, a[0], -1);
   200		KUNIT_EXPECT_STREQ(test, __stringify(FIRST_ARG(FOO_ARGS)), "X");
   201	}
   202	
   203	static void last_arg_test(struct kunit *test)
   204	{
   205		int Q = -4;
   206		int a[] = { LAST_ARG(FOO_ARGS) };
   207	
   208		KUNIT_EXPECT_EQ(test, LAST_ARG(-1, -2), -2);
   209	
   210		KUNIT_EXPECT_EQ(test, CALL_ARGS(COUNT_ARGS, LAST_ARG(FOO_ARGS)), 1);
   211		KUNIT_EXPECT_EQ(test, LAST_ARG(FOO_ARGS), -4);
   212		KUNIT_EXPECT_EQ(test, a[0], -4);
   213		KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(FOO_ARGS)), "Q");
   214	
   215		KUNIT_EXPECT_EQ(test, LAST_ARG(MAX_ARGS), -12);
   216		KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
   217	}
   218	
   219	static void if_args_test(struct kunit *test)
   220	{
   221		bool with_args = true;
   222		bool no_args = false;
   223		enum { X = 100 };
   224	
   225		KUNIT_EXPECT_TRUE(test, IF_ARGS(true, false, FOO_ARGS));
   226		KUNIT_EXPECT_FALSE(test, IF_ARGS(true, false, NO_ARGS));
   227	
   228		KUNIT_EXPECT_TRUE(test, CONCATENATE(IF_ARGS(with, no, FOO_ARGS), _args));
   229		KUNIT_EXPECT_FALSE(test, CONCATENATE(IF_ARGS(with, no, NO_ARGS), _args));
   230	
   231		KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, FOO_ARGS)), "yes");
   232		KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, NO_ARGS)), "no");
   233	
 > 234		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, FOO_ARGS), 4);
   235		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, NO_ARGS), -1);
   236		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, FOO_ARGS), 0);
   237		KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, NO_ARGS), -1);
   238	
   239		KUNIT_EXPECT_EQ(test,
   240				CALL_ARGS(FIRST_ARG,
   241					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), X);
   242		KUNIT_EXPECT_EQ(test,
   243				CALL_ARGS(FIRST_ARG,
   244					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), -1);
   245		KUNIT_EXPECT_EQ(test,
   246				CALL_ARGS(COUNT_ARGS,
   247					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, FOO_ARGS), _ARGS)), 4);
   248		KUNIT_EXPECT_EQ(test,
   249				CALL_ARGS(COUNT_ARGS,
   250					  CALL_ARGS(CONCATENATE, IF_ARGS(FOO, MAX, NO_ARGS), _ARGS)), 12);
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
