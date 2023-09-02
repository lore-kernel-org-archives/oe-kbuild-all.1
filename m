Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395619A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 03:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693624205; x=1725160205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HUUTLp1hync9DfQhvs1gK4OnaYThuOmFMOmTFl5i8G4=;
  b=R7aXGuTH6tPqhcNWHpG58TRBqo1rt9SjsbpIP23UUHt0L9v8ITD31d5C
   Y6LmSuFsPjATG+GiXhcj6SpsTNMDruInppr4BTPfV1lctwX+HtSORjxND
   RgNJV3uTv3fK+9Plji1zTHTuW6lez3/HxULKzM72dE+aeDw1kbHClfwFW
   ACCQ2eM0UGE+2FHgSmxvpJgKx+wgqd1GJrQDcW9NT2nDhSbwd2xvdmMwz
   mAA+Zp8XLBKfdpeHAwfvPjkxkAGJfPSl9SfMLdQGisZuMIju3AAMeIFW8
   i0nSY8tyu/4cp67Dr9kZLOQIoYsB5/dJixK779xlkKViqmZkXKbUsiBzO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380133234"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="380133234"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805652526"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="805652526"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Sep 2023 20:10:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcH1O-0001tw-0e;
	Sat, 02 Sep 2023 03:10:02 +0000
Date: Sat, 2 Sep 2023 11:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230901 46/46]
 include/linux/blkdev.h:1509:6: warning: no previous prototype for
 'bdev_aops_reset'
Message-ID: <202309021106.87NYgLhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230901
head:   8e33509f10cabce9067f10fcabb3f4350048056d
commit: 8e33509f10cabce9067f10fcabb3f4350048056d [46/46] bdev: allow to switch between bdev aops
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230902/202309021106.87NYgLhF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021106.87NYgLhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021106.87NYgLhF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/random.c:39:
>> include/linux/blkdev.h:1509:6: warning: no previous prototype for 'bdev_aops_reset' [-Wmissing-prototypes]
    1509 | void bdev_aops_reset(struct block_device *bdev)
         |      ^~~~~~~~~~~~~~~
--
   In file included from lib/vsprintf.c:47:
>> include/linux/blkdev.h:1509:6: warning: no previous prototype for 'bdev_aops_reset' [-Wmissing-prototypes]
    1509 | void bdev_aops_reset(struct block_device *bdev)
         |      ^~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1682 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~


vim +/bdev_aops_reset +1509 include/linux/blkdev.h

  1496	
  1497	#ifdef CONFIG_BLOCK
  1498	void invalidate_bdev(struct block_device *bdev);
  1499	int sync_blockdev(struct block_device *bdev);
  1500	int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
  1501	int sync_blockdev_nowait(struct block_device *bdev);
  1502	void sync_bdevs(bool wait);
  1503	void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
  1504	void printk_all_partitions(void);
  1505	int __init early_lookup_bdev(const char *pathname, dev_t *dev);
  1506	#ifdef CONFIG_BUFFER_HEAD
  1507	void bdev_aops_reset(struct block_device *bdev);
  1508	#else
> 1509	void bdev_aops_reset(struct block_device *bdev)
  1510	{
  1511	}
  1512	#endif
  1513	#else
  1514	static inline void invalidate_bdev(struct block_device *bdev)
  1515	{
  1516	}
  1517	static inline int sync_blockdev(struct block_device *bdev)
  1518	{
  1519		return 0;
  1520	}
  1521	static inline int sync_blockdev_nowait(struct block_device *bdev)
  1522	{
  1523		return 0;
  1524	}
  1525	static inline void sync_bdevs(bool wait)
  1526	{
  1527	}
  1528	static inline void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
  1529	{
  1530	}
  1531	static inline void printk_all_partitions(void)
  1532	{
  1533	}
  1534	static inline int early_lookup_bdev(const char *pathname, dev_t *dev)
  1535	{
  1536		return -EINVAL;
  1537	}
  1538	void bdev_aops_reset(struct block_device *bdev)
  1539	{
  1540	}
  1541	#endif /* CONFIG_BLOCK */
  1542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
