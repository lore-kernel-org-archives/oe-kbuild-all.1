Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA63D170E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741040; cv=none; b=YDqujpZyxvElUm2ZjybEWO38qFzqBk8eGQNod7ueAtL5KM2keRxjUoruixZXo4CErUQbPAuXaXyMm2YHi8VpyhkSF1L2OOSZR/dtgnoDT00ORUbp5Z72+tVO0gGzb87dXkj7X5mQWQHx2l2qYhHick8wwT3QijBAC33IdKtg3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741040; c=relaxed/simple;
	bh=zJc4YtJVQf6/RXz/HYpPLEge+htojzjl9fdIlelabsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oSOj32XlxToEHVW5Y7fu8MvModZ+sNQO4Tsy/JHvEFm8hezMKCi60D1mYdKkqWq5pxxarpf0aJDPMIJBkJClcDP8s6ddgDKPtbr2w/jkyQ5IT1ybTDsqTtXBvkqITdoo4AqD4oZdzMo3lO5cGRJqA4XR87+JZdt7BU0UEwUC6UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I82ltK6d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I82ltK6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778741039; x=1810277039;
  h=date:from:to:cc:subject:message-id;
  bh=zJc4YtJVQf6/RXz/HYpPLEge+htojzjl9fdIlelabsc=;
  b=I82ltK6dh5a7JcnehY5vdg+r1JLpe/lwOzbyAY3AEIwfAqKPyrvAiasn
   zo5wcbenpDxpQDbou4s3+qVtBGRZbeJuoEeO4205dysgz9XTFy5IWZIbP
   TYzx4ack5hQvW4zjM3Lg6LN2tYpRHXzUOteO2oN0XTzRwR2ICVjqiZU1Y
   04ZDagGkUOiRHNqdRtR/zyi3+1ltXNsEq/hD4mRzltv7fdwMv+cAXPYEF
   YLNB+HwDUf3z0TllcIsUP9YAQXFRaSrfIK3V2YqNLEqO2i57FY1bGsX0u
   3RGvYhPExnGyftUZazKA9rpV8z+eY+I2+dmHXeMroDIquohXsh7GXSdla
   g==;
X-CSE-ConnectionGUID: ourpf39gTUKdq3biFviIEg==
X-CSE-MsgGUID: PDDJV9xORDaYvXamoXNHVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97105371"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="97105371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 23:43:58 -0700
X-CSE-ConnectionGUID: L3XOGL/eSK27Ds3jawTcCQ==
X-CSE-MsgGUID: mGcdBl98RXiA7xNbNnDUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="231905045"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2026 23:43:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNPnU-000000008lZ-1hLp;
	Thu, 14 May 2026 06:43:52 +0000
Date: Thu, 14 May 2026 08:43:01 +0200
From: kernel test robot <lkp@intel.com>
To: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: lib/tests/string_kunit.c:1014:25: error:
 'string_bench_memcmp' undeclared here (not in a function); did you mean
 'string_test_memcmp'?
Message-ID: <202605140815.XCfr5fd8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Milan-Tripkovic/lib-string_kunit-extend-benchmarks-and-unit-test-to-memcmp/20260514-061117
head:   63994c99c1cec63db18bebab3030f0c0e9d43ea5
commit: 63994c99c1cec63db18bebab3030f0c0e9d43ea5 lib/string_kunit: extend benchmarks and unit test to memcmp()
date:   8 hours ago
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260514/202605140815.XCfr5fd8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140815.XCfr5fd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140815.XCfr5fd8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/tests/string_kunit.c:8:
>> lib/tests/string_kunit.c:1014:25: error: 'string_bench_memcmp' undeclared here (not in a function); did you mean 'string_test_memcmp'?
    1014 |         KUNIT_CASE_SLOW(string_bench_memcmp),
         |                         ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:188:31: note: in definition of macro 'KUNIT_CASE_SLOW'
     188 |                 { .run_case = test_name, .name = #test_name,    \
         |                               ^~~~~~~~~


vim +1014 lib/tests/string_kunit.c

   983	
   984	static struct kunit_case string_test_cases[] = {
   985		KUNIT_CASE(string_test_memset16),
   986		KUNIT_CASE(string_test_memset32),
   987		KUNIT_CASE(string_test_memset64),
   988		KUNIT_CASE(string_test_strlen),
   989		KUNIT_CASE(string_test_strnlen),
   990		KUNIT_CASE(string_test_strchr),
   991		KUNIT_CASE(string_test_strnchr),
   992		KUNIT_CASE(string_test_strrchr),
   993		KUNIT_CASE(string_test_strspn),
   994		KUNIT_CASE(string_test_strcmp),
   995		KUNIT_CASE(string_test_strcmp_long_strings),
   996		KUNIT_CASE(string_test_strncmp),
   997		KUNIT_CASE(string_test_strncmp_long_strings),
   998		KUNIT_CASE(string_test_strcasecmp),
   999		KUNIT_CASE(string_test_strcasecmp_long_strings),
  1000		KUNIT_CASE(string_test_strncasecmp),
  1001		KUNIT_CASE(string_test_strncasecmp_long_strings),
  1002		KUNIT_CASE(string_test_strscpy),
  1003		KUNIT_CASE(string_test_strcat),
  1004		KUNIT_CASE(string_test_strncat),
  1005		KUNIT_CASE(string_test_strlcat),
  1006		KUNIT_CASE(string_test_strtomem),
  1007		KUNIT_CASE(string_test_memtostr),
  1008		KUNIT_CASE(string_test_strends),
  1009		KUNIT_CASE(string_bench_strlen),
  1010		KUNIT_CASE(string_bench_strnlen),
  1011		KUNIT_CASE(string_bench_strchr),
  1012		KUNIT_CASE(string_bench_strrchr),
  1013		KUNIT_CASE(string_test_memcmp),
> 1014		KUNIT_CASE_SLOW(string_bench_memcmp),
  1015		{}
  1016	};
  1017	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
