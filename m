Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3B27FD48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 05:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768800376; cv=none; b=OjImDMFP7NWAd5m6NEOmcmtcwB1KB6oZbZjpkC9k6yBzWSzyRpT/smBc3WEP8dlLQeCoi6yikqhBpx0qNAQbrd/ZqtMf9nf8Hq0VkOCbVYsn/xh3VhsaRGRAxYDwWj4xMVsFyIDrZZQ7kMmE/1C750xdX7nL2DlMQT8FnrieeOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768800376; c=relaxed/simple;
	bh=HuPQR37E/7Rsv13jP5BvUsF7bJF5koDQdnLY9wz95P8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=glZXyPZYzFnNRS+m8Ce9x26h3EC3DkH68WzHUm+6rKArC5HlYnN3GCARaEHpeHhJNaj+WXw08SL08VF4ANNhFfXeb3LyL3S6ipB1dae2elreX9Z6FcngCtYmmEmZ2ZhynQaDfOb3+qU7yzn42UDCadEZlkjR07+ib1VqNMvuGK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xt/gHpMf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xt/gHpMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768800374; x=1800336374;
  h=date:from:to:cc:subject:message-id;
  bh=HuPQR37E/7Rsv13jP5BvUsF7bJF5koDQdnLY9wz95P8=;
  b=Xt/gHpMfcU0wFo7Iap4t1+ziUbdlPioTGTMzqq/pchke4nxi8vOZqYmW
   ebsJMmXEg+kyynVk/AD3h05ilmjemNP7yCNFCI7doBKl9mb+XFLPE4WRH
   TC1Bx3unuKdTBj/enFvTH/ozrRAtWKsr8lIIYXP7ZOI88UezfxAxdKC2T
   P31bmaPLiPfqncY4PGP+9PVe1IKdE0oENzD/Nh6MyFAA0IpEstkMxDqt5
   QFoJlbHmSe2Rlap7nS3os7wc10d3X4UEdSvVWagb4Et1WZnaV7K15qQya
   3A/hcdboMv0bV01ZCqfgdbX1scn0DjmJALdI86SaQKa7j0nPSHJdw/xWj
   A==;
X-CSE-ConnectionGUID: wUOcUtTTQL6YYM3NfHDv4Q==
X-CSE-MsgGUID: JLVDEOg0RCCCGfJ/2XD4dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70058266"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70058266"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 21:26:11 -0800
X-CSE-ConnectionGUID: Do0peaOeRpCMeJac/59BnQ==
X-CSE-MsgGUID: 04l2qzQXTVKwyN165aMsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210258434"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2026 21:26:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhhmB-00000000NTx-3IE1;
	Mon, 19 Jan 2026 05:26:07 +0000
Date: Mon, 19 Jan 2026 13:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [linux-next:master 1581/6849]
 drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse: sparse: incompatible
 types for operation (==):
Message-ID: <202601191306.Pa4IS8Aq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: ce5971773651ad5c7e26aea29d72ea8887428774 [1581/6849] drm/xe: Introduce IF_ARGS macro utility
config: i386-randconfig-063-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191306.Pa4IS8Aq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191306.Pa4IS8Aq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191306.Pa4IS8Aq-lkp@intel.com/

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
