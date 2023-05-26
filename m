Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E00D742EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685103752; x=1716639752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hlYGIeQI1cGRvV42/8J4tAHvpRx+Gq/Bu7GG2LmvfWo=;
  b=ketd9X8v6V/1RkiDSNCfgIHrsC4pqIaz9TzsGH2idu6yNPObgYgw4Rki
   1sLxHYgBRUUcn+kah76bYnF39nPfCRQuxCWE1gXSjaEvSN11g4mSBcoWo
   JXRBMt8Hb4Q+Qzt0zPULnL6ZUfny4gTVX+YZ4M5sPNkzW6r356VHLU7Eq
   0jQX3PnSVwqTPebBKP4xFqC50Od3yyf5gx2XrGnskznrDSt3kOOMXtm4u
   b4GLnLWj9zLj36d47DUbLg2khTCVKqTDGgWvYenMDFpxOHbWPkpn7veE2
   kJN4ag2biFemoXNrR+weAdRgJAAwG24e92427Vofb6t8ucSGECSmiE9C3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440544077"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="440544077"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 05:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="775077418"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="775077418"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 05:22:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2WSk-000JKU-16;
	Fri, 26 May 2023 12:22:30 +0000
Date: Fri, 26 May 2023 20:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 1300/9879]
 usr/include/linux/videodev2.h:2437:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202305262014.jcyP4U6t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: d368bdd73e55410f089fc065109f13953f409d88 [1300/9879] video: fbdev: mxc: Forward IPUv3 framebuffer driver from imx_4.19.y kernel
config: i386-randconfig-i006-20230525 (https://download.01.org/0day-ci/archive/20230526/202305262014.jcyP4U6t-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d368bdd73e55410f089fc065109f13953f409d88
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout d368bdd73e55410f089fc065109f13953f409d88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305262014.jcyP4U6t-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
