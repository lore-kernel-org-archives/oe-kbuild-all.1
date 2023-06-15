Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F16AA8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686835298; x=1718371298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qW7KV9J6EADC26bWtWLlOkiMY5zt8IZioaE3SJDd3ak=;
  b=eI/QWMmkzR0rbXof9j5x39K7tJlIWPV3E+fI8zViT+bM9uYBjPUUBJbR
   lFd46QtLfhdOKMlKsm0fzpvbfthOAYDzaRatloeSJMDNDwlFYPRfv3F7P
   kJQTlW8Qrm0za49QMj0JlZcbz8fZ/5n1J97DxizP1BuNqBgsNu4I3ENKV
   pxtkg7LIRfJsloJOo22MvDTbm9k99/YBvuD1igPPLUqlyYg8Bs3++lvZp
   +Ob9VwV2nn+7bCdmbyaxrYJCV9GKPXYbw8nB2LONGU/UVTu5bsN8XFNd8
   wy51XHDxP7kmI8eZKH6A7j5Sphq6FH8P5A1Vr265KG0cy22yegYCxUKQw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356403348"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="356403348"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 06:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="689781630"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="689781630"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2023 06:21:36 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9mut-0001vT-1q;
	Thu, 15 Jun 2023 13:21:35 +0000
Date: Thu, 15 Jun 2023 21:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1] ERROR: modpost:
 "uhid_hid_driver" [drivers/hid/hid.ko] undefined!
Message-ID: <202306152149.WalVMh88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   c93516a2d02c0a1f0466b3f512977c40c1bee4f0
commit: c93516a2d02c0a1f0466b3f512977c40c1bee4f0 [1/1] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20230615/202306152149.WalVMh88-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10
        git checkout c93516a2d02c0a1f0466b3f512977c40c1bee4f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152149.WalVMh88-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "uhid_hid_driver" [drivers/hid/hid.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
