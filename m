Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7FC9472
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 23:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680304744; x=1711840744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JfV8O4ujDzu5AXLnOdjnLUmeb0eB9jd7bZwzWM9GTiM=;
  b=a3qfRglG4lBboCwWTd2e7HAubTxwjzVhMmUV376eNgxkr7wtW2lAK2Ll
   C5V3pJbZV/HvB27wF+coxHSixptaFuDDqo+n8+gIPGQMWJYO5yK549QQB
   HuIZ2nGZAoYoJ7fxCJ+AJqoGtj53uDoAMzjv5g5C5SeiONy5e4Jwc769t
   fmPEyhDD7AcbJ50y7R1tK2rV2TFkSwZUl6qOaKo+RDzrNPBd9G5++ZKfi
   qfeEoVYy78lIPXTWORGQtXJPODZVAi/LLUgozmtS7LcRpRJRLAqPsfBTP
   Yv6xiWiYxuNaVLs8be1XH/4j8SD7HExjmtza8Qd58oqJk8Tx4PWUwfrPn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="325558333"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="325558333"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 16:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="754545398"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="754545398"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2023 16:19:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piO1M-000MG5-2q;
	Fri, 31 Mar 2023 23:19:00 +0000
Date: Sat, 1 Apr 2023 07:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:tmp 6/25]
 drivers/media/test-drivers/visl/visl-core.c:490:50: error: incompatible type
 for argument 1 of 'media_devnode_is_registered'
Message-ID: <202304010723.Of30LwrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   42249987f00786a33526b973c650743bc49681c2
commit: 15f1c7087ec4c7e0c3e07781be4ca7d3d54ff0af [6/25] Revert "[media] media-device: dynamically allocate struct media_devnode"
config: arm-randconfig-r046-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010723.Of30LwrE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree tmp
        git checkout 15f1c7087ec4c7e0c3e07781be4ca7d3d54ff0af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/test-drivers/visl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010723.Of30LwrE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/test-drivers/visl/visl-core.c: In function 'visl_remove':
>> drivers/media/test-drivers/visl/visl-core.c:490:50: error: incompatible type for argument 1 of 'media_devnode_is_registered'
     490 |         if (media_devnode_is_registered(dev->mdev.devnode)) {
         |                                         ~~~~~~~~~^~~~~~~~
         |                                                  |
         |                                                  struct media_devnode
   In file included from include/media/media-device.h:19,
                    from include/media/media-request.h:20,
                    from include/media/v4l2-ctrls.h:14,
                    from drivers/media/test-drivers/visl/visl-core.c:44:
   include/media/media-devnode.h:140:69: note: expected 'struct media_devnode *' but argument is of type 'struct media_devnode'
     140 | static inline int media_devnode_is_registered(struct media_devnode *devnode)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~


vim +/media_devnode_is_registered +490 drivers/media/test-drivers/visl/visl-core.c

0c078e310b6d16 Daniel Almeida 2022-11-05  482  
0c078e310b6d16 Daniel Almeida 2022-11-05  483  static int visl_remove(struct platform_device *pdev)
0c078e310b6d16 Daniel Almeida 2022-11-05  484  {
0c078e310b6d16 Daniel Almeida 2022-11-05  485  	struct visl_dev *dev = platform_get_drvdata(pdev);
0c078e310b6d16 Daniel Almeida 2022-11-05  486  
0c078e310b6d16 Daniel Almeida 2022-11-05  487  	v4l2_info(&dev->v4l2_dev, "Removing " VISL_NAME);
0c078e310b6d16 Daniel Almeida 2022-11-05  488  
0c078e310b6d16 Daniel Almeida 2022-11-05  489  #ifdef CONFIG_MEDIA_CONTROLLER
0c078e310b6d16 Daniel Almeida 2022-11-05 @490  	if (media_devnode_is_registered(dev->mdev.devnode)) {
0c078e310b6d16 Daniel Almeida 2022-11-05  491  		media_device_unregister(&dev->mdev);
0c078e310b6d16 Daniel Almeida 2022-11-05  492  		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
0c078e310b6d16 Daniel Almeida 2022-11-05  493  	}
0c078e310b6d16 Daniel Almeida 2022-11-05  494  #endif
0c078e310b6d16 Daniel Almeida 2022-11-05  495  	video_unregister_device(&dev->vfd);
0c078e310b6d16 Daniel Almeida 2022-11-05  496  
0c078e310b6d16 Daniel Almeida 2022-11-05  497  	return 0;
0c078e310b6d16 Daniel Almeida 2022-11-05  498  }
0c078e310b6d16 Daniel Almeida 2022-11-05  499  

:::::: The code at line 490 was first introduced by commit
:::::: 0c078e310b6d16b9b9489bbc7bc1476430d19a7c media: visl: add virtual stateless decoder driver

:::::: TO: Daniel Almeida <daniel.almeida@collabora.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
