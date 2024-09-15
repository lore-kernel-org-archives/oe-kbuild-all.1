Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169A12CDBE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726407409; cv=none; b=KwViaYKH3r5+U6casHjKWdEOKnBsJmkCb7eYp0aRqFR4iuts8q1pPxNYO/UT5rVx0Wdv76lXrO+JL2OrzrWQ0IaxiVUz67LM+9zmlht6PMMM6M/kJ5d4vKlqaEQQT/s53vQoJd7psN+4f+Eu0a7p3QXVv9dQ04cFQdcBJDJIeMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726407409; c=relaxed/simple;
	bh=Y+dF82KmView2H0iIPihLBd0qmw1aAF/whdti+xx4Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGM+YniwL8X+tf49AvWiPaTm4uL2N+532vLJCMZrlf21EKA52xNGbMTbLSVPQsPm57qPXgQicVbR2Ljy+wn3wR6McRMgnqrT/B0rD0pmalj+IRDggQxX8y70CG9RrNHtwPvICWw4Bh/SVLuiHwf8FgzlR0GclckUnKz3kihMyBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmfkfTsB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmfkfTsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726407407; x=1757943407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+dF82KmView2H0iIPihLBd0qmw1aAF/whdti+xx4Oc=;
  b=OmfkfTsB6kbt6z38Ovc7rIG96gQcLn6k0VyRjwvUI7HrcyHeQ0PVS0fi
   KE2Lqolmu9hCuPPZ0L0v2GGj39UA/jCuCHIcm9UAnH+6mm0sR0Fcl57Z9
   OkBZW8+mHqEwSaugijblE6iueZsaNBc5GT9p1kHT5eON62tvHT3gJqp8l
   csX4KXXL8hYfD1ivmSUz0dxIzRqyrHlVdPnaLeBwQkj8b6m3iW8HO0tHq
   jbhroGK/uORIXLreuDa9+cx+fa6ICjHFQUX4h+UuXlnk0/b1ghDa6uMWN
   ap1cgEDMz6YprDR0mc3U3AOXYIaKUMQ+J0ls2dDPza9EZOg2Z1aIp1OxM
   g==;
X-CSE-ConnectionGUID: w9XSwPHvTfKJMdYEQTWOiQ==
X-CSE-MsgGUID: vQx3LRG7QCK7ehdUMqdh9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25190471"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25190471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 06:36:46 -0700
X-CSE-ConnectionGUID: U9UFxEPmTliYHIPVh28yKA==
X-CSE-MsgGUID: JsCCtGW9RniAqnDIsSCFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="99303321"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Sep 2024 06:36:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sppQh-0008i6-0w;
	Sun, 15 Sep 2024 13:36:43 +0000
Date: Sun, 15 Sep 2024 21:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14922/30000] mm/damon/core-test.h:284:9: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202409152151.x8rsjC6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1b6ac823ff98dd4dbd1b6bff478a1b9b44855f67
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [14922/30000] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-121-20240915 (https://download.01.org/0day-ci/archive/20240915/202409152151.x8rsjC6m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409152151.x8rsjC6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409152151.x8rsjC6m-lkp@intel.com/

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
