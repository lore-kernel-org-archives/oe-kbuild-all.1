Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AAA2F5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744457649; cv=none; b=EoiJVCzzzJIj35DoRyefmaiw8rxdR+9Oz2v2LSAhIGzlAO15yMrtXUIUSN6nwuwcOY+0CUrMa2a6lYvMlcjlteqUaHv87yMnpLrP1OzN41F1NsPMvkgIAWyZYBPz60QrNkqfb8t662v/CHu79RJ0czb7kIBciK5KCQD0My7gazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744457649; c=relaxed/simple;
	bh=gncQ7NnFnNbqOPlSO+7KrF7Snc8j/3HwYQAasyBMdgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTSWhGSsNcOVj8nLCKMTut1ktMvMaWKUsrV7DshuoSEC6/MlJyOZ9jwMhoZy36SYuByFddJITBvGP7Mrn+W5W+8OakhgmXWUU8yFSh7JWBt/wPVVCPj6MbEI8CSm1yAzJKXs99zCZ7XCNgQlO4xhWgDf/2QvZggVrvlAbgsrSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYTinISo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYTinISo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744457648; x=1775993648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gncQ7NnFnNbqOPlSO+7KrF7Snc8j/3HwYQAasyBMdgI=;
  b=UYTinISozSXYFI9Y3do8bzleCxnV4x+aXREB2gR2fR/ufe16PfGW0GO4
   ZOutODIosoOUBP2tRC5Zbb7H0E5T2KO6sFMlkQ/5PmJs37bClaRfJL7d5
   FEZ3BTHX5uJVE6rC4F8wwPREA4YHl5HrQRL/u/JPejr7Kzx+pzfzqZZuU
   F3JAe00gqJAK517AGtwayiMzPfT8zcyhL2Cw/LC1ZJoRyUVpQRwTVm/w8
   5nTCzUh/GsFtv/Xv8vl+2D2YbdspKzIX5UxkjLaHKrObrhyFZReREFbBP
   3w3e7kvoD/5an6kkRrBjJ/M5qQ74fAl2SNr80cNNe3pgu1YorV1gaK2kg
   w==;
X-CSE-ConnectionGUID: GmuqmeSeSyGkOhKsR3mayw==
X-CSE-MsgGUID: KzTQOVtORB+DIi2n+jyldg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56642285"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="56642285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 04:34:07 -0700
X-CSE-ConnectionGUID: 0jcE5Y2OStSZS/vNGW7cUQ==
X-CSE-MsgGUID: c6Wo6nDLTpWnLrijtaalIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134572559"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2025 04:34:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Z7b-000BlS-2q;
	Sat, 12 Apr 2025 11:34:03 +0000
Date: Sat, 12 Apr 2025 19:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2860/2860] mm/damon/core-test.h:284:9: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202504121904.5u9UZZmR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8cf05d37849321b8bb9b74e099fa5bb6164d4f56
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [2860/2860] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-121-20250412 (https://download.01.org/0day-ci/archive/20250412/202504121904.5u9UZZmR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121904.5u9UZZmR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121904.5u9UZZmR-lkp@intel.com/

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
