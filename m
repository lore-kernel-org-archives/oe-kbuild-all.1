Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C094111A1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708566922; cv=none; b=Os54Azj4i73FLqcq+hyfrxuA6aODPOU7sXEzgxDjCXPbUk8fVy1tzWX+dl/EYEzD/fWKM0ZAgJGmULFY1D06IHezCSWNgB74943PcRJb+ugbAv45oOSAiEhOov/tWH9mwHzZM3Tkop7o8bNnUqnybbOy+l+AxV+YdO4YfgzRT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708566922; c=relaxed/simple;
	bh=9ZLyzyLV8yAdVigU6jIit2YvvBS0HqTPdKOFbNWiGVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVELpmf3fIh0lQwb90lPB/Hu54xE2E7AYFcf16vlK+SlCgYTBpQc1DecjBv7bvTeuZ/56zP9hn6MZwa0EogsGOGOK7KgXxlxQSVtwy7fC96ngG50C3VEU3Gsal5X6w0arIxSEE2nElc0OzjmRhz8ionwij2qdNYNRcta/1q4V/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO0K0fRb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO0K0fRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708566920; x=1740102920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ZLyzyLV8yAdVigU6jIit2YvvBS0HqTPdKOFbNWiGVU=;
  b=ZO0K0fRbcSE87t3rZV4ODvRv7z/TgPEAqLdHOvPv3m/QfVZH5KqeUyZn
   ygJzDj8OQ35QY5MsFwSYGTBglkr3LnhYOfNQ0MCZJUJlkbN+Oys0xkV0X
   otId3ylyaDdmov6aYK3v4ISmf4DDY5iBZ+Bbm+L3HWyJK9tEIxvlKsO5D
   VwtCK57T0sP9tq/ghKVWAoE2uddA2vr/LTZYuXHkT0nVHx+oYx3/Q4Bq+
   fKlrQkEBqgR/BVigaark9mWtxtnaLB5OLDqGAlMO3VfmG0ZfME33E78d6
   RrKtTOFaxIoUIV7u1EhvUUexcxqyBXvAudjgAmhSGGhFjx/vylKo9BJTc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2624881"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2624881"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 17:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="36130653"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Feb 2024 17:55:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcyIs-0005sp-0Z;
	Thu, 22 Feb 2024 01:55:14 +0000
Date: Thu, 22 Feb 2024 09:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] mm, slab: use an enum to define SLAB_ cache creation
 flags
Message-ID: <202402220942.XxR0oby3-lkp@intel.com>
References: <20240220-slab-cleanup-flags-v1-2-e657e373944a@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-slab-cleanup-flags-v1-2-e657e373944a@suse.cz>

Hi Vlastimil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6613476e225e090cc9aad49be7fa504e290dd33d]

url:    https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/mm-slab-deprecate-SLAB_MEM_SPREAD-flag/20240221-005936
base:   6613476e225e090cc9aad49be7fa504e290dd33d
patch link:    https://lore.kernel.org/r/20240220-slab-cleanup-flags-v1-2-e657e373944a%40suse.cz
patch subject: [PATCH 2/3] mm, slab: use an enum to define SLAB_ cache creation flags
config: i386-randconfig-r111-20240222 (https://download.01.org/0day-ci/archive/20240222/202402220942.XxR0oby3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220942.XxR0oby3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220942.XxR0oby3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/overlayfs/super.c:1499:63: sparse: sparse: restricted slab_flags_t degrades to integer
>> fs/overlayfs/super.c:1499:62: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got unsigned int @@
   fs/overlayfs/super.c:1499:62: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/overlayfs/super.c:1499:62: sparse:     got unsigned int
--
>> fs/tracefs/inode.c:793:54: sparse: sparse: restricted slab_flags_t degrades to integer
>> fs/tracefs/inode.c:792:69: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got unsigned int @@
   fs/tracefs/inode.c:792:69: sparse:     expected restricted slab_flags_t [usertype] flags
   fs/tracefs/inode.c:792:69: sparse:     got unsigned int

vim +1499 fs/overlayfs/super.c

13cf199d0088b7 Amir Goldstein 2017-06-12  1491  
e9be9d5e76e348 Miklos Szeredi 2014-10-24  1492  static int __init ovl_init(void)
e9be9d5e76e348 Miklos Szeredi 2014-10-24  1493  {
13cf199d0088b7 Amir Goldstein 2017-06-12  1494  	int err;
13cf199d0088b7 Amir Goldstein 2017-06-12  1495  
13cf199d0088b7 Amir Goldstein 2017-06-12  1496  	ovl_inode_cachep = kmem_cache_create("ovl_inode",
13cf199d0088b7 Amir Goldstein 2017-06-12  1497  					     sizeof(struct ovl_inode), 0,
13cf199d0088b7 Amir Goldstein 2017-06-12  1498  					     (SLAB_RECLAIM_ACCOUNT|
13cf199d0088b7 Amir Goldstein 2017-06-12 @1499  					      SLAB_MEM_SPREAD|SLAB_ACCOUNT),
13cf199d0088b7 Amir Goldstein 2017-06-12  1500  					     ovl_inode_init_once);
13cf199d0088b7 Amir Goldstein 2017-06-12  1501  	if (ovl_inode_cachep == NULL)
13cf199d0088b7 Amir Goldstein 2017-06-12  1502  		return -ENOMEM;
13cf199d0088b7 Amir Goldstein 2017-06-12  1503  
13cf199d0088b7 Amir Goldstein 2017-06-12  1504  	err = register_filesystem(&ovl_fs_type);
2406a307ac7ddf Jiufei Xue     2019-11-20  1505  	if (!err)
2406a307ac7ddf Jiufei Xue     2019-11-20  1506  		return 0;
2406a307ac7ddf Jiufei Xue     2019-11-20  1507  
13cf199d0088b7 Amir Goldstein 2017-06-12  1508  	kmem_cache_destroy(ovl_inode_cachep);
13cf199d0088b7 Amir Goldstein 2017-06-12  1509  
13cf199d0088b7 Amir Goldstein 2017-06-12  1510  	return err;
e9be9d5e76e348 Miklos Szeredi 2014-10-24  1511  }
e9be9d5e76e348 Miklos Szeredi 2014-10-24  1512  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
