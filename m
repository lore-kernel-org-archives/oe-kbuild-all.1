Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EE805
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 01:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681523165; x=1713059165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILExBvfteA7j7rDP2guOtRUu07J1NO7iaRbbBuDI+Ek=;
  b=I+7TZpBupH2M97gb1fO7NlJfgtKEjxD//qfMt9DqB+C2rhN5ZCuZzHfv
   fBwt0Kjui0SlJxxiAYHf7EJ3yaqZDYyBnuA4crgyCFN2WBuM1GwW7+bZh
   wcxapa8M5P1aNKCj3GxDZVAlhxeYpkACLv8FCTyqJBkr5iBH2nnLpdnda
   JT14jCMW9Or+9F3UGEPVxL65I0GaWyLAFXVuw7kbIHF3IoOF/V0CCchzE
   aZNC0Q9jC+K2jutyVWGLkz1I/Cutvt7i7qOEbBM9ICiPGLIIWQjYeJ05k
   sybS/prGpb4NHgqtMtk21APQ7GR12H8xYtvDIVCYf2etXfvz/cwQUAQcQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343360028"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="343360028"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 18:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="640294688"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="640294688"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2023 18:46:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnUzL-000aGY-1M;
	Sat, 15 Apr 2023 01:46:03 +0000
Date: Sat, 15 Apr 2023 09:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1300/9838]
 usr/include/linux/videodev2.h:2437:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202304150900.dfNjxyV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/9838] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230415/202304150900.dfNjxyV0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d368bdd73e55410f089fc065109f13953f409d88
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout d368bdd73e55410f089fc065109f13953f409d88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150900.dfNjxyV0-lkp@intel.com/

Note: the freescale-fslc/pr/629 HEAD d1033c2e51746dfdb7179c82e38b03ba7de39c63 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/ipu.h:29:
>> usr/include/linux/videodev2.h:2437:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   usr/include/linux/videodev2.h:2437:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
