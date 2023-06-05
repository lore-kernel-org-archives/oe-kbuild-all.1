Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF391C777
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685973998; x=1717509998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n6ajSEW4ucTeRY8ZfzjfuX4MgorLB8QxEnjd72cLZE8=;
  b=F57kfZajfaeOgodbS7KTYwja8lw109uHAH8Lc+CiwmcW9rgyQLEBFkew
   mR5YJ2bdEvTQ5dyJkqSWsHzd+r35wnZGWR8JLUN9Xm+3f3MauC//wTNmz
   N4ok4MEQ8fDexQ/SOSL0E7Yib9sVrDQ780OMWDdUdvY5E/w4eNxEYDm01
   h2zGrTGb94UdXZOEBct0jkMZAelWDuoIewbdCEsAXJcHahTduTeAP2vxR
   BdS0cxC7CTFGIw+rs3IQWvdA2GFMyYfTW46muHhdvZJEFM/5fHGojqbCx
   MpzNnj3EaVqIJ2kJE2jJqPi5J22VG6Fk+hnNnbkWmfDxOhrB3HVvAI+Yq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="422200290"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="422200290"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 07:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798454487"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="798454487"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 07:05:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6ApW-0004Bx-0n;
	Mon, 05 Jun 2023 14:05:06 +0000
Date: Mon, 5 Jun 2023 22:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 45/48] drivers/block/swim.c:617:61:
 error: 'BLK_MODE_EXCL' undeclared; did you mean 'BLK_OPEN_EXCL'?
Message-ID: <202306052128.t7y2BgME-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230605/202306052128.t7y2BgME-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 54822e562a29c2e2098f70e01d9b1d8a96213d94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306052128.t7y2BgME-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/swim.c: In function 'floppy_open':
>> drivers/block/swim.c:617:61: error: 'BLK_MODE_EXCL' undeclared (first use in this function); did you mean 'BLK_OPEN_EXCL'?
     617 |         if (fs->ref_count == -1 || (fs->ref_count && mode & BLK_MODE_EXCL))
         |                                                             ^~~~~~~~~~~~~
         |                                                             BLK_OPEN_EXCL
   drivers/block/swim.c:617:61: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/block/swim.c:637:22: error: 'BLK_MODE_BLOCKING' undeclared (first use in this function); did you mean 'BLK_MQ_F_BLOCKING'?
     637 |         if (!(mode & BLK_MODE_BLOCKING))
         |                      ^~~~~~~~~~~~~~~~~
         |                      BLK_MQ_F_BLOCKING
>> drivers/block/swim.c:640:21: error: 'BLK_MODE_READ' undeclared (first use in this function); did you mean 'BLK_OPEN_READ'?
     640 |         if (mode & (BLK_MODE_READ | BLK_MODE_WRITE)) {
         |                     ^~~~~~~~~~~~~
         |                     BLK_OPEN_READ
>> drivers/block/swim.c:640:37: error: 'BLK_MODE_WRITE' undeclared (first use in this function); did you mean 'BLK_OPEN_WRITE'?
     640 |         if (mode & (BLK_MODE_READ | BLK_MODE_WRITE)) {
         |                                     ^~~~~~~~~~~~~~
         |                                     BLK_OPEN_WRITE
--
>> drivers/block/ataflop.c:1966:13: error: conflicting types for 'floppy_release'; have 'void(struct gendisk *, blk_mode_t)' {aka 'void(struct gendisk *, unsigned int)'}
    1966 | static void floppy_release(struct gendisk *disk, blk_mode_t mode)
         |             ^~~~~~~~~~~~~~
   drivers/block/ataflop.c:451:13: note: previous declaration of 'floppy_release' with type 'void(struct gendisk *)'
     451 | static void floppy_release(struct gendisk *disk);
         |             ^~~~~~~~~~~~~~
>> drivers/block/ataflop.c:1982:27: error: initialization of 'void (*)(struct gendisk *)' from incompatible pointer type 'void (*)(struct gendisk *, blk_mode_t)' {aka 'void (*)(struct gendisk *, unsigned int)'} [-Werror=incompatible-pointer-types]
    1982 |         .release        = floppy_release,
         |                           ^~~~~~~~~~~~~~
   drivers/block/ataflop.c:1982:27: note: (near initialization for 'floppy_fops.release')
   cc1: some warnings being treated as errors


vim +617 drivers/block/swim.c

   610	
   611	static int floppy_open(struct gendisk *disk, blk_mode_t mode)
   612	{
   613		struct floppy_state *fs = disk->private_data;
   614		struct swim __iomem *base = fs->swd->base;
   615		int err;
   616	
 > 617		if (fs->ref_count == -1 || (fs->ref_count && mode & BLK_MODE_EXCL))
   618			return -EBUSY;
   619		if (mode & BLK_MODE_EXCL)
   620			fs->ref_count = -1;
   621		else
   622			fs->ref_count++;
   623		swim_write(base, setup, S_IBM_DRIVE  | S_FCLK_DIV2);
   624		udelay(10);
   625		swim_drive(base, fs->location);
   626		swim_motor(base, ON);
   627		swim_action(base, SETMFM);
   628		if (fs->ejected)
   629			setup_medium(fs);
   630		if (!fs->disk_in) {
   631			err = -ENXIO;
   632			goto out;
   633		}
   634	
   635		set_capacity(fs->disk, fs->total_secs);
   636	
 > 637		if (!(mode & BLK_MODE_BLOCKING))
   638			return 0;
   639	
 > 640		if (mode & (BLK_MODE_READ | BLK_MODE_WRITE)) {
   641			if (disk_check_media_change(disk) && fs->disk_in)
   642				fs->ejected = 0;
   643			if ((mode & FMODE_WRITE) && fs->write_protected) {
   644				err = -EROFS;
   645				goto out;
   646			}
   647		}
   648		return 0;
   649	out:
   650		if (fs->ref_count < 0)
   651			fs->ref_count = 0;
   652		else if (fs->ref_count > 0)
   653			--fs->ref_count;
   654	
   655		if (fs->ref_count == 0)
   656			swim_motor(base, OFF);
   657		return err;
   658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
