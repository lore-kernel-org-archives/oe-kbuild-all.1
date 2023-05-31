Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D417736
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685553027; x=1717089027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KQCaVfP+p26YK8JtbYbJ5ET3VY86gVHcv7LY/9k5uPs=;
  b=b4mPRv/dhjOVM/rv3EgGUg/pU9ZBX95AR+Pc9tjFiDOUeECZ4P4lIgSl
   8LxJtol+ObpV921zII9OR69/TqtbuR67yBH7rOgj5VH2QLVbPI60n/cnO
   eE+Xu8e7axlKzvzBJbGdVrEb6SgbfZyBHFNHUMnPHPeRc4OlZkDB6Y0qf
   yhp/67qsN0s2vlfJX9+6nZx82M6NJVb+kh2nd0h+dnBIWNNCE0Mt0cJGV
   QfdlVHis/AxlKEqR3Ip0EMzV7h2oh68gsjYQIMEJ+jZBhXrfh1zkPEmzA
   sX18nURvMHGqvQhTWPZ6GC/egnoReUyl4zLyy/u1kft8k8CgkfXeLIA/f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354148039"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="354148039"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 10:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796797493"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="796797493"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2023 10:07:34 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4PIL-0001VD-1y;
	Wed, 31 May 2023 17:07:33 +0000
Date: Thu, 1 Jun 2023 01:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-06 17993/20126] ld.lld: error:
 undefined symbol: devm_led_classdev_register_ext
Message-ID: <202306010129.V4MSt928-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-06
head:   1247e4a9ca826161b8c13c6422a56ed008dc4de5
commit: 4281e236100d7ca198bca4e0e7e74410dc3fe751 [17993/20126] UPSTREAM: HID: playstation: fix return from dualsense_player_led_set_brightness()
config: x86_64-randconfig-x092-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010129.V4MSt928-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2023-06
        git checkout 4281e236100d7ca198bca4e0e7e74410dc3fe751
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010129.V4MSt928-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_register_ext
   >>> referenced by leds.h:206 (include/linux/leds.h:206)
   >>>               hid/hid-playstation.o:(ps_led_register) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
