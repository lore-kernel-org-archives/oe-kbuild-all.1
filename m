Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131B535DA78
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 04:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842279; cv=none; b=mM5Ip8YWLrIVdeGpyDqxIAPdRyoYcHHbuGpocknSzGPAmNPEPjZNJGKlMNk+3Idj5GITmK6I1CnM8facrgvXBDcgkwrK+iyLcqsXUyL+zknuwQmqkjGQB6iADxpyI6zm9M3xto8Gx9R9eC4Kr32tubK/3mf/WA6lod5cKqGUXdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842279; c=relaxed/simple;
	bh=GDa161aAG5luI95KnLUgrUA2iG8rWS1txhTiWPkoxts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DQHUxqqHAECL7sMtUbZgBHSPy0bffs1QDEVtsRnXoTFH9Br9+18qd3eYZDw69GKFLYZ3yXD7GrrJTbL8aJv8LtiQ8wNAQh66PFAhOALu4unvZ6JGsD8Gxmerji6Ozx9yuhJzOTIA4ZWlAupVHKO0InVKefwqOlItDr7QJLKMPj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Crssnnc2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Crssnnc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788842276; x=1820378276;
  h=date:from:to:cc:subject:message-id;
  bh=GDa161aAG5luI95KnLUgrUA2iG8rWS1txhTiWPkoxts=;
  b=Crssnnc2U/g9f+nT0XVpaaWrj5+wl+R44N9EDkgZk+UsbVu4XMgJVz/E
   ajz1Sv3ARwaw4tmi9eOvsOHprLU0dzg0SXS95FgrOX6ED/mMpMhcYw4jo
   MBn7drmMSJBEzOmg3AslF6VLOliIPHjwGz+lEUCsXVN07B3keeP5hdav0
   yC0KQ/vXNwT+cRrntViOgUetKBVpOev0K03rbWaCzME7btQsQeS0Rd9OT
   7YTsyrCEnuAraTWP4NBF7GJuEYHmNjCNDP7SD5u0GknwMmqi5aUNGR41N
   pvPo1CFRZbZldXjZ1/ZskeLIZ12LjN20X9i9S1KgEgRZHS8CZ4ZshNx8O
   w==;
X-CSE-ConnectionGUID: ARtoooHcQEKKmfkIIU+wUg==
X-CSE-MsgGUID: L0G1dLgMRveo8qyQZvh9qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99828582"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99828582"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 21:37:53 -0700
X-CSE-ConnectionGUID: VMZCDNxuS0iHb8FXjO5yeg==
X-CSE-MsgGUID: 3zzlYApyR0S8/y+MQNRZ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274658617"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Sep 2026 21:37:53 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3nag-000000001fh-3814;
	Tue, 08 Sep 2026 04:37:50 +0000
Date: Tue, 08 Sep 2026 12:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Subject: fs/f2fs/checkpoint.c:784:57: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202609081243.Jo4beeqD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28924df2a08f440c73991b83028032c901de2ae4
commit: 9a9ee7408a1f8271bd1978baff2dd09457054ef4 f2fs: reduce memory footprint of ino management
date:   3 weeks ago
config: parisc-randconfig-r132-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081243.Jo4beeqD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081243.Jo4beeqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081243.Jo4beeqD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/checkpoint.c:782:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/f2fs/checkpoint.c:782:14: sparse:     expected void **slot
   fs/f2fs/checkpoint.c:782:14: sparse:     got void [noderef] __rcu **
>> fs/f2fs/checkpoint.c:784:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:784:57: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:784:57: sparse:     got void **slot
   fs/f2fs/checkpoint.c:789:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:789:64: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:789:64: sparse:     got void **slot
   fs/f2fs/checkpoint.c:810:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/f2fs/checkpoint.c:810:14: sparse:     expected void **slot
   fs/f2fs/checkpoint.c:810:14: sparse:     got void [noderef] __rcu **
   fs/f2fs/checkpoint.c:812:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:812:57: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:812:57: sparse:     got void **slot
   fs/f2fs/checkpoint.c:819:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/f2fs/checkpoint.c:819:64: sparse:     expected void [noderef] __rcu **slot
   fs/f2fs/checkpoint.c:819:64: sparse:     got void **slot

vim +784 fs/f2fs/checkpoint.c

   768	
   769	static void __set_ino_bitmap(struct f2fs_sb_info *sbi, nid_t ino, int type)
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
   782		slot = radix_tree_lookup_slot(&im->ino_root, index);
   783		if (slot) {
 > 784			entry = radix_tree_deref_slot_protected(slot, &im->ino_lock);
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
