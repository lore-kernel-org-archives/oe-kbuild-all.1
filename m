Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723431FC118
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589909; cv=none; b=SB/4WHd/Oh5YZ42FDNItpkb//wYxl9dZk3bxa0j4fCwDavgsk2wIUpmaNhsr/w4d4uSnOMZ+3TTNMrBmAgVWUd9IGcyR4YmPA8BSDIKjl6YWiE4PJkw2Zv3UCV5C6tu+x5MtqIYYj/HCxykBRzj3qYxBgkn0dkPML/c9s7BD4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589909; c=relaxed/simple;
	bh=wzcSeabHoWYOS2dUWDIYl3V+m6BIhWH94x5wmNuO918=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFlpPXYwCujdMK7WjRPaQjm0nrq8wCUU2y+lZ+Uu+6aUg965z3wlhdIIn4KY2NjKPZXJp6ScrRLB7ez1rtCzvVmbV8BoDVPyfJLaXI0+WWA2NysnuK6CC+Ac4DS23EUH0YbEsnPTFJhRknHEv8vI5sAQOTOtEW0BVRKh0ObBjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdiCP7L8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdiCP7L8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738589907; x=1770125907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzcSeabHoWYOS2dUWDIYl3V+m6BIhWH94x5wmNuO918=;
  b=CdiCP7L80JVz1BdCdhPnUpYyya+pzv+J0Nwo3XSmNj0sfJiZ+VkP05sS
   RkXzBYgK2aj+de0xFeenlosbgOOyT31ofi/vMHyj1Lv/RPEsaDRiAfjDq
   dWQUBhmEWi2kXHihh7lgv0d5MpZPhYIHGqJjPNy600kALGPI21IM+WHZV
   JAsqzmhBmjEse93FJT66WFx+wobpQ0d1PZsK5KepKDU8fWDXD4W7Cd2rX
   ZdFxkANX4LTruvQIgtaawwk2+Wro0QwAiaklLq2sRWyTTrrHggBgKw1sm
   tJQ28hiAq40q1Qyq4uzt/I9tTXtBWwE0/KiwLA0+jSIxjjeOK7esp1hG+
   w==;
X-CSE-ConnectionGUID: tAYcLqD6TzmQs0AIrmPrPQ==
X-CSE-MsgGUID: Rfc3ddxFT+WBVJpVsOp8HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49685232"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49685232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:38:26 -0800
X-CSE-ConnectionGUID: KE84QMUDT0+2a+9Kjs9sUQ==
X-CSE-MsgGUID: CCYs4gw2TyylKndbt5QLMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110107251"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2025 05:38:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tewed-000qxX-0V;
	Mon, 03 Feb 2025 13:38:23 +0000
Date: Mon, 3 Feb 2025 21:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xfs-data-crc 5/21] drivers/md/dm-table.c:1048:7: warning:
 variable 'mempool_needs_integrity' set but not used
Message-ID: <202502032107.KlCWumd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git xfs-data-crc
head:   99d5f00e7209b1efbf51c27f4746718c27104289
commit: f08e9d973ef71daf81ae6cd7eb64acf21a5a036e [5/21] block: split struct bio_integrity_data
config: hexagon-randconfig-002-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032107.KlCWumd8-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032107.KlCWumd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032107.KlCWumd8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-table.c:1048:7: warning: variable 'mempool_needs_integrity' set but not used [-Wunused-but-set-variable]
    1048 |         bool mempool_needs_integrity = t->integrity_supported;
         |              ^
   1 warning generated.


vim +/mempool_needs_integrity +1048 drivers/md/dm-table.c

e5863d9ad75492 Mike Snitzer      2014-12-17  1040  
17e149b8f73ba1 Mike Snitzer      2015-03-11  1041  static int dm_table_alloc_md_mempools(struct dm_table *t, struct mapped_device *md)
e6ee8c0b767540 Kiyoshi Ueda      2009-06-22  1042  {
7e0d574f2683a2 Bart Van Assche   2017-04-27  1043  	enum dm_queue_mode type = dm_table_get_type(t);
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1044  	unsigned int per_io_data_size = 0, front_pad, io_front_pad;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1045  	unsigned int min_pool_size = 0, pool_size;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1046  	struct dm_md_mempools *pools;
8023e144f9d6e3 Christoph Hellwig 2024-06-17  1047  	unsigned int bioset_flags = 0;
617069741dfbb1 Mikulas Patocka   2024-07-10 @1048  	bool mempool_needs_integrity = t->integrity_supported;
e6ee8c0b767540 Kiyoshi Ueda      2009-06-22  1049  
78d8e58a086b21 Mike Snitzer      2015-06-26  1050  	if (unlikely(type == DM_TYPE_NONE)) {
43e6c111824c75 Mikulas Patocka   2022-08-24  1051  		DMERR("no table type is set, can't allocate mempools");
e6ee8c0b767540 Kiyoshi Ueda      2009-06-22  1052  		return -EINVAL;
e6ee8c0b767540 Kiyoshi Ueda      2009-06-22  1053  	}
e6ee8c0b767540 Kiyoshi Ueda      2009-06-22  1054  
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1055  	pools = kzalloc_node(sizeof(*pools), GFP_KERNEL, md->numa_node_id);
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1056  	if (!pools)
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1057  		return -ENOMEM;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1058  
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1059  	if (type == DM_TYPE_REQUEST_BASED) {
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1060  		pool_size = dm_get_reserved_rq_based_ios();
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1061  		front_pad = offsetof(struct dm_rq_clone_bio_info, clone);
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1062  		goto init_bs;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1063  	}
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1064  
8023e144f9d6e3 Christoph Hellwig 2024-06-17  1065  	if (md->queue->limits.features & BLK_FEAT_POLL)
8023e144f9d6e3 Christoph Hellwig 2024-06-17  1066  		bioset_flags |= BIOSET_PERCPU_CACHE;
8023e144f9d6e3 Christoph Hellwig 2024-06-17  1067  
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1068  	for (unsigned int i = 0; i < t->num_targets; i++) {
564b5c5476cdb7 Mike Snitzer      2022-07-05  1069  		struct dm_target *ti = dm_table_get_target(t, i);
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1070  
0776aa0e30aa31 Mike Snitzer      2017-12-08  1071  		per_io_data_size = max(per_io_data_size, ti->per_io_data_size);
0776aa0e30aa31 Mike Snitzer      2017-12-08  1072  		min_pool_size = max(min_pool_size, ti->num_flush_bios);
617069741dfbb1 Mikulas Patocka   2024-07-10  1073  
617069741dfbb1 Mikulas Patocka   2024-07-10  1074  		mempool_needs_integrity |= ti->mempool_needs_integrity;
78d8e58a086b21 Mike Snitzer      2015-06-26  1075  	}
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1076  	pool_size = max(dm_get_reserved_bio_based_ios(), min_pool_size);
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1077  	front_pad = roundup(per_io_data_size,
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1078  		__alignof__(struct dm_target_io)) + DM_TARGET_IO_BIO_OFFSET;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1079  
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1080  	io_front_pad = roundup(per_io_data_size,
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1081  		__alignof__(struct dm_io)) + DM_IO_BIO_OFFSET;
8023e144f9d6e3 Christoph Hellwig 2024-06-17  1082  	if (bioset_init(&pools->io_bs, pool_size, io_front_pad, bioset_flags))
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1083  		goto out_free_pools;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1084  init_bs:
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1085  	if (bioset_init(&pools->bs, pool_size, front_pad, 0))
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1086  		goto out_free_pools;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1087  
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1088  	t->mempools = pools;
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1089  	return 0;
78d8e58a086b21 Mike Snitzer      2015-06-26  1090  
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1091  out_free_pools:
e810cb78bc4b4f Christoph Hellwig 2022-06-08  1092  	dm_free_md_mempools(pools);
4e6e36c3714364 Mike Snitzer      2015-06-26  1093  	return -ENOMEM;
e6ee8c0b767540 Kiyoshi Ueda      2009-06-22  1094  }
e6ee8c0b767540 Kiyoshi Ueda      2009-06-22  1095  

:::::: The code at line 1048 was first introduced by commit
:::::: 617069741dfbb141bc4574531a5dbbbad8ddf197 dm: introduce the target flag mempool_needs_integrity

:::::: TO: Mikulas Patocka <mpatocka@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
