Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E148EBE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695846513; x=1727382513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cJrSJ04BZpzg2mToqoWdzSwU4vqJwN6DxHRjIa79Q4=;
  b=fjgPKVr4a3C9N/3z9jw6+3n+P4WlYwpSM4T9anE+HyiAppD/aG6lAhDK
   cJ403eeinKKyogzDEN7TcYL/xX6/VN7gMZJYePf6uZ9dJ2tXM0ClL7tse
   5jbDPrNbmqr6c3Qhp5qwFQ93f/45qOx0ni99YIfWM2rFuJARReD1FEabb
   ADfmKY8JB6uYbjPIXhs5NNGpIby5z8LoGzX4+RER4N5/m4teX+2yY1h1n
   edQU9xMj85I4/HMqb/6cAyEruCMmh0eTE1KpBg8uAkIDXOpph2FmD2cxZ
   8xFno8UofZq4LCt8I3HTiTiXfvzmWxceegtU69X3RT/EBWiEAX3yrzfTe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384717000"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="384717000"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 13:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873040899"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="873040899"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 13:28:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlb92-0000dh-2r;
	Wed, 27 Sep 2023 20:28:28 +0000
Date: Thu, 28 Sep 2023 04:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.super 12/30] drivers/md/md.c:3635:25: warning:
 unused variable 'holder'
Message-ID: <202309280448.tZry49AM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.super
head:   953863a5a2ff126582a21068485dbf7d8ae1d6dc
commit: 15db36126ca6ea2f6ad8cb1bf3cd132a4f2cc150 [12/30] md: Convert to bdev_open_by_dev()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309280448.tZry49AM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280448.tZry49AM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280448.tZry49AM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/md.c: In function 'md_import_device':
>> drivers/md/md.c:3635:25: warning: unused variable 'holder' [-Wunused-variable]
    3635 |         struct md_rdev *holder;
         |                         ^~~~~~


vim +/holder +3635 drivers/md/md.c

2736e8eeb0ccdc Christoph Hellwig  2023-06-08  3621  
^1da177e4c3f41 Linus Torvalds     2005-04-16  3622  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  3623   * Import a device. If 'super_format' >= 0, then sanity check the superblock
^1da177e4c3f41 Linus Torvalds     2005-04-16  3624   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  3625   * mark the device faulty if:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3626   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  3627   *   - the device is nonexistent (zero size)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3628   *   - the device has no valid superblock
^1da177e4c3f41 Linus Torvalds     2005-04-16  3629   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  3630   * a faulty rdev _never_ has rdev->sb set.
^1da177e4c3f41 Linus Torvalds     2005-04-16  3631   */
3cb03002000f13 NeilBrown          2011-10-11  3632  static struct md_rdev *md_import_device(dev_t newdev, int super_format, int super_minor)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3633  {
3cb03002000f13 NeilBrown          2011-10-11  3634  	struct md_rdev *rdev;
99892147f028d7 Yu Kuai            2023-08-25 @3635  	struct md_rdev *holder;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3636  	sector_t size;
fb541ca4c36500 Christoph Hellwig  2022-11-29  3637  	int err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3638  
9ffae0cf3ea02f NeilBrown          2006-01-06  3639  	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
9d48739ef19aa8 NeilBrown          2016-11-02  3640  	if (!rdev)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3641  		return ERR_PTR(-ENOMEM);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3642  
2230dfe4ccc3ad NeilBrown          2011-07-28  3643  	err = md_rdev_init(rdev);
2230dfe4ccc3ad NeilBrown          2011-07-28  3644  	if (err)
fb541ca4c36500 Christoph Hellwig  2022-11-29  3645  		goto out_free_rdev;
2230dfe4ccc3ad NeilBrown          2011-07-28  3646  	err = alloc_disk_sb(rdev);
2230dfe4ccc3ad NeilBrown          2011-07-28  3647  	if (err)
fb541ca4c36500 Christoph Hellwig  2022-11-29  3648  		goto out_clear_rdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3649  
15db36126ca6ea Jan Kara           2023-09-27  3650  	rdev->bdev_handle = bdev_open_by_dev(newdev,
15db36126ca6ea Jan Kara           2023-09-27  3651  			BLK_OPEN_READ | BLK_OPEN_WRITE,
15db36126ca6ea Jan Kara           2023-09-27  3652  			super_format == -2 ? &claim_rdev : rdev, NULL);
15db36126ca6ea Jan Kara           2023-09-27  3653  	if (IS_ERR(rdev->bdev_handle)) {
fb541ca4c36500 Christoph Hellwig  2022-11-29  3654  		pr_warn("md: could not open device unknown-block(%u,%u).\n",
fb541ca4c36500 Christoph Hellwig  2022-11-29  3655  			MAJOR(newdev), MINOR(newdev));
15db36126ca6ea Jan Kara           2023-09-27  3656  		err = PTR_ERR(rdev->bdev_handle);
fb541ca4c36500 Christoph Hellwig  2022-11-29  3657  		goto out_clear_rdev;
fb541ca4c36500 Christoph Hellwig  2022-11-29  3658  	}
15db36126ca6ea Jan Kara           2023-09-27  3659  	rdev->bdev = rdev->bdev_handle->bdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3660  
f9cb074bff8e76 Greg Kroah-Hartman 2007-12-17  3661  	kobject_init(&rdev->kobj, &rdev_ktype);
86e6ffdd243a06 NeilBrown          2005-11-08  3662  
0fe80347fd701a Christoph Hellwig  2021-10-18  3663  	size = bdev_nr_bytes(rdev->bdev) >> BLOCK_SIZE_BITS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3664  	if (!size) {
913cce5a1e588e Christoph Hellwig  2022-05-12  3665  		pr_warn("md: %pg has zero or unknown size, marking faulty!\n",
913cce5a1e588e Christoph Hellwig  2022-05-12  3666  			rdev->bdev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3667  		err = -EINVAL;
fb541ca4c36500 Christoph Hellwig  2022-11-29  3668  		goto out_blkdev_put;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3669  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3670  
^1da177e4c3f41 Linus Torvalds     2005-04-16  3671  	if (super_format >= 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3672  		err = super_types[super_format].
^1da177e4c3f41 Linus Torvalds     2005-04-16  3673  			load_super(rdev, NULL, super_minor);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3674  		if (err == -EINVAL) {
913cce5a1e588e Christoph Hellwig  2022-05-12  3675  			pr_warn("md: %pg does not have a valid v%d.%d superblock, not importing!\n",
913cce5a1e588e Christoph Hellwig  2022-05-12  3676  				rdev->bdev,
df968c4e8d809d NeilBrown          2007-07-17  3677  				super_format, super_minor);
fb541ca4c36500 Christoph Hellwig  2022-11-29  3678  			goto out_blkdev_put;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3679  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3680  		if (err < 0) {
913cce5a1e588e Christoph Hellwig  2022-05-12  3681  			pr_warn("md: could not read %pg's sb, not importing!\n",
913cce5a1e588e Christoph Hellwig  2022-05-12  3682  				rdev->bdev);
fb541ca4c36500 Christoph Hellwig  2022-11-29  3683  			goto out_blkdev_put;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3684  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3685  	}
6bfe0b499082fd Dan Williams       2008-04-30  3686  
^1da177e4c3f41 Linus Torvalds     2005-04-16  3687  	return rdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3688  
fb541ca4c36500 Christoph Hellwig  2022-11-29  3689  out_blkdev_put:
15db36126ca6ea Jan Kara           2023-09-27  3690  	bdev_release(rdev->bdev_handle);
fb541ca4c36500 Christoph Hellwig  2022-11-29  3691  out_clear_rdev:
545c87957f4d53 NeilBrown          2012-05-22  3692  	md_rdev_clear(rdev);
fb541ca4c36500 Christoph Hellwig  2022-11-29  3693  out_free_rdev:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3694  	kfree(rdev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3695  	return ERR_PTR(err);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3696  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3697  

:::::: The code at line 3635 was first introduced by commit
:::::: 99892147f028d711f9d40fefad4f33632593864c md: fix warning for holder mismatch from export_rdev()

:::::: TO: Yu Kuai <yukuai3@huawei.com>
:::::: CC: Song Liu <song@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
