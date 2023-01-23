Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88F8829
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674517109; x=1706053109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TYZlpZgaHPM4moCtDp8sCeGFQ4I40LFkBABINECC9Nk=;
  b=HfIP9E5Qhb691WGwBd4ehmG9NljNeL1g6Bmd9Mkpmq3eJVDoHxeUkZPU
   3Xa6Lcsn8QlhFZUMZyw7cWx3vaxrHyWgQ7bME6bQJTHbyB9r+/Ard6C/O
   s3w5vDq7Xuf6s6YBbAuvYvG4jiqbBj9zDNwILbk05WOLZO78JA5RrCYoU
   FAomjZH/DN3Y9qj0B5X8W8P1PU4N7RAcB8HrpcgnYSao7J3KRZ+87SrPc
   kAVhmkuAs8zsKQXTSTybclpe7FUVRymtW//LkE/kmL7oaebiDjxhADUEm
   lwKDoDdT0vIb/6JGBBPrEj+ccFFDJEICcLwcSgCk1+LTSOY21vMcPDdQv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323881117"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="323881117"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 15:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639380550"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="639380550"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 15:38:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK6OQ-0005x6-10;
	Mon, 23 Jan 2023 23:38:26 +0000
Date: Tue, 24 Jan 2023 07:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/deprecated/android-4.14-p-release
 73/6167] drivers/md/dm-linear.c:132:5: warning: no previous prototype for
 function 'dm_linear_prepare_ioctl'
Message-ID: <202301240743.iW1CbfQZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/deprecated/android-4.14-p-release
head:   0ca5d5ac9152d01b3494fb2efb5390319eb9904a
commit: 28969a9aaf3fd1a5d67d23ed0e9735adc389caa3 [73/6167] ANDROID: dm: android-verity: adopt changes made to dm callbacks
config: x86_64-randconfig-a013-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240743.iW1CbfQZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/28969a9aaf3fd1a5d67d23ed0e9735adc389caa3
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/deprecated/android-4.14-p-release
        git checkout 28969a9aaf3fd1a5d67d23ed0e9735adc389caa3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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

   114	
 > 115	void dm_linear_status(struct dm_target *ti, status_type_t type,
   116				  unsigned status_flags, char *result, unsigned maxlen)
   117	{
   118		struct linear_c *lc = (struct linear_c *) ti->private;
   119	
   120		switch (type) {
   121		case STATUSTYPE_INFO:
   122			result[0] = '\0';
   123			break;
   124	
   125		case STATUSTYPE_TABLE:
   126			snprintf(result, maxlen, "%s %llu", lc->dev->name,
   127					(unsigned long long)lc->start);
   128			break;
   129		}
   130	}
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
