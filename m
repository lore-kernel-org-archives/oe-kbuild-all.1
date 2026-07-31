Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BEF3368A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 21:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785533455; cv=none; b=hxYTNsCbpO2AGTSLM1pz4WGKGmBgmlAua+zwtiMZr7xTI1RQvkgTQKalev/YJLIJuxTmK8U8ReQEZ6dQtupY/MCSXq5y5J4kzgHxH7KMhpt3gnLb8NLv2pIINSbsgjfdwFPjXtftGvjIIU2m4X6aAxuQI3TvXPfezFyEzcP+Kuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785533455; c=relaxed/simple;
	bh=T4Je7GGj4QjJ24oJhxY50Iy4OpMoOyEhlt+tH133C2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jmtCWARvIYbQkHL2xALaCI67DQQV9C938IvbmXV9JjFvEG6vgGGMkgBsYpaMdhJznrnDK2DQPa67Cq3yuTonv+S2Dz8aNSYHDda2+NdPf7m54D2SJzqtWBWuyOgHo6FavKzuruZJO/lLVmmepoNQ4pWlkqBs7wEfMmd/fZNrNZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIKLwHK2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIKLwHK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785533453; x=1817069453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T4Je7GGj4QjJ24oJhxY50Iy4OpMoOyEhlt+tH133C2w=;
  b=IIKLwHK2hEj9qciC/X1XcZ1SL2Jnzv6BC7UqKSkLtdLkAcLLksmfAx0F
   cXs/RApGqZtnAHYk06rmJiLCyOhFsGUP6gEfx+rPCcU4QhtcgJEcxYEAe
   ub0yvNBpeCuFQwZWr2CQHfENm3yGQEk7K10fiQDjEt6pYEg6mStPK4sX7
   7X9hHa/71Fcc3SMJp5PgGI/4GnXN2gvacrYhDgbBXURCTTOr82jW2z3u7
   EofWRmpfttP6WSIOQS+Y3QRrOmBJvcv4Y9CvkRz6zO2antpZar95dmGrV
   cgNFNYIC1bBqNZ7M0U3fao5END7viuZtmgWfzm7eV1OHZPbRKhhcMdv1o
   A==;
X-CSE-ConnectionGUID: 2og4YCaRQLaZ6pjbCDTd7w==
X-CSE-MsgGUID: jw255oWFTzqyKMKmnxINnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86035824"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86035824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 14:30:52 -0700
X-CSE-ConnectionGUID: Dyxemq5ITnWQzTzbEOLD4A==
X-CSE-MsgGUID: OVfeQJUJTUO5L03WCNSo8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="254377249"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jul 2026 14:30:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpuoa-000000002Hp-2QxY;
	Fri, 31 Jul 2026 21:30:48 +0000
Date: Sat, 01 Aug 2026 05:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 53/55]
 kernel/time/time_test.c:184:41: error: implicit declaration of function
 'tk_aux_reciprocal_mult'
Message-ID: <202608010522.IMcTJaym-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   c2edf72f8ebcec4268393789859f789bb12ea5d0
commit: d9ad800448084bd3e951f2de98a1180affcc40a7 [53/55] lazy update
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260801/202608010522.IMcTJaym-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010522.IMcTJaym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010522.IMcTJaym-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/time_test.c: In function 'aux_mono_conv':
   kernel/time/time_test.c:183:16: error: implicit declaration of function 'tk_aux_capture_mono_conv' [-Wimplicit-function-declaration]
     183 |         conv = tk_aux_capture_mono_conv(params->mono_base, mono_mult, params->aux_base, aux_mult,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/time/time_test.c:184:41: error: implicit declaration of function 'tk_aux_reciprocal_mult' [-Wimplicit-function-declaration]
     184 |                                         tk_aux_reciprocal_mult(shift, shift, mono_mult),
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/time_test.c:183:16: error: incompatible types when assigning to type 'struct tk_aux_mono_conv' from type 'int'
     183 |         conv = tk_aux_capture_mono_conv(params->mono_base, mono_mult, params->aux_base, aux_mult,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/tk_aux_reciprocal_mult +184 kernel/time/time_test.c

   168	
   169	static void aux_mono_conv(struct kunit *test)
   170	{
   171		const struct aux_mono_conv_test_case *params = test->param_value;
   172		u32 mono_mult, aux_mult, shift;
   173		struct tk_aux_mono_conv conv;
   174	
   175		if (__is_defined(MODULE) || !IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS)) {
   176			kunit_skip(test, "CONFIG_POSIX_AUX_CLOCKS is not reachable");
   177			return;
   178		}
   179	
   180		clocks_calc_mult_shift(&mono_mult, &shift, 1, 1, 200);
   181		aux_mult = mult_frac(mono_mult, 100 + params->speed_difference_percentage, 100);
   182	
   183		conv = tk_aux_capture_mono_conv(params->mono_base, mono_mult, params->aux_base, aux_mult,
 > 184						tk_aux_reciprocal_mult(shift, shift, mono_mult),
   185						tk_aux_reciprocal_mult(shift, shift, aux_mult),
   186						shift);
   187	
   188		for (size_t i = 0; i < ARRAY_SIZE(params->timestamps); i++) {
   189			ktime_t mono = params->timestamps[i].mono;
   190			ktime_t aux = params->timestamps[i].aux;
   191			kunit_info(test, "timestamp mono=%lld aux=%lld\n", mono, aux);
   192	
   193			ktime_t expected_aux = mult_frac(mono - conv.mono_base, 100 + params->speed_difference_percentage, 100) + conv.aux_base;
   194	
   195			KUNIT_ASSERT_EQ(test, aux, expected_aux);
   196	
   197			ktime_t converted_aux = ktime_mono_to_aux(mono, &conv);
   198			kunit_info(test, "converted_aux=%lld\n", converted_aux);
   199			KUNIT_EXPECT_GE(test, converted_aux, aux - 1);
   200			KUNIT_EXPECT_LE(test, converted_aux, aux + 1);
   201	
   202			ktime_t converted_mono = ktime_aux_to_mono(aux, &conv);
   203			kunit_info(test, "converted_mono=%lld\n", converted_mono);
   204			KUNIT_EXPECT_GE(test, converted_mono, mono - 1);
   205			KUNIT_EXPECT_LE(test, converted_mono, mono + 1);
   206		}
   207	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
