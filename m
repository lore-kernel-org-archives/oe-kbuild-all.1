Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402D7D31A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678107006; x=1709643006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvjZkHf0G3tP6BcvNeJFEhfNwqfELrOZ1cTUDdA4N8c=;
  b=Ae1cc+snXMQUgAFwk+OysL5Dzc7DjeCKadu0bHBaNLKOz0JRAFlD/C/d
   1doqU2yWjERdUifQaydAKAyYt42xFSEnuH98UjBC6C3vejCim2+m2uBCw
   oyVOCwxznclaBnk5iEsDYaE/YHt7BK/d7OQIu9sgn4dVK8O2v6jjCBP90
   Sdm4vZGjd8UeoshhLToR1F1YumNnWwZFSKOXyswdcFRrPgSWrvDpySUNh
   H53oO98beDKZh7BxVlTAhF4SjAKweH2nGMiEr/+Ql/s9+bmCbUclMOH9w
   mJth5eDKCynidVmPh1bLeHRoaRdGL9rNdoa1cCZox4Lw/VzN/ANDYsnRq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="323852733"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="323852733"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 04:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="1005383947"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="1005383947"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 04:50:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZAHz-0000KF-1y;
	Mon, 06 Mar 2023 12:50:03 +0000
Date: Mon, 6 Mar 2023 20:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [shawnguo:imx/dt64 1/9] Error:
 arch/arm64/boot/dts/freescale/imx8mm-evkb.dts:22.2-7 syntax error
Message-ID: <202303062021.MPg00bq7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   6d23f305b41712d4dd77730aed6e8bf484ec9410
commit: c288f420e3c68df5ea750eec54a0aedba8ff59aa [1/9] arm64: dts: imx8mm-evkb: add support for i.MX8MM-EVKB
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230306/202303062021.MPg00bq7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?id=c288f420e3c68df5ea750eec54a0aedba8ff59aa
        git remote add shawnguo https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
        git fetch --no-tags shawnguo imx/dt64
        git checkout c288f420e3c68df5ea750eec54a0aedba8ff59aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303062021.MPg00bq7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/imx8mm-evkb.dts:22.2-7 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
