Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A99211194
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmIS0k/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703982795; x=1735518795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2RNIy2Q9lvDCsdr3dQp5iMSKFMnWCd/pDQdqI1EZKBM=;
  b=SmIS0k/+OGJkVqFdp5B4pZalvSIxHI511vAM7R+BR9FvDD5fd7pjocIh
   xsx8w8Uju/k/JHdntg0fQqy0V14kuurCZqlFv9v8w8lxVKCj/qIts/LxS
   w7gbaqMU0VCfCH91VLiIfKYvO8RfVJ/u5zJdOu2B/2eN3U9nlIVmxqajl
   +/Vl3+YCh88IUqYHZPY1ElS0h07MyIV6fZlVDqZW0WJA5ughWNObq5I7k
   EGE5xcpbySIxXPsrCM9JOm9KRMaUNWhVzWzyUTfAtnoYw6Ryl1pyuN+2+
   t/OtSMwwEvPAxuZc2DtYj6kscxiCEGS48K68A0Dyr6dKF4Rq5NO4H6nyA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="482909590"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="482909590"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 16:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="845001726"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="845001726"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Dec 2023 16:33:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJjlK-000IrV-05;
	Sun, 31 Dec 2023 00:33:06 +0000
Date: Sun, 31 Dec 2023 08:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-limits 36/46] drivers/cdrom/gdrom.c:832:1: warning:
 control reaches end of non-void function
Message-ID: <202312310819.ub0q2JwD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-limits
head:   2ac689ccdb138ca7b07b7a731204f8a66bc4eed7
commit: 7b5e4342c4f9a51c309346d1cdcee3cdca5fc9cb [36/46] gdrom: pass queue_limits to blk_mq_alloc_disk
config: sh-dreamcast_defconfig (https://download.01.org/0day-ci/archive/20231231/202312310819.ub0q2JwD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312310819.ub0q2JwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310819.ub0q2JwD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cdrom/gdrom.c: In function 'gdrom_get_last_session':
   drivers/cdrom/gdrom.c:315:21: warning: variable 'lentry' set but not used [-Wunused-but-set-variable]
     315 |         int fentry, lentry, track, data, err;
         |                     ^~~~~~
   drivers/cdrom/gdrom.c: In function 'probe_gdrom':
   drivers/cdrom/gdrom.c:748:9: error: expected ',' or ';' before 'int'
     748 |         int err;
         |         ^~~
   drivers/cdrom/gdrom.c:773:17: error: 'err' undeclared (first use in this function)
     773 |                 err = -ENOMEM;
         |                 ^~~
   drivers/cdrom/gdrom.c:773:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/cdrom/gdrom.c:832:1: warning: control reaches end of non-void function [-Wreturn-type]
     832 | }
         | ^


vim +832 drivers/cdrom/gdrom.c

ad5fc6bb722146 Jens Axboe         2018-10-15  734  
74ee1a7590b782 Adrian McMenamin   2008-01-21  735  /*
74ee1a7590b782 Adrian McMenamin   2008-01-21  736   * register this as a block device and as compliant with the
74ee1a7590b782 Adrian McMenamin   2008-01-21  737   * universal CD Rom driver interface
74ee1a7590b782 Adrian McMenamin   2008-01-21  738   */
0fe763c570ad27 Greg Kroah-Hartman 2012-12-21  739  static int probe_gdrom(struct platform_device *devptr)
74ee1a7590b782 Adrian McMenamin   2008-01-21  740  {
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  741  	struct queue_limits lim = {
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  742  		.logical_block_size		= GDROM_HARD_SECTOR,
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  743  		/* using DMA so memory will need to be contiguous */
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  744  		.max_segments			= 1,
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  745  		/* set a large max size to get most from DMA */
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  746  		.max_segment_size		= 0x40000,
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  747  	}
74ee1a7590b782 Adrian McMenamin   2008-01-21 @748  	int err;
9183f01b5e6e32 Greg Kroah-Hartman 2021-05-06  749  
9183f01b5e6e32 Greg Kroah-Hartman 2021-05-06  750  	/*
9183f01b5e6e32 Greg Kroah-Hartman 2021-05-06  751  	 * Ensure our "one" device is initialized properly in case of previous
9183f01b5e6e32 Greg Kroah-Hartman 2021-05-06  752  	 * usages of it
9183f01b5e6e32 Greg Kroah-Hartman 2021-05-06  753  	 */
9183f01b5e6e32 Greg Kroah-Hartman 2021-05-06  754  	memset(&gd, 0, sizeof(gd));
9183f01b5e6e32 Greg Kroah-Hartman 2021-05-06  755  
74ee1a7590b782 Adrian McMenamin   2008-01-21  756  	/* Start the device */
74ee1a7590b782 Adrian McMenamin   2008-01-21  757  	if (gdrom_execute_diagnostic() != 1) {
f8b489980d9427 Kefeng Wang        2019-10-18  758  		pr_warn("ATA Probe for GDROM failed\n");
74ee1a7590b782 Adrian McMenamin   2008-01-21  759  		return -ENODEV;
74ee1a7590b782 Adrian McMenamin   2008-01-21  760  	}
74ee1a7590b782 Adrian McMenamin   2008-01-21  761  	/* Print out firmware ID */
74ee1a7590b782 Adrian McMenamin   2008-01-21  762  	if (gdrom_outputversion())
74ee1a7590b782 Adrian McMenamin   2008-01-21  763  		return -ENOMEM;
74ee1a7590b782 Adrian McMenamin   2008-01-21  764  	/* Register GDROM */
74ee1a7590b782 Adrian McMenamin   2008-01-21  765  	gdrom_major = register_blkdev(0, GDROM_DEV_NAME);
74ee1a7590b782 Adrian McMenamin   2008-01-21  766  	if (gdrom_major <= 0)
74ee1a7590b782 Adrian McMenamin   2008-01-21  767  		return gdrom_major;
e597cd09f711b2 Joe Perches        2010-07-01  768  	pr_info("Registered with major number %d\n",
74ee1a7590b782 Adrian McMenamin   2008-01-21  769  		gdrom_major);
74ee1a7590b782 Adrian McMenamin   2008-01-21  770  	/* Specify basic properties of drive */
74ee1a7590b782 Adrian McMenamin   2008-01-21  771  	gd.cd_info = kzalloc(sizeof(struct cdrom_device_info), GFP_KERNEL);
74ee1a7590b782 Adrian McMenamin   2008-01-21  772  	if (!gd.cd_info) {
74ee1a7590b782 Adrian McMenamin   2008-01-21  773  		err = -ENOMEM;
74ee1a7590b782 Adrian McMenamin   2008-01-21  774  		goto probe_fail_no_mem;
74ee1a7590b782 Adrian McMenamin   2008-01-21  775  	}
74ee1a7590b782 Adrian McMenamin   2008-01-21  776  	probe_gdrom_setupcd();
0592c3d166c967 Christoph Hellwig  2021-06-02  777  
0592c3d166c967 Christoph Hellwig  2021-06-02  778  	err = blk_mq_alloc_sq_tag_set(&gd.tag_set, &gdrom_mq_ops, 1,
0592c3d166c967 Christoph Hellwig  2021-06-02  779  				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
0592c3d166c967 Christoph Hellwig  2021-06-02  780  	if (err)
0592c3d166c967 Christoph Hellwig  2021-06-02  781  		goto probe_fail_free_cd_info;
0592c3d166c967 Christoph Hellwig  2021-06-02  782  
7b5e4342c4f9a5 Christoph Hellwig  2023-07-06  783  	gd.disk = blk_mq_alloc_disk(&gd.tag_set, &lim, NULL);
0592c3d166c967 Christoph Hellwig  2021-06-02  784  	if (IS_ERR(gd.disk)) {
0592c3d166c967 Christoph Hellwig  2021-06-02  785  		err = PTR_ERR(gd.disk);
0592c3d166c967 Christoph Hellwig  2021-06-02  786  		goto probe_fail_free_tag_set;
74ee1a7590b782 Adrian McMenamin   2008-01-21  787  	}
0592c3d166c967 Christoph Hellwig  2021-06-02  788  	gd.gdrom_rq = gd.disk->queue;
74ee1a7590b782 Adrian McMenamin   2008-01-21  789  	probe_gdrom_setupdisk();
a711d91cd97e6c Christoph Hellwig  2020-04-25  790  	if (register_cdrom(gd.disk, gd.cd_info)) {
74ee1a7590b782 Adrian McMenamin   2008-01-21  791  		err = -ENODEV;
0592c3d166c967 Christoph Hellwig  2021-06-02  792  		goto probe_fail_cleanup_disk;
74ee1a7590b782 Adrian McMenamin   2008-01-21  793  	}
74ee1a7590b782 Adrian McMenamin   2008-01-21  794  	gd.disk->fops = &gdrom_bdops;
773008f6fe0544 Martin Wilck       2019-03-27  795  	gd.disk->events = DISK_EVENT_MEDIA_CHANGE;
74ee1a7590b782 Adrian McMenamin   2008-01-21  796  	/* latch on to the interrupt */
74ee1a7590b782 Adrian McMenamin   2008-01-21  797  	err = gdrom_set_interrupt_handlers();
74ee1a7590b782 Adrian McMenamin   2008-01-21  798  	if (err)
0592c3d166c967 Christoph Hellwig  2021-06-02  799  		goto probe_fail_cleanup_disk;
ad5fc6bb722146 Jens Axboe         2018-10-15  800  
74ee1a7590b782 Adrian McMenamin   2008-01-21  801  	err = probe_gdrom_setupqueue();
74ee1a7590b782 Adrian McMenamin   2008-01-21  802  	if (err)
0592c3d166c967 Christoph Hellwig  2021-06-02  803  		goto probe_fail_free_irqs;
74ee1a7590b782 Adrian McMenamin   2008-01-21  804  
74ee1a7590b782 Adrian McMenamin   2008-01-21  805  	gd.toc = kzalloc(sizeof(struct gdromtoc), GFP_KERNEL);
605cdf0875f803 Christophe JAILLET 2017-02-06  806  	if (!gd.toc) {
605cdf0875f803 Christophe JAILLET 2017-02-06  807  		err = -ENOMEM;
0592c3d166c967 Christoph Hellwig  2021-06-02  808  		goto probe_fail_free_irqs;
605cdf0875f803 Christophe JAILLET 2017-02-06  809  	}
d6ac27c60fec4d Luis Chamberlain   2021-09-27  810  	err = add_disk(gd.disk);
d6ac27c60fec4d Luis Chamberlain   2021-09-27  811  	if (err)
d6ac27c60fec4d Luis Chamberlain   2021-09-27  812  		goto probe_fail_add_disk;
d6ac27c60fec4d Luis Chamberlain   2021-09-27  813  
74ee1a7590b782 Adrian McMenamin   2008-01-21  814  	return 0;
74ee1a7590b782 Adrian McMenamin   2008-01-21  815  
d6ac27c60fec4d Luis Chamberlain   2021-09-27  816  probe_fail_add_disk:
d6ac27c60fec4d Luis Chamberlain   2021-09-27  817  	kfree(gd.toc);
0592c3d166c967 Christoph Hellwig  2021-06-02  818  probe_fail_free_irqs:
74ee1a7590b782 Adrian McMenamin   2008-01-21  819  	free_irq(HW_EVENT_GDROM_DMA, &gd);
74ee1a7590b782 Adrian McMenamin   2008-01-21  820  	free_irq(HW_EVENT_GDROM_CMD, &gd);
0592c3d166c967 Christoph Hellwig  2021-06-02  821  probe_fail_cleanup_disk:
8b9ab62662048a Christoph Hellwig  2022-06-19  822  	put_disk(gd.disk);
0592c3d166c967 Christoph Hellwig  2021-06-02  823  probe_fail_free_tag_set:
0592c3d166c967 Christoph Hellwig  2021-06-02  824  	blk_mq_free_tag_set(&gd.tag_set);
0592c3d166c967 Christoph Hellwig  2021-06-02  825  probe_fail_free_cd_info:
74ee1a7590b782 Adrian McMenamin   2008-01-21  826  	kfree(gd.cd_info);
31bd8fbb41b1fd Libo Chen          2013-07-03  827  probe_fail_no_mem:
74ee1a7590b782 Adrian McMenamin   2008-01-21  828  	unregister_blkdev(gdrom_major, GDROM_DEV_NAME);
74ee1a7590b782 Adrian McMenamin   2008-01-21  829  	gdrom_major = 0;
f8b489980d9427 Kefeng Wang        2019-10-18  830  	pr_warn("Probe failed - error is 0x%X\n", err);
74ee1a7590b782 Adrian McMenamin   2008-01-21  831  	return err;
74ee1a7590b782 Adrian McMenamin   2008-01-21 @832  }
74ee1a7590b782 Adrian McMenamin   2008-01-21  833  

:::::: The code at line 832 was first introduced by commit
:::::: 74ee1a7590b782a6df01d00ae38093cbfbee5ca9 cdrom: Add support for Sega Dreamcast GD-ROM.

:::::: TO: Adrian McMenamin <adrian@mcmen.demon.co.uk>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
