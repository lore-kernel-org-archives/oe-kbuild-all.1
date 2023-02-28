Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C3C2F49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677582812; x=1709118812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFk0JgQ5PBBlwqHzuDP2H7N17YUK4N4Xesd++JEGrWQ=;
  b=fKxemvOrJ9XM01Yt2wThEUSVfz8vZpMgvP21gWnwvp3dwGuXlBARHcyR
   lTcYneQejvQLnKGCCufquzyMgqivliM6BSOeeFseZQniYxUhuCryBJT40
   i1o1+hLhaNVinNcBPSWrwHJuXj1saVxJnpqVqhmbGz2WRhXlNHEnal8Og
   rIK+ohjO6+bXVsOi6lkdBeE619I0UA1MOD4gYxPtp7sfOdXPkc1NrItW1
   bGuo27zKO7QFcsSGa4rwrmukns495uLVoUXOcxR6936hI/OlJfBvCRXyO
   odRsHxKR9zZ4266LOdW+esnryf2sGDtXOfcLrnSyEkk+kMgm/7wuoFndK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317908752"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="317908752"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 03:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="798034599"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="798034599"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Feb 2023 03:13:29 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWxvF-0005L1-0Z;
	Tue, 28 Feb 2023 11:13:29 +0000
Date: Tue, 28 Feb 2023 19:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 103/583] clk-bcm2835.c:undefined
 reference to `rpi_firmware_get'
Message-ID: <202302281937.XjswwnwK-lkp@intel.com>
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
commit: 5f657fb88886df899fe452d34400aad106ccac88 [103/583] clk-bcm2835: Read max core clock from firmware
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302281937.XjswwnwK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/5f657fb88886df899fe452d34400aad106ccac88
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 5f657fb88886df899fe452d34400aad106ccac88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281937.XjswwnwK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/bcm/clk-bcm2835.o: in function `bcm2835_clk_probe':
>> clk-bcm2835.c:(.text+0x126c): undefined reference to `rpi_firmware_get'
   arm-linux-gnueabi-ld: drivers/clk/bcm/clk-bcm2835.o: in function `bcm2835_clock_get_rate_vpu':
>> clk-bcm2835.c:(.text+0x1a90): undefined reference to `rpi_firmware_property'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
