Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CBA346FC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 20:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161484; cv=none; b=Q1AeBW4VfhvcUu/x8F/L82a/UejKk7Di9HAoX2+jPQDG7xVy4bkH1+1W1W+Dy496GcDVeWssjO6N9xy9jjYGbBCFV3G10t5IPHqdhXO4RPFKUlXxYj5keE+TeTuKqrOvNOIlPhKG2cQvMKsTBzcbmvSlogNiJXBNNV2hXW54ano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161484; c=relaxed/simple;
	bh=Y9gtb08+Xxvv5sV9mak7Y98YGihHhD6XwinuihZVIZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dtbpxklX1hkA0+Se6k+7Bi+ShJFCwxuz7eYuVJxrhbnQlTud47HV4PpbIE+Xfp9JRG2/dVnyj5/qmYE0OIhKB6sfkglQjGdoFWDb2HlNSuDcXKAOc+kiHxt+AytBYqUD+Nv6wGZl7ZpxMgNjeFkPSNGO8xym7zCEHzBV2UYf4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iurz/JVx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iurz/JVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782161482; x=1813697482;
  h=date:from:to:cc:subject:message-id;
  bh=Y9gtb08+Xxvv5sV9mak7Y98YGihHhD6XwinuihZVIZ4=;
  b=Iurz/JVxqMMsubakUXbATGXHoLDhwtp3UnXPmghcsos3JiYP98NSbrUQ
   pKcGQgsLvN8WE+0UAeYndH8JuXGTasxDm+lB2CCMtMtNU50DF5td+2Qwo
   /xuNOlkSAqDnuUxY9HRL/k6mhLzyyHSPczMInVMNb/AXW8SdnkNJsgOhS
   p8XxZxcZgqbHOreQszxMGA05clVfkEbZ0oiacQk5x2s+fMjcsM6fQpI9s
   YkZYSBtKq+gZUj+2bej84rfjAO5HekLDhaiMHNddr6zl8foMPHNejplPr
   HxNvDOJrCLPPuRZy92U7AgKiazcjB/LelvvjILnGJ2k5gZrRPqY2277pl
   g==;
X-CSE-ConnectionGUID: QLkyICQvTfWZGC6SiAl8dg==
X-CSE-MsgGUID: vx4Z16iZRHGhHS8HRNQoBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="70416875"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="70416875"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 13:51:22 -0700
X-CSE-ConnectionGUID: rIyUhU6QRl6NM+emZGH8uQ==
X-CSE-MsgGUID: T+V0N4gFQaSmKbYvAbY3yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249186908"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2026 13:51:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wblbm-000000001uR-2YXx;
	Mon, 22 Jun 2026 20:51:10 +0000
Date: Tue, 23 Jun 2026 04:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/dovec_consolidate 8/10]
 kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument 3
 (different address spaces)
Message-ID: <202606230414.kVgMx0D2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/dovec_consolidate
head:   2d06753a2610465be86b654f02b69731c330cb01
commit: a6e90775f118adc6a11c4edfd47be3acd4a80e4d [8/10] sysctl: Group proc_handler declarations and document
config: sparc64-randconfig-r134-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230414.kVgMx0D2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230414.kVgMx0D2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230414.kVgMx0D2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:46:9: sparse:     expected void *buf
   kernel/sysctl-test.c:46:9: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:46:9: sparse:     expected void *buf
   kernel/sysctl-test.c:46:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:55:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:55:9: sparse:     expected void *buf
   kernel/sysctl-test.c:55:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:55:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:55:9: sparse:     expected void *buf
   kernel/sysctl-test.c:55:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:92:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:92:9: sparse:     expected void *buf
   kernel/sysctl-test.c:92:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:92:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:92:9: sparse:     expected void *buf
   kernel/sysctl-test.c:92:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:101:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:101:9: sparse:     expected void *buf
   kernel/sysctl-test.c:101:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:101:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:101:9: sparse:     expected void *buf
   kernel/sysctl-test.c:101:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:133:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:133:9: sparse:     expected void *buf
   kernel/sysctl-test.c:133:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:133:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:133:9: sparse:     expected void *buf
   kernel/sysctl-test.c:133:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:137:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:137:9: sparse:     expected void *buf
   kernel/sysctl-test.c:137:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:137:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:137:9: sparse:     expected void *buf
   kernel/sysctl-test.c:137:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:172:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:172:9: sparse:     expected void *buf
   kernel/sysctl-test.c:172:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:172:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:172:9: sparse:     expected void *buf
   kernel/sysctl-test.c:172:9: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl-test.c:201:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:201:9: sparse:     expected void *buf
   kernel/sysctl-test.c:201:9: sparse:     got char [noderef] __user *user_buffer
>> kernel/sysctl-test.c:201:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:201:9: sparse:     expected void *buf
   kernel/sysctl-test.c:201:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:231:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:231:9: sparse:     expected void *buf
   kernel/sysctl-test.c:231:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:231:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:231:9: sparse:     expected void *buf
   kernel/sysctl-test.c:231:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:262:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:262:9: sparse:     expected void *buf
   kernel/sysctl-test.c:262:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:262:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:262:9: sparse:     expected void *buf
   kernel/sysctl-test.c:262:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:292:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:292:9: sparse:     expected void *buf
   kernel/sysctl-test.c:292:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:292:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:292:9: sparse:     expected void *buf
   kernel/sysctl-test.c:292:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:332:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:332:9: sparse:     expected void *buf
   kernel/sysctl-test.c:332:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:332:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:332:9: sparse:     expected void *buf
   kernel/sysctl-test.c:332:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:364:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:364:9: sparse:     expected void *buf
   kernel/sysctl-test.c:364:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:364:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buf @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:364:9: sparse:     expected void *buf
   kernel/sysctl-test.c:364:9: sparse:     got char [noderef] __user *user_buffer

vim +46 kernel/sysctl-test.c

2cb80dbbbaba4f Iurii Zaikin 2019-09-23   11  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   12  /*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   13   * Test that proc_dointvec will not try to use a NULL .data field even when the
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   14   * length is non-zero.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   15   */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   16  static void sysctl_test_api_dointvec_null_tbl_data(struct kunit *test)
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   17  {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   18  	struct ctl_table null_data_table = {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   19  		.procname = "foo",
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   20  		/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   21  		 * Here we are testing that proc_dointvec behaves correctly when
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   22  		 * we give it a NULL .data field. Normally this would point to a
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   23  		 * piece of memory where the value would be stored.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   24  		 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   25  		.data		= NULL,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   26  		.maxlen		= sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   27  		.mode		= 0644,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   28  		.proc_handler	= proc_dointvec,
c06a17fe056b84 Liu Shixin   2022-09-08   29  		.extra1		= SYSCTL_ZERO,
c06a17fe056b84 Liu Shixin   2022-09-08   30  		.extra2         = SYSCTL_ONE_HUNDRED,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   31  	};
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   32  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   33  	 * proc_dointvec expects a buffer in user space, so we allocate one. We
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   34  	 * also need to cast it to __user so sparse doesn't get mad.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   35  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   36  	void __user *buffer = (void __user *)kunit_kzalloc(test, sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   37  							   GFP_USER);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   38  	size_t len;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   39  	loff_t pos;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   40  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   41  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   42  	 * We don't care what the starting length is since proc_dointvec should
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   43  	 * not try to read because .data is NULL.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   44  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   45  	len = 1234;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  @46  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   47  					       KUNIT_PROC_READ, buffer, &len,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   48  					       &pos));
388ca2e024dd5e David Gow    2021-05-13   49  	KUNIT_EXPECT_EQ(test, 0, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   50  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   51  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   52  	 * See above.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   53  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   54  	len = 1234;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   55  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   56  					       KUNIT_PROC_WRITE, buffer, &len,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   57  					       &pos));
388ca2e024dd5e David Gow    2021-05-13   58  	KUNIT_EXPECT_EQ(test, 0, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   59  }
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   60  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   61  /*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   62   * Similar to the previous test, we create a struct ctrl_table that has a .data
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   63   * field that proc_dointvec cannot do anything with; however, this time it is
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   64   * because we tell proc_dointvec that the size is 0.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   65   */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   66  static void sysctl_test_api_dointvec_table_maxlen_unset(struct kunit *test)
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   67  {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   68  	int data = 0;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   69  	struct ctl_table data_maxlen_unset_table = {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   70  		.procname = "foo",
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   71  		.data		= &data,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   72  		/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   73  		 * So .data is no longer NULL, but we tell proc_dointvec its
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   74  		 * length is 0, so it still shouldn't try to use it.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   75  		 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   76  		.maxlen		= 0,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   77  		.mode		= 0644,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   78  		.proc_handler	= proc_dointvec,
c06a17fe056b84 Liu Shixin   2022-09-08   79  		.extra1		= SYSCTL_ZERO,
c06a17fe056b84 Liu Shixin   2022-09-08   80  		.extra2         = SYSCTL_ONE_HUNDRED,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   81  	};
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   82  	void __user *buffer = (void __user *)kunit_kzalloc(test, sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   83  							   GFP_USER);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   84  	size_t len;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   85  	loff_t pos;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   86  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   87  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   88  	 * As before, we don't care what buffer length is because proc_dointvec
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   89  	 * cannot do anything because its internal .data buffer has zero length.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   90  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   91  	len = 1234;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   92  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&data_maxlen_unset_table,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   93  					       KUNIT_PROC_READ, buffer, &len,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   94  					       &pos));
388ca2e024dd5e David Gow    2021-05-13   95  	KUNIT_EXPECT_EQ(test, 0, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   96  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   97  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   98  	 * See previous comment.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23   99  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  100  	len = 1234;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  101  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&data_maxlen_unset_table,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  102  					       KUNIT_PROC_WRITE, buffer, &len,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  103  					       &pos));
388ca2e024dd5e David Gow    2021-05-13  104  	KUNIT_EXPECT_EQ(test, 0, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  105  }
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  106  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  107  /*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  108   * Here we provide a valid struct ctl_table, but we try to read and write from
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  109   * it using a buffer of zero length, so it should still fail in a similar way as
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  110   * before.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  111   */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  112  static void sysctl_test_api_dointvec_table_len_is_zero(struct kunit *test)
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  113  {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  114  	int data = 0;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  115  	/* Good table. */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  116  	struct ctl_table table = {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  117  		.procname = "foo",
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  118  		.data		= &data,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  119  		.maxlen		= sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  120  		.mode		= 0644,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  121  		.proc_handler	= proc_dointvec,
c06a17fe056b84 Liu Shixin   2022-09-08  122  		.extra1		= SYSCTL_ZERO,
c06a17fe056b84 Liu Shixin   2022-09-08  123  		.extra2         = SYSCTL_ONE_HUNDRED,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  124  	};
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  125  	void __user *buffer = (void __user *)kunit_kzalloc(test, sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  126  							   GFP_USER);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  127  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  128  	 * However, now our read/write buffer has zero length.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  129  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  130  	size_t len = 0;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  131  	loff_t pos;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  132  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  133  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_READ, buffer,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  134  					       &len, &pos));
388ca2e024dd5e David Gow    2021-05-13  135  	KUNIT_EXPECT_EQ(test, 0, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  136  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23 @137  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_WRITE, buffer,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  138  					       &len, &pos));
388ca2e024dd5e David Gow    2021-05-13  139  	KUNIT_EXPECT_EQ(test, 0, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  140  }
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  141  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  142  /*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  143   * Test that proc_dointvec refuses to read when the file position is non-zero.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  144   */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  145  static void sysctl_test_api_dointvec_table_read_but_position_set(
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  146  		struct kunit *test)
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  147  {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  148  	int data = 0;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  149  	/* Good table. */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  150  	struct ctl_table table = {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  151  		.procname = "foo",
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  152  		.data		= &data,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  153  		.maxlen		= sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  154  		.mode		= 0644,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  155  		.proc_handler	= proc_dointvec,
c06a17fe056b84 Liu Shixin   2022-09-08  156  		.extra1		= SYSCTL_ZERO,
c06a17fe056b84 Liu Shixin   2022-09-08  157  		.extra2         = SYSCTL_ONE_HUNDRED,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  158  	};
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  159  	void __user *buffer = (void __user *)kunit_kzalloc(test, sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  160  							   GFP_USER);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  161  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  162  	 * We don't care about our buffer length because we start off with a
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  163  	 * non-zero file position.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  164  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  165  	size_t len = 1234;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  166  	/*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  167  	 * proc_dointvec should refuse to read into the buffer since the file
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  168  	 * pos is non-zero.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  169  	 */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  170  	loff_t pos = 1;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  171  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  172  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_READ, buffer,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  173  					       &len, &pos));
388ca2e024dd5e David Gow    2021-05-13  174  	KUNIT_EXPECT_EQ(test, 0, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  175  }
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  176  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  177  /*
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  178   * Test that we can read a two digit number in a sufficiently size buffer.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  179   * Nothing fancy.
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  180   */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  181  static void sysctl_test_dointvec_read_happy_single_positive(struct kunit *test)
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  182  {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  183  	int data = 0;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  184  	/* Good table. */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  185  	struct ctl_table table = {
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  186  		.procname = "foo",
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  187  		.data		= &data,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  188  		.maxlen		= sizeof(int),
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  189  		.mode		= 0644,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  190  		.proc_handler	= proc_dointvec,
c06a17fe056b84 Liu Shixin   2022-09-08  191  		.extra1		= SYSCTL_ZERO,
c06a17fe056b84 Liu Shixin   2022-09-08  192  		.extra2         = SYSCTL_ONE_HUNDRED,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  193  	};
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  194  	size_t len = 4;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  195  	loff_t pos = 0;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  196  	char *buffer = kunit_kzalloc(test, len, GFP_USER);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  197  	char __user *user_buffer = (char __user *)buffer;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  198  	/* Store 13 in the data field. */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  199  	*((int *)table.data) = 13;
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  200  
2cb80dbbbaba4f Iurii Zaikin 2019-09-23 @201  	KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_READ,
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  202  					       user_buffer, &len, &pos));
388ca2e024dd5e David Gow    2021-05-13  203  	KUNIT_ASSERT_EQ(test, 3, len);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  204  	buffer[len] = '\0';
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  205  	/* And we read 13 back out. */
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  206  	KUNIT_EXPECT_STREQ(test, "13\n", buffer);
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  207  }
2cb80dbbbaba4f Iurii Zaikin 2019-09-23  208  

:::::: The code at line 46 was first introduced by commit
:::::: 2cb80dbbbaba4f2f86f686c34cb79ea5cbfb0edb kernel/sysctl-test: Add null pointer test for sysctl.c:proc_dointvec()

:::::: TO: Iurii Zaikin <yzaikin@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
