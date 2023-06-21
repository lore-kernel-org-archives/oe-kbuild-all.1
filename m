Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE3A95B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687337525; x=1718873525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YuAsHNI0F1PzLRaUzY1tFeZcICjdLh6yw2rydqw371Q=;
  b=C9AemWKxvyzbNJJXKyKFJnBCmyJ/n4JcIU4OXfw9LwQ9eWdps33LkjUy
   T/VOglHJUdmuzX3nL3k0HCkyks68HBk/Q99tLZLUZwLbKWNTSbR828AjY
   z5qNJCWiu4sEb8hEgxCuho/c2LshZ0dAsmstSFEqvrCVuVDXp4epki02h
   MaW+3PlKHZEN54gS9499/2VPnrd3VdsS3Ui6JpOg35n72SixrXAcMSv9M
   3s0C07DHidEl5bF6PbTPKstMxvm7S6JtjT2pDjP9JH713sT4ljBaw++o2
   n2l4g35uRIrzWgvUZoMSgGyX87pPTseAkGk0dd1IJxNOh1WJbB91z/Igh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="446489346"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="446489346"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 01:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="664575057"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="664575057"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2023 01:52:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBtZJ-0006gh-1d;
	Wed, 21 Jun 2023 08:52:01 +0000
Date: Wed, 21 Jun 2023 16:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [linux-next:master 11060/11436] block/genhd.c:369:51: sparse:
 sparse: restricted blk_mode_t degrades to integer
Message-ID: <202306211602.vo5v52QJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e71592dbae49a674429c618a10401d7f992ac3
commit: 985958b8584cc143555f1bd735e7ab5066c944a7 [11060/11436] block: fix wrong mode for blkdev_get_by_dev() from disk_scan_partitions()
config: i386-randconfig-s001-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211602.vo5v52QJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211602.vo5v52QJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211602.vo5v52QJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/genhd.c:369:51: sparse: sparse: restricted blk_mode_t degrades to integer
>> block/genhd.c:369:58: sparse: sparse: restricted fmode_t degrades to integer
>> block/genhd.c:369:56: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] mode @@     got unsigned int @@
   block/genhd.c:369:56: sparse:     expected restricted blk_mode_t [usertype] mode
   block/genhd.c:369:56: sparse:     got unsigned int

vim +369 block/genhd.c

   342	
   343	int disk_scan_partitions(struct gendisk *disk, blk_mode_t mode)
   344	{
   345		struct block_device *bdev;
   346		int ret = 0;
   347	
   348		if (disk->flags & (GENHD_FL_NO_PART | GENHD_FL_HIDDEN))
   349			return -EINVAL;
   350		if (test_bit(GD_SUPPRESS_PART_SCAN, &disk->state))
   351			return -EINVAL;
   352		if (disk->open_partitions)
   353			return -EBUSY;
   354	
   355		/*
   356		 * If the device is opened exclusively by current thread already, it's
   357		 * safe to scan partitons, otherwise, use bd_prepare_to_claim() to
   358		 * synchronize with other exclusive openers and other partition
   359		 * scanners.
   360		 */
   361		if (!(mode & BLK_OPEN_EXCL)) {
   362			ret = bd_prepare_to_claim(disk->part0, disk_scan_partitions,
   363						  NULL);
   364			if (ret)
   365				return ret;
   366		}
   367	
   368		set_bit(GD_NEED_PART_SCAN, &disk->state);
 > 369		bdev = blkdev_get_by_dev(disk_devt(disk), mode & ~FMODE_EXEC, NULL,
   370					 NULL);
   371		if (IS_ERR(bdev))
   372			ret =  PTR_ERR(bdev);
   373		else
   374			blkdev_put(bdev, NULL);
   375	
   376		/*
   377		 * If blkdev_get_by_dev() failed early, GD_NEED_PART_SCAN is still set,
   378		 * and this will cause that re-assemble partitioned raid device will
   379		 * creat partition for underlying disk.
   380		 */
   381		clear_bit(GD_NEED_PART_SCAN, &disk->state);
   382		if (!(mode & BLK_OPEN_EXCL))
   383			bd_abort_claiming(disk->part0, disk_scan_partitions);
   384		return ret;
   385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
