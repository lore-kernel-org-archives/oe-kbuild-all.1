Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8BC2B9B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 05:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701546; cv=none; b=Vv7RSKdyErW9CCucuGyDJboeBR5P2CKYbxFtgMB0Z5I/AxHnt0TB2IQa15Fte4hr8bkwBbAn5i4Wfzuy7ItjaXA7ifCZDzGgIGgzlGtWKpiQYv7hcl0bqUXofIP0mT8HkwAoNQPAq64xZwU1fsFKEN7f60YfwLztQkHs7QjzSu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701546; c=relaxed/simple;
	bh=jmi1cve8W7FUUbylHvhTFPbCsxuO954l4eStqASgDMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LtEIywnhRCLQoio3kVWTahf7egREIzUqOoxdXNdqRfpGD66noSceOwpzLPSh1MxOBYOi2FZhAKrVX7OeuhkZH6DFtYm2Y5hce4MSMnkBTD67XQAWvPqGiN+Z+bnu8yjp+2UkFA2chNaKnxDx/fPPZf5ngpCUVfR4Q5s9fiMjemA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jogMdETU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jogMdETU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770701545; x=1802237545;
  h=date:from:to:cc:subject:message-id;
  bh=jmi1cve8W7FUUbylHvhTFPbCsxuO954l4eStqASgDMk=;
  b=jogMdETUb9Ad8R14HFHs4On4/BTDNA078amxoF1NFhVOQkuEK8MlI3uM
   xlHlXGR+w6WiJkNQaisPyTelIjQ7OXo2nytApT52iUL9xfChVYO3XcusZ
   WfMe+WwfEvpgK9AUOD3jhYTtodhcc8XiRzdNesUrGxxW7FrjhhjHIphm8
   ZLvvmuIMSKQWKhHlNS47D+ys5g1nahE7CcULh1MTvOED728gil/rS+edz
   8QxO1k5y/Jy2OI1w5gE1YvVPUd/f8AQ4dvE2+AGSxKfCGuWStPXOYzznk
   NKanUdj+2hB5KMU1fp91P+JFo+yXuHSOR63K+wpQbsjCMRVTeGBN0ZE8p
   g==;
X-CSE-ConnectionGUID: 8d2QiYrsTqi5h+lKyi1zvg==
X-CSE-MsgGUID: gD0VlRnpRsObbxADP4T5nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75447210"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75447210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:32:25 -0800
X-CSE-ConnectionGUID: pMsnAmCcS7qDf7Lv69pVYQ==
X-CSE-MsgGUID: ZJlNkc+CRrqVFmqymtWDQQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Feb 2026 21:32:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpgMH-00000000ofg-29nV;
	Tue, 10 Feb 2026 05:32:21 +0000
Date: Tue, 10 Feb 2026 13:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 481/799]
 fs/bcachefs/snapshots/snapshot.c:45:5-8: Unneeded variable: "ret". Return "0"
 on line 52
Message-ID: <202602101305.3VdQsOTo-lkp@intel.com>
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
commit: 29e05f82d6bdd4efef504f6f68922db28e2e4917 [481/799] bcachefs: bit more reorg
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101305.3VdQsOTo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101305.3VdQsOTo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/snapshots/snapshot.c:45:5-8: Unneeded variable: "ret". Return "0" on line 52
   fs/bcachefs/snapshots/snapshot.c:225:5-8: Unneeded variable: "ret". Return "0" on line 272
--
>> fs/bcachefs/snapshots/subvolume.c:215:5-8: Unneeded variable: "ret". Return "0" on line 230

vim +45 fs/bcachefs/snapshots/snapshot.c

8e877caaad8185 fs/bcachefs/snapshot.c Kent Overstreet 2023-08-16  41  
d97de0d017cde0 fs/bcachefs/snapshot.c Kent Overstreet 2024-08-12  42  int bch2_snapshot_tree_validate(struct bch_fs *c, struct bkey_s_c k,
a6f4794fcd8627 fs/bcachefs/snapshot.c Kent Overstreet 2024-11-27  43  				struct bkey_validate_context from)
8e877caaad8185 fs/bcachefs/snapshot.c Kent Overstreet 2023-08-16  44  {
b65db750e2bb92 fs/bcachefs/snapshot.c Kent Overstreet 2023-10-24 @45  	int ret = 0;
8e877caaad8185 fs/bcachefs/snapshot.c Kent Overstreet 2023-08-16  46  
b65db750e2bb92 fs/bcachefs/snapshot.c Kent Overstreet 2023-10-24  47  	bkey_fsck_err_on(bkey_gt(k.k->p, POS(0, U32_MAX)) ||
d97de0d017cde0 fs/bcachefs/snapshot.c Kent Overstreet 2024-08-12  48  			 bkey_lt(k.k->p, POS(0, 1)),
d97de0d017cde0 fs/bcachefs/snapshot.c Kent Overstreet 2024-08-12  49  			 c, snapshot_tree_pos_bad,
b65db750e2bb92 fs/bcachefs/snapshot.c Kent Overstreet 2023-10-24  50  			 "bad pos");
b65db750e2bb92 fs/bcachefs/snapshot.c Kent Overstreet 2023-10-24  51  fsck_err:
b65db750e2bb92 fs/bcachefs/snapshot.c Kent Overstreet 2023-10-24 @52  	return ret;
8e877caaad8185 fs/bcachefs/snapshot.c Kent Overstreet 2023-08-16  53  }
8e877caaad8185 fs/bcachefs/snapshot.c Kent Overstreet 2023-08-16  54  

:::::: The code at line 45 was first introduced by commit
:::::: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
