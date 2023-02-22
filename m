Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874829A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677091291; x=1708627291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlgNdkEMKCJX1ptMNuazJAc7njzCUbVMTrwSpuoL9qE=;
  b=NRIkCcZ01YcKSFjmYnGYrrvwHXrLWRHDNerfngtV8XCScSfkwu4gTFfF
   nURin4isqY7X4uG51gkDl78Kk2GQqFBD5Vx4p8bQkqFbrv6X3GhmA5o0z
   yGtBovtqjomBFbNwHb1Grl6uxBn3ihYlGJAn4UqUW+fZPtk5GBKpjW38Z
   lTK0hVHAqewFuTG3uRSgKU8HtydAcKRL07Pwxqx0YqE8PYJRAc7HuERHt
   sw1TL0GG8GdFTnzug+HuZIyrZbxa118K/a2TX9sYnw5oRbSwbmGF2pZyu
   xAMBqVE23rX6iCj6VpmYnlequCb8PlExEHKtNGddW10bwNd8flbEIxq+L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="313384130"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="313384130"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 10:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="815033693"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="815033693"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2023 10:41:29 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUu3U-0000ev-1E;
	Wed, 22 Feb 2023 18:41:28 +0000
Date: Thu, 23 Feb 2023 02:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 7757/13727]
 arch/arm/mach-davinci/board-da830-evm.c:18:10: fatal error:
 linux/platform_data/pcf857x.h: No such file or directory
Message-ID: <202302230244.9GrTbcGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5
commit: 91a0192e90e9df40d4b63c4ce11126114ed5d79d [7757/13727] gpio: pcf857x: Get rid of legacy platform data
config: arm-buildonly-randconfig-r003-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230244.9GrTbcGc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=91a0192e90e9df40d4b63c4ce11126114ed5d79d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 91a0192e90e9df40d4b63c4ce11126114ed5d79d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230244.9GrTbcGc-lkp@intel.com/

Note: the linux-next/master HEAD aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/arm/mach-davinci/board-da830-evm.c:18:10: fatal error: linux/platform_data/pcf857x.h: No such file or directory
      18 | #include <linux/platform_data/pcf857x.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> arch/arm/mach-pxa/balloon3.c:26:10: fatal error: linux/platform_data/pcf857x.h: No such file or directory
      26 | #include <linux/platform_data/pcf857x.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 arch/arm/mach-davinci/board-da830-evm.c

b6480faeee2348 Wolfram Sang        2017-05-21 @18  #include <linux/platform_data/pcf857x.h>
c70cf56252b9c1 Bartosz Golaszewski 2019-01-08  19  #include <linux/property.h>
733975a314e4dd David A. Griego     2009-09-18  20  #include <linux/mtd/mtd.h>
733975a314e4dd David A. Griego     2009-09-18  21  #include <linux/mtd/partitions.h>
16a3c8320a1946 Sekhar Nori         2011-02-24  22  #include <linux/spi/spi.h>
16a3c8320a1946 Sekhar Nori         2011-02-24  23  #include <linux/spi/flash.h>
b856671e8ce181 Philip Avinash      2013-08-18  24  #include <linux/platform_data/gpio-davinci.h>
b856671e8ce181 Philip Avinash      2013-08-18  25  #include <linux/platform_data/mtd-davinci.h>
b856671e8ce181 Philip Avinash      2013-08-18  26  #include <linux/platform_data/mtd-davinci-aemif.h>
b856671e8ce181 Philip Avinash      2013-08-18  27  #include <linux/platform_data/spi-davinci.h>
b856671e8ce181 Philip Avinash      2013-08-18  28  #include <linux/platform_data/usb-davinci.h>
aa88d25d5296b0 Bartosz Golaszewski 2018-06-28  29  #include <linux/platform_data/ti-aemif.h>
274e4c336192b3 Bartosz Golaszewski 2019-04-12  30  #include <linux/regulator/fixed.h>
40a17abc8b9844 Axel Haslam         2016-10-26  31  #include <linux/regulator/machine.h>
c85efcc60a8922 Bartosz Golaszewski 2018-11-13  32  #include <linux/nvmem-provider.h>
8593790d604c29 Mark A. Greer       2009-06-03  33  

:::::: The code at line 18 was first introduced by commit
:::::: b6480faeee234829b315168aebcb281ecf95f178 gpio: pcf857x: move header file out of I2C realm

:::::: TO: Wolfram Sang <wsa@the-dreams.de>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
