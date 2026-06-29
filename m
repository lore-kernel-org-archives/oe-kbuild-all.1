Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61131368D41
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744890; cv=none; b=mIoebBrhNbkNCHualH94rt3k6AHUVM5Plju9jt1aua1sh0lNxPj4aplGpCHi4Aqh1X2oLQriS99SycEKQeApBN9GpnFg88LeRpwH28zfoPYlZb9dbw4ANnsy92KOByAyd7pBcq8kKE8TCwRFSkbL8EEWqQyVjp5XYOVqzlmGAZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744890; c=relaxed/simple;
	bh=Ze4tNaUV+OLzdS8ZB9XqLclZ6IjxX51cMZeNJH7mtrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S+SEYeDZouX1zQae0y/ImLQygwPCx4PB25i18/ncA9i+ikVtacdox6ZcAMif5FUOKIvb4GC2VgpjKB15I8bSjnxrHilGA4sNmIh97F7mbB9nOSiMVBKah5ZhrAeQamfABowZq432uQ3z+/cq+Z5FIDpuTvPlyZzpLQACKmby4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATHGfO0t; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATHGfO0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744888; x=1814280888;
  h=date:from:to:cc:subject:message-id;
  bh=Ze4tNaUV+OLzdS8ZB9XqLclZ6IjxX51cMZeNJH7mtrM=;
  b=ATHGfO0tub7Dmf7O64STYDPKgw/rqh4EhMI4ZFbhw1LOdADd7/S/OUpi
   YilQwrP8LL1bpYeMmVRP+PCPAvCIavZgOTTU+AHgWV5y9/rJxptE5S856
   mpTYXqDgJMIPS+5mY/zi7rtMa52XNYCFgwaH/gW1Vnd6HkdsOnCNU93PQ
   btGVu08eK15mGac6em0gHJaWj6cNVgFTtZbPDEVmlsz5dy3eXjE5Y4Rlh
   uAv0fpqE/4Pyd8+FhjEtDTsnvUnaWYai0FjjewRQLCY7wizdyRJV1Uaee
   T7QwnZCODjNb2ZSZPMy62drogqbaULOXG8bOWzeC/Gpeg7g9Lml/Z2ibc
   w==;
X-CSE-ConnectionGUID: vjxQ3zlCQpSYDFzflgYgRw==
X-CSE-MsgGUID: YWthcoxrSWqJBbEpXTUWaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106229910"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106229910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:54:47 -0700
X-CSE-ConnectionGUID: yh1N0t3DRauhbZu1lRyrcw==
X-CSE-MsgGUID: aUzkhk/7Q+qvwnoLvs0Mlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250286698"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Jun 2026 07:54:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weDNi-000000007UP-2njX;
	Mon, 29 Jun 2026 14:54:42 +0000
Date: Mon, 29 Jun 2026 22:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 480/799]
 fs/bcachefs/alloc/background.c:210:5-8: Unneeded variable: "ret". Return "0"
 on line 218
Message-ID: <202606292212.55YVp6MG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 1793cc6db8c9956fee64b427113359b3a2df7678 [480/799] bcachefs: errptr_try()
config: arc-randconfig-r061-20260629 (https://download.01.org/0day-ci/archive/20260629/202606292212.55YVp6MG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606292212.55YVp6MG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/alloc/background.c:210:5-8: Unneeded variable: "ret". Return "0" on line 218
   fs/bcachefs/alloc/background.c:225:5-8: Unneeded variable: "ret". Return "0" on line 231
   fs/bcachefs/alloc/background.c:238:5-8: Unneeded variable: "ret". Return "0" on line 244
   fs/bcachefs/alloc/background.c:527:5-8: Unneeded variable: "ret". Return "0" on line 534
--
>> fs/bcachefs/data/extents.c:531:5-8: Unneeded variable: "ret". Return "0" on line 537
   fs/bcachefs/data/extents.c:1460:5-8: Unneeded variable: "ret". Return "0" on line 1584
--
>> fs/bcachefs/alloc/lru.c:23:5-8: Unneeded variable: "ret". Return "0" on line 29
   fs/bcachefs/alloc/lru.c:86:5-8: Unneeded variable: "ret". Return "0" on line 104

vim +210 fs/bcachefs/alloc/background.c

1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  205  
d97de0d017cde0 fs/bcachefs/alloc_background.c Kent Overstreet 2024-08-12  206  int bch2_alloc_v1_validate(struct bch_fs *c, struct bkey_s_c k,
a6f4794fcd8627 fs/bcachefs/alloc_background.c Kent Overstreet 2024-11-27  207  			   struct bkey_validate_context from)
1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  208  {
26609b619fa230 fs/bcachefs/alloc_background.c Kent Overstreet 2018-11-01  209  	struct bkey_s_c_alloc a = bkey_s_c_to_alloc(k);
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24 @210  	int ret = 0;
26609b619fa230 fs/bcachefs/alloc_background.c Kent Overstreet 2018-11-01  211  
e88973373aaabe fs/bcachefs/alloc_background.c Kent Overstreet 2018-11-22  212  	/* allow for unknown fields */
d97de0d017cde0 fs/bcachefs/alloc_background.c Kent Overstreet 2024-08-12  213  	bkey_fsck_err_on(bkey_val_u64s(a.k) < bch_alloc_v1_val_u64s(a.v),
d97de0d017cde0 fs/bcachefs/alloc_background.c Kent Overstreet 2024-08-12  214  			 c, alloc_v1_val_size_bad,
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24  215  			 "incorrect value size (%zu < %u)",
f0ac7df23d04f3 fs/bcachefs/alloc_background.c Kent Overstreet 2022-04-03  216  			 bkey_val_u64s(a.k), bch_alloc_v1_val_u64s(a.v));
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24  217  fsck_err:
b65db750e2bb92 fs/bcachefs/alloc_background.c Kent Overstreet 2023-10-24 @218  	return ret;
1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  219  }
1c6fdbd8f2465d fs/bcachefs/alloc.c            Kent Overstreet 2017-03-16  220  

:::::: The code at line 210 was first introduced by commit
:::::: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
