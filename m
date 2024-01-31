Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0FC7691D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701878; cv=none; b=U9+mxz6ZqGrmZ5yQti7JNJ1x62BMoXy7XwAlTM3WrzEAuTGzVJbIUx3n+JCyd/6d6LaINvrChMfbTO8/MIM1+5q2VSeDJbgPLddx6VFlakTQSEpBrNJQR4rFbbJjUCMMaUU149VzTUtOkMytf7KWzbwauB98i5URt3R+OlznNeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701878; c=relaxed/simple;
	bh=h1vY2/WTv10tnbyA80PbnycPMc3gVO+bpKnxLorKtMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYRazeo8o2KASSh0w0r6hant7KkuZxbM8Lq1EX/NG7c0T/lilkhyhzh56qyEVdSNrRl537tiqu9l2xmS6kBRSdvd5ZJVNcFS5GxNrquY0pzczw60K8hMcRuwrWK8ZFA5nwiepjhrPcz4fWbLWiYw8k20XJ3zReSduhi6ev0rRTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ykwu8bf2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ykwu8bf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706701876; x=1738237876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1vY2/WTv10tnbyA80PbnycPMc3gVO+bpKnxLorKtMY=;
  b=Ykwu8bf2ZeuIxceBufnPVg/vmmFSZfFH4b7cv4/pKB88eQf8PD73ejni
   DUyTC0FLtDYVA5xzCseWHmDNBh6eyAAE8NnCZuGeCdLD5noWJddS9PwBY
   TelvfwLC2mbmgTTP5cz7m2c6tffdm/G6ES3jjxLNvmhJ/OsxfWLqZ7WDh
   5GlYn5LEC/qJYCepd7T3QXh5BW/rWCJbMxR+XlbEklvvm+EH4b0hVg76d
   NCRYPQPJkVmTUtL4YmX5OFB4g169+gAxn2WmWXOPnzYpEfX3QMYHp+D6M
   NTdQ63qD2blw7oM/BFA3TkBb9rJJVqhpnyh4rMvXVm5z7x5MnD7IriY/i
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17110207"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="17110207"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 03:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4068834"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2024 03:51:14 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV97Y-0001WS-0w;
	Wed, 31 Jan 2024 11:51:12 +0000
Date: Wed, 31 Jan 2024 19:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21561/30000] mm/damon/core-test.h:284:9: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202401311902.kmMXNYn1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   260c7a5874066269671cc826d6c9ccd70dd001e5
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [21561/30000] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-121-20240130 (https://download.01.org/0day-ci/archive/20240131/202401311902.kmMXNYn1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311902.kmMXNYn1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311902.kmMXNYn1-lkp@intel.com/

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
