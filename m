Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D5139B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 00:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753834228; cv=none; b=gin2fhcPsMwac466U6K1LoM+toGxMu0rFJy3NsJ3cZUJzIGsllszr8WWXfMROJqPFNEcT/0I3D8slTMBH3hy/5csF7v20NNqjL1MSY7cNa28oFzZt7qK68ZLPVAAHs5S0abeRzYRuDNphyBWXA+06WuudAEpax+NCYUWMmoZpgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753834228; c=relaxed/simple;
	bh=GTaPwA9wagdhTS48BModWNyCDRPozUbooe+JufCy/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8CiCZarxRnaTCMAxaS92azjhgMWr5h43sR0CHRGCgPBTyJZU6hEcHJGS2bYgo17IjXy4m3iCCJPVE5MFOYTj/CZyoLSNOH32d1rJ5RkYB51Q4A69DCYKKCYr+770ar+x5gv9TV7srIybvUSrBkTWMNV5fsmctylx/onN5M7owE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHNRxLzD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHNRxLzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753834227; x=1785370227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTaPwA9wagdhTS48BModWNyCDRPozUbooe+JufCy/W8=;
  b=QHNRxLzDNFjZ02/1C+l2EXsrT9THYJH49XcsmYbm38g5NMQkHPkzYXo3
   TenmvW3YwpDMv2SNERGlkHd9x6NOH5XtPO7cZMCz4xYy+B6T+S+aPX6vu
   LzfinEa4A6IuhaidegZIXNZcgmC4Plpf9ly3R/J76cAEBWl+212p/m0PD
   aIjxOOmmSYvnCBfZxbK5jVPADje+NHYmVKlY5ut9mqQGotfuKTg/+Drig
   x2271SdOCC+ov4yscCNk36NM/epk2i4qlMbf11kFKXcKovXSOsT3a5Zrt
   a4hcZNFrt6PbfYxQRQFyv3gCuiTkov4cgmoliHlXZq5HgoN+8lzeQiZIW
   A==;
X-CSE-ConnectionGUID: I5vvd4kNTn2iXss3hRnPLQ==
X-CSE-MsgGUID: mb1BFI6YS7icCvjWelp4ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66691734"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66691734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 17:10:26 -0700
X-CSE-ConnectionGUID: BoIn8uMjRdGarMwV4BE7Zg==
X-CSE-MsgGUID: 6SnoIdZwS9C7atbIyaKKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193688343"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2025 17:10:24 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uguOk-0001mh-2D;
	Wed, 30 Jul 2025 00:10:22 +0000
Date: Wed, 30 Jul 2025 08:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3079/3079] mm/damon/core-test.h:284:9: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202507300823.a0jPwXWY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   725aa34ac7c0468d85710181998ddcdd873b5f74
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [3079/3079] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-122-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300823.a0jPwXWY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300823.a0jPwXWY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300823.a0jPwXWY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/damon/core.c: note: in included file (through include/linux/kernel.h, arch/x86/include/asm/percpu.h, arch/x86/include/asm/current.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/damon/core.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, arch/x86/include/asm/percpu.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   mm/damon/core.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
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
