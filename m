Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602B2C9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 16:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677169458; x=1708705458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8RbXY1iA9HPIx+y52h27Fs8mLYEC2+1k2EgGYiwyxxs=;
  b=LNRCrpLAKX5g1mROyH6h+Ny1y1eHdpPkEF2UL7UGEqQCTQ7rb6GF+u+n
   kgzKu+OvkvfNIP0xUB9ZSOiKr6B1k4bkLl9PYzCZJvaD73xO/w+tUSDGU
   CwTP1GrRZGsfRDCvuM7DLsEAtIMof35o0KV6GOD6R1+Ru4TgB7n2P1hWR
   4jQpkOJxoViYdrfMpmzVJdKMuTWMgaj6eTfgG14TlH5C2Dfcz7v/S7jeR
   AXg+wyzkDgC4bm1UCQuX9Hnk6SNWo/kbZwEqA+5Xwck3LCaMsg+ybAGoE
   ieoQw7HROn5LlhJeVuNW0S6rJhHTDikzbBUubjkYE8H+UMAFRPB+ZMy4b
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="419483290"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="419483290"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 08:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741329313"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="741329313"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2023 08:24:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVEO8-0001U5-0D;
	Thu, 23 Feb 2023 16:24:08 +0000
Date: Fri, 24 Feb 2023 00:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/030-misc 19/24]
 drivers/soc/apple/rtkit-crashlog.c:6:10: fatal error: asm/esr.h: No such
 file or directory
Message-ID: <202302240026.3UuxBiM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   16b5bb2c2f8dacac332beb8584ce5cf66f32faa7
commit: a1521d50e71902d0c49980cbaaa669957bfedc6a [19/24] soc: apple: rtkit: Add register dump decoding to crashlog
config: openrisc-randconfig-r016-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240026.3UuxBiM9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/a1521d50e71902d0c49980cbaaa669957bfedc6a
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/030-misc
        git checkout a1521d50e71902d0c49980cbaaa669957bfedc6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240026.3UuxBiM9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/apple/rtkit-crashlog.c:6:10: fatal error: asm/esr.h: No such file or directory
       6 | #include <asm/esr.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +6 drivers/soc/apple/rtkit-crashlog.c

   > 6	#include <asm/esr.h>
     7	#include "rtkit-internal.h"
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
