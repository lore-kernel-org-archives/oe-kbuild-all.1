Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1936A34F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131473; cv=none; b=Jy6Ls+Vpv1rxwM1O/5YyTOx6seDX0/fxRmj5cq249I0//w/ES28XjToDhW1Kkygrzo+gNF49/inAcfy1UwLbfkJYjacsRykZvr2qrLnccbMdsgE4BIzXx0agQj1BdGZeHonNlYV0PD5Eku2NQJTJ69CUv7fORfSWTO8Hd6H19fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131473; c=relaxed/simple;
	bh=Q6lKDts1aO2Rpc/yfM79DYKf18NmroK4KbJapVHV2wQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EWKyJMSpziCXtNEuJ24xB7IbizyFBDopaMyOurQuE13hvmaO2bg7t4ckHhn6PPOv36T5++cyv2LIvXzh4TjztDVyA/Z3fmEj9foo5OVRZDvqBGQISwCcAX0t/94+LTDRtL/b+BP+vN5TGoLh6oJORNVZHv5+mqCNJt/pAX7+hBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeTiCRaU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeTiCRaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782131471; x=1813667471;
  h=date:from:to:cc:subject:message-id;
  bh=Q6lKDts1aO2Rpc/yfM79DYKf18NmroK4KbJapVHV2wQ=;
  b=DeTiCRaUifFTKv2YHcRpJ/d4jp2Kc0FEEir2DO7lcCzNqye8x6Ru6L9/
   6Ez535m93KIysdIuUvYz1U15Mjpk+xtT2x4kbwpkt6Icpl3B3ufdLgxbH
   hz4oS4paEp3cY1iVTSo+Pr+ZVtlqyVxB2VD7NYS8slsBJNAblktPaMGa9
   a2c0173TAByI457ThJAM3xNO8oz4bRPwdmThm9kaFdfsU9W11T3FPLRFe
   qKF/qOT/7WFcQH30Aaap/WcndV5Ye4+ZSQbKdb2SlfDPLHWsujJXMfJLe
   8py+D/f5LkfbPjmnog7+iMtcETFM2Z7eYiwhircOBNVbzILphTIP5PemT
   A==;
X-CSE-ConnectionGUID: DP23XYGnSayVwaBCgMMh2A==
X-CSE-MsgGUID: YQlj0GJUR86YeRxI565uiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="86541111"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="86541111"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 05:31:11 -0700
X-CSE-ConnectionGUID: +W+gLbAYTemekFSFU4pFJA==
X-CSE-MsgGUID: TY878WMWSOaIbmVae/g1Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="253548901"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 05:31:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbdno-0000000018X-3xV9;
	Mon, 22 Jun 2026 12:31:01 +0000
Date: Mon, 22 Jun 2026 20:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 8/8] fs/f2fs/checkpoint.c:782:14:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202606222053.I61JpMTs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   ab162f884225286b8b722443d3b82e97936efee7
commit: ab162f884225286b8b722443d3b82e97936efee7 [8/8] f2fs: reduce memory footprint of ino management
config: x86_64-randconfig-122-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222053.I61JpMTs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222053.I61JpMTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222053.I61JpMTs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/checkpoint.c:782:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/f2fs/checkpoint.c:782:14: sparse:     expected void **slot
   fs/f2fs/checkpoint.c:782:14: sparse:     got void [noderef] __rcu **
>> fs/f2fs/checkpoint.c:784:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:784:47: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:784:47: sparse:     got void **slot
   fs/f2fs/checkpoint.c:789:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:789:64: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:789:64: sparse:     got void **slot
   fs/f2fs/checkpoint.c:810:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/f2fs/checkpoint.c:810:14: sparse:     expected void **slot
   fs/f2fs/checkpoint.c:810:14: sparse:     got void [noderef] __rcu **
   fs/f2fs/checkpoint.c:812:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:812:47: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:812:47: sparse:     got void **slot
   fs/f2fs/checkpoint.c:819:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:819:64: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:819:64: sparse:     got void **slot

vim +782 fs/f2fs/checkpoint.c

   768	
   769	void f2fs_add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type)
   770	{
   771		struct inode_management *im = &sbi->im[type];
   772		unsigned long index = INO_SLOT_INDEX(ino);
   773		unsigned int ofs = INO_BIT_OFFSET(ino);
   774		void **slot, *entry;
   775		unsigned long bitmap = 0;
   776		int ret;
   777	
   778		ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
   779		f2fs_bug_on(sbi, ret);
   780	
   781		spin_lock(&im->ino_lock);
 > 782		slot = radix_tree_lookup_slot(&im->ino_root, index);
   783		if (slot) {
 > 784			entry = radix_tree_deref_slot(slot);
   785			bitmap = xa_to_value(entry);
   786			if (!(bitmap & (1UL << ofs))) {
   787				bitmap |= (1UL << ofs);
   788				entry = xa_mk_value(bitmap);
   789				radix_tree_replace_slot(&im->ino_root, slot, entry);
   790			}
   791		} else {
   792			bitmap |= (1UL << ofs);
   793			entry = xa_mk_value(bitmap);
   794			if (unlikely(radix_tree_insert(&im->ino_root, index, entry)))
   795				f2fs_bug_on(sbi, 1);
   796		}
   797		spin_unlock(&im->ino_lock);
   798		radix_tree_preload_end();
   799	}
   800	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
