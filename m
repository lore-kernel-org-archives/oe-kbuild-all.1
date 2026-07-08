Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE8F13A86C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548955; cv=none; b=ULgR5rPLrO8HfLJ48gfUakzGOdqYCAqfLUJk0k+6NP+bnK+ggHvVV99M/6FbUrRAaqAW5sFajH6294Jag4sft0hStE6f5bFWsTaACR5nSxXbUQa3nxLvpYVkTSse/fxo23OZ8rjljrXfn3h2P39QNJOJ5ZxUP356znwMAqZUj88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548955; c=relaxed/simple;
	bh=X+6ltkYpMiOg40c5aYAEeo1mVqxkmsLOzmeb45A2V0Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G4jTqHoUfhrdMmb9nqP2kIFSAsAtXZx2rOK7N5ABqeLrIQST4XGkGLGKGTt8M2g1NgaS39U8UjMcl08BNU1vqC4g72vNAti7H1wSWNEd5OsWhsamArdXI1jEWueAX5hQMo5bVommF5m/Kqo7gqoztBhLy19UWm7bz70M0omARQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBzvw3zj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBzvw3zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783548954; x=1815084954;
  h=date:from:to:cc:subject:message-id;
  bh=X+6ltkYpMiOg40c5aYAEeo1mVqxkmsLOzmeb45A2V0Y=;
  b=SBzvw3zjiC7SJGxBIpJ78AIs2iVMuf6SRHYHoag7R1VihElc2463bgM0
   Glo+Ik+DeVXyyVeTlwjgcnC4ZJjW8Yy8fdwywZiCpDMi+G9AqkD3wa9B1
   HHXqHLD1aPDRd7LYJ4QsEeLfIH3NhfW5Vk5RogLv05MDJraViE67iEEbT
   if8/B8ZskPfkUCLvDys69aIoLzheM1f4UApM4/WbfIRv8qlaTD2n+xQtX
   JUZxebBmnXadfLLbDEj+R/AktE9OcRiGwNBgPgewbuN3DBVZ3XLqBebEX
   +blTTNaW9dUJWbvYlt5V9mvYxL+x8vKwq2G9JxYlSA8dDerEDIw6L2WAE
   g==;
X-CSE-ConnectionGUID: KA6qWh4MSXSoOiS1JSnWmg==
X-CSE-MsgGUID: m2cifq8PQR6x+j4MkQC/FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94831582"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94831582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 15:15:53 -0700
X-CSE-ConnectionGUID: Iq1Q8x+UQJeHB5aXJqxoOg==
X-CSE-MsgGUID: /PA9JogdTa2N2vVpY4Eo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251754198"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2026 15:15:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whaYW-00000000Gvj-426h;
	Wed, 08 Jul 2026 22:15:48 +0000
Date: Thu, 09 Jul 2026 06:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: drivers/gpu/drm/xe/tests/xe_args_test.c:234:9: sparse:
 sparse: incompatible types for operation (==):
Message-ID: <202607090601.odxc3iTj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: ce5971773651ad5c7e26aea29d72ea8887428774 drm/xe: Introduce IF_ARGS macro utility
date:   7 months ago
config: powerpc-randconfig-r131-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090601.odxc3iTj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090601.odxc3iTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce5971773651 ("drm/xe: Introduce IF_ARGS macro utility")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090601.odxc3iTj-lkp@intel.com/

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
