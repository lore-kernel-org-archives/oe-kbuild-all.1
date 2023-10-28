Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7AE17E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 00:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ks/jNStA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698451503; x=1729987503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnA49TQO7OC79LCriMiSOmZ/Z006JGrMfGSr0RD3q7w=;
  b=Ks/jNStAJnpA762sjRkDNUL6mIfm/bzxwJ5Kfw5X9PEdoU2b7lYb5dPY
   o+S8d4+B9JTqMP9HVK78ELapryl+j7vNACSKlFyiRtGN+0CGMVCcyYXa6
   51Wmd4hvGqTC/1zrbvZU1sidxtSLV3MzvMJhIMj1EVmq5jz3ZNBsqnHYh
   mL6K6B7JL2cUkwE85n0NUlWemenx1E1/4vTbJwYd3oxLo08T9thNRQLPz
   VXoafFqD+9n/pUcQEDvihy2IQ2Bzvu53s2cDSxDjfXx4sB8LnsiZ2sWGH
   gWFEBk4tmyIeCHAz2ampGlOf5j9Yj+bLJjpW61nEfN4gVi9sditk8bpl0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="418976459"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="418976459"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 17:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="903432500"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="903432500"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2023 17:02:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwWp0-000BIN-2R;
	Sat, 28 Oct 2023 00:04:58 +0000
Date: Sat, 28 Oct 2023 08:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:dev_t-unsigned 1/1] drivers/mtd/ubi/block.c:406
 ubiblock_create() warn: unsigned 'gd->first_minor' is never less than zero.
Message-ID: <202310280753.DpxDZFRv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git dev_t-unsigned
head:   1bc09c5d03e17b7af64cdf96f4908bdc3ff2ee1b
commit: 1bc09c5d03e17b7af64cdf96f4908bdc3ff2ee1b [1/1] block: dev_t components are unsigned
config: i386-randconfig-141-20231028 (https://download.01.org/0day-ci/archive/20231028/202310280753.DpxDZFRv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231028/202310280753.DpxDZFRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280753.DpxDZFRv-lkp@intel.com/

New smatch warnings:
drivers/mtd/ubi/block.c:406 ubiblock_create() warn: unsigned 'gd->first_minor' is never less than zero.

Old smatch warnings:
drivers/mtd/ubi/block.c:225 ubiblock_read() error: uninitialized symbol 'ret'.

vim +406 drivers/mtd/ubi/block.c

e46131b9fd31155 Richard Weinberger  2019-09-01  348  
4d283ee2517303a Artem Bityutskiy    2014-03-04  349  int ubiblock_create(struct ubi_volume_info *vi)
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  350  {
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  351  	struct ubiblock *dev;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  352  	struct gendisk *gd;
e46131b9fd31155 Richard Weinberger  2019-09-01  353  	u64 disk_capacity;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  354  	int ret;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  355  
e46131b9fd31155 Richard Weinberger  2019-09-01  356  	ret = calc_disk_capacity(vi, &disk_capacity);
e46131b9fd31155 Richard Weinberger  2019-09-01  357  	if (ret) {
e46131b9fd31155 Richard Weinberger  2019-09-01  358  		return ret;
e46131b9fd31155 Richard Weinberger  2019-09-01  359  	}
e46131b9fd31155 Richard Weinberger  2019-09-01  360  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  361  	/* Check that the volume isn't already handled */
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  362  	mutex_lock(&devices_mutex);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  363  	if (find_dev_nolock(vi->ubi_num, vi->vol_id)) {
7f29ae9f977bcdc Bradley Bolen       2018-01-18  364  		ret = -EEXIST;
7f29ae9f977bcdc Bradley Bolen       2018-01-18  365  		goto out_unlock;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  366  	}
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  367  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  368  	dev = kzalloc(sizeof(struct ubiblock), GFP_KERNEL);
7f29ae9f977bcdc Bradley Bolen       2018-01-18  369  	if (!dev) {
7f29ae9f977bcdc Bradley Bolen       2018-01-18  370  		ret = -ENOMEM;
7f29ae9f977bcdc Bradley Bolen       2018-01-18  371  		goto out_unlock;
7f29ae9f977bcdc Bradley Bolen       2018-01-18  372  	}
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  373  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  374  	mutex_init(&dev->dev_mutex);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  375  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  376  	dev->ubi_num = vi->ubi_num;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  377  	dev->vol_id = vi->vol_id;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  378  	dev->leb_size = vi->usable_leb_size;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  379  
77567b25ab9f06c Christoph Hellwig   2021-06-02  380  	dev->tag_set.ops = &ubiblock_mq_ops;
77567b25ab9f06c Christoph Hellwig   2021-06-02  381  	dev->tag_set.queue_depth = 64;
77567b25ab9f06c Christoph Hellwig   2021-06-02  382  	dev->tag_set.numa_node = NUMA_NO_NODE;
91cc8fbcc8c7053 Christoph Hellwig   2023-01-12  383  	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING;
77567b25ab9f06c Christoph Hellwig   2021-06-02  384  	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
77567b25ab9f06c Christoph Hellwig   2021-06-02  385  	dev->tag_set.driver_data = dev;
77567b25ab9f06c Christoph Hellwig   2021-06-02  386  	dev->tag_set.nr_hw_queues = 1;
77567b25ab9f06c Christoph Hellwig   2021-06-02  387  
77567b25ab9f06c Christoph Hellwig   2021-06-02  388  	ret = blk_mq_alloc_tag_set(&dev->tag_set);
77567b25ab9f06c Christoph Hellwig   2021-06-02  389  	if (ret) {
77567b25ab9f06c Christoph Hellwig   2021-06-02  390  		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
6c97bb345f163e4 Li zeming           2022-08-17  391  		goto out_free_dev;
77567b25ab9f06c Christoph Hellwig   2021-06-02  392  	}
77567b25ab9f06c Christoph Hellwig   2021-06-02  393  
77567b25ab9f06c Christoph Hellwig   2021-06-02  394  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  395  	/* Initialize the gendisk of this ubiblock device */
77567b25ab9f06c Christoph Hellwig   2021-06-02  396  	gd = blk_mq_alloc_disk(&dev->tag_set, dev);
77567b25ab9f06c Christoph Hellwig   2021-06-02  397  	if (IS_ERR(gd)) {
77567b25ab9f06c Christoph Hellwig   2021-06-02  398  		ret = PTR_ERR(gd);
77567b25ab9f06c Christoph Hellwig   2021-06-02  399  		goto out_free_tags;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  400  	}
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  401  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  402  	gd->fops = &ubiblock_ops;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  403  	gd->major = ubiblock_major;
77567b25ab9f06c Christoph Hellwig   2021-06-02  404  	gd->minors = 1;
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17  405  	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17 @406  	if (gd->first_minor < 0) {
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17  407  		dev_err(disk_to_dev(gd),
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17  408  			"block: dynamic minor allocation failed");
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17  409  		ret = -ENODEV;
77567b25ab9f06c Christoph Hellwig   2021-06-02  410  		goto out_cleanup_disk;
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17  411  	}
1ebe2e5f9d68e94 Christoph Hellwig   2021-11-22  412  	gd->flags |= GENHD_FL_NO_PART;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  413  	gd->private_data = dev;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  414  	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  415  	set_capacity(gd, disk_capacity);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  416  	dev->gd = gd;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  417  
77567b25ab9f06c Christoph Hellwig   2021-06-02  418  	dev->rq = gd->queue;
ff1f48ee3bb3af2 Richard Weinberger  2015-01-10  419  	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  420  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  421  	list_add_tail(&dev->list, &ubiblock_devices);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  422  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  423  	/* Must be the last step: anyone can call file ops from now on */
05b8773ca33253e Daniel Golle        2022-12-22  424  	ret = device_add_disk(vi->dev, dev->gd, NULL);
ed73919124b2e48 Luis Chamberlain    2021-11-03  425  	if (ret)
91cc8fbcc8c7053 Christoph Hellwig   2023-01-12  426  		goto out_remove_minor;
ed73919124b2e48 Luis Chamberlain    2021-11-03  427  
326087033108e78 Tanya Brokhman      2014-10-20  428  	dev_info(disk_to_dev(dev->gd), "created from ubi%d:%d(%s)",
326087033108e78 Tanya Brokhman      2014-10-20  429  		 dev->ubi_num, dev->vol_id, vi->name);
7f29ae9f977bcdc Bradley Bolen       2018-01-18  430  	mutex_unlock(&devices_mutex);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  431  	return 0;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  432  
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17  433  out_remove_minor:
8fcf2d012c8641c Harshit Mogalapalli 2023-02-14  434  	list_del(&dev->list);
2bf50d42f3a4181 Dan Ehrenberg       2015-03-17  435  	idr_remove(&ubiblock_minor_idr, gd->first_minor);
77567b25ab9f06c Christoph Hellwig   2021-06-02  436  out_cleanup_disk:
8b9ab62662048a3 Christoph Hellwig   2022-06-19  437  	put_disk(dev->gd);
77567b25ab9f06c Christoph Hellwig   2021-06-02  438  out_free_tags:
77567b25ab9f06c Christoph Hellwig   2021-06-02  439  	blk_mq_free_tag_set(&dev->tag_set);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  440  out_free_dev:
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  441  	kfree(dev);
7f29ae9f977bcdc Bradley Bolen       2018-01-18  442  out_unlock:
7f29ae9f977bcdc Bradley Bolen       2018-01-18  443  	mutex_unlock(&devices_mutex);
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  444  
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  445  	return ret;
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  446  }
9d54c8a33eec782 Ezequiel Garcia     2014-02-25  447  

:::::: The code at line 406 was first introduced by commit
:::::: 2bf50d42f3a418153d2964ca0f25655177f36445 UBI: block: Dynamically allocate minor numbers

:::::: TO: Dan Ehrenberg <dehrenberg@chromium.org>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
