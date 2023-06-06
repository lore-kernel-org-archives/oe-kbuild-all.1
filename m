Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C2219915
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686072604; x=1717608604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K+5sjESW4wyXlH/qZeTa+Mgp7ROGClPbFl0hhiR8vIU=;
  b=iCbX+JLnF/YViQ+1Hp5Ke490ueMNtmYcfQrSpYoMOkbBRyLUupB3g80J
   3pYOUnEtvCuPCdE8pg6wZ9BjW+5Z0GlBViipc9UzZUx7LmwLaNJemSnTV
   i1Zq0Eo+bL9hkPpFaHQKKrla7JsvOFCWJskkJVAWRnsZcj4KmMqgATU9M
   9wV35OqMx0S11lshnfM7CtNtW/9mNzaCaEaK4hLMj3VZtnbiJMDccBnSA
   o+yJFU6FEx+hrRF+SEvPep5Ra2r0vsvbMwMIIVQA5vRp2dWzwsI4KrIfn
   EKBJ2xIUtwDgOolNCP7OkEFmFTzl3o4QYlTTgqEXEkpL69GCmpfihkX+8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="443118649"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="443118649"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 10:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709158176"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="709158176"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 10:30:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6aVN-0005YR-0t;
	Tue, 06 Jun 2023 17:30:01 +0000
Date: Wed, 7 Jun 2023 01:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 45/48] fs/btrfs/super.c:2191:59: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202306070132.UKIOHOCu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-open-release
head:   0c548efe09ba601207bd6bb9fa48cf2dd706bfb3
commit: 54822e562a29c2e2098f70e01d9b1d8a96213d94 [45/48] block: replace fmode_t with a block-specific type for block open flags
config: powerpc-randconfig-s031-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070132.UKIOHOCu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/mtd/devices/ fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070132.UKIOHOCu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/super.c:2191:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] flags @@     got restricted fmode_t [usertype] @@
   fs/btrfs/super.c:2191:59: sparse:     expected restricted blk_mode_t [usertype] flags
   fs/btrfs/super.c:2191:59: sparse:     got restricted fmode_t [usertype]
   fs/btrfs/super.c:2205:59: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] flags @@     got restricted fmode_t [usertype] @@
   fs/btrfs/super.c:2205:59: sparse:     expected restricted blk_mode_t [usertype] flags
   fs/btrfs/super.c:2205:59: sparse:     got restricted fmode_t [usertype]
--
>> drivers/mtd/devices/block2mtd.c:252:56: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] mode @@     got restricted fmode_t [usertype] mode @@
   drivers/mtd/devices/block2mtd.c:252:56: sparse:     expected restricted blk_mode_t [usertype] mode
   drivers/mtd/devices/block2mtd.c:252:56: sparse:     got restricted fmode_t [usertype] mode
   drivers/mtd/devices/block2mtd.c:277:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted blk_mode_t [usertype] mode @@     got restricted fmode_t const [usertype] mode @@
   drivers/mtd/devices/block2mtd.c:277:44: sparse:     expected restricted blk_mode_t [usertype] mode
   drivers/mtd/devices/block2mtd.c:277:44: sparse:     got restricted fmode_t const [usertype] mode

vim +2191 fs/btrfs/super.c

d8620958296e4f Tom Van Braeckel  2015-03-24  2168  
d352ac68148b69 Chris Mason       2008-09-29  2169  /*
cfe953c8240d1b Su Yue            2020-02-04  2170   * Used by /dev/btrfs-control for devices ioctls.
d352ac68148b69 Chris Mason       2008-09-29  2171   */
8a4b83cc8bd75f Chris Mason       2008-03-24  2172  static long btrfs_control_ioctl(struct file *file, unsigned int cmd,
8a4b83cc8bd75f Chris Mason       2008-03-24  2173  				unsigned long arg)
8a4b83cc8bd75f Chris Mason       2008-03-24  2174  {
8a4b83cc8bd75f Chris Mason       2008-03-24  2175  	struct btrfs_ioctl_vol_args *vol;
36350e95a2b1fe Gu Jinxiang       2018-07-12  2176  	struct btrfs_device *device = NULL;
16cab91a0c8fea Anand Jain        2022-01-12  2177  	dev_t devt = 0;
c071fcfdb60e7a Chris Mason       2009-01-16  2178  	int ret = -ENOTTY;
8a4b83cc8bd75f Chris Mason       2008-03-24  2179  
e441d54de4fd97 Chris Mason       2009-01-05  2180  	if (!capable(CAP_SYS_ADMIN))
e441d54de4fd97 Chris Mason       2009-01-05  2181  		return -EPERM;
e441d54de4fd97 Chris Mason       2009-01-05  2182  
dae7b665cf6d6e Li Zefan          2009-04-08  2183  	vol = memdup_user((void __user *)arg, sizeof(*vol));
dae7b665cf6d6e Li Zefan          2009-04-08  2184  	if (IS_ERR(vol))
dae7b665cf6d6e Li Zefan          2009-04-08  2185  		return PTR_ERR(vol);
f505754fd65992 Filipe Manana     2018-11-14  2186  	vol->name[BTRFS_PATH_NAME_MAX] = '\0';
c071fcfdb60e7a Chris Mason       2009-01-16  2187  
8a4b83cc8bd75f Chris Mason       2008-03-24  2188  	switch (cmd) {
8a4b83cc8bd75f Chris Mason       2008-03-24  2189  	case BTRFS_IOC_SCAN_DEV:
899f9307c33ce4 David Sterba      2018-06-19  2190  		mutex_lock(&uuid_mutex);
4a7e7a931e3991 Christoph Hellwig 2023-06-04 @2191  		device = btrfs_scan_one_device(vol->name, FMODE_READ);
36350e95a2b1fe Gu Jinxiang       2018-07-12  2192  		ret = PTR_ERR_OR_ZERO(device);
899f9307c33ce4 David Sterba      2018-06-19  2193  		mutex_unlock(&uuid_mutex);
8a4b83cc8bd75f Chris Mason       2008-03-24  2194  		break;
228a73abde5c04 Anand Jain        2019-01-04  2195  	case BTRFS_IOC_FORGET_DEV:
16cab91a0c8fea Anand Jain        2022-01-12  2196  		if (vol->name[0] != 0) {
16cab91a0c8fea Anand Jain        2022-01-12  2197  			ret = lookup_bdev(vol->name, &devt);
16cab91a0c8fea Anand Jain        2022-01-12  2198  			if (ret)
16cab91a0c8fea Anand Jain        2022-01-12  2199  				break;
16cab91a0c8fea Anand Jain        2022-01-12  2200  		}
16cab91a0c8fea Anand Jain        2022-01-12  2201  		ret = btrfs_forget_devices(devt);
228a73abde5c04 Anand Jain        2019-01-04  2202  		break;
02db0844beffc1 Josef Bacik       2012-06-21  2203  	case BTRFS_IOC_DEVICES_READY:
899f9307c33ce4 David Sterba      2018-06-19  2204  		mutex_lock(&uuid_mutex);
4a7e7a931e3991 Christoph Hellwig 2023-06-04  2205  		device = btrfs_scan_one_device(vol->name, FMODE_READ);
36350e95a2b1fe Gu Jinxiang       2018-07-12  2206  		if (IS_ERR(device)) {
899f9307c33ce4 David Sterba      2018-06-19  2207  			mutex_unlock(&uuid_mutex);
36350e95a2b1fe Gu Jinxiang       2018-07-12  2208  			ret = PTR_ERR(device);
02db0844beffc1 Josef Bacik       2012-06-21  2209  			break;
899f9307c33ce4 David Sterba      2018-06-19  2210  		}
36350e95a2b1fe Gu Jinxiang       2018-07-12  2211  		ret = !(device->fs_devices->num_devices ==
36350e95a2b1fe Gu Jinxiang       2018-07-12  2212  			device->fs_devices->total_devices);
899f9307c33ce4 David Sterba      2018-06-19  2213  		mutex_unlock(&uuid_mutex);
02db0844beffc1 Josef Bacik       2012-06-21  2214  		break;
c5868f8362f562 David Sterba      2016-02-17  2215  	case BTRFS_IOC_GET_SUPPORTED_FEATURES:
d5131b658c2e90 David Sterba      2016-02-17  2216  		ret = btrfs_ioctl_get_supported_features((void __user*)arg);
c5868f8362f562 David Sterba      2016-02-17  2217  		break;
8a4b83cc8bd75f Chris Mason       2008-03-24  2218  	}
dae7b665cf6d6e Li Zefan          2009-04-08  2219  
8a4b83cc8bd75f Chris Mason       2008-03-24  2220  	kfree(vol);
f819d837eea982 Linda Knippers    2008-06-09  2221  	return ret;
8a4b83cc8bd75f Chris Mason       2008-03-24  2222  }
8a4b83cc8bd75f Chris Mason       2008-03-24  2223  

:::::: The code at line 2191 was first introduced by commit
:::::: 4a7e7a931e39919172b4111994e532f23f1d664d btrfs: don't pass a holder for non-exclusive blkdev_get_by_path

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
