Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AB2F4B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681567964; x=1713103964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Wzmw1K01yt3/vFvhBEB3XGlOvAaCYXmg+dSS/gC5rw=;
  b=fK5mhDWKbMUOjYBLsGELDZGILXH2CWVWUGSGuvQJhbiXc6IxyPLVW9Sf
   +MIZdBNxR1dhDSM36Aic9UwzzmENsf/SIE7YYkS5+9iFmyM5s6NM9+EHi
   hlgRnRZMGGy9ZbYe1cKqaxlW14MsevNiH6Jak+1NotHmznTZ5asq+zrh+
   s+VryHu0C89aG7NtRX3jkQ3BpImsyjXMvTU9pXJw7yANFxDg9AOsfdNyU
   zS37EEteFBJQfN7ixMF88RrGkQg6Wxhu+OuVRaD4YmVX+c1hvXSzhcVje
   flJQ9gR6/N8q5POl+kU31/Y6vWsArQ6eljTQC6q1F3D+NIGOiHMIUqXzX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="333436346"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="333436346"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 07:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="667636870"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="667636870"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Apr 2023 07:12:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pngdu-000b6B-1d;
	Sat, 15 Apr 2023 14:12:42 +0000
Date: Sat, 15 Apr 2023 22:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4631/9838]
 drivers/firmware/imx/ele_trng.c:91:5: error: redefinition of 'ele_trng_init'
Message-ID: <202304152252.g70HbQQu-lkp@intel.com>
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
commit: 45df0f582836b4f75f20627d85dff2668bde0f17 [4631/9838] LF-7285: firmware: imx: ele: Add support for ELE HW Random Number Generator
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304152252.g70HbQQu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/45df0f582836b4f75f20627d85dff2668bde0f17
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 45df0f582836b4f75f20627d85dff2668bde0f17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152252.g70HbQQu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/imx/ele_trng.c:44:5: warning: no previous prototype for 'ele_get_random' [-Wmissing-prototypes]
      44 | int ele_get_random(struct hwrng *rng, void *data, size_t len, bool wait)
         |     ^~~~~~~~~~~~~~
>> drivers/firmware/imx/ele_trng.c:91:5: error: redefinition of 'ele_trng_init'
      91 | int ele_trng_init(struct device *dev)
         |     ^~~~~~~~~~~~~
   In file included from drivers/firmware/imx/ele_trng.c:13:
   drivers/firmware/imx/ele_mu.h:146:19: note: previous definition of 'ele_trng_init' with type 'int(struct device *)'
     146 | static inline int ele_trng_init(struct device *dev)
         |                   ^~~~~~~~~~~~~


vim +/ele_trng_init +91 drivers/firmware/imx/ele_trng.c

    90	
  > 91	int ele_trng_init(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
