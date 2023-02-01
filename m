Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC17E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 01:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675215517; x=1706751517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDbjCKo46pmw8szD4bsvYz2EuJ3K5UFVdJp9uDpm1mo=;
  b=DlILHQhUoujLbL/yVNqJx+JPm/Ahvo6GXPbhu6hIy48rq6InKrPWx18/
   o0cHgQvL9J5xDXP5WZk1QPS8ZeTXW0yenMsu7bzNva0cf3/OE+8+LNjwM
   OZE7kO9+YiQkQgB2wxxtfwUgwHbI2Qk099EWY9UpjTZEGTrHmD1+WLYRi
   f2m+5Kd2DUQ/HDMBnAlLkw8GXc//EPC7p0zVo8pJTgc0DCm/Wd4ygxNgz
   q/dv7JBtY4RBCGBC463mftJJ510V2Cx0uq1DnUd21NdHRQ/giKAtijerB
   C4tJ+MqrqM4ADQ1DF8xEfaD9d5YSI8Rsce0uKw5rnGomAu+J/ANmwsEUK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="325711623"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="325711623"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 17:38:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910127923"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="910127923"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 17:38:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN255-0004tS-0r;
	Wed, 01 Feb 2023 01:38:35 +0000
Date: Wed, 1 Feb 2023 09:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 8520/9515] arch/arm/mach-pxa/cm-x300.c:26:10:
 fatal error: linux/platform_data/rtc-v3020.h: No such file or directory
Message-ID: <202302010907.ldMaJ10q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   80bd9028fecadae4e8e3a278cd32d74badc2a6e0
commit: bf5c08d3de21fc9145b829f668c71fa346bb8644 [8520/9515] rtc: remove v3020 driver
config: arm-cm_x300_defconfig (https://download.01.org/0day-ci/archive/20230201/202302010907.ldMaJ10q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bf5c08d3de21fc9145b829f668c71fa346bb8644
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bf5c08d3de21fc9145b829f668c71fa346bb8644
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 80bd9028fecadae4e8e3a278cd32d74badc2a6e0 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/arm/mach-pxa/cm-x300.c:26:10: fatal error: linux/platform_data/rtc-v3020.h: No such file or directory
      26 | #include <linux/platform_data/rtc-v3020.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +26 arch/arm/mach-pxa/cm-x300.c

cf75d8d213f58c0 Mike Rapoport     2008-08-26  21  
cf75d8d213f58c0 Mike Rapoport     2008-08-26  22  #include <linux/gpio.h>
9b00bc7b901ff67 Linus Walleij     2018-02-12  23  #include <linux/gpio/machine.h>
cf75d8d213f58c0 Mike Rapoport     2008-08-26  24  #include <linux/dm9000.h>
cf75d8d213f58c0 Mike Rapoport     2008-08-26  25  #include <linux/leds.h>
cd9b518b98d3e98 Alexandre Belloni 2016-06-27 @26  #include <linux/platform_data/rtc-v3020.h>
783bc78836563af Thierry Reding    2015-10-05  27  #include <linux/pwm.h>
db205463fd24c09 Igor Grinberg     2009-11-10  28  #include <linux/pwm_backlight.h>
cf75d8d213f58c0 Mike Rapoport     2008-08-26  29  

:::::: The code at line 26 was first introduced by commit
:::::: cd9b518b98d3e989f523e63b2ffda78467a3679e rtc: v3020: move rtc-v3020.h to platform_data

:::::: TO: Alexandre Belloni <alexandre.belloni@free-electrons.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
