Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC68848C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687004797; x=1718540797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cXD0g1H9E9UuwGms7XxMSDgjreFk+KWaexzmji8c5Sk=;
  b=JUGUECDU30c728ngUVE3Wz5IqKxNALin4ho0F916pOCgdvcaqJIlpLSQ
   YRSa8+2HVUKk0jkjTxNnX9amedPACxxHBTFKrgnYYhT+W0DDbMYbpEGzE
   dLSVWhh4pMwciHOLsP9EkcqCSAh2VetTdqk+E+TFFU72tVXrHYXujgF85
   EBbH5A6kiC1gu3CUdEt9jwVh/ii/Xb3zw1xStf3NVX9r/rEUCP95Su5iu
   6e05VkvoSSZjmyPNzZM62nx9Cwwt/OYJRuPoTBE7GuEc8KgFa4MrlmaMu
   DGT7yxYWzwQl3WlMJxgHiRzXeVGahu8aQIgpoeXde//CcBdf51ImTG3iz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="445765393"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="445765393"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 05:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="716339005"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="716339005"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2023 05:26:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAV0i-0002kG-1u;
	Sat, 17 Jun 2023 12:26:32 +0000
Date: Sat, 17 Jun 2023 20:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>, hch@lst.de, axboe@kernel.dk,
	brauner@kernel.org, hare@suse.de, dsterba@suse.com,
	jinpu.wang@ionos.com
Cc: oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, yukuai3@huawei.com,
	yukuai1@huaweicloud.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next] block: fix wrong mode for blkdev_get_by_dev() from
 disk_scan_partitions()
Message-ID: <202306172040.1dllc8rx-lkp@intel.com>
References: <20230617103813.3708374-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230617103813.3708374-1-yukuai1@huaweicloud.com>

Hi Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230616]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/block-fix-wrong-mode-for-blkdev_get_by_dev-from-disk_scan_partitions/20230617-184451
base:   next-20230616
patch link:    https://lore.kernel.org/r/20230617103813.3708374-1-yukuai1%40huaweicloud.com
patch subject: [PATCH -next] block: fix wrong mode for blkdev_get_by_dev() from disk_scan_partitions()
config: alpha-randconfig-r036-20230617 (https://download.01.org/0day-ci/archive/20230617/202306172040.1dllc8rx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172040.1dllc8rx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172040.1dllc8rx-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/genhd.c: In function 'disk_scan_partitions':
>> block/genhd.c:369:59: error: 'FMODE_EXCL' undeclared (first use in this function); did you mean 'FMODE_EXEC'?
     369 |         bdev = blkdev_get_by_dev(disk_devt(disk), mode & ~FMODE_EXCL, NULL,
         |                                                           ^~~~~~~~~~
         |                                                           FMODE_EXEC
   block/genhd.c:369:59: note: each undeclared identifier is reported only once for each function it appears in


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
 > 369		bdev = blkdev_get_by_dev(disk_devt(disk), mode & ~FMODE_EXCL, NULL,
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
