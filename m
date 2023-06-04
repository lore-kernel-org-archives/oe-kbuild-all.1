Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446C4101E5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685895601; x=1717431601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qAhomWJaQy9c8cmbG0s669fcrvNSB17jSbR2ReWozP4=;
  b=fn1hinIwrskrdtDDcfiEQwNHUMeFkXjTjEPkhdWWbIpGqZVisPAyQYkA
   oZZIsNwUhUZfJUWuIjJBPsUb+ygZ+s5U6ozofmINx3t4Hkph8VbNYJ4s+
   F8OYfjM5Nn1v5ZnZqv5hV/SzSRzSUCQ13bWUXaxyhBc7PgZo/N4pD54tA
   CIlU8CgtrFWt40PLMgY4pWrTl7el1mA17/M9GK3TzzP+uExiL4a/YmIe2
   9RB0anOojeXOEy2mX60gH0XZ6ovfnogkhjA7ys0rBCAzAtLk2ydmNSxi7
   Nm8u6njteumVv9ohYb6TVNqMlfs47Xj6YHxADEhLowcRfyFscizXB/5Iz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="336561278"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="336561278"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 09:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="820889383"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="820889383"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Jun 2023 09:19:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5qSU-00036t-2U;
	Sun, 04 Jun 2023 16:19:58 +0000
Date: Mon, 5 Jun 2023 00:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 11/11]
 drivers/s390/block/dcssblk.c:45:27: error: initialization of 'void
 (*)(struct gendisk *)' from incompatible pointer type 'void (*)(struct
 gendisk *, fmode_t)' {aka 'void (*)(struct gendisk *, unsigned int)'}
Message-ID: <202306050029.dRFOc9ow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-open-release
head:   82e16464921aeb370b735b19188e8d1078e1867f
commit: 82e16464921aeb370b735b19188e8d1078e1867f [11/11] block: remove the unused mode argument to ->release
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230605/202306050029.dRFOc9ow-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 82e16464921aeb370b735b19188e8d1078e1867f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/s390/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050029.dRFOc9ow-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/block/dcssblk.c:45:27: error: initialization of 'void (*)(struct gendisk *)' from incompatible pointer type 'void (*)(struct gendisk *, fmode_t)' {aka 'void (*)(struct gendisk *, unsigned int)'} [-Werror=incompatible-pointer-types]
      45 |         .release        = dcssblk_release,
         |                           ^~~~~~~~~~~~~~~
   drivers/s390/block/dcssblk.c:45:27: note: (near initialization for 'dcssblk_devops.release')
   cc1: some warnings being treated as errors


vim +45 drivers/s390/block/dcssblk.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  39  
^1da177e4c3f41 Linus Torvalds    2005-04-16  40  static int dcssblk_major;
83d5cde47dedf0 Alexey Dobriyan   2009-09-21  41  static const struct block_device_operations dcssblk_devops = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  42  	.owner   	= THIS_MODULE,
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  43  	.submit_bio	= dcssblk_submit_bio,
46d74326e660b2 Al Viro           2008-03-02  44  	.open    	= dcssblk_open,
46d74326e660b2 Al Viro           2008-03-02 @45  	.release 	= dcssblk_release,
7a2765f6e82063 Dan Williams      2017-01-26  46  };
7a2765f6e82063 Dan Williams      2017-01-26  47  

:::::: The code at line 45 was first introduced by commit
:::::: 46d74326e660b2878005d222fb3efbc4eaa1ea4a [PATCH] switch dcssblk

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
