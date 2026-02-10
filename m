Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C49337BAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714156; cv=none; b=buWUMWpH+ecJKQuVxwz/lghZIyWCYWRFK9X8AJ9+v8rkw8qTGx4sv5tzsRon3PxPMEe0Hkn+nBsi4j1v24Vjq/nQlZE6ZHfKyEeJ0714ghd6ncErXHA0PJhw8m81GrIc/hL7+qwvOJX8Rf58NUpuc6hciSRSMNeVdoxo5TNEDOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714156; c=relaxed/simple;
	bh=gOztfxZ/Zqz79202o7dr8oXnMjiHQxkG/2JYcDWjYwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jmgaOLAA5lIyRLl3cXw0tusvUWa6n3UogMt9dGNKTFkRrrMovEtZQ8ENT9AZqjTFES6UdibcqK0Qa+GXJMuvc8C2/pyDVyC5HKEDdvTJvQxlz+x4AcD5FY7eHhIQBEmbwSgN1OIMC4Cs9EAAGxAp/SMjC9lnovvujVicClMRiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/sfRhWR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/sfRhWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770714154; x=1802250154;
  h=date:from:to:cc:subject:message-id;
  bh=gOztfxZ/Zqz79202o7dr8oXnMjiHQxkG/2JYcDWjYwM=;
  b=M/sfRhWRdJj2+z/ilQwX5Ndhfegw55MoqvgFjZbDnRIT43HhO16Nufd0
   w6D/GJ/fvjtlIg7mjzIRF8rRq59S8hJA2Ep/KaBQmuTDZzQUnsnzV495/
   /Vy57GbNQf0wa250/XbH3MHI7GWQXG4op7JGF4A2B4kTDyRnUaD9lNeHJ
   1XiRLYsk+GU+1viJyVR9s7lN1eg50qcUzK0mHJZptc2shP7XeEQE5nqWb
   b4XDQNR7wef2NRM/M4WkvA61KvtkFBBWxbpJ+hhOCKVltaehmBj87SUNd
   jP9AhYr6j0C4rnHyCghyl2wZLb9aIP+v5RM8JssgFCfJZ+fNhkqhPGZdL
   A==;
X-CSE-ConnectionGUID: H+ntJVzCQTeX8JbDshjXhA==
X-CSE-MsgGUID: wOk5SuVfQTmeY87vbbG1XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89251719"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89251719"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:02:33 -0800
X-CSE-ConnectionGUID: B+Y5HmeHSg6TJqNn+LzDJQ==
X-CSE-MsgGUID: acyRaN2pSo2otVhl3LiGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216371250"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Feb 2026 01:02:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpjdd-00000000oqW-3Sok;
	Tue, 10 Feb 2026 09:02:29 +0000
Date: Tue, 10 Feb 2026 17:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 501/799]
 fs/bcachefs/journal/read.c:527:5-8: Unneeded variable: "ret". Return "0" on
 line 536
Message-ID: <202602101725.H5T5lTt8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 23542f9170e75481d2e3d2e05c2f2988d2483f48 [501/799] bcachefs: split journal/io.c -> (read|write).c
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101725.H5T5lTt8-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101725.H5T5lTt8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/journal/read.c:527:5-8: Unneeded variable: "ret". Return "0" on line 536
   fs/bcachefs/journal/read.c:555:5-8: Unneeded variable: "ret". Return "0" on line 576
   fs/bcachefs/journal/read.c:599:5-8: Unneeded variable: "ret". Return "0" on line 606
   fs/bcachefs/journal/read.c:675:5-8: Unneeded variable: "ret". Return "0" on line 682
   fs/bcachefs/journal/read.c:716:5-8: Unneeded variable: "ret". Return "0" on line 724
   fs/bcachefs/journal/read.c:837:5-8: Unneeded variable: "ret". Return "0" on line 845
   fs/bcachefs/journal/read.c:1305:5-8: Unneeded variable: "ret". Return "0" on line 1347

vim +527 fs/bcachefs/journal/read.c

528b18e6d1c67c fs/bcachefs/journal_io.c Kent Overstreet 2021-12-31  520  
528b18e6d1c67c fs/bcachefs/journal_io.c Kent Overstreet 2021-12-31  521  static int journal_entry_blacklist_validate(struct bch_fs *c,
c23a9e08825919 fs/bcachefs/journal_io.c Kent Overstreet 2022-09-26  522  				struct jset *jset,
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  523  				struct jset_entry *entry,
c4e382e2347781 fs/bcachefs/journal_io.c Kent Overstreet 2023-08-06  524  				unsigned version, int big_endian,
60558d55f7e26c fs/bcachefs/journal_io.c Kent Overstreet 2024-12-07  525  				struct bkey_validate_context from)
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  526  {
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16 @527  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  528  
c23a9e08825919 fs/bcachefs/journal_io.c Kent Overstreet 2022-09-26  529  	if (journal_entry_err_on(le16_to_cpu(entry->u64s) != 1,
a8712967bf07da fs/bcachefs/journal_io.c Kent Overstreet 2023-08-06  530  				 c, version, jset, entry,
b65db750e2bb92 fs/bcachefs/journal_io.c Kent Overstreet 2023-10-24  531  				 journal_entry_blacklist_bad_size,
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  532  		"invalid journal seq blacklist entry: bad size")) {
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  533  		journal_entry_null_range(entry, vstruct_next(entry));
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  534  	}
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  535  fsck_err:
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16 @536  	return ret;
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  537  }
1c6fdbd8f2465d fs/bcachefs/journal_io.c Kent Overstreet 2017-03-16  538  

:::::: The code at line 527 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
