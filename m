Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6CD3CAA2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121104; cv=none; b=E5LjDsrm1y9KBYuJmHH/pXc4e3sLaKskQJrT2eHdrhpKQNoH0QLdcY3ce0xfq3n1TYCVWbhhLcdVI4wZOmZr9TFTFGLQY9zekcwcwwHWKWufsQo9LKmeDKq97yPKV518RmuDZRs8CtThK4EkRrhfE862b95zOrf50jIvba8OiBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121104; c=relaxed/simple;
	bh=y4Jic/dy/m6B6H3k+pWKfkzEQdhMLBI3kYRnCJTsmco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OhnumJpl4V/4+uj0HfrRYZWcO6mL6wboMm/nASRW8xTGAAvFlyMqih7bfFwlf2bM5cqq6yqN3ULcM/2yrD/scBN3e8d33SlqkziMlx1443ISc4Am7qndXihIyIKt8OKUso2ySqe4zn1uZbgv/FtXM2heh3Vsn6tQ/3/2zt41uKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlqNeytb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlqNeytb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789121102; x=1820657102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4Jic/dy/m6B6H3k+pWKfkzEQdhMLBI3kYRnCJTsmco=;
  b=SlqNeytbdNDnicmlZXdaHQmrlxkUqpwzjaJxbqWey7+FLEXG3i4U5HQD
   gDKwQBzpLao+D6cwDb/uXkHQWEHCPA/HZzhE6NLkvW3VOwHuO0odDHkGT
   MMYbV7TUGyks76NTuDYDL2SU90e46JNlpnRqc/jlCuYTJKqecYv/Kdypw
   ayrbZBPgzTbvXUQr8CXk8iq3btrHiSQuMjY8bxRqly5zWouwu2nQrdYuW
   WLSIG5hl5OL4jLKDPQGpaiesicgokImk4J2xy4Z7kbToycS9irFyTPWp+
   QWnGGSbJ4DSF3rPQC1T8kxLGuw66LrG7PXODGhh+WyT8UdhJtbOfWDvI+
   Q==;
X-CSE-ConnectionGUID: dmOmVKScQkiLzziJfi1N1A==
X-CSE-MsgGUID: TMsWuxitTkOTRzbIziM58A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100934880"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100934880"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:05:01 -0700
X-CSE-ConnectionGUID: ik0QLeS8TtKbZoT3mOkC4g==
X-CSE-MsgGUID: 63IHrbW6Qui41RFk0tKK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="296864584"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2026 03:05:00 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4y7u-000000000lL-1z8s;
	Fri, 11 Sep 2026 10:04:58 +0000
Date: Fri, 11 Sep 2026 12:04:05 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 17/42]
 kernel/time/aux_clock_test.c:184:18: warning: overflow in expression; result
 is 705'032'704 with type 'long'
Message-ID: <202609111102.lkBGAFl6-lkp@intel.com>
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
config: i386-randconfig-051-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111102.lkBGAFl6-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111102.lkBGAFl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111102.lkBGAFl6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/aux_clock_test.c:184:18: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
     184 |         small_delta = 5 * NSEC_PER_SEC;
         |                       ~~^~~~~~~~~~~~~~
   kernel/time/aux_clock_test.c:186:28: warning: overflow in expression; result is 765'657'088 with type 'long' [-Winteger-overflow]
     186 |         large_delta = 365 * 86400 * NSEC_PER_SEC;
         |                       ~~~~~~~~~~~~^~~~~~~~~~~~~~
   2 warnings generated.


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
