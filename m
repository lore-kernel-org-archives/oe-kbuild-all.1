Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA6187862
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512131; cv=none; b=U5hqD7cCiWIgCpnhCs1RXyLNo/A9PM5zsYFUEsv9S2qpoUL8dSdF4QyU8krEzRo1+zz/PVTxGxZhqBjFJNFKpqT1lsGJI4scjh6X47BZrbEIUqunZBxA+o/8gF54e+c/WB7LkJP+69piz52KpbyRkFXqGws25GS5Hnlz5ZrUK2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512131; c=relaxed/simple;
	bh=dsI4/d/+ju2x0Qh9x4bO6SS6vNHssA7w3vftgF+HC6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sg1sbmf5t1YldevpGz6D3W6XU2iroMm33gHSfUPEifHigcxMTwUDgi2hsQAKgPPeUDhvXiWb6xIkOsVqBvLAYkfjXDxTZsA8WVrWfffvVb0rqc3JqWG58Qo6whuNXMpXg6u29klCvOhcrTUELQPFygi0wEWeH3AuAC3bMIPWFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FW6q0vH5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FW6q0vH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734512129; x=1766048129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsI4/d/+ju2x0Qh9x4bO6SS6vNHssA7w3vftgF+HC6M=;
  b=FW6q0vH5/I2nFpFSYaxZq6wE2uFBoKwuoMB1HykFXR9PmgKD+L8Md+Ev
   GfX9+8rrM7ouEV2kCB2btXrzgsA5MinhBNDERUmHeUCjG3Fo8T9tLwSLE
   VWTruplLIZ7aiLiYcPxL5GZXWs/qa1RsHLnfrwOYAwUe6es3s3UqLRcyV
   DI1jgj+bxIC0ItTm7WUXm01z7KtuQ0twEjK0/rDIZEjSDGITF3GnJsk2h
   2Qoxau2hisDbfxRuFO2nKBxAQazje/G55MwSQLBM79sMfu3U/HqouNdEm
   zSwKxIYytsX2DTWIMeGacvzvQFWbaSWLMI07LreTcCpaPc6Z51xtYDfIk
   A==;
X-CSE-ConnectionGUID: s8Z7TLimTOq7S0bCVTvIUQ==
X-CSE-MsgGUID: jAGD4500QwuY03JtRlJnmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34867703"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="34867703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:55:28 -0800
X-CSE-ConnectionGUID: H9AfjPhoQ5Oo7WUZJbASUg==
X-CSE-MsgGUID: 2dZC9O3ETlqQ/ywyMzgqfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102797208"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Dec 2024 00:55:26 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNpq0-000GDq-0f;
	Wed, 18 Dec 2024 08:55:24 +0000
Date: Wed, 18 Dec 2024 16:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2588/2588] mm/damon/core-test.h:284:9: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202412181634.jaSfAZYT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6ad884d53c04817627bd02b871dd31359ce2d05c
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [2588/2588] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-122-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181634.jaSfAZYT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181634.jaSfAZYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181634.jaSfAZYT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/damon/core.c: note: in included file (through include/linux/kernel.h, arch/x86/include/asm/percpu.h, arch/x86/include/asm/current.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/damon/core.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, arch/x86/include/asm/percpu.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/damon/core.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/damon/core.c: note: in included file:
>> mm/damon/core-test.h:284:9: sparse: sparse: incompatible types in comparison expression (different signedness):
   mm/damon/core-test.h:284:9: sparse:    unsigned int *
   mm/damon/core-test.h:284:9: sparse:    int *

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
