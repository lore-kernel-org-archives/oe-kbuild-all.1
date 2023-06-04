Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608BA28EC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685896864; x=1717432864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1ii4ll+mY0rmd4DBaGXUUCYwk83Nu/QMIWJlnZ8siI=;
  b=PmxWIlQLaoe5tnDteZbtAT2xn5yVryQqJjSyf6Qcxj60HKQ2y1MW47UT
   DuvNEfclRvqKdNWQMo8qS4yBkFh1q6wDu7MJHd1cOARywAMSElnTM9qgP
   tmnTiXIm1yLjpdQdi8NgRktwGgJw6CD0WjyE1iYeMQfNkOzLkgg98ThyV
   XtgBF5K8PdskboYGd6gyhFZpWoSgok2J3EFZw5Awe2VcSubgipCHt9zeu
   BMu8hDorIOWNJA2cvKN95TJXWY17XNCAgWzd927/EG2tSHqsHWlo2vUOA
   AeQnvpLsA74xB9c7nvwbiCHYh9V5MdSuNKd0sFi4nADcvmBAfoU6VwiBx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="353700372"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="353700372"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 09:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="778284396"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="778284396"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2023 09:41:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5qms-0003BL-0F;
	Sun, 04 Jun 2023 16:41:02 +0000
Date: Mon, 5 Jun 2023 00:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-open-release 11/11] drivers/block/z2ram.c:307:20:
 error: initialization of 'void (*)(struct gendisk *)' from incompatible
 pointer type 'void (*)(struct gendisk *, fmode_t)' {aka 'void (*)(struct
 gendisk *, unsigned int)'}
Message-ID: <202306050015.YvbC7RtF-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230605/202306050015.YvbC7RtF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block blk-open-release
        git checkout 82e16464921aeb370b735b19188e8d1078e1867f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050015.YvbC7RtF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/z2ram.c:307:20: error: initialization of 'void (*)(struct gendisk *)' from incompatible pointer type 'void (*)(struct gendisk *, fmode_t)' {aka 'void (*)(struct gendisk *, unsigned int)'} [-Werror=incompatible-pointer-types]
     307 |         .release = z2_release,
         |                    ^~~~~~~~~~
   drivers/block/z2ram.c:307:20: note: (near initialization for 'z2_fops.release')
   cc1: some warnings being treated as errors


vim +307 drivers/block/z2ram.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  303  
6c3a05e127058e Christoph Hellwig 2020-10-29  304  static const struct block_device_operations z2_fops = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  305  	.owner = THIS_MODULE,
ab746cb9386313 Al Viro           2008-03-02  306  	.open = z2_open,
ab746cb9386313 Al Viro           2008-03-02 @307  	.release = z2_release,
^1da177e4c3f41 Linus Torvalds    2005-04-16  308  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  

:::::: The code at line 307 was first introduced by commit
:::::: ab746cb9386313201f2e0060e85a30781047dee1 [PATCH] switch z2ram

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
