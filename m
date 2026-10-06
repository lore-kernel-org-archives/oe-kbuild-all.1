Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E836E478
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 22:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325846; cv=none; b=YoOU5GJEwJXt2NYPnLuh+2Vxv9LqLRgjLd3+ap41UPNXELrnlv4QdnazsUsUrmyiukpSmUYJMd83wOM82FiywrcA643iWq7gPamTdES6Brvw/ep5K3XxLVwHMWpAhJRmycKUg03mkd2JZF5X67YQDKb07q5qZsF81Ha9cLbzAI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325846; c=relaxed/simple;
	bh=qz3bmCVZTMEAtJwD/Yl/S2cEPbw53hY7qHU8rtJJwtc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bHwH0iLyC0SpNftnNxrBGu6S45e+wDxsq7ATCK6yU3MlujZsFfTO/TpYSDqAsjB+UJu8hD0Q+xj0COjoLv1noPnnAe8i9jbnyrSBQMqd01td8NkSs46XrCEELwjBgzDmMfM/Xs1e0esXkrmHprsP89PGWm/LO7t732AYBupB99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbwoiuwV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbwoiuwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791325846; x=1822861846;
  h=date:from:to:cc:subject:message-id;
  bh=qz3bmCVZTMEAtJwD/Yl/S2cEPbw53hY7qHU8rtJJwtc=;
  b=IbwoiuwVqGZkgSZrk8ze7Jo+xg5arlENipf3EoNkUZXatTQ9jgl8KEZB
   v5TRwidf4x12nG6KhzMgQ3S6ehPtTJ5pX73VSCd7Wyc2Z/TpcLSYS1d6c
   XyjzzM2zqhJmycCqObl+Iox8h79jFGACxhptrFEOhU/o/YmtQoN1tDYGG
   tNHkiEj6iPsGEzlsvI6CUjMvnA5Qdq8ajN/kyamTwamyuHrKD6EG8T5Qn
   sXRNr142E6eeQf0t4lmjXlIGkAd4U1vea7WTssRFrsFf2dsDR6kdn6n2T
   DrS9797WWhstpaIYRhQ4xTYgFJ4b/ZWquzaVAfYu28sdjvoRd1iD6owtT
   A==;
X-CSE-ConnectionGUID: IiYf+wYlQWSu6kWYgwaD9A==
X-CSE-MsgGUID: hzy3OvUvQBm3597TSNDU+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="182717"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="182717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:30:45 -0700
X-CSE-ConnectionGUID: apdJYLvzSYyDu4EuRykGnA==
X-CSE-MsgGUID: IvjUzyjLS8CeIOIN/ZhsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276794052"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 15:30:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEDgG-000000001wb-1gX2;
	Tue, 06 Oct 2026 22:30:40 +0000
Date: Wed, 07 Oct 2026 00:30:20 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net,
 Amir Goldstein <amir73il@gmail.com>
Subject: [mszeredi-fuse:extent-map-v3 28/29]
 fs/fuse/ext_map.c:141:31: warning: unused variable 'fuse_ext_map_iomap_ops'
Message-ID: <202610070010.d2JG57WI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v3
head:   abdbd9557c238384900ebd545f426a609e0162ae
commit: 91fc78ad913efd321396e414a561474c9072d334 [28/29] fuse: add extent map I/O support
config: hexagon-randconfig-r2301-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070010.d2JG57WI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070010.d2JG57WI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070010.d2JG57WI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/ext_map.c:150:16: warning: unused variable 'pfn' [-Wunused-variable]
     150 |         unsigned long pfn;
         |                       ^~~
>> fs/fuse/ext_map.c:141:31: warning: unused variable 'fuse_ext_map_iomap_ops' [-Wunused-const-variable]
     141 | static const struct iomap_ops fuse_ext_map_iomap_ops = {
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/ext_map.c:162:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] ret @@     got int @@
   fs/fuse/ext_map.c:162:13: sparse:     expected restricted vm_fault_t [usertype] ret
   fs/fuse/ext_map.c:162:13: sparse:     got int
   fs/fuse/ext_map.c:164:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] ret @@     got int @@
   fs/fuse/ext_map.c:164:21: sparse:     expected restricted vm_fault_t [usertype] ret
   fs/fuse/ext_map.c:164:21: sparse:     got int

vim +/fuse_ext_map_iomap_ops +141 fs/fuse/ext_map.c

   140	
 > 141	static const struct iomap_ops fuse_ext_map_iomap_ops = {
   142		.iomap_begin		= fuse_ext_map_iomap_begin,
   143	};
   144	
   145	static vm_fault_t fuse_ext_map_huge_fault(struct vm_fault *vmf, unsigned int order)
   146	{
   147		struct inode *inode = file_inode(vmf->vma->vm_file);
   148		bool write_fault = (vmf->flags & FAULT_FLAG_WRITE) && (vmf->vma->vm_flags & VM_SHARED);
   149		vm_fault_t ret;
 > 150		unsigned long pfn;
   151	
   152		if (WARN_ON_ONCE(!IS_DAX(inode)))
   153			return VM_FAULT_SIGBUS;
   154	
   155		if (write_fault) {
   156			sb_start_pagefault(inode->i_sb);
   157			file_update_time(vmf->vma->vm_file);
   158		}
   159	
   160		filemap_invalidate_lock_shared(inode->i_mapping);
   161	
 > 162		ret = dax_iomap_fault(vmf, order, &pfn, NULL, &fuse_ext_map_iomap_ops);
   163		if (ret & VM_FAULT_NEEDDSYNC)
   164			ret = dax_finish_sync_fault(vmf, order, pfn);
   165	
   166		filemap_invalidate_unlock_shared(inode->i_mapping);
   167	
   168		if (write_fault)
   169			sb_end_pagefault(inode->i_sb);
   170	
   171		return ret;
   172	}
   173	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
