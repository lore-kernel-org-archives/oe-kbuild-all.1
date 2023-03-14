Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4617C6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 04:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678767435; x=1710303435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfLd1oIi/pO51pBxCqFi71USEDkKz5rAwwaoxgK7n0o=;
  b=TNbfIA+qVYr3PINpdBlhSqmUq12TJy1TDM1QW3WFJBdy1OqWCtGAaH+1
   +1SBYDoucdNCK/rj+SXk9cA6OQyG+Iox+W2MclD8vVZN6ThqPgCI/LdAs
   zLr681iU35JjuN/OPFhWNVTHqDL6gFlrDdRRWiSg7zwWoXynNIY5o9nzy
   F4ipZWgUCIfnzuJR4yLHGdUtb8FiOwGDNeC7Xc3nr7KNGKCPtibTPeQR9
   v2tknneF91HrxzibKcUXVQcgmOVVJXCQe3CATcAZhLdHh3YYhcRNfzytI
   DmH/+LU6BHx/5wHk03fq0ckoxa6jhcLzHmSRadD5csVrdNGjVZh+wV5Ew
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334804095"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="334804095"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 21:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="767953433"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="767953433"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Mar 2023 21:17:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbw65-0006WK-1G;
	Tue, 14 Mar 2023 04:17:13 +0000
Date: Tue, 14 Mar 2023 12:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [andy-gpio-intel:review-andy 11/27]
 drivers/gpio/gpio-mm-lantiq.c:13:10: fatal error:
 linux/gpio/legacy-of-mm-gpiochip.h.h: No such file or directory
Message-ID: <202303141222.6ClKYAo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git review-andy
head:   22f9fa11619d4eb7e78997935fcfb446f751d62a
commit: a99cc66807d6c854a7f65f962766c530c91be149 [11/27] gpiolib: split of_mm_gpio_chip out of linux/of_gpio.h
config: mips-xway_defconfig (https://download.01.org/0day-ci/archive/20230314/202303141222.6ClKYAo6-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/commit/?id=a99cc66807d6c854a7f65f962766c530c91be149
        git remote add andy-gpio-intel https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
        git fetch --no-tags andy-gpio-intel review-andy
        git checkout a99cc66807d6c854a7f65f962766c530c91be149
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141222.6ClKYAo6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-mm-lantiq.c:13:10: fatal error: linux/gpio/legacy-of-mm-gpiochip.h.h: No such file or directory
      13 | #include <linux/gpio/legacy-of-mm-gpiochip.h.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/gpio/gpio-mm-lantiq.c

  > 13	#include <linux/gpio/legacy-of-mm-gpiochip.h.h>
    14	#include <linux/of.h>
    15	#include <linux/io.h>
    16	#include <linux/slab.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
