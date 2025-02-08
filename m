Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229CC19995E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739028135; cv=none; b=niH6DQYkX7o0rH6bcml+64jLVWeXTvMOGOjk8vkaUxMQO4QXTx5gUkk92tTp+92ZVMqA3wOwVjvI0AHMcpbrSv8q5aELoKDLWzvS9MBuVy2+znZGlRiZQ6CmYrLS5P2KWXN38YpbByWjHAj235rqT4ZfkFqHJKGgWEV0tloLHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739028135; c=relaxed/simple;
	bh=ryYRbgy52vofkGjP6MY5Iqwdl2s7CuRK2ydWnQQwDg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=olYyNCZSANyvnU33ku1wvP0dbJJvOMcGAPnWRIUeu+Ixllq7FZoj6xGTHJzip62glvmSDVqAXIYMgR7wBVTOfz9jp/HEAEIQ4R+wP0bxLlYrXFVrjTfCKeALkATlC2eEnWS1aOyxk4UpQ2klIrSx/tuyVBufzSrMnL0pKvvbJcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSVWeCvw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSVWeCvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739028133; x=1770564133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryYRbgy52vofkGjP6MY5Iqwdl2s7CuRK2ydWnQQwDg0=;
  b=iSVWeCvw1rJsAtR4nOs0+fXLXfZcaBPioce3u721XPDPzMtBpHb2HkUa
   ZCqgiX8Pyeaq2ah1GmNE2vt0QELm5X7ZKPTeFolhPmJ6xKpYmh9PwJtfX
   Jc7a30L3bEzsJUKm9eINVViMRIsxUpMR6A7JkmObVx+MMVKYTxUKh8pnQ
   vCmpQHl3Q/PbSIXb4AL3Mv01T4MMwZOYk2abB5jcFD+T+VuxFWpVBFKpZ
   nHO6lFgp0jdGl0bm+WDJ8NVTMr6wXnshwGr/WRUrs3nqmritpMLMHsAfN
   tfW0J4UYLxAuh9AHuvlleDGMMxRJWSAR/35uL5duRvsY35MXDSxe19KDL
   Q==;
X-CSE-ConnectionGUID: BV2NKnd0QiGua/bU2Ana7Q==
X-CSE-MsgGUID: YXYSql7DT8eoi3OSetbP3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50641846"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50641846"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:22:13 -0800
X-CSE-ConnectionGUID: AXjYFCoJSIyOZYxelNLZtg==
X-CSE-MsgGUID: 9VaB1iIITcGLq4Hfx6arKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="142654541"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Feb 2025 07:22:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmen-0010AZ-0q;
	Sat, 08 Feb 2025 15:22:09 +0000
Date: Sat, 8 Feb 2025 23:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2729/2729] mm/damon/core-test.h:284:2: warning:
 comparison of distinct pointer types ('typeof (__left) *' (aka 'unsigned int
 *') and 'typeof (__right) *' (aka 'int *'))
Message-ID: <202502082340.S6mQ2xsd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi SeongJae,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   263072f655dcd6fd63f7d5dd1f9c5553134982fa
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [2729/2729] mm/damon/core-test: test damon_set_regions
config: x86_64-buildonly-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082340.S6mQ2xsd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082340.S6mQ2xsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082340.S6mQ2xsd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/damon/core.c:13:
   In file included from include/linux/mm.h:1573:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/damon/core.c:1248:
>> mm/damon/core-test.h:284:2: warning: comparison of distinct pointer types ('typeof (__left) *' (aka 'unsigned int *') and 'typeof (__right) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     284 |         KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 3);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1234:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1234 |         KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:871:2: note: expanded from macro 'KUNIT_BINARY_EQ_ASSERTION'
     871 |         KUNIT_BINARY_EQ_MSG_ASSERTION(test,                                    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     872 |                                       assert_type,                             \
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     873 |                                       left,                                    \
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     874 |                                       right,                                   \
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     875 |                                       NULL)
         |                                       ~~~~~
   include/kunit/test.h:861:2: note: expanded from macro 'KUNIT_BINARY_EQ_MSG_ASSERTION'
     861 |         KUNIT_BASE_EQ_MSG_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     862 |                                     kunit_binary_assert,                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     863 |                                     KUNIT_INIT_BINARY_ASSERT_STRUCT,           \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     864 |                                     assert_type,                               \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     865 |                                     left,                                      \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     866 |                                     right,                                     \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     867 |                                     fmt,                                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     868 |                                     ##__VA_ARGS__)
         |                                     ~~~~~~~~~~~~~~
   include/kunit/test.h:772:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG_ASSERTION'
     772 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     773 |                                     assert_class,                              \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     774 |                                     ASSERT_CLASS_INIT,                         \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     775 |                                     assert_type,                               \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     776 |                                     left, ==, right,                           \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     777 |                                     fmt,                                       \
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     778 |                                     ##__VA_ARGS__)
         |                                     ~~~~~~~~~~~~~~
   include/kunit/test.h:748:9: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     748 |         ((void)__typecheck(__left, __right));                                  \
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.


vim +284 mm/damon/core-test.h

   269	
   270	static void damon_test_set_regions(struct kunit *test)
   271	{
   272		struct damon_target *t = damon_new_target();
   273		struct damon_region *r1 = damon_new_region(4, 16);
   274		struct damon_region *r2 = damon_new_region(24, 32);
   275		struct damon_addr_range range = {.start = 8, .end = 28};
   276		unsigned long expects[] = {8, 16, 16, 24, 24, 28};
   277		int expect_idx = 0;
   278		struct damon_region *r;
   279	
   280		damon_add_region(r1, t);
   281		damon_add_region(r2, t);
   282		damon_set_regions(t, &range, 1);
   283	
 > 284		KUNIT_EXPECT_EQ(test, damon_nr_regions(t), 3);
   285		damon_for_each_region(r, t) {
   286			KUNIT_EXPECT_EQ(test, r->ar.start, expects[expect_idx++]);
   287			KUNIT_EXPECT_EQ(test, r->ar.end, expects[expect_idx++]);
   288		}
   289		damon_destroy_target(t);
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
