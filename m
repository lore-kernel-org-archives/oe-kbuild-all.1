Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E754A2F3A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677519654; x=1709055654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LB3d/K7r4CQRwqd76xBJTxNWKvbaovbYBB/FglUMPhM=;
  b=QenGztJnff9lfWHaN5hHBFEhnxaEUKisvV1bMhVuCaO1TVVfL2E6c+N2
   5ZuHfH1WmpWeUF8A9dUFdojKU5VLW4hseCNkGmTgiHv0UC1iEvYleGGn6
   N1f2qCTcN9FJye1+nyf6PH0wJfmtuFw5DNqMMQaT1/KayCHlbJ3FWNDC9
   eDhrHxoCTclFKZl5p79l4IgUgTMJaQ7lLraxrh8RheFqaOMciQzNKOXCy
   NpXwxmi+zELYy3fJsYhfzFtM3bazztiS2hKZFoMAM9QQFgh6ZDM5tm+JU
   prQVGqk5vLHvmQrqpgMMAVpRemtzCoj1KcoJCiqgjJ9UKdmD9aHcUbuhn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336205076"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="336205076"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 09:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="673811600"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="673811600"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Feb 2023 09:40:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWhUa-0004dd-0b;
	Mon, 27 Feb 2023 17:40:52 +0000
Date: Tue, 28 Feb 2023 01:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 461/583]
 drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c:1383:9:
 warning: 'strncpy' output may be truncated copying 31 bytes from a string of
 length 31
Message-ID: <202302280138.Thd75UgI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: acb413230e2baae37462eaa425351e6bb4c81627 [461/583] vc04_services: vchiq-mmal: Add defines for mmal_es_format flags
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280138.Thd75UgI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/acb413230e2baae37462eaa425351e6bb4c81627
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout acb413230e2baae37462eaa425351e6bb4c81627
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/char/broadcom/ drivers/staging/vc04_services/bcm2835-codec/ drivers/staging/vc04_services/vc-sm-cma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280138.Thd75UgI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c: In function 'vidioc_querycap':
>> drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c:1383:9: warning: 'strncpy' output may be truncated copying 31 bytes from a string of length 31 [-Wstringop-truncation]
    1383 |         strncpy(cap->card, dev->vfd.name, sizeof(cap->card) - 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +1383 drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c

67cab07a284f80 Dave Stevenson 2020-10-08  1373  
67cab07a284f80 Dave Stevenson 2020-10-08  1374  /*
67cab07a284f80 Dave Stevenson 2020-10-08  1375   * video ioctls
67cab07a284f80 Dave Stevenson 2020-10-08  1376   */
67cab07a284f80 Dave Stevenson 2020-10-08  1377  static int vidioc_querycap(struct file *file, void *priv,
67cab07a284f80 Dave Stevenson 2020-10-08  1378  			   struct v4l2_capability *cap)
67cab07a284f80 Dave Stevenson 2020-10-08  1379  {
67cab07a284f80 Dave Stevenson 2020-10-08  1380  	struct bcm2835_codec_dev *dev = video_drvdata(file);
67cab07a284f80 Dave Stevenson 2020-10-08  1381  
67cab07a284f80 Dave Stevenson 2020-10-08  1382  	strncpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver) - 1);
67cab07a284f80 Dave Stevenson 2020-10-08 @1383  	strncpy(cap->card, dev->vfd.name, sizeof(cap->card) - 1);
67cab07a284f80 Dave Stevenson 2020-10-08  1384  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
67cab07a284f80 Dave Stevenson 2020-10-08  1385  		 MEM2MEM_NAME);
67cab07a284f80 Dave Stevenson 2020-10-08  1386  	return 0;
67cab07a284f80 Dave Stevenson 2020-10-08  1387  }
67cab07a284f80 Dave Stevenson 2020-10-08  1388  

:::::: The code at line 1383 was first introduced by commit
:::::: 67cab07a284f806a257bf7cd3e1ac03e0a8794ee staging: vc04_services: Add a V4L2 M2M codec driver

:::::: TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
:::::: CC: Dom Cobley <popcornmix@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
