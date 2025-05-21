Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B171E489
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 22:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868307; cv=none; b=H4IwSA8tt5NMkNHc/LJpttFquOpGlnRgMggvtsM/XAvM0O1kP82LtMeoNiXQYdZciP57PZQc1B51Qbq8fsykJC7/djo9wQrVzb0lBWKK9EETfrWUUJUVQtYQizOisQ+MTdnaBwYiSM8NN+oyp5WIrCvzgEZ8ZCPoymUcgNa2Qb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868307; c=relaxed/simple;
	bh=38Rwix4Y08Z6Gx6nPGd6clMZbkChUk95Lls1u1oV+Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jWp8zlHllcqFgyDCQWRklh8Oj+P16QaqJvOYb4ahNxUW6xcwwZRtcc1mLiSbyGlhbypPgWLN9S322T/NWcUqetl4C/E5l4+qfRcNIDO5aM1fo8eh0oB0jhUJqTFcV3i/42ywgEeEC/zg9rO/ewv0Ymb/veBb+ZiNAm+pMvEiFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwfrvMdC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwfrvMdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747868306; x=1779404306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=38Rwix4Y08Z6Gx6nPGd6clMZbkChUk95Lls1u1oV+Qc=;
  b=TwfrvMdCfoJy2dwlfbcEYYvChe0XgT0fZ9Yuv5db6pgk/uR5ltBF5KkJ
   pbT4iyi/PU+ZLVl0xC4jbCRWsVVfAtvVppeGr+Un9YFwTiAPAk3NbS7td
   bc9gjw3ei6A30M2h/d0mv/5i1heF4gAEnnwlburp06iDw6+Ex8et15xLu
   9Sk2xXCJUI6tsYKySxInJDK9Qgasq147Xrr2Fz6FyfPLWDF/6X/ecZaPD
   No4DXLwsRguL7dK1Iti1wnSnJLPV93D9tIZSSYRQeXkOow/hzu/XGZ6vz
   Z0PxmglqtSQVB/J5e8JQD5CI3Gt/2XzNBiX81eiejQ5rTNxsmPIx/XAPO
   Q==;
X-CSE-ConnectionGUID: +/9jBG3sSzuGb92ORcO2CA==
X-CSE-MsgGUID: inJPKVPKRnaZet5O7k3niQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49792212"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49792212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:58:25 -0700
X-CSE-ConnectionGUID: Iyn11XBCSG2wjKMxEGh4nA==
X-CSE-MsgGUID: QCe+YnkATE6nrKJsq6Fb7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140716646"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 May 2025 15:58:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHsOE-000Oi0-1F;
	Wed, 21 May 2025 22:58:22 +0000
Date: Thu, 22 May 2025 06:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/4]
 lib/tests/stacktrace_kunit.c:259:undefined reference to
 `__kunit_do_failed_assertion'
Message-ID: <202505220636.cdUrxYFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   c734aedb3ed9454b32144052f3bd3af91a8a3942
commit: fe72213446c2f40e11ceef009780df565eef74c3 [2/4] WIP: lib: add basic stacktrace tests
config: parisc-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220636.cdUrxYFg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220636.cdUrxYFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220636.cdUrxYFg-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `__do_test_basic':
>> lib/tests/stacktrace_kunit.c:259:(.text+0x23c): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_empty':
   lib/tests/stacktrace_kunit.c:188:(.text+0x594): undefined reference to `__kunit_do_failed_assertion'
>> hppa-linux-ld: lib/tests/stacktrace_kunit.c:189:(.text+0x604): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_trace':
   lib/tests/stacktrace_kunit.c:221:(.text+0x744): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.c:226:(.text+0x804): undefined reference to `__kunit_do_failed_assertion'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_callers_present_reliable':
>> lib/tests/stacktrace_kunit.c:245:(.text+0x8b4): undefined reference to `kunit_log_append'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit':
>> lib/tests/stacktrace_kunit.c:47:(.text+0xb00): undefined reference to `kunit_kfree'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_dump':
   lib/tests/stacktrace_kunit.c:22:(.text+0xb98): undefined reference to `kunit_log_append'
>> hppa-linux-ld: lib/tests/stacktrace_kunit.c:27:(.text+0xbd8): undefined reference to `kunit_log_append'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `kunit_kmalloc':
>> include/kunit/test.h:449:(.text+0xc2c): undefined reference to `kunit_kmalloc_array'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC1':
>> stacktrace_kunit.c:(.rodata.cst4+0x0): undefined reference to `kunit_binary_ptr_assert_format'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC42':
>> stacktrace_kunit.c:(.rodata.cst4+0x4c): undefined reference to `kunit_binary_assert_format'
   hppa-linux-ld: lib/tests/stacktrace_kunit.o: in function `.LC51':
>> stacktrace_kunit.c:(.rodata.cst4+0x50): undefined reference to `kunit_fail_assert_format'


vim +259 lib/tests/stacktrace_kunit.c

   181	
   182	typedef void (*std_expect_t)(struct kunit *test,
   183				     struct stacktrace_test_data *std);
   184	
   185	static void std_expect_empty(struct kunit *test,
   186				     struct stacktrace_test_data *std)
   187	{
   188		KUNIT_EXPECT_EQ(test, std->hit, false);
 > 189		KUNIT_EXPECT_EQ(test, std->len, 0);
   190	}
   191	
   192	struct stacktrace_test_params {
   193		void **trace;
   194	};
   195	
   196	struct stacktrace_test_params basic_scenario = {
   197		.trace = (void *[]) { caller_1, caller_2, caller_3, NULL },
   198	};
   199	
   200	/*
   201	 * Check that we have recorded the expected callchain.
   202	 *
   203	 * Every function in the expected trace for the scenario must exist in the real
   204	 * trace, and must be ordered as with the expected trace.
   205	 *
   206	 * Other calls may exist in the trace, so we only check that the expected
   207	 * functions exist and are ordered relative to one another, and do not check
   208	 * their absolute positions in the trace, nor do we check their absolute
   209	 * offsets from one another.
   210	 */
   211	static void std_expect_trace(struct kunit *test,
   212				     struct stacktrace_test_data *std,
   213				     void **expected_trace)
   214	{
   215		unsigned int idx_min = 0;
   216	
   217		for (void **trace = expected_trace; *trace != NULL; trace++) {
   218			int idx_caller = stacktrace_find_sym(std, *trace);
   219	
   220			if (idx_caller < 0) {
   221				KUNIT_FAIL(test, "Stacktrace misses %ps\n", *trace);
   222				return;
   223			}
   224	
   225			if (idx_caller < idx_min) {
   226				KUNIT_FAIL(test, "Stacktrace ordered incorrectly\n");
   227				return;
   228			}
   229	
   230			idx_min = idx_caller + 1;
   231		}
   232	}
   233	
   234	static void std_expect_callers_present(struct kunit *test,
   235					       struct stacktrace_test_data *std)
   236	{
   237	
   238		std_expect_trace(test, std, basic_scenario.trace);
   239	}
   240	
   241	static void std_expect_callers_present_reliable(struct kunit *test,
   242							struct stacktrace_test_data *std)
   243	{
   244		if (std->len < 0) {
 > 245			kunit_info(test, "marked unreliable: %d", std->len);
   246			return;
   247		}
   248	
   249		std_expect_callers_present(test, std);
   250	}
   251	
   252	static void __do_test_basic(struct kunit *test,
   253				    callee_t callee,
   254				    std_expect_t expect)
   255	{
   256		struct stacktrace_test_data *std = test->priv;
   257	
   258		void *ret = caller_3(callee, NULL);
 > 259		KUNIT_EXPECT_PTR_EQ(test, ret, NULL);
   260	
   261		expect(test, std);
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
