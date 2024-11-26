Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD01D90A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732640005; cv=none; b=DLUFbVLpZ42DsCTzul0mXa0yjRSElQqQ3NNmSBxzfSryAprt5qudSrgcGePmBz6KZwd9gi5GTozRf9hzQE5I1fk8EOcLisEUVQsiFPnfZktUj44iJ0bit/2z1z4xNKDwNi58ckWBZ3JR94FZoeF/D0yQ0CMk2hOVK9Hhv2Svtdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732640005; c=relaxed/simple;
	bh=RCytURu9pau/Q2cZgHajaZCMDOuD85nU5BI+kzK5Kjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPj5f6pDeThICPssV10H2mgdohS15hrucbTSJ5RxTOscrtehUWlAmiI9vSSd+jt7U3rGJHDP2ppYFLGMHtQkAXFoOIVFTBzdeedczlawQrzLmYMxaJuqcDbdpnRQkAzR+Djlp3xjmJCJvBMG6zbACPB9uda02sF/GPMGD0kdiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZkEDC9e; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZkEDC9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732640003; x=1764176003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCytURu9pau/Q2cZgHajaZCMDOuD85nU5BI+kzK5Kjw=;
  b=NZkEDC9eJWdvx5Vh52LhReGcBPPj5knoRZB26RM9FaoXtlWifZRNL3J4
   A/r9DX9Mob1+LC702IPFmTBoktZqZe3BpJRBI4ROHm91arC+v9MlWofuD
   Ify6LTaJzTxUVxLygfri/2npX7wdtiNNtDKSQ8NtKRhlDsVkKPxe4kBNa
   oAOaVacf78a4lDQAoos8nf9/6VmZLfsbpdIuZnxdB1PxbVHJy0ndBdgoE
   CQQw4nGUhHaA2kMmj3tX4qmSR4WtxHzU6LxS2ya51zmIU/2jm1vuXqbz3
   IE07/dRD0SeFA/jUNmxzHv7kYDH9wA8RK0eSR/rl7ny55zngE1WCLwHj8
   A==;
X-CSE-ConnectionGUID: T3EjAXyKRcKCvM9qJhamQA==
X-CSE-MsgGUID: oy0tJLWGSl6B89vNibxWrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50218662"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="50218662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 08:53:21 -0800
X-CSE-ConnectionGUID: XaYXjiLhQO+8isRzws2Dbw==
X-CSE-MsgGUID: 7owDwxewSoG7EIl1YXulUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96726536"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 08:53:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFyoP-0007QJ-1T;
	Tue, 26 Nov 2024 16:53:17 +0000
Date: Wed, 27 Nov 2024 00:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2470/2470] mm/damon/core-test.h:284:9: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202411270328.nVqotnND-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b72e8e3239b08473e630c6c751eb719791d2f843
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [2470/2470] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-121-20241123 (https://download.01.org/0day-ci/archive/20241127/202411270328.nVqotnND-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270328.nVqotnND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270328.nVqotnND-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
