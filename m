Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228C5261C2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685982737; x=1717518737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ij9KZdPCB8dut8heW0p4VfIvvkon+aWmTvXCN4WuePw=;
  b=fl34WIJ2vJBu7O1uAFW6OQxLwNyRNNv0CG+NilOrylJbcSHMeAvUZSnZ
   IYptNhWMz08a2tZlNpj6dxMuhxQF7l1nhMmxNrNydy0Wvnd9MmmFZqQbF
   cCii3eWQExsptP5jc5cXPnH8pxFYqFVwWU+cwLVqjF+N1pxXy2WjiFH4j
   SF5CstFuQo7h1lZfdJIVHMLXKx/R3BTke/Ac02VbRhIdud1orxDKymtIx
   ASF6MMT2df9i8TpMy7ArXAzLukc5HV3Yv8lNT7IClGBxzfZ00AzIJG+6Z
   GmIrafAkrKzVpN6lIVN9cp42G/Cl1wn4hTQ9/6gJO45GoVfFcFh/Qev9G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="346009342"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="346009342"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 09:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798504262"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="798504262"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 09:32:14 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6D7t-0004HH-23;
	Mon, 05 Jun 2023 16:32:13 +0000
Date: Tue, 6 Jun 2023 00:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 45/48] drivers/block/floppy.c:4222:35:
 error: initialization of 'void (*)(struct gendisk *)' from incompatible
 pointer type 'void (*)(struct gendisk *, blk_mode_t)' {aka 'void (*)(struct
 gendisk *, unsigned int)'}
Message-ID: <202306060052.v3Tv6jj5-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230606/202306060052.v3Tv6jj5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 54822e562a29c2e2098f70e01d9b1d8a96213d94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060052.v3Tv6jj5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/floppy.c:4222:35: error: initialization of 'void (*)(struct gendisk *)' from incompatible pointer type 'void (*)(struct gendisk *, blk_mode_t)' {aka 'void (*)(struct gendisk *, unsigned int)'} [-Werror=incompatible-pointer-types]
    4222 |         .release                = floppy_release,
         |                                   ^~~~~~~~~~~~~~
   drivers/block/floppy.c:4222:35: note: (near initialization for 'floppy_fops.release')
   cc1: some warnings being treated as errors


vim +4222 drivers/block/floppy.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  4218  
83d5cde47dedf0 Alexey Dobriyan   2009-09-21  4219  static const struct block_device_operations floppy_fops = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  4220  	.owner			= THIS_MODULE,
a4af9b48cb480f Al Viro           2008-03-02  4221  	.open			= floppy_open,
a4af9b48cb480f Al Viro           2008-03-02 @4222  	.release		= floppy_release,
8a6cfeb6deca3a Arnd Bergmann     2010-07-08  4223  	.ioctl			= fd_ioctl,
a885c8c4316e1c Christoph Hellwig 2006-01-08  4224  	.getgeo			= fd_getgeo,
1a8a74f03fcde1 Tejun Heo         2011-03-09  4225  	.check_events		= floppy_check_events,
229b53c9bf4e11 Al Viro           2017-06-27  4226  #ifdef CONFIG_COMPAT
229b53c9bf4e11 Al Viro           2017-06-27  4227  	.compat_ioctl		= fd_compat_ioctl,
229b53c9bf4e11 Al Viro           2017-06-27  4228  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  4229  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  4230  

:::::: The code at line 4222 was first introduced by commit
:::::: a4af9b48cb480f5016947bbd3f396c265c7cb368 [PATCH] switch floppy

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
