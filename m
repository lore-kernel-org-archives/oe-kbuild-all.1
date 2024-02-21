Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFD7FBD5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529689; cv=none; b=kKufqMSR5J07ouukvI+L4vCe1c37OxxSvpO7suVV5WtS6Dm7H4oFp3xLTvuv1q1QcET5QiiIJ8luvbfV2VNe1S7oFvog3KpWfmgOdsGEoIpczpt7OZJGWb0qyvzqbgncm9MZwiHDWyh3NxcpMlfoe9oaEdYaPIDi2SqpxQ9+xo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529689; c=relaxed/simple;
	bh=WFZHu9/qzq9/BeIEdWMDp1hdn2oJFVX3KeTOnvE+HaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwyXEf8NaPni2bq8CpXIMEmRsHfDJFmBQ05cPAx9ZkmKb/zCIYVDr1GVeRJdnYlBIzjDQBIvSgpWxVeGeEyjfSszmWEOY1D6BVPSTM46iZSreuNL63DUJlnSioZx2kRhaKW+ZBeAY4fVXxt8JlviVRp2T4KyC1h2pN/ujL27LCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=im0VNkBj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="im0VNkBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529689; x=1740065689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFZHu9/qzq9/BeIEdWMDp1hdn2oJFVX3KeTOnvE+HaE=;
  b=im0VNkBjn89LQ/IciVVThzlkhxg7YLLp62PYZRGiLeWsTm2l58Wv14sF
   OzErlGc0XLOWr7bvM0qMFNPEqh47XJMh2B2TFshpQDMZTwCL48Qxh9LzA
   iXRu6H8AFTHbeG9Hb8vFmpiMs4juKp6jjxZhhxZ4dHYPMsAly2n0UJFBS
   IMyJbQupkr+24rxj4iLZ/78L52GhP5wtFYQFLltCLZGjfS65xYTdMY0tV
   E5KOgRhadtS9jkQPTsBdIBrKqL2NVG5Q5DmLf2lGG0t7Lh432e8XiYwkz
   hiWBnrjnXWXvuG0mmoHPXWPjgJiG1GbeAIV3UFNnqInivjAAytY3WjWe/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2557454"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2557454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5146486"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2024 07:34:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcocL-0005RI-06;
	Wed, 21 Feb 2024 15:34:42 +0000
Date: Wed, 21 Feb 2024 23:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slab-cleanup-flags 3/4] fs/overlayfs/super.c:1499:62:
 sparse: sparse: incorrect type in argument 4 (different base types)
Message-ID: <202402212310.KPtSDrRy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slab-cleanup-flags
head:   95c527f4e5dd5245977e9625ec6e1197dc0e733b
commit: 9cd1bbdf6848577e2e1c1a3cab62dbe91b993439 [3/4] mm, slab: use an enum to define SLAB_ cache creation flags
config: powerpc-randconfig-r131-20240221 (https://download.01.org/0day-ci/archive/20240221/202402212310.KPtSDrRy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce: (https://download.01.org/0day-ci/archive/20240221/202402212310.KPtSDrRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212310.KPtSDrRy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/overlayfs/super.c:1499:62: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got int @@
   fs/overlayfs/super.c:1499:62: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/overlayfs/super.c:1499:62: sparse:     got int
   fs/overlayfs/super.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +1499 fs/overlayfs/super.c

13cf199d0088b77 Amir Goldstein 2017-06-12  1491  
e9be9d5e76e3487 Miklos Szeredi 2014-10-24  1492  static int __init ovl_init(void)
e9be9d5e76e3487 Miklos Szeredi 2014-10-24  1493  {
13cf199d0088b77 Amir Goldstein 2017-06-12  1494  	int err;
13cf199d0088b77 Amir Goldstein 2017-06-12  1495  
13cf199d0088b77 Amir Goldstein 2017-06-12  1496  	ovl_inode_cachep = kmem_cache_create("ovl_inode",
13cf199d0088b77 Amir Goldstein 2017-06-12  1497  					     sizeof(struct ovl_inode), 0,
13cf199d0088b77 Amir Goldstein 2017-06-12  1498  					     (SLAB_RECLAIM_ACCOUNT|
13cf199d0088b77 Amir Goldstein 2017-06-12 @1499  					      SLAB_MEM_SPREAD|SLAB_ACCOUNT),
13cf199d0088b77 Amir Goldstein 2017-06-12  1500  					     ovl_inode_init_once);
13cf199d0088b77 Amir Goldstein 2017-06-12  1501  	if (ovl_inode_cachep == NULL)
13cf199d0088b77 Amir Goldstein 2017-06-12  1502  		return -ENOMEM;
13cf199d0088b77 Amir Goldstein 2017-06-12  1503  
13cf199d0088b77 Amir Goldstein 2017-06-12  1504  	err = register_filesystem(&ovl_fs_type);
2406a307ac7ddfd Jiufei Xue     2019-11-20  1505  	if (!err)
2406a307ac7ddfd Jiufei Xue     2019-11-20  1506  		return 0;
2406a307ac7ddfd Jiufei Xue     2019-11-20  1507  
13cf199d0088b77 Amir Goldstein 2017-06-12  1508  	kmem_cache_destroy(ovl_inode_cachep);
13cf199d0088b77 Amir Goldstein 2017-06-12  1509  
13cf199d0088b77 Amir Goldstein 2017-06-12  1510  	return err;
e9be9d5e76e3487 Miklos Szeredi 2014-10-24  1511  }
e9be9d5e76e3487 Miklos Szeredi 2014-10-24  1512  

:::::: The code at line 1499 was first introduced by commit
:::::: 13cf199d0088b77ab08a9594df2e73e775317ed2 ovl: allocate an ovl_inode struct

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
