Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E817C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 03:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sg2wV7Yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703819697; x=1735355697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gY3zE+3MrVBfdoGL0r6wUrnLx7PlvBALAwU7bpAeDGU=;
  b=Sg2wV7Yykul6ev4qxM26UxN5zudtn7W+hSjFJRgKmYOmTAdClCqlfX/V
   3y6wMJI9VAkl1MOYegeVnMuGIAY96/QMPFNpDVn5AnpjCbiFVYFlm6YuU
   N+d8n1GZwWqQfFONVPHnqnlT0JWH+S2IG3X3z42Lj755C0YB+mXzIu8WW
   MzNSu5t5yHfgXiuTqMaYi01HHXjRgY3TcOosBgT+EVfqSJo2tUgTyn4go
   qIF/FDe0rYaScYJ2fU3Swvl5yjIkfLO7as2x4n2hMgThLkRIwINmri2Jl
   Iu/bB+E/kWij7e8BnBJP4++TCpCOX2q1y3pcrApK24ESCEFvdfQQhzNTt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="395504541"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="395504541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 19:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="869292266"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="869292266"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Dec 2023 19:14:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ3Ko-000H2y-0C;
	Fri, 29 Dec 2023 03:14:54 +0000
Date: Fri, 29 Dec 2023 11:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-limits 41/45] drivers/s390/block/scm_blk.c:439:43:
 error: 'nr_max_blk' undeclared
Message-ID: <202312291100.nmSK59sH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-limits
head:   337f45dec9ea74309924c682e15eeef50d86b1d9
commit: df7e4cab19dae1f0aeb3b45b090922d52e0ce818 [41/45] scm_blk: pass queue_limits to blk_mq_alloc_disk
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231229/202312291100.nmSK59sH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291100.nmSK59sH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291100.nmSK59sH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/s390/block/scm_blk.c: In function 'scm_blk_dev_setup':
>> drivers/s390/block/scm_blk.c:439:43: error: 'nr_max_blk' undeclared (first use in this function)
     439 |                 .max_hw_sectors         = nr_max_blk << 3,
         |                                           ^~~~~~~~~~
   drivers/s390/block/scm_blk.c:439:43: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/s390/block/scm_blk.c:441:10: error: expected ',' or ';' before ':' token
     441 |         }:
         |          ^
>> drivers/s390/block/scm_blk.c:446:9: error: 'devindex' undeclared (first use in this function); did you mean 'pte_index'?
     446 |         devindex = atomic_inc_return(&nr_devices) - 1;
         |         ^~~~~~~~
         |         pte_index


vim +/nr_max_blk +439 drivers/s390/block/scm_blk.c

   434	
   435	int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
   436	{
   437		struct queue_limits lim = {
   438			.logical_block_size	= 1 << 12,
 > 439			.max_hw_sectors		= nr_max_blk << 3,
   440			.max_segments		= nr_max_blk,
 > 441		}:
   442		unsigned int devindex, nr_max_blk;
   443		struct request_queue *rq;
   444		int len, ret;
   445	
 > 446		devindex = atomic_inc_return(&nr_devices) - 1;
   447		/* scma..scmz + scmaa..scmzz */
   448		if (devindex > 701) {
   449			ret = -ENODEV;
   450			goto out;
   451		}
   452	
   453		bdev->scmdev = scmdev;
   454		bdev->state = SCM_OPER;
   455		spin_lock_init(&bdev->lock);
   456		atomic_set(&bdev->queued_reqs, 0);
   457	
   458		bdev->tag_set.ops = &scm_mq_ops;
   459		bdev->tag_set.cmd_size = sizeof(blk_status_t);
   460		bdev->tag_set.nr_hw_queues = nr_requests;
   461		bdev->tag_set.queue_depth = nr_requests_per_io * nr_requests;
   462		bdev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
   463		bdev->tag_set.numa_node = NUMA_NO_NODE;
   464	
   465		ret = blk_mq_alloc_tag_set(&bdev->tag_set);
   466		if (ret)
   467			goto out;
   468	
   469		bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, &lim, scmdev);
   470		if (IS_ERR(bdev->gendisk)) {
   471			ret = PTR_ERR(bdev->gendisk);
   472			goto out_tag;
   473		}
   474		rq = bdev->rq = bdev->gendisk->queue;
   475		nr_max_blk = min(scmdev->nr_max_block,
   476				 (unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
   477	
   478		blk_queue_flag_set(QUEUE_FLAG_NONROT, rq);
   479		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
   480	
   481		bdev->gendisk->private_data = scmdev;
   482		bdev->gendisk->fops = &scm_blk_devops;
   483		bdev->gendisk->major = scm_major;
   484		bdev->gendisk->first_minor = devindex * SCM_NR_PARTS;
   485		bdev->gendisk->minors = SCM_NR_PARTS;
   486	
   487		len = snprintf(bdev->gendisk->disk_name, DISK_NAME_LEN, "scm");
   488		if (devindex > 25) {
   489			len += snprintf(bdev->gendisk->disk_name + len,
   490					DISK_NAME_LEN - len, "%c",
   491					'a' + (devindex / 26) - 1);
   492			devindex = devindex % 26;
   493		}
   494		snprintf(bdev->gendisk->disk_name + len, DISK_NAME_LEN - len, "%c",
   495			 'a' + devindex);
   496	
   497		/* 512 byte sectors */
   498		set_capacity(bdev->gendisk, scmdev->size >> 9);
   499		ret = device_add_disk(&scmdev->dev, bdev->gendisk, NULL);
   500		if (ret)
   501			goto out_cleanup_disk;
   502	
   503		return 0;
   504	
   505	out_cleanup_disk:
   506		put_disk(bdev->gendisk);
   507	out_tag:
   508		blk_mq_free_tag_set(&bdev->tag_set);
   509	out:
   510		atomic_dec(&nr_devices);
   511		return ret;
   512	}
   513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
