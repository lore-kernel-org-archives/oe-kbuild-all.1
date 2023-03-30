Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9ED1C3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 10:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680173050; x=1711709050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUAMKtbaluTdZzTXaAdlz5et1YoUjsAl2/ajrRHZbNk=;
  b=N+AEa97mT1pTDMxtCkqzqa9qS9RUhv3FCZ0XGBYPPczifRAJaBPWT3nz
   8TJoFzQtB4GMR1PKYfnzGai3PjKxZcsRCBlQby5kQsYSemAekPBxMR31P
   mFsrZm7tbZobtJ2x7aFQBPplAG1pgwfNucvQW2so+f12PRrnjWaHWWw2H
   bXJ23dlr2ZBkTh0GszVU4EjzpvAzZcK62b3WbYv71KDmDbcmfbQgTYdhO
   Hhzk+QzpjweBwukwlLYfJD9iYZHMRmq052x5CknRylO+l5VHp0Wfy9Cfe
   +347P9/iQk1HULLWZl2K9jkyIQeNWDUGZ7fiw6AHJbL3Zo0j7zuL6bmCQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="325055588"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="325055588"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 03:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="678146362"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="678146362"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 03:43:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phpky-000KlI-2L;
	Thu, 30 Mar 2023 10:43:48 +0000
Date: Thu, 30 Mar 2023 18:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:class_cleanup 104/104] drivers/char/dsp56k.c:104:40:
 error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
Message-ID: <202303301809.zlocAixw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   0a691d3e4ee7c40089125d7643399d5ec1edf340
commit: 0a691d3e4ee7c40089125d7643399d5ec1edf340 [104/104] driver core: convert class_create() to class_register()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230330/202303301809.zlocAixw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=0a691d3e4ee7c40089125d7643399d5ec1edf340
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core class_cleanup
        git checkout 0a691d3e4ee7c40089125d7643399d5ec1edf340
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301809.zlocAixw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/dsp56k.c:104:40: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     104 | static const struct class dsp56k_class {
         |                                        ^
   drivers/char/dsp56k.c: In function 'dsp56k_init_driver':
>> drivers/char/dsp56k.c:509:31: error: 'dsp45k_class' undeclared (first use in this function)
     509 |         err = class_register(&dsp45k_class);
         |                               ^~~~~~~~~~~~
   drivers/char/dsp56k.c:509:31: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/dsp56k.c:512:24: error: 'dsp56k_class' undeclared (first use in this function); did you mean 'dsp56k_fops'?
     512 |         device_create(&dsp56k_class, NULL, MKDEV(DSP56K_MAJOR, 0), NULL,
         |                        ^~~~~~~~~~~~
         |                        dsp56k_fops
   drivers/char/dsp56k.c: In function 'dsp56k_cleanup_driver':
   drivers/char/dsp56k.c:527:25: error: 'dsp56k_class' undeclared (first use in this function); did you mean 'dsp56k_fops'?
     527 |         device_destroy(&dsp56k_class, MKDEV(DSP56K_MAJOR, 0));
         |                         ^~~~~~~~~~~~
         |                         dsp56k_fops


vim +104 drivers/char/dsp56k.c

   103	
 > 104	static const struct class dsp56k_class {
   105		.name = "dsp56k",
   106	};
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
