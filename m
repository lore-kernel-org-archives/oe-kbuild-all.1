Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9BB3016E3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 16:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331687; cv=none; b=Hc2SPgC+IOYnO0FpsVJIFrR/G4aoj29p85NgaoTbu2mqjgzVv8KoeQcT3d/Pc5THd7bJCoSVNS4i4dqWrPrR2Wy7E4+aClPnXaSTKvPUXYGxwGoKb834gQzIgLfEyJ57DirnbfrftXd6nAcy4RNDUGF/UMlGjp/2XgGYxwBH5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331687; c=relaxed/simple;
	bh=LlAVmx3fat2QKCgITMEOFiPNn6ZCMY/LbSoGfABSN6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f76Rh3HCljgtfRlATlSzsk//u2mdvLBjxjii7jYCNAUD9LArjuASRwTGSKbnUZanG2AMEOJlL1wYpYhgNsoH0gL4Me0HC6oF139u0UfHocvXsDnKE1/e+OvVrR24TeEstwDquCuP1cH3kjzitm0SL2/IfjFda8114ZgxdPRj54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K18JPXaJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K18JPXaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780331686; x=1811867686;
  h=date:from:to:cc:subject:message-id;
  bh=LlAVmx3fat2QKCgITMEOFiPNn6ZCMY/LbSoGfABSN6Q=;
  b=K18JPXaJKljn/2s1XA2BmycKueQMrODgO8ablA8kbKCmOYWix1Fvbyc4
   AJ4m1U+lS7t2u2m8/2u7lP3MTqplEGcqwW+ko6Ho/p4NV5RA1NoLdpj2I
   sC75SMDJH2kto8+dVHCSNfJUV9fOr1z2i2Pib3Noe5w2Oo49WtVLP7ijC
   5wNuwDY0/fS5p1xjOXS4RdIB3FbNCdYLbJFSUxdcsl+xrrFfxnS6i1q9z
   oNanQh5ebRTFrovMfipS0pMlMoNkIlq/Kb7FTvkoC7EjThawJLdoaVsRY
   1jxgiO8//CiH+DBIrLf/rdoB/Ufz4L5yXllR0Nfs973NmVYy32JZPUbOD
   A==;
X-CSE-ConnectionGUID: Qsgn0HynS+OVvg9nPyDJxg==
X-CSE-MsgGUID: jcHSRrofRCCSECD5sTwKrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106543558"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="106543558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:34:45 -0700
X-CSE-ConnectionGUID: MoJldCjwQFCSYCc9eShMbA==
X-CSE-MsgGUID: eAV2mwnWShiGPkaKO8K6Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="242573662"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jun 2026 09:34:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5b6-00000000AoV-1o9u;
	Mon, 01 Jun 2026 16:34:40 +0000
Date: Tue, 02 Jun 2026 00:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: avivdaum <aviv.daum@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: fs/fat/fat_test.c:261:9: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202606020036.nW4hUG3I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 4bbf3f58e00f8671eb384c7df6983d803058b204 fat: add KUnit tests for timestamp conversion helpers
date:   10 weeks ago
config: m68k-randconfig-r111-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020036.nW4hUG3I-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020036.nW4hUG3I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4bbf3f58e00f ("fat: add KUnit tests for timestamp conversion helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020036.nW4hUG3I-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fat/fat_test.c:261:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:261:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:261:9: sparse:     got restricted __le16 const __left
   fs/fat/fat_test.c:261:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:261:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:261:9: sparse:     got restricted __le16 const __right
   fs/fat/fat_test.c:265:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:265:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:265:9: sparse:     got restricted __le16 const __left
   fs/fat/fat_test.c:265:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:265:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:265:9: sparse:     got restricted __le16 const __right
   fs/fat/fat_test.c:286:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:286:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:286:9: sparse:     got restricted __le16 const __left
   fs/fat/fat_test.c:286:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:286:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:286:9: sparse:     got restricted __le16 const __right
   fs/fat/fat_test.c:290:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:290:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:290:9: sparse:     got restricted __le16 const __left
   fs/fat/fat_test.c:290:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:290:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:290:9: sparse:     got restricted __le16 const __right

vim +261 fs/fat/fat_test.c

b0d4adaf3b3c44 David Gow 2021-04-15  248  
b0d4adaf3b3c44 David Gow 2021-04-15  249  static void fat_time_unix2fat_test(struct kunit *test)
b0d4adaf3b3c44 David Gow 2021-04-15  250  {
b0d4adaf3b3c44 David Gow 2021-04-15  251  	static struct msdos_sb_info fake_sb;
b0d4adaf3b3c44 David Gow 2021-04-15  252  	__le16 date, time;
b0d4adaf3b3c44 David Gow 2021-04-15  253  	u8 cs;
b0d4adaf3b3c44 David Gow 2021-04-15  254  	struct fat_timestamp_testcase *testcase =
b0d4adaf3b3c44 David Gow 2021-04-15  255  		(struct fat_timestamp_testcase *)test->param_value;
b0d4adaf3b3c44 David Gow 2021-04-15  256  
4bbf3f58e00f86 avivdaum  2026-03-16  257  	fat_test_set_time_offset(&fake_sb, testcase->time_offset);
b0d4adaf3b3c44 David Gow 2021-04-15  258  
b0d4adaf3b3c44 David Gow 2021-04-15  259  	fat_time_unix2fat(&fake_sb, &testcase->ts,
b0d4adaf3b3c44 David Gow 2021-04-15  260  			  &time, &date, &cs);
b0d4adaf3b3c44 David Gow 2021-04-15 @261  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  262  			    testcase->time,
4bbf3f58e00f86 avivdaum  2026-03-16  263  			    time,
b0d4adaf3b3c44 David Gow 2021-04-15  264  			    "Time mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  265  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  266  			    testcase->date,
4bbf3f58e00f86 avivdaum  2026-03-16  267  			    date,
b0d4adaf3b3c44 David Gow 2021-04-15  268  			    "Date mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  269  	KUNIT_EXPECT_EQ_MSG(test,
b0d4adaf3b3c44 David Gow 2021-04-15  270  			    testcase->cs,
b0d4adaf3b3c44 David Gow 2021-04-15  271  			    cs,
b0d4adaf3b3c44 David Gow 2021-04-15  272  			    "Centisecond mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  273  }
b0d4adaf3b3c44 David Gow 2021-04-15  274  

:::::: The code at line 261 was first introduced by commit
:::::: b0d4adaf3b3c4402d9c3b6186e02aa1e4f7985cd fat: Add KUnit tests for checksums and timestamps

:::::: TO: David Gow <davidgow@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
