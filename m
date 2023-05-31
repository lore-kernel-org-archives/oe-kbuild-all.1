Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8D805
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685558557; x=1717094557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1DwFFECSAg+69upgzBxbRiYjqpVqgDwVN6n/cdJ4pAw=;
  b=bfz8UJ9TfhpTQXvfnyj6krdZlrdy4+6Zysvf4US3FdcBgPErimQXNXpR
   YoVG2EWsh3hXn28pQfioIPhJD7o2gvlNVhp6FsrTt/AP+U5hBwwY4YXMr
   nGj96LySrEwOH7ImG6skZMIsxPKN/wu5d/KgxYiUHQgx4OrTgeNbhOzqy
   wYoa/OQlwFD5JsCYgErTXcOoHLUs2zHE+Xx6wHMV5ZLsR6oM3/3uxl8Kp
   hmDvOE7rkt0jMseK29h+0ZTrURV6tSJ/woxodtt2q0kjBrTqUpvmF482d
   joNUFMZAU04dc3fE8JYUeCvJjP2216hr2wE340SZWQIGnpFWW7xV0T/og
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="357719329"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="357719329"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 11:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="740080919"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="740080919"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2023 11:42:36 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4QmJ-0001Xh-1i;
	Wed, 31 May 2023 18:42:35 +0000
Date: Thu, 1 Jun 2023 02:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/10] ld.lld: error: undefined
 symbol: led_mc_calc_color_components
Message-ID: <202306010202.tzI77b8P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   f075722ce9292fa3cb0a07b0fe617000fabe7030
commit: c3336b229d33938c45da272589c68a3e66505fbd [2/10] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: x86_64-randconfig-x091-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010202.tzI77b8P-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout c3336b229d33938c45da272589c68a3e66505fbd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010202.tzI77b8P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_multicolor_register_ext
   >>> referenced by led-class-multicolor.h:74 (include/linux/led-class-multicolor.h:74)
   >>>               hid/hid-playstation.o:(ps_lightbar_register) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: led_mc_calc_color_components
   >>> referenced by hid-playstation.c:816 (drivers/hid/hid-playstation.c:816)
   >>>               hid/hid-playstation.o:(dualsense_lightbar_set_brightness) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
