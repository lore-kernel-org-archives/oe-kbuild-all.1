Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A638F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 06:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686032883; x=1717568883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f47HPy8uyvcUsKv8UJftYAaowQHH0V5xq1WrKYUJelo=;
  b=l2VuVYgn9ExYefFBUX9TklZmhjSocNdtF9S9HVwNjW3YgiCcv0sIPmnJ
   MVIN/GEBEpTV1yj351y1AmKrGuJZ7J49wL3Ilg/8mEAGE4i6yuHJ1lE0g
   1h4EDJa+Xw9FiUW47QfWO0rbTSpt5npYgrawC4MbaSu+cyQvnavMrZnM+
   T4DfEisb5W7GNUCl5rPIWRa8r7V7pxzBuDFx2vZ/BqQVvY+5FZfNRsvcf
   V+LMFsM1oJ1EncSgnkKSP2HtVVFq+b0CqUIf2sBxzEN3SCrKPNP5IVfEw
   1Np88KArt1dti23u+Nm0LOboltNesQp5HwfI5/iVnubVx5DRXUQ+fRLi0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336202330"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="336202330"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 23:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="742018551"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="742018551"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jun 2023 23:28:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6QAh-0004vn-2d;
	Tue, 06 Jun 2023 06:27:59 +0000
Date: Tue, 6 Jun 2023 14:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 45/48]
 drivers/mtd/devices/block2mtd.c:277:44: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202306061413.ULe1mz7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-open-release
head:   74ec704f4aa19cfd25faa78189e5c9d5f2e97ba3
commit: 54822e562a29c2e2098f70e01d9b1d8a96213d94 [45/48] block: replace fmode_t with a block-specific type for block open flags
config: arc-randconfig-s032-20230606 (https://download.01.org/0day-ci/archive/20230606/202306061413.ULe1mz7v-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 54822e562a29c2e2098f70e01d9b1d8a96213d94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash drivers/mtd/devices/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061413.ULe1mz7v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/devices/block2mtd.c:277:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] mode @@     got restricted fmode_t const [usertype] mode @@
   drivers/mtd/devices/block2mtd.c:277:44: sparse:     expected restricted blk_mode_t [usertype] mode
   drivers/mtd/devices/block2mtd.c:277:44: sparse:     got restricted fmode_t const [usertype] mode

vim +277 drivers/mtd/devices/block2mtd.c

c4e7fb313771ac Ville Herva         2006-07-14  260  
71864ba3d52b8b Christoph Hellwig   2023-05-20  261  static struct block2mtd_dev *add_device(char *devname, int erase_size,
71864ba3d52b8b Christoph Hellwig   2023-05-20  262  		char *label, int timeout)
71864ba3d52b8b Christoph Hellwig   2023-05-20  263  {
46a98c166f9caa Christoph Hellwig   2023-06-05  264  	const fmode_t mode = FMODE_READ | FMODE_WRITE;
71864ba3d52b8b Christoph Hellwig   2023-05-20  265  	struct block_device *bdev;
71864ba3d52b8b Christoph Hellwig   2023-05-20  266  	struct block2mtd_dev *dev;
71864ba3d52b8b Christoph Hellwig   2023-05-20  267  	char *name;
c4e7fb313771ac Ville Herva         2006-07-14  268  
71864ba3d52b8b Christoph Hellwig   2023-05-20  269  	if (!devname)
71864ba3d52b8b Christoph Hellwig   2023-05-20  270  		return NULL;
71864ba3d52b8b Christoph Hellwig   2023-05-20  271  
71864ba3d52b8b Christoph Hellwig   2023-05-20  272  	dev = kzalloc(sizeof(struct block2mtd_dev), GFP_KERNEL);
71864ba3d52b8b Christoph Hellwig   2023-05-20  273  	if (!dev)
71864ba3d52b8b Christoph Hellwig   2023-05-20  274  		return NULL;
71864ba3d52b8b Christoph Hellwig   2023-05-20  275  
71864ba3d52b8b Christoph Hellwig   2023-05-20  276  	/* Get a handle on the device */
ce7813a1f22845 Christoph Hellwig   2023-06-04 @277  	bdev = blkdev_get_by_path(devname, mode, dev, NULL);
71864ba3d52b8b Christoph Hellwig   2023-05-20  278  	if (IS_ERR(bdev))
71864ba3d52b8b Christoph Hellwig   2023-05-20  279  		bdev = mdtblock_early_get_bdev(devname, mode, timeout, dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  280  	if (IS_ERR(bdev)) {
a1c06609b37c30 Joe Perches         2013-04-19  281  		pr_err("error: cannot open device %s\n", devname);
4bed207cd0b280 Fabian Frederick    2014-01-25  282  		goto err_free_block2mtd;
^1da177e4c3f41 Linus Torvalds      2005-04-16  283  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  284  	dev->blkdev = bdev;
^1da177e4c3f41 Linus Torvalds      2005-04-16  285  
^1da177e4c3f41 Linus Torvalds      2005-04-16  286  	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
a1c06609b37c30 Joe Perches         2013-04-19  287  		pr_err("attempting to use an MTD device as a block device\n");
4bed207cd0b280 Fabian Frederick    2014-01-25  288  		goto err_free_block2mtd;
^1da177e4c3f41 Linus Torvalds      2005-04-16  289  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  290  
ea6d833a3fddcd Fabian Frederick    2014-03-06  291  	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
ea6d833a3fddcd Fabian Frederick    2014-03-06  292  		pr_err("erasesize must be a divisor of device size\n");
ea6d833a3fddcd Fabian Frederick    2014-03-06  293  		goto err_free_block2mtd;
ea6d833a3fddcd Fabian Frederick    2014-03-06  294  	}
ea6d833a3fddcd Fabian Frederick    2014-03-06  295  
48b192686dd20c Ingo Molnar         2006-03-31  296  	mutex_init(&dev->write_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  297  
^1da177e4c3f41 Linus Torvalds      2005-04-16  298  	/* Setup the MTD structure */
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  	/* make the name contain the block device in */
7b09acdcb944a9 Joachim Wiberg      2021-10-09  300  	if (!label)
4d682420cead1c Julia Lawall        2010-03-10  301  		name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
7b09acdcb944a9 Joachim Wiberg      2021-10-09  302  	else
7b09acdcb944a9 Joachim Wiberg      2021-10-09  303  		name = kstrdup(label, GFP_KERNEL);
eadcf0d704a469 Greg Kroah-Hartman  2008-07-02  304  	if (!name)
4bed207cd0b280 Fabian Frederick    2014-01-25  305  		goto err_destroy_mutex;
^1da177e4c3f41 Linus Torvalds      2005-04-16  306  
eadcf0d704a469 Greg Kroah-Hartman  2008-07-02  307  	dev->mtd.name = name;
^1da177e4c3f41 Linus Torvalds      2005-04-16  308  
^1da177e4c3f41 Linus Torvalds      2005-04-16  309  	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
^1da177e4c3f41 Linus Torvalds      2005-04-16  310  	dev->mtd.erasesize = erase_size;
17ffc7ba6d7ea6 Artem B. Bityutskiy 2006-06-22  311  	dev->mtd.writesize = 1;
b604387411ec6a Artem Bityutskiy    2012-02-03  312  	dev->mtd.writebufsize = PAGE_SIZE;
21c8db9eff9526 David Woodhouse     2006-06-14  313  	dev->mtd.type = MTD_RAM;
^1da177e4c3f41 Linus Torvalds      2005-04-16  314  	dev->mtd.flags = MTD_CAP_RAM;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  315  	dev->mtd._erase = block2mtd_erase;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  316  	dev->mtd._write = block2mtd_write;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  317  	dev->mtd._sync = block2mtd_sync;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  318  	dev->mtd._read = block2mtd_read;
^1da177e4c3f41 Linus Torvalds      2005-04-16  319  	dev->mtd.priv = dev;
^1da177e4c3f41 Linus Torvalds      2005-04-16  320  	dev->mtd.owner = THIS_MODULE;
^1da177e4c3f41 Linus Torvalds      2005-04-16  321  
ee0e87b174bb41 Jamie Iles          2011-05-23  322  	if (mtd_device_register(&dev->mtd, NULL, 0)) {
25985edcedea63 Lucas De Marchi     2011-03-30  323  		/* Device didn't get added, so free the entry */
4bed207cd0b280 Fabian Frederick    2014-01-25  324  		goto err_destroy_mutex;
^1da177e4c3f41 Linus Torvalds      2005-04-16  325  	}
d6a3f0176fe03c Felix Fietkau       2014-11-09  326  
^1da177e4c3f41 Linus Torvalds      2005-04-16  327  	list_add(&dev->list, &blkmtd_device_list);
a1c06609b37c30 Joe Perches         2013-04-19  328  	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
a1c06609b37c30 Joe Perches         2013-04-19  329  		dev->mtd.index,
7b09acdcb944a9 Joachim Wiberg      2021-10-09  330  		label ? label : dev->mtd.name + strlen("block2mtd: "),
^1da177e4c3f41 Linus Torvalds      2005-04-16  331  		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
^1da177e4c3f41 Linus Torvalds      2005-04-16  332  	return dev;
^1da177e4c3f41 Linus Torvalds      2005-04-16  333  
4bed207cd0b280 Fabian Frederick    2014-01-25  334  err_destroy_mutex:
4bed207cd0b280 Fabian Frederick    2014-01-25  335  	mutex_destroy(&dev->write_mutex);
4bed207cd0b280 Fabian Frederick    2014-01-25  336  err_free_block2mtd:
^1da177e4c3f41 Linus Torvalds      2005-04-16  337  	block2mtd_free_device(dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  338  	return NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  339  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  340  

:::::: The code at line 277 was first introduced by commit
:::::: ce7813a1f22845198594957d9462fde7c061bcfb Merge branch 'blk-init-cleanup' into HEAD

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
