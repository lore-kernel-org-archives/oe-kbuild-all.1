Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80080285061
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756302826; cv=none; b=DuOFLCU6BkO80UPubUG/akWtoKZLiUe2It5JN0wOdXT/5ksCNdl4u/TQRjQsWTqxZnQSMlLdXr/p1iTu2VsRjsPJYeOxxcwggfZFTdOGDAMmqos4wB7YKh9J5trxQZgVK5mFPx8Xe5CqSgLy4rX/IH95lp+VvHQ2G7qZBeMI5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756302826; c=relaxed/simple;
	bh=jOdoUU4E8M0AiMO4M1l8qZRz/Yz+9ABQ59UV6bdjJ1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NXllHJH5bgzM0zPP2rdv4C0zekxH+mMsY8S4xVKkW5Z4+Hkmk/yKBu7IOjHSITQS2TbUju6kEtRgoOGwVnF9H5zJrAqt9+1m+pIX5H93SspO2+Y3/CCR5xa96q5FiJJorDKJe4wIlD4hr5GwYyb4XaYjfQnLs7EttSaZs2HKnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wp6F2TXx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wp6F2TXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756302825; x=1787838825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jOdoUU4E8M0AiMO4M1l8qZRz/Yz+9ABQ59UV6bdjJ1w=;
  b=Wp6F2TXxrljjt5mkKdymEiSAgYFJ6bRL4Rgzz7PB+iXSSv20CgG+LrXg
   v2D+EMHN2D5qeOcE5Sydci28SnVn9m8ont43qpSDq4s5TJjwRaBU3ckzp
   Bx++Ky5l67cDiFsMbydgulcz+jiSGSJE4kK3D4ORsDF1D/++LSwpLj4Nk
   0UKuteHPdNgrFIJASdTTmxC8164TpqBraYdodAyg2ujy0n+52Z6QwCiek
   +Lc5saJsn550FyO5k4TrmhNYTxLADgL6rs5tL3Goy22WMSZnwbPvqKrMQ
   LthnpO1GXWe3Mpdn7HCB359ITPaaIuD8uMTBuK853GxqG07Yi3qUts0YR
   g==;
X-CSE-ConnectionGUID: HDIBxkp3TJSP/dlHGRBJ5A==
X-CSE-MsgGUID: mWPnWwNYRlSp+RAfDvEl2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58472608"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58472608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 06:53:45 -0700
X-CSE-ConnectionGUID: 6oqLc9XJQ6+840f59oHufA==
X-CSE-MsgGUID: 3bZ7M9+PT1uG1DuP2OKqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170014586"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 06:53:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urGaq-000SyF-2x;
	Wed, 27 Aug 2025 13:53:40 +0000
Date: Wed, 27 Aug 2025 21:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 24/24]
 mm/kasan/kasan_test_c.c:48:6: sparse: sparse: symbol 'kasan_ptr_result' was
 not declared. Should it be static?
Message-ID: <202508272122.s3wpVNqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e618ac331b0929e7221e5aadc18783b4b8bc5e2e
commit: a2f11547052001bd448ccec81dd1e68409078fbb [24/24] kasan: rust: Add KASAN smoke test via UAF
config: x86_64-randconfig-r112-20250827 (https://download.01.org/0day-ci/archive/20250827/202508272122.s3wpVNqF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508272122.s3wpVNqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508272122.s3wpVNqF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test_c.c:48:6: sparse: sparse: symbol 'kasan_ptr_result' was not declared. Should it be static?
>> mm/kasan/kasan_test_c.c:49:5: sparse: sparse: symbol 'kasan_int_result' was not declared. Should it be static?

vim +/kasan_ptr_result +48 mm/kasan/kasan_test_c.c

7ce0ea19d50e4e9 mm/kasan/kasan_test.c Andrey Konovalov 2022-09-27  43  
adb72ae1915db28 lib/test_kasan.c      Daniel Axtens    2020-06-03  44  /*
0fd379253691e7b lib/test_kasan.c      Andrey Konovalov 2021-02-24  45   * Some tests use these global variables to store return values from function
0fd379253691e7b lib/test_kasan.c      Andrey Konovalov 2021-02-24  46   * calls that could otherwise be eliminated by the compiler as dead code.
adb72ae1915db28 lib/test_kasan.c      Daniel Axtens    2020-06-03  47   */
adb72ae1915db28 lib/test_kasan.c      Daniel Axtens    2020-06-03 @48  void *kasan_ptr_result;
83c4e7a0363bdb8 lib/test_kasan.c      Patricia Alfonso 2020-10-13 @49  int kasan_int_result;
83c4e7a0363bdb8 lib/test_kasan.c      Patricia Alfonso 2020-10-13  50  

:::::: The code at line 48 was first introduced by commit
:::::: adb72ae1915db28f934e9e02c18bfcea2f3ed3b7 kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
