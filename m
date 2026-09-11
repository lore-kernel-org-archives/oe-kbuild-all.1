Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F039CD19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113618; cv=none; b=Vttd79v4Wjxh9Vq4PCUyf8AG8R2st6fsMP/xLfi4JUbrEfdBQlXdW6dsZ40WxmRu1Ods1/WVxqgmIKTq22xxbX72mg92APUiKXSDbHkRSpoZEdjmp+1it1/s1V/DOo/yz6FYZr+Sv2YvHdSwS2CjN45i+ousV2xsuu4RM4F1sFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113618; c=relaxed/simple;
	bh=v88xHl27JkqvP+UYuQQQ3Wyi/ZZHijh8mVMdE3fImqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e4U8/SXBhRIO1Qmyyl+QILSm20gLhi4CVQyMMoZxGvSHVr9uz84A3W6S2CVYIogm7qLMxsrPlv7YXGgmzJPDiUvlIZ674+XT4XpouqkutylN3qvCi8L/XwkrHku8q9o+lDTZatlLvRmmGti5D3rL0UUsfNSa8c9xFO5kFTdf3bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RH5hAXLP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RH5hAXLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789113616; x=1820649616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v88xHl27JkqvP+UYuQQQ3Wyi/ZZHijh8mVMdE3fImqc=;
  b=RH5hAXLPK5aqP1uXDoQkZfnoNl4g3dWJZwzjCdgS33+FTB/Gew3S11s+
   XY9EZJi5YZ7t2w6RmrFpQFraOqp59KQJfk/9jcXv52MDu0ABYwrB7LyUi
   8Tz+526K9OLyhJapDdn6g5BGlOtilpSgAy0/DR8XuC/DjEYMwMH+gK+kw
   xTTwoYF8XewRjJZyklVLraZjp6pG85x/yYSVU8xHmFzFEHBhBp9U8Y8vS
   F2fS5mhcs2ETqNcUIWwfusN98WlctRGD0keeVPVDZtrvFmmwEdD+/CALd
   iLZqWKFQ8FqdcucwKYha4Bq73fuetq3AqIw+ZoLVjZkYW0KmiGUCtz0zE
   A==;
X-CSE-ConnectionGUID: Y+I4t4UMRTi4edRn0RAWFA==
X-CSE-MsgGUID: 8+ySibqySbyUIbmx+o7MsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93265607"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="93265607"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 01:00:16 -0700
X-CSE-ConnectionGUID: GXWOnszuT7K55FXHmxUygw==
X-CSE-MsgGUID: L5xOCbtzSr6u0REFJrABtA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 01:00:14 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4wAs-000000001GS-2zn9;
	Fri, 11 Sep 2026 08:00:01 +0000
Date: Fri, 11 Sep 2026 15:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/42]
 kernel/time/aux_clock_test.c:184:18: warning: integer overflow in expression
 of type 'long int' results in '705032704'
Message-ID: <202609111530.PtcoH3H4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   368883ddc7ac709883254193a4588fdf9b2da65a
commit: 05ab3171697e70cdc4302f27ef62d851a2580f93 [17/42] timekeeping: Add a test for auxiliary to monotonic clock conversions
config: arc-randconfig-002-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111530.PtcoH3H4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111530.PtcoH3H4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111530.PtcoH3H4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/aux_clock_test.c: In function 'mono_conv_edge_cases':
>> kernel/time/aux_clock_test.c:184:18: warning: integer overflow in expression of type 'long int' results in '705032704' [-Woverflow]
     small_delta = 5 * NSEC_PER_SEC;
                     ^
   kernel/time/aux_clock_test.c:186:28: warning: integer overflow in expression of type 'long int' results in '765657088' [-Woverflow]
     large_delta = 365 * 86400 * NSEC_PER_SEC;
                               ^


vim +184 kernel/time/aux_clock_test.c

   173	
   174	/* Mostly for development only. */
   175	static void mono_conv_edge_cases(struct kunit *test)
   176	{
   177		ktime_t mono_base, aux_base, small_delta, large_delta;
   178		struct tk_aux_mono_conv conv;
   179		ktime_t converted_mono;
   180		bool is_before;
   181	
   182		mono_base = 0;
   183		aux_base = 0;
 > 184		small_delta = 5 * NSEC_PER_SEC;
   185		/* 1 year */
   186		large_delta = 365 * 86400 * NSEC_PER_SEC;
   187	
   188		setup_aux_mono_conv(&conv, 5, mono_base, aux_base);
   189	
   190		/* delta = 0 */
   191		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base, mono_base, &converted_mono);
   192		KUNIT_EXPECT_FALSE(test, is_before);
   193	
   194		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base, mono_base + 1,
   195							      &converted_mono);
   196		KUNIT_EXPECT_TRUE(test, is_before);
   197		KUNIT_EXPECT_EQ(test, converted_mono, mono_base);
   198	
   199		/* positive small delta */
   200		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base + small_delta, mono_base,
   201							      &converted_mono);
   202		KUNIT_EXPECT_FALSE(test, is_before);
   203	
   204		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base, mono_base + small_delta,
   205							      &converted_mono);
   206		KUNIT_EXPECT_TRUE(test, is_before);
   207		KUNIT_EXPECT_EQ(test, converted_mono, mono_base);
   208	
   209		/* positive large delta */
   210		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base + large_delta, mono_base,
   211							      &converted_mono);
   212		KUNIT_EXPECT_FALSE(test, is_before);
   213	
   214		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base, mono_base + large_delta,
   215							      &converted_mono);
   216		KUNIT_EXPECT_TRUE(test, is_before);
   217		KUNIT_EXPECT_EQ(test, converted_mono, mono_base);
   218	
   219		/* negative small delta */
   220		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base - small_delta, mono_base,
   221							      &converted_mono);
   222		KUNIT_EXPECT_TRUE(test, is_before);
   223		KUNIT_EXPECT_EQ(test, converted_mono, -4761904702);
   224	
   225		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base, mono_base - small_delta,
   226							      &converted_mono);
   227		KUNIT_EXPECT_FALSE(test, is_before);
   228	
   229		/* negative large delta */
   230		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base - large_delta, mono_base,
   231							      &converted_mono);
   232		KUNIT_EXPECT_TRUE(test, is_before);
   233		KUNIT_EXPECT_EQ(test, converted_mono, -30034285333871842);
   234	
   235		is_before = ktime_aux_before_mono_and_convert(&conv, aux_base, mono_base - large_delta,
   236							      &converted_mono);
   237		KUNIT_EXPECT_FALSE(test, is_before);
   238	}
   239	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
