Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1670FBF0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707453197; cv=none; b=stmj1Xs2GO7aUfdR4172c0SSO0rGJf9otOdvj4MZhT6pIhbaN+tpTiRAn8UzMwLGi4U60p8y5G0VaNiEiFZazb5O0aFCHdLMZIhwuOb/5EpsYBEcZxcGofstjk6Km5Zp2Yk/CZkE5aSrGJ+RoN5YFIyVdPDWgAUXD7g2RpIbT30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707453197; c=relaxed/simple;
	bh=o4J1Atsy8r5g+zme6VScE3+94q9O9SRw/BPlvtFWL1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k7tYQlD1PW0XCenDACLReObolQtZ2fWudE1g0qtjjnimU3A2WO3ETLxdTtKiZ/zMMUOXduOhjwp1PS73tfD1iwi+neVpZqpz//JLnkWa5qMNt2HjyMuDI+Lh5qlsioA2SMA1luC942TtB4vS+qZ0aVkZGBB+haF8b/HNoLqtQXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFDhS0+N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFDhS0+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707453195; x=1738989195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4J1Atsy8r5g+zme6VScE3+94q9O9SRw/BPlvtFWL1c=;
  b=XFDhS0+NuSyuQi5Dq7+rX2IcygX1l09PKR+elVRCTPGfTvofGOKv5jtT
   i8hBLRpzP4dmsC3NUMpq4jiZnQU2ZgE8J3De/taCRxITHkPRajVhETZD8
   VUHNaJ4DRCOLdBagp5H/o6fRMs8WkaW4tz6GIRWqSSPgd3WGb8Hyv8bQ+
   PekG+BPuGfrsRPlThqbKZN9F/wbqCjRPAi8x4zWdMa8/ABXkQPWJI/7Ie
   gdSDsgLrtB48inVT7VjZQqr1E33gxKez6lzmqelMvKB2plU22SeLlK/68
   g4knL1Ovb2/h0yuFj11H56KLDJg4FA6h7U9RUHSCdVrSJC+G7yhgn1j0a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1254143"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1254143"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 20:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6503739"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2024 20:33:13 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYIZa-0004OC-2r;
	Fri, 09 Feb 2024 04:33:10 +0000
Date: Fri, 9 Feb 2024 12:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/signed-sanitizer 26/27] lib/test_ubsan.c:62:16:
 sparse: sparse: cast truncates bits from constant value (7fffffffffffffff
 becomes ffffffff)
Message-ID: <202402091220.ApBO5EdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/signed-sanitizer
head:   fdc16607cd55a37f5d4924c47f1642047c4ea1e1
commit: 3a9f6e016a76d7c3535f9d410dbae01561bb4916 [26/27] [WIP] Enable -fsanitize=implicit-signed-integer-truncation
config: powerpc64-randconfig-r113-20240208 (https://download.01.org/0day-ci/archive/20240209/202402091220.ApBO5EdE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402091220.ApBO5EdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091220.ApBO5EdE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_ubsan.c:62:16: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
   lib/test_ubsan.c:72:18: sparse: sparse: shift count is negative (-1)

vim +62 lib/test_ubsan.c

    55	
    56	static void test_ubsan_truncate_signed(void)
    57	{
    58		volatile long val = LONG_MAX;
    59		volatile int val2 = 0;
    60	
    61		UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
  > 62		val2 = val;
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
