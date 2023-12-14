Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFAF377
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhCyr/cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702512817; x=1734048817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/jl2kmkMTqGyu6lkpLnjSR9M3/tTTAJWrRkS1p/n0/A=;
  b=JhCyr/cFhv+26+gSsbrc2JEJS7w5xoyj3SkuP43IGPcWfYPatIgvfKFb
   JRl8QPXynULwgmh3wQEGobfzj3Msi7SFOlVxKWfQmlinhbmYOtoHt7eDI
   RU36huGbQPMn3fFQCC5O1JS8shniZNwohLicFVI1eHRk/wxKdbyw8CGd4
   DYIU22H6dyfeIrU1PU0K48mFQoznZ73KybtRDz8Pc80DuTXSTEEZB1nbH
   kku9OHXjZAGP/WER67Sm8CW66DbtnpHBRM4ad7totrnfi5AUhC+ufUjT1
   /JAPH+jZjluWy6AnUbi9vniZY+ghpG5KBH2ODV9Zaf+dGmiLjZC479xPF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16596997"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="16596997"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 16:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844509613"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="844509613"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 16:13:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDZM4-000LK6-2S;
	Thu, 14 Dec 2023 00:13:32 +0000
Date: Thu, 14 Dec 2023 08:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 for-6.8/block 04/18] mtd: block2mtd: use bdev apis
Message-ID: <202312140712.mwReKJAj-lkp@intel.com>
References: <20231211140552.973290-5-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211140552.973290-5-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on axboe-block/for-next kdave/for-next linus/master v6.7-rc5]
[cannot apply to next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/block-add-some-bdev-apis/20231211-221732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20231211140552.973290-5-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC v2 for-6.8/block 04/18] mtd: block2mtd: use bdev apis
config: i386-randconfig-003-20231214 (https://download.01.org/0day-ci/archive/20231214/202312140712.mwReKJAj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140712.mwReKJAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140712.mwReKJAj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mtd/devices/block2mtd.o: in function `add_device':
>> drivers/mtd/devices/block2mtd.c:289: undefined reference to `__moddi3'


vim +289 drivers/mtd/devices/block2mtd.c

   255	
   256	static struct block2mtd_dev *add_device(char *devname, int erase_size,
   257			char *label, int timeout)
   258	{
   259		const blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_WRITE;
   260		struct bdev_handle *bdev_handle;
   261		struct block_device *bdev;
   262		struct block2mtd_dev *dev;
   263		char *name;
   264	
   265		if (!devname)
   266			return NULL;
   267	
   268		dev = kzalloc(sizeof(struct block2mtd_dev), GFP_KERNEL);
   269		if (!dev)
   270			return NULL;
   271	
   272		/* Get a handle on the device */
   273		bdev_handle = bdev_open_by_path(devname, mode, dev, NULL);
   274		if (IS_ERR(bdev_handle))
   275			bdev_handle = mdtblock_early_get_bdev(devname, mode, timeout,
   276							      dev);
   277		if (IS_ERR(bdev_handle)) {
   278			pr_err("error: cannot open device %s\n", devname);
   279			goto err_free_block2mtd;
   280		}
   281		dev->bdev_handle = bdev_handle;
   282		bdev = bdev_handle->bdev;
   283	
   284		if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
   285			pr_err("attempting to use an MTD device as a block device\n");
   286			goto err_free_block2mtd;
   287		}
   288	
 > 289		if (bdev_nr_bytes(bdev) % erase_size) {
   290			pr_err("erasesize must be a divisor of device size\n");
   291			goto err_free_block2mtd;
   292		}
   293	
   294		mutex_init(&dev->write_mutex);
   295	
   296		/* Setup the MTD structure */
   297		/* make the name contain the block device in */
   298		if (!label)
   299			name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
   300		else
   301			name = kstrdup(label, GFP_KERNEL);
   302		if (!name)
   303			goto err_destroy_mutex;
   304	
   305		dev->mtd.name = name;
   306	
   307		dev->mtd.size = bdev_nr_bytes(bdev) & PAGE_MASK;
   308		dev->mtd.erasesize = erase_size;
   309		dev->mtd.writesize = 1;
   310		dev->mtd.writebufsize = PAGE_SIZE;
   311		dev->mtd.type = MTD_RAM;
   312		dev->mtd.flags = MTD_CAP_RAM;
   313		dev->mtd._erase = block2mtd_erase;
   314		dev->mtd._write = block2mtd_write;
   315		dev->mtd._sync = block2mtd_sync;
   316		dev->mtd._read = block2mtd_read;
   317		dev->mtd.priv = dev;
   318		dev->mtd.owner = THIS_MODULE;
   319	
   320		if (mtd_device_register(&dev->mtd, NULL, 0)) {
   321			/* Device didn't get added, so free the entry */
   322			goto err_destroy_mutex;
   323		}
   324	
   325		list_add(&dev->list, &blkmtd_device_list);
   326		pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
   327			dev->mtd.index,
   328			label ? label : dev->mtd.name + strlen("block2mtd: "),
   329			dev->mtd.erasesize >> 10, dev->mtd.erasesize);
   330		return dev;
   331	
   332	err_destroy_mutex:
   333		mutex_destroy(&dev->write_mutex);
   334	err_free_block2mtd:
   335		block2mtd_free_device(dev);
   336		return NULL;
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
