Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6141879EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677523376; x=1709059376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFEidDMoHBIm4eVSpcFctpgdHfZZlWuQI9jQ+wI6w+o=;
  b=D5/FCM8yDDd0rsCK6LO3Ke/QHVFOZ3E4EOUkpIsuiGvd+Regiu5Tukcj
   CfheFpyZHUqASXHnS2101U6qPO7STRGrb2AWhoCS5ETSz4V5Nzt2irXbD
   fJck/nYxtImLZXUTzrpUDBGk3oiiE1JYuS3Tv+zpUhzHVgPQaTLzAeZxC
   ZW4kSM4NNU9hgyQo+L7rTN8vIpWtVx/WtIK1KJBtBhgModvs1Zmije0mJ
   GCeiV+BychnMwm+Ej99dvnqXTPfRjD+Jn89qgpwlo34aM2qOXepBejMTr
   gnRxIuFu0oaQqRsyrYMQ4LBDA0+WC5pavUzET8ft11fV7DuWAPYTX6Pl4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322184231"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="322184231"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 10:42:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="762833460"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="762833460"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2023 10:42:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWiSb-0004gL-2T;
	Mon, 27 Feb 2023 18:42:53 +0000
Date: Tue, 28 Feb 2023 02:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:saa7146 6/7]
 drivers/media/common/saa7146/saa7146_video.c:320:22: warning: variable
 'resource' set but not used
Message-ID: <202302280216.uVPrZOta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git saa7146
head:   8574988163c112b1ec209581c0bd4a1e9fddde77
commit: 4a4b186f474b70573008189daf27a0ddb2903a86 [6/7] wip
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280216.uVPrZOta-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree saa7146
        git checkout 4a4b186f474b70573008189daf27a0ddb2903a86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/media/common/saa7146/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280216.uVPrZOta-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/common/saa7146/saa7146_video.c: In function 'video_begin':
>> drivers/media/common/saa7146/saa7146_video.c:320:22: warning: variable 'resource' set but not used [-Wunused-but-set-variable]
     320 |         unsigned int resource;
         |                      ^~~~~~~~
   drivers/media/common/saa7146/saa7146_video.c: In function 'video_end':
   drivers/media/common/saa7146/saa7146_video.c:386:22: warning: variable 'resource' set but not used [-Wunused-but-set-variable]
     386 |         unsigned int resource;
         |                      ^~~~~~~~


vim +/resource +320 drivers/media/common/saa7146/saa7146_video.c

^1da177e4c3f415 drivers/media/common/saa7146_video.c         Linus Torvalds 2005-04-16  315  
4a4b186f474b705 drivers/media/common/saa7146/saa7146_video.c Hans Verkuil   2023-02-27  316  static int video_begin(struct saa7146_dev *dev)
^1da177e4c3f415 drivers/media/common/saa7146_video.c         Linus Torvalds 2005-04-16  317  {
^1da177e4c3f415 drivers/media/common/saa7146_video.c         Linus Torvalds 2005-04-16  318  	struct saa7146_vv *vv = dev->vv_data;
^1da177e4c3f415 drivers/media/common/saa7146_video.c         Linus Torvalds 2005-04-16  319  	struct saa7146_format *fmt = NULL;
^1da177e4c3f415 drivers/media/common/saa7146_video.c         Linus Torvalds 2005-04-16 @320  	unsigned int resource;
4a4b186f474b705 drivers/media/common/saa7146/saa7146_video.c Hans Verkuil   2023-02-27  321  	int err = 0;
^1da177e4c3f415 drivers/media/common/saa7146_video.c         Linus Torvalds 2005-04-16  322  
4a4b186f474b705 drivers/media/common/saa7146/saa7146_video.c Hans Verkuil   2023-02-27  323  	DEB_EE("dev:%p\n", dev);
^1da177e4c3f415 drivers/media/common/saa7146_video.c         Linus Torvalds 2005-04-16  324  

:::::: The code at line 320 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
