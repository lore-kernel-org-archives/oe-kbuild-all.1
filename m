Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406891CDFD6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 08:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423391; cv=none; b=g3uIF6MY6vZo2qQdzS5Dprc5ai5bE0V7ByUwUbnngXTHN7NwX+nGeccj4sPOeXocZ4Yp2nHyPx0HmjHBUDg3XD42mvbARspVpxHPvHLcBNK/+MSDVZd5/riYjG0bDHnCLtZADgGj8s62YB8YuxAkDmrzZUiG8Wz2ndKb2Cl0mIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423391; c=relaxed/simple;
	bh=CDu01Rcg2QWSwC8nXoyjjwMBmCPQd6R1orJn6vkWUTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBbSxcagECic4+ytgnY62wKqVF1r3YWj92+9v4NjFixV0+4AxTZZYJx3mYQEmeCN/4bDDchPoTYH2xJBPGrbf7kJzGjemDUynoWBhqWtCfMBR+QJgakiB8fUCVUQ+p4D+jiFXVLQ0T9oo4zx+RmTjcvzNrxhNVm23h2yM3WndHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQFOweK0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQFOweK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423390; x=1765959390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CDu01Rcg2QWSwC8nXoyjjwMBmCPQd6R1orJn6vkWUTA=;
  b=XQFOweK0xTCHr9bIOgKPogrPhqg3zZ4N6PffGRjRQo0NVmjDJETnOVy1
   e93ac0YRqFHDNLmzZacybO6jMV6L9/UTh0EoVsvppPOWYkdqkB6y2NVyB
   90tmVcEcKJMPUhV5A2raghawrq/OwqNB1CqmJnFRhd0xY5OoygLJXQNT/
   XePQqLzTgDjXnuZNsMozo7RoW2MYEAQKGgz0892SmHzcUpUy9UEoxqwd+
   fjFawPrE+5A0YNhA7jgG0RqAK1oA/c0rUXo3nkfmtPatULCVYXIX6na21
   Sc0w382ePST76XK2XRhjm5ZMegOdqg8WIW7TmrsQlpHvYXG1bBPPua6BV
   Q==;
X-CSE-ConnectionGUID: M/0O1rJWSiO81Mvjh6Okcg==
X-CSE-MsgGUID: v8ej/HorS62E80SaI0e4SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22427647"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="22427647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:16:30 -0800
X-CSE-ConnectionGUID: H6ziaI5jTKK/71YLJ2x4Rg==
X-CSE-MsgGUID: eBiaNKe/ShCCkHLBUa04ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101608889"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Dec 2024 00:16:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNSkg-000EpS-0x;
	Tue, 17 Dec 2024 08:16:22 +0000
Date: Tue, 17 Dec 2024 16:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-remove-BLK_MQ_F_SHOULD_MERGE 1/1]
 block/blk-mq-debugfs.c:182:37: error: 'BLK_MQ_F_SHOULD_MERGE' undeclared
 here (not in a function)
Message-ID: <202412171659.rKplntvT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-remove-BLK_MQ_F_SHOULD_MERGE
head:   f7a2f23f70f1770dbfda0a60b2484a7390819eef
commit: f7a2f23f70f1770dbfda0a60b2484a7390819eef [1/1] block: remove BLK_MQ_F_SHOULD_MERGE
config: csky-randconfig-002-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171659.rKplntvT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171659.rKplntvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171659.rKplntvT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:26,
                    from block/blk-mq-debugfs.c:6:
>> block/blk-mq-debugfs.c:182:37: error: 'BLK_MQ_F_SHOULD_MERGE' undeclared here (not in a function)
     182 | #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
         |                                     ^~~~~~~~~
   include/linux/log2.h:158:30: note: in definition of macro 'ilog2'
     158 |         __builtin_constant_p(n) ?       \
         |                              ^
   block/blk-mq-debugfs.c:184:9: note: in expansion of macro 'HCTX_FLAG_NAME'
     184 |         HCTX_FLAG_NAME(SHOULD_MERGE),
         |         ^~~~~~~~~~~~~~
>> include/linux/log2.h:157:1: error: array index in initializer not of integer type
     157 | ( \
         | ^
   block/blk-mq-debugfs.c:182:31: note: in expansion of macro 'ilog2'
     182 | #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
         |                               ^~~~~
   block/blk-mq-debugfs.c:184:9: note: in expansion of macro 'HCTX_FLAG_NAME'
     184 |         HCTX_FLAG_NAME(SHOULD_MERGE),
         |         ^~~~~~~~~~~~~~
   include/linux/log2.h:157:1: note: (near initialization for 'hctx_flag_name')
     157 | ( \
         | ^
   block/blk-mq-debugfs.c:182:31: note: in expansion of macro 'ilog2'
     182 | #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
         |                               ^~~~~
   block/blk-mq-debugfs.c:184:9: note: in expansion of macro 'HCTX_FLAG_NAME'
     184 |         HCTX_FLAG_NAME(SHOULD_MERGE),
         |         ^~~~~~~~~~~~~~


vim +/BLK_MQ_F_SHOULD_MERGE +182 block/blk-mq-debugfs.c

f5c0b0910ac4c1 Bart Van Assche 2017-03-30  181  
1a435111f8eb30 Omar Sandoval   2017-05-04 @182  #define HCTX_FLAG_NAME(name) [ilog2(BLK_MQ_F_##name)] = #name
f5c0b0910ac4c1 Bart Van Assche 2017-03-30  183  static const char *const hctx_flag_name[] = {
1a435111f8eb30 Omar Sandoval   2017-05-04  184  	HCTX_FLAG_NAME(SHOULD_MERGE),
51db1c37ee1661 Ming Lei        2020-08-19  185  	HCTX_FLAG_NAME(TAG_QUEUE_SHARED),
bf0beec0607db3 Ming Lei        2020-05-29  186  	HCTX_FLAG_NAME(STACKING),
02f938e9fed168 John Garry      2021-01-08  187  	HCTX_FLAG_NAME(TAG_HCTX_SHARED),
1c83c5375e2f1b John Garry      2024-07-19  188  	HCTX_FLAG_NAME(BLOCKING),
1c83c5375e2f1b John Garry      2024-07-19  189  	HCTX_FLAG_NAME(NO_SCHED),
1c83c5375e2f1b John Garry      2024-07-19  190  	HCTX_FLAG_NAME(NO_SCHED_BY_DEFAULT),
f5c0b0910ac4c1 Bart Van Assche 2017-03-30  191  };
1a435111f8eb30 Omar Sandoval   2017-05-04  192  #undef HCTX_FLAG_NAME
f5c0b0910ac4c1 Bart Van Assche 2017-03-30  193  

:::::: The code at line 182 was first introduced by commit
:::::: 1a435111f8eb30b370e3891caebb1d1ca61f41ec blk-mq-debugfs: clean up flag definitions

:::::: TO: Omar Sandoval <osandov@fb.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
