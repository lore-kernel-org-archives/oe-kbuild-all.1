Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5F17E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681182114; x=1712718114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g7fLzDtXPzrUQFFcDiSAZuXoVGnG8HaSUhRpW8nSAac=;
  b=L1BzQdVzNbw5pHCDX3CjEGk653YLWyP0apHx2bIE3XHq6dBkEJ+VAvwk
   Pd5KY+f1IlvIJOh9RFk1fy/PrlDjePbtsLfNnlq7DwEWVFrsDjfQPYPOF
   AyVZZXLYGCqq+wmJBJ6V/UXeEE1s15UVd6s27i0mS5mQA8LT8RXFV84tx
   q2J9I38XyPoCLfPaIRWkT4LMFzQDYskK17se9/SCEQK+rxBDncLEBW4Lk
   hnOZlgIm0oF4ziPAnmujebstPXq87zozNO6za18ZsIJquVU0ZP/W7RhRd
   Q6TGTRKRDC9Y/Iypph8k6S3p0l6V3ErrnQIYvwZif3geTKCvt5YFCuMHL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341000152"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="341000152"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 20:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752981930"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="752981930"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 20:01:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm4GT-000Vrn-1b;
	Tue, 11 Apr 2023 03:01:49 +0000
Date: Tue, 11 Apr 2023 11:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 725/29447]
 drivers/md/dm-linear.c:132:5: warning: no previous prototype for function
 'dm_linear_prepare_ioctl'
Message-ID: <202304111022.st0MdB4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Badhri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   285fc83a087180f0bc30b75285d4bc2cdcceae06
commit: 28969a9aaf3fd1a5d67d23ed0e9735adc389caa3 [725/29447] ANDROID: dm: android-verity: adopt changes made to dm callbacks
config: x86_64-randconfig-a001-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111022.st0MdB4O-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.14-stable
        git checkout 28969a9aaf3fd1a5d67d23ed0e9735adc389caa3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111022.st0MdB4O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-linear.c:29:5: warning: no previous prototype for function 'dm_linear_ctr' [-Wmissing-prototypes]
   int dm_linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
       ^
   drivers/md/dm-linear.c:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
   ^
   static 
   drivers/md/dm-linear.c:72:6: warning: no previous prototype for function 'dm_linear_dtr' [-Wmissing-prototypes]
   void dm_linear_dtr(struct dm_target *ti)
        ^
   drivers/md/dm-linear.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_linear_dtr(struct dm_target *ti)
   ^
   static 
   drivers/md/dm-linear.c:97:5: warning: no previous prototype for function 'dm_linear_map' [-Wmissing-prototypes]
   int dm_linear_map(struct dm_target *ti, struct bio *bio)
       ^
   drivers/md/dm-linear.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_map(struct dm_target *ti, struct bio *bio)
   ^
   static 
   drivers/md/dm-linear.c:115:6: warning: no previous prototype for function 'dm_linear_status' [-Wmissing-prototypes]
   void dm_linear_status(struct dm_target *ti, status_type_t type,
        ^
   drivers/md/dm-linear.c:115:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void dm_linear_status(struct dm_target *ti, status_type_t type,
   ^
   static 
>> drivers/md/dm-linear.c:132:5: warning: no previous prototype for function 'dm_linear_prepare_ioctl' [-Wmissing-prototypes]
   int dm_linear_prepare_ioctl(struct dm_target *ti,
       ^
   drivers/md/dm-linear.c:132:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_prepare_ioctl(struct dm_target *ti,
   ^
   static 
   drivers/md/dm-linear.c:149:5: warning: no previous prototype for function 'dm_linear_iterate_devices' [-Wmissing-prototypes]
   int dm_linear_iterate_devices(struct dm_target *ti,
       ^
   drivers/md/dm-linear.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dm_linear_iterate_devices(struct dm_target *ti,
   ^
   static 
   6 warnings generated.


vim +/dm_linear_prepare_ioctl +132 drivers/md/dm-linear.c

   131	
 > 132	int dm_linear_prepare_ioctl(struct dm_target *ti,
   133			struct block_device **bdev, fmode_t *mode)
   134	{
   135		struct linear_c *lc = (struct linear_c *) ti->private;
   136		struct dm_dev *dev = lc->dev;
   137	
   138		*bdev = dev->bdev;
   139	
   140		/*
   141		 * Only pass ioctls through if the device sizes match exactly.
   142		 */
   143		if (lc->start ||
   144		    ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT)
   145			return 1;
   146		return 0;
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
