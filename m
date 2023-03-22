Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769B18F58
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 17:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679506670; x=1711042670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dqXOzOTMcJmSojTd8FtlsoQ2boq3PgnKjkbToRSxoWc=;
  b=I/KZbtEO1pZjjUHRE2gJpREoYcY67xv+WVp6zXFLJOlKmHpNZWatjpcQ
   7yCPnO1MPIQaziUvZWMl449JGn7cmbcjE0xG5hi+mgnyF5xSu5Z7/2o8E
   grpWRF9enV1F9cDxcQpndzwIsLwt1rk6GeutK1bSmMjLlsUqD94YnwM0f
   rBOcpqcvRPFIpetWpdDkszEKF1qVdFZYXlf8mXy6VDjCrLP7fIshPUn+o
   ctj13/lQH4yDlxfEQAcvmFMIZZB2CBsC9ChNrm0u/46JDa9Dts7xN28x3
   OQljPJWZP9celltd7cCQmTx7pho0BVwYGlEPwJq4qbO8aNf3vlFABvIvy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336793074"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="336793074"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 10:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="927917092"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="927917092"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2023 10:37:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf2PE-000DWu-08;
	Wed, 22 Mar 2023 17:37:48 +0000
Date: Thu, 23 Mar 2023 01:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Subject: [lunn:v6.3-rc2-net-next-phy-leds 5/15] phy_device.c:undefined
 reference to `devm_led_classdev_register_ext'
Message-ID: <202303230138.I1nDLnRS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.3-rc2-net-next-phy-leds
head:   31990696068654b2fc49ca6be815e8a07f5eb30c
commit: 152381bd1930ab5201b26cceccad9ee422f287e7 [5/15] net: phy: Add a binding for PHY LEDs
config: mips-loongson3_defconfig (https://download.01.org/0day-ci/archive/20230323/202303230138.I1nDLnRS-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/152381bd1930ab5201b26cceccad9ee422f287e7
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.3-rc2-net-next-phy-leds
        git checkout 152381bd1930ab5201b26cceccad9ee422f287e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230138.I1nDLnRS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
>> phy_device.c:(.text+0x43d0): undefined reference to `devm_led_classdev_register_ext'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
