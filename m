Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2827B257841
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 06:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763879043; cv=none; b=elF9OSKovabQMqolxv+a3PzjbfZi4sq2xo+dR/L+LR1reLgOzLVseKSayUYr+cuipxutfnUQitpKdfrr58tnXl6aJ3s4s5HUIs+ib30IWPr9dwjd5GMhiiI25iPkIERlcWh8hmCJL5e97+hOeTh4/SHX78zoFpmcUOD//TrXBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763879043; c=relaxed/simple;
	bh=yO3oNL3r9llPv2HQzZ5u+nNxsP1rBisaGD8PZ3AGyqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R6Y4G5+WEvVQRhnNYuTP6xnEtbPllxV0LPV5G9nnr3gmpsIYc8zE4u72olCuhHrRj1Gvt8K2FgpYci6GW1S3wXh6cicq0z0C8OSWB0cr6Yt4LhzI52LqOvXA/dg4o35qM63DrXWeFtisjKXTEzN6yjfJKWgGP5dS+JVI7rlnfaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zbxxd6cx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zbxxd6cx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763879041; x=1795415041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yO3oNL3r9llPv2HQzZ5u+nNxsP1rBisaGD8PZ3AGyqE=;
  b=Zbxxd6cxnQIq6vOdtCoH875lANsMuzs2nqW4+7lGNAIVLZshsKHsyjVa
   vbwz8NFcyGTYo7Qx10FUA5vzQFULB4+csNMHNDbGfkUlUBw0wlIp4VJwB
   8QNqO5HO+B/UfYZiAVrGJmrjuB4p/R28uXinaj3t25nrWUFXMh64b0G4I
   3qBiXlZoTxQzhQYZWamcWOKPx4ugHeLXBkVWZ5upG9Ev9BvV4Ovvz5HaL
   PMXDj8ktxYldpPHWDb0hcZIsxZNT3oRKCsTDI8a7TdExRTse0YUuuxQs/
   0g9oEHER5vb1UBBpXkYKeR7Lk4kI9z/7S/kntn+kZdnaLno/hgI5i/9NT
   A==;
X-CSE-ConnectionGUID: SmJ02MwHTFyQRdYYb/bldg==
X-CSE-MsgGUID: DE06KShNThyHZ6xO8ik79A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76243511"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="76243511"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 22:24:00 -0800
X-CSE-ConnectionGUID: e8vMnpz8SpWrc14v7uMZ1A==
X-CSE-MsgGUID: nQyPs+OJTfSaY8yBgI+dbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="196207191"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2025 22:23:59 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN3Vs-00085R-1s;
	Sun, 23 Nov 2025 06:23:56 +0000
Date: Sun, 23 Nov 2025 14:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3301/3301] mm/damon/core-test.h:284:9: sparse:
 sparse: incompatible types in comparison expression (different signedness):
Message-ID: <202511231439.ABUnWfea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   40e02117ca786975378e324ac2e14cc00b00206e
commit: 83b931be40b2829e20f38356509d8706ea6b6238 [3301/3301] mm/damon/core-test: test damon_set_regions
config: x86_64-randconfig-123-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231439.ABUnWfea-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231439.ABUnWfea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231439.ABUnWfea-lkp@intel.com/

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
