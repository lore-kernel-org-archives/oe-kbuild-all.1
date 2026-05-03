Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C014F3A875E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777796074; cv=none; b=SZF2RfnNUktED3Y1jqf1L9x74vNQZXa8qzIZwsZ9RiJORI0SI1NWsUwiXUrl3DtBG04k6bmbeBfxarCXgII5fhJyCTf/vsNY1Tdhji7qDDifUNFRgwawLouRaCNPhS7e3lFP6897RIEhhRjV8ahfT6BWG2tUZX1BQkTRMgrOfaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777796074; c=relaxed/simple;
	bh=/tIWxTuyntpMLV2OyFDUnYV59YjDCqB8nwUWJEzPIr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XsKgOHHpZgWeVqmlND0rXxgWwU8dsEuRgTDHMbhBm5MNqkhKESdnuL0P+CiJDqFKjUD8zcfq/aVN+9VQ9lE/FcvtXSElvfKSeI8KUwDPcJvlGQHhGhlod2dg4wZw60bVdwLE1fhaYnRjEezb1Gd2r7aRZaPXbGpP8k1lGwVYSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdUlTjOg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdUlTjOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777796072; x=1809332072;
  h=date:from:to:cc:subject:message-id;
  bh=/tIWxTuyntpMLV2OyFDUnYV59YjDCqB8nwUWJEzPIr8=;
  b=OdUlTjOgDEhaKMqdnaa3ATTptj+eHBRGfcAGQ7qqHT9PkdU+U00F5Tyx
   cEHwC26h8FXi+FWVk/Yagis9UaaHg/P5wzYksdpC9TqiLecVffBb8sVIu
   9hHm2ZkHTDBKrP/5WCI6AyH3c1GLQcis6sHIDZypKEqoXnpoAUyAC3YKQ
   44UOxX4EpYEDgAd0Q3euqhEwWo0CCyUvF6AaSCHrLrD1hzB3+F4uMh45r
   CWG2VVlPB1Adh3NA0ZUJd4DVLpcBknImo1OpDzGy+OS8jlJ7JYedT4LGm
   w7WBuuWFd/TtItcz9rZkzKCHz5x/IlX7j21uh6J2g4aEd1tag+xe/T0yQ
   Q==;
X-CSE-ConnectionGUID: uKRV0CpWRgC68LDYbPlBxw==
X-CSE-MsgGUID: SvzjNQqORzmU15tPma2a+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78886035"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78886035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:14:30 -0700
X-CSE-ConnectionGUID: HE8irxY6RAC9tV/IyssLfg==
X-CSE-MsgGUID: h07NvDe0QOqHHutd92inuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235320372"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2026 01:14:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJRy6-000000002LR-0vwf;
	Sun, 03 May 2026 08:14:26 +0000
Date: Sun, 03 May 2026 16:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/2]
 lib/tests/stacktrace_kunit.c:261:undefined reference to `kunit_log_append'
Message-ID: <202605031607.Mz2p4YL3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   b712a90eff6950d9083a938fb5eabad990fa1cbf
commit: b712a90eff6950d9083a938fb5eabad990fa1cbf [2/2] WIP: lib: add kunit tests for RELIABLE_STACKTRACE
config: x86_64-randconfig-161-20250618 (https://download.01.org/0day-ci/archive/20260503/202605031607.Mz2p4YL3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031607.Mz2p4YL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031607.Mz2p4YL3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_callers_present_reliable':
>> lib/tests/stacktrace_kunit.c:261:(.text+0x3fd): undefined reference to `kunit_log_append'
   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_trace':
>> lib/tests/stacktrace_kunit.c:237:(.text+0x63d): undefined reference to `kunit_fail_assert_format'
>> ld: lib/tests/stacktrace_kunit.c:237:(.text+0x654): undefined reference to `__kunit_do_failed_assertion'
>> ld: lib/tests/stacktrace_kunit.c:242:(.text+0x6fa): undefined reference to `kunit_fail_assert_format'
   ld: lib/tests/stacktrace_kunit.c:242:(.text+0x70e): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `std_expect_empty':
>> lib/tests/stacktrace_kunit.c:204:(.text+0x887): undefined reference to `kunit_binary_assert_format'
   ld: lib/tests/stacktrace_kunit.c:204:(.text+0x8ab): undefined reference to `__kunit_do_failed_assertion'
>> ld: lib/tests/stacktrace_kunit.c:205:(.text+0x961): undefined reference to `kunit_binary_assert_format'
   ld: lib/tests/stacktrace_kunit.c:205:(.text+0x985): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `__do_test_basic':
>> lib/tests/stacktrace_kunit.c:275:(.text+0xaca): undefined reference to `kunit_binary_ptr_assert_format'
   ld: lib/tests/stacktrace_kunit.c:275:(.text+0xaee): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `__do_kprobe_unwind':
   lib/tests/stacktrace_kunit.c:619:(.text+0xf36): undefined reference to `kunit_log_append'
>> ld: lib/tests/stacktrace_kunit.c:625:(.text+0xfee): undefined reference to `kunit_log_append'
   ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit':
>> lib/tests/stacktrace_kunit.c:63:(.text+0x10c3): undefined reference to `kunit_kfree'
   ld: lib/tests/stacktrace_kunit.o: in function `std_dump':
   lib/tests/stacktrace_kunit.c:38:(.text+0x12b9): undefined reference to `kunit_log_append'
   ld: lib/tests/stacktrace_kunit.c:43:(.text+0x13fd): undefined reference to `kunit_log_append'
   ld: lib/tests/stacktrace_kunit.o: in function `__do_test_kprobe':
   lib/tests/stacktrace_kunit.c:644:(.text+0x1531): undefined reference to `kunit_fail_assert_format'
   ld: lib/tests/stacktrace_kunit.c:644:(.text+0x1547): undefined reference to `__kunit_do_failed_assertion'
   ld: lib/tests/stacktrace_kunit.o: in function `__do_test_one_async_kp':
   lib/tests/stacktrace_kunit.c:702:(.text+0x17aa): undefined reference to `kunit_log_append'
   ld: lib/tests/stacktrace_kunit.c:706:(.text+0x181b): undefined reference to `kunit_log_append'
   ld: lib/tests/stacktrace_kunit.o: in function `kunit_kmalloc':
   include/kunit/test.h:501:(.text+0x198a): undefined reference to `kunit_kmalloc_array'


vim +261 lib/tests/stacktrace_kunit.c

    57	
    58	static void std_test_exit(struct kunit *test)
    59	{
    60		if (test->status == KUNIT_FAILURE)
    61			std_dump(test, test->priv);
    62	
  > 63		kunit_kfree(test, test->priv);
    64	}
    65	
    66	static void std_save_stacktrace_reliable(struct stacktrace_test_data *std)
    67	{
    68		std->len = stack_trace_save_tsk_reliable(current,
    69							 std->stack_trace,
    70							 NR_STACKTRACE_ELEMS);
    71		std->hit = true;
    72	}
    73	
    74	typedef void *(*callee_t)(void *arg);
    75	typedef void *(*caller_t)(callee_t callee, void *arg);
    76	
    77	static noinline void *callee_nop(void *arg)
    78	{
    79		/* Inhibit dead code elimination */
    80		return OPTIMIZER_HIDE_EXPR(arg);
    81	}
    82	
    83	static noinline void *callee_unwind_reliable(void *arg)
    84	{
    85		std_save_stacktrace_reliable(current->kunit_test->priv);
    86		return OPTIMIZER_HIDE_EXPR(arg);
    87	}
    88	
    89	static noinline void *callee_tail_nop(void *arg)
    90	{
    91		/* Permit tail call optimization */
    92		return callee_nop(arg);
    93	}
    94	
    95	static noinline void *callee_notail_nop(void *arg)
    96	{
    97		/* Inhibit tail call optimization */
    98		return OPTIMIZER_HIDE_EXPR(callee_nop(arg));
    99	}
   100	
   101	static noinline void *caller_tail_unwind_reliable(void *arg)
   102	{
   103		/* Permit tail call optimization */
   104		return callee_unwind_reliable(arg);
   105	}
   106	
   107	static noinline void *caller_notail_unwind_reliable(void *arg)
   108	{
   109		/* Inhibit tail call optimization */
   110		return OPTIMIZER_HIDE_EXPR(callee_unwind_reliable(arg));
   111	}
   112	
   113	static noinline void *caller_1(callee_t callee, void *arg)
   114	{
   115		/* Inhibit tail call optimization */
   116		return OPTIMIZER_HIDE_EXPR(callee(arg));
   117	}
   118	
   119	static noinline void *caller_2(callee_t callee, void *arg)
   120	{
   121		/* Inhibit tail call optimization */
   122		return OPTIMIZER_HIDE_EXPR(caller_1(callee, arg));
   123	}
   124	
   125	static noinline void *caller_3(callee_t callee, void *arg)
   126	{
   127		/* Inhibit tail call optimization */
   128		return OPTIMIZER_HIDE_EXPR(caller_2(callee, arg));
   129	}
   130	
   131	static int lookup_sym_bounds(void *sym, unsigned long *start,
   132				     unsigned long *end)
   133	{
   134		unsigned long offset, size;
   135	
   136		if (!kallsyms_lookup_size_offset((unsigned long)sym, &size, &offset))
   137			return -ENOENT;
   138	
   139		if (offset) {
   140			WARN_ONCE(1, "%pS has non zero offset: %ld\n", sym, offset);
   141			return -EINVAL;
   142		}
   143	
   144		*start = (unsigned long)sym;
   145		*end = (unsigned long)sym + size;
   146	
   147		return 0;
   148	}
   149	
   150	static int stacktrace_find_sym(struct stacktrace_test_data *std,
   151				       void *sym)
   152	{
   153		unsigned long start, end;
   154		int ret;
   155	
   156		if (std->len < 0)
   157			return std->len;
   158	
   159		ret = lookup_sym_bounds(sym, &start, &end);
   160		if (ret)
   161			return ret;
   162	
   163		for (int i = 0; i < std->len; i++) {
   164			unsigned long pc = std->stack_trace[i];
   165			if (start <= pc && pc < end)
   166				return i;
   167		}
   168	
   169		return -ENOENT;
   170	}
   171	
   172	/*
   173	 * Generate each possible instruction pointer value within a given function.
   174	 */
   175	static inline const void *
   176	__gen_ips_symbol(void *symbol, const void *prev, char *desc)
   177	{
   178		unsigned long cur = (unsigned long)prev;
   179		unsigned long start, end;
   180		int ret;
   181	
   182		ret = lookup_sym_bounds(symbol, &start, &end);
   183		if (WARN_ON_ONCE(ret))
   184			return NULL;
   185	
   186		/*
   187		 * TODO: find the next instruction boundary better.
   188		 */
   189		cur = cur ? cur + 1 : start;
   190		if (cur == end)
   191			cur = 0;
   192	
   193		sprintf(desc, "%pS", (void *)cur);
   194	
   195		return (void *)cur;
   196	}
   197	
   198	typedef void (*std_expect_t)(struct kunit *test,
   199				     struct stacktrace_test_data *std);
   200	
   201	static void std_expect_empty(struct kunit *test,
   202				     struct stacktrace_test_data *std)
   203	{
 > 204		KUNIT_EXPECT_EQ(test, std->hit, false);
 > 205		KUNIT_EXPECT_EQ(test, std->len, 0);
   206	}
   207	
   208	struct stacktrace_test_params {
   209		void **trace;
   210	};
   211	
   212	struct stacktrace_test_params basic_scenario = {
   213		.trace = (void *[]) { caller_1, caller_2, caller_3, NULL },
   214	};
   215	
   216	/*
   217	 * Check that we have recorded the expected callchain.
   218	 *
   219	 * Every function in the expected trace for the scenario must exist in the real
   220	 * trace, and must be ordered as with the expected trace.
   221	 *
   222	 * Other calls may exist in the trace, so we only check that the expected
   223	 * functions exist and are ordered relative to one another, and do not check
   224	 * their absolute positions in the trace, nor do we check their absolute
   225	 * offsets from one another.
   226	 */
   227	static void std_expect_trace(struct kunit *test,
   228				     struct stacktrace_test_data *std,
   229				     void **expected_trace)
   230	{
   231		unsigned int idx_min = 0;
   232	
   233		for (void **trace = expected_trace; *trace != NULL; trace++) {
   234			int idx_caller = stacktrace_find_sym(std, *trace);
   235	
   236			if (idx_caller < 0) {
 > 237				KUNIT_FAIL(test, "Stacktrace misses %ps\n", *trace);
   238				return;
   239			}
   240	
   241			if (idx_caller < idx_min) {
 > 242				KUNIT_FAIL(test, "Stacktrace ordered incorrectly\n");
   243				return;
   244			}
   245	
   246			idx_min = idx_caller + 1;
   247		}
   248	}
   249	
   250	static void std_expect_callers_present(struct kunit *test,
   251					       struct stacktrace_test_data *std)
   252	{
   253	
   254		std_expect_trace(test, std, basic_scenario.trace);
   255	}
   256	
   257	static void std_expect_callers_present_reliable(struct kunit *test,
   258							struct stacktrace_test_data *std)
   259	{
   260		if (std->len < 0) {
 > 261			kunit_info(test, "marked unreliable: %d", std->len);
   262			return;
   263		}
   264	
   265		std_expect_callers_present(test, std);
   266	}
   267	
   268	static void __do_test_basic(struct kunit *test,
   269				    callee_t callee,
   270				    std_expect_t expect)
   271	{
   272		struct stacktrace_test_data *std = test->priv;
   273	
   274		void *ret = caller_3(callee, NULL);
 > 275		KUNIT_EXPECT_PTR_EQ(test, ret, NULL);
   276	
   277		expect(test, std);
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
