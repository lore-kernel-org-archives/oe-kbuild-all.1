Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDFE230BD9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 04:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771128434; cv=none; b=R6R/eSln1KtDeM4v9TmApoBG0DVH3GKyJnpEBbCLJA4wVdQIsSoAFMVCCKChvbnkF6XJGuG+BkEVuemA7iYwJ+wYYk4DiTOxN35TIOdyXCHpPWxAZSeQmlAWx1faQIn9UA01GJSwHncSf0Qo9g8k5CRN/xEzpy0THb3PGkBlUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771128434; c=relaxed/simple;
	bh=fpcqmj1dLXWH8r9zuZt+jL7KagCiX+EP70eYGK1uAOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L25vks4vVkHn2xTs5qemHIyhFjAn7W1c8C6cuA9EvYI4wBBDk4vGK2vCKPhNOYx0Dz9BwxerrHCD+JEXiQxivXjmVooe/6L8YaL/ib/pBKBPNmTUb5SPaeLY1Ltjv59gNq1I0nCrf2R8VQ+RxjXwUYLbcoGS+X7BZCJmK6mqmo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJG3sf8a; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJG3sf8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771128432; x=1802664432;
  h=date:from:to:cc:subject:message-id;
  bh=fpcqmj1dLXWH8r9zuZt+jL7KagCiX+EP70eYGK1uAOk=;
  b=fJG3sf8aLuOKZSe98RD6t1Iea1YYjmxS9xgn5+7INKcEQQ8Z6vPVgb+6
   jL0JeyY53JUiOFwYlKB3BJtg7FLf3UoL5T0i5tlEDnh0fgy9mPPxj6kh8
   KcL67/i0vXU4+1ttdMOdtheoIbxuwpZWqYuFk3/71Skpq9xFxBvVvo4Jk
   Mix/rVachiWLWp+xPvmbdFlR3v3CdK3Oe2z2zsyHL+cPXTyIVDpNGPhTt
   3ii81lRFlHWF5iwo6PYxQek9XjqUGT5YrfA9Hc0Z2B9IQDISJb9G4eGgF
   8eLekMGl2ZuhWvOmxpXk/YgM2CnM5beLXUdo5gZy8Q3iRpWWB7bvAeDKB
   g==;
X-CSE-ConnectionGUID: 5NXc2o52T7aZxUtKQWCqgg==
X-CSE-MsgGUID: XoU93kGFTRSpYWRy2tyvcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="74858041"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="74858041"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 20:07:12 -0800
X-CSE-ConnectionGUID: /N2XD8CPTKeR0hxYIppw0Q==
X-CSE-MsgGUID: T47gLTi7Q3CpJR+rLPup4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="217817021"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2026 20:07:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrTPY-00000000xLo-2xij;
	Sun, 15 Feb 2026 04:07:08 +0000
Date: Sun, 15 Feb 2026 12:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 105/106]
 fs/fuse/fuse_iomap_bpf.c:293:1: sparse: sparse: symbol
 'fuse_bpf_iomap_inval_mappings' was not declared. Should it be static?
Message-ID: <202602151241.SGHXIsdX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   cfabfd535988652f4ce050030fbbf472e820a672
commit: 9a06445aae55a984808236d65fd2751f74ff262d [105/106] fuse: add kfuncs for iomap bpf programs to manage the cache
config: arm64-randconfig-r122-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151241.SGHXIsdX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151241.SGHXIsdX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151241.SGHXIsdX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fuse/fuse_iomap_bpf.c:176:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:176:9: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:176:9: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:215:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:215:9: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:215:9: sparse:    struct fuse_iomap_bpf_ops *
>> fs/fuse/fuse_iomap_bpf.c:293:1: sparse: sparse: symbol 'fuse_bpf_iomap_inval_mappings' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:318:1: sparse: sparse: symbol 'fuse_bpf_iomap_upsert_mappings' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:371:1: sparse: sparse: symbol 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:373:1: sparse: sparse: symbol 'btf_fuse_iomap_begin_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:375:1: sparse: sparse: symbol 'btf_fuse_iomap_ioend_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops *

vim +/fuse_bpf_iomap_inval_mappings +293 fs/fuse/fuse_iomap_bpf.c

   291	
   292	__bpf_kfunc int
 > 293	fuse_bpf_iomap_inval_mappings(struct fuse_inode *fi,
   294				      const struct fuse_range *read__nullable,
   295				      const struct fuse_range *write__nullable)
   296	{
   297		struct fuse_iomap_inval_mappings_out outarg = {
   298			.nodeid = fi->nodeid,
   299			.attr_ino = fi->orig_ino,
   300		};
   301		struct inode *inode = &fi->inode;
   302		struct fuse_conn *fc = get_fuse_conn(inode);
   303	
   304		if (!fc->iomap)
   305			return -EOPNOTSUPP;
   306	
   307		if (read__nullable)
   308			memcpy(&outarg.read, read__nullable, sizeof(outarg.read));
   309		if (write__nullable)
   310			memcpy(&outarg.write, write__nullable, sizeof(outarg.write));
   311	
   312		trace_fuse_iomap_inval_mappings(inode, &outarg);
   313	
   314		return fuse_iomap_inval_inode(inode, &outarg);
   315	}
   316	
   317	__bpf_kfunc int
 > 318	fuse_bpf_iomap_upsert_mappings(struct fuse_inode *fi,
   319				       const struct fuse_iomap_io *read__nullable,
   320				       const struct fuse_iomap_io *write__nullable)
   321	{
   322		struct fuse_iomap_upsert_mappings_out outarg = {
   323			.nodeid = fi->nodeid,
   324			.attr_ino = fi->orig_ino,
   325			.read.type = FUSE_IOMAP_TYPE_NOCACHE,
   326			.write.type = FUSE_IOMAP_TYPE_NOCACHE,
   327		};
   328		struct inode *inode = &fi->inode;
   329		struct fuse_conn *fc = get_fuse_conn(inode);
   330	
   331		if (!fc->iomap)
   332			return -EOPNOTSUPP;
   333	
   334		if (read__nullable)
   335			memcpy(&outarg.read, read__nullable, sizeof(outarg.read));
   336		if (write__nullable)
   337			memcpy(&outarg.write, write__nullable, sizeof(outarg.write));
   338	
   339		trace_fuse_iomap_upsert_mappings(inode, &outarg);
   340	
   341		return fuse_iomap_upsert_inode(inode, &outarg);
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
