Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A05CD19
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V52R3M82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702379373; x=1733915373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lR4iO+tZSHJIOkDRSGjf6CT6qjw3GtBw+1bWQgYZdwo=;
  b=V52R3M82yYIigPkDpp7spRuL9an/lkTM1sBAonxUqCDPLKZ2ciNL56TU
   xHOno4bFyPC/Df3O+0HWPO9Ze7B8iWMWmTxEwLSsrjhFnsLarR6tDBIzg
   jyxc4SCT2SEoIZ7MvjINp1dsut4mk1iuP7Q5ry8H45KkystWz6iedjptS
   f0mUs7GKieH4JmMjpiWUsfqJk+F32J5pGn+w3UtEGf99gkQnKbiy4LW73
   pg2AJUfQ6MZP58lLXDbrRvbkadsrO79NemEeKnKUBNhmXls2Y7extHfCQ
   BwSSc8JtlRMbPnZHvniFk5/0539GyHydHSTJzexpOBCxaBwjwaJk4JCcm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480987479"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="480987479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="21477930"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2023 03:09:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD0dj-000J5x-2h;
	Tue, 12 Dec 2023 11:09:28 +0000
Date: Tue, 12 Dec 2023 19:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-ioprio 1/1] include/linux/blk-mq.h:1161:37: error:
 'struct bio' has no member named 'bi_disk'
Message-ID: <202312121958.6U5Dk00Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-ioprio
head:   1541e2e932ed4580c4c40941c837512846386cf9
commit: 1541e2e932ed4580c4c40941c837512846386cf9 [1/1] block/blk-ioprio: Skip zoned writes that are not append operations
config: arc-randconfig-001-20231212 (https://download.01.org/0day-ci/archive/20231212/202312121958.6U5Dk00Z-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312121958.6U5Dk00Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312121958.6U5Dk00Z-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/blktrace_api.h:5,
                    from include/trace/events/block.h:8,
                    from fs/buffer.c:49:
   include/linux/blk-mq.h: In function 'blk_bio_is_seq_zoned_write':
>> include/linux/blk-mq.h:1161:37: error: 'struct bio' has no member named 'bi_disk'
    1161 |                 disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
         |                                     ^~
>> include/linux/blk-mq.h:1161:51: error: 'bio' is a pointer; did you mean to use '->'?
    1161 |                 disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
         |                                                   ^
         |                                                   ->
--
   In file included from block/blk-ioprio.c:15:
   include/linux/blk-mq.h: In function 'blk_bio_is_seq_zoned_write':
>> include/linux/blk-mq.h:1161:37: error: 'struct bio' has no member named 'bi_disk'
    1161 |                 disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
         |                                     ^~
>> include/linux/blk-mq.h:1161:51: error: 'bio' is a pointer; did you mean to use '->'?
    1161 |                 disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
         |                                                   ^
         |                                                   ->
>> include/linux/blk-mq.h:1162:1: warning: control reaches end of non-void function [-Wreturn-type]
    1162 | }
         | ^


vim +1161 include/linux/blk-mq.h

  1151	
  1152	/**
  1153	 * blk_bio_is_seq_zoned_write() - Check if @bio requires write serialization.
  1154	 * @bio: Bio to examine.
  1155	 *
  1156	 * Note: REQ_OP_ZONE_APPEND bios do not require serialization.
  1157	 */
  1158	static inline bool blk_bio_is_seq_zoned_write(struct bio *bio)
  1159	{
  1160		return op_needs_zoned_write_locking(bio_op(bio)) &&
> 1161			disk_zone_is_seq(bio->bi_disk, bio.bi_iter.bi_sector);
> 1162	}
  1163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
