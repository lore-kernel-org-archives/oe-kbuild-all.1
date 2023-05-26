Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A9523D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685091266; x=1716627266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJ4jWtuP7Djxh09FtmLEtzLq4p5nAiAyN2oMvc/3fz0=;
  b=EJAq0XF5ABzyjd9XYP05qPN7iGPhCva6b6R2y5pYXqInvOXBkHhfM+Rx
   FrrdfViHYVpkoA/JGrklpB/H/NplCGQDUwum6Mk5L2BlBwC7zA+AKg8YB
   uNkpre96emvYZ8yPqZWo/5cC9OI3JRSYrCZo5vbnMNeGX5M1HgXeM2HcR
   nH10Jj4NmVVi1c2ZAJTQ1MOFCncEDt77vpzLv/eqnqnqgqn0zJTEZvwLN
   pUnilHTpuLKReebxwNX1ttyIAP95QOhxKdD1pdQn69sf38fNmaCal6ql/
   6BUl7Yp68qZ1EzJflc18OoMDbPsvfn0LL8GMdw2izINa/m0a0YfqUZw4I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="419910072"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="419910072"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 01:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682659651"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="682659651"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 May 2023 01:54:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2TDL-000JCN-37;
	Fri, 26 May 2023 08:54:23 +0000
Date: Fri, 26 May 2023 16:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 127/9879]
 sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without
 a prototype is deprecated in all versions of C
Message-ID: <202305261610.LhgP7qd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: d6bb8a57699c60069606540858677858f7df394d [127/9879] MLK-24965: ASoC: fsl_xcvr: bit and timestamp counters
config: arm-randconfig-r003-20230524 (https://download.01.org/0day-ci/archive/20230526/202305261610.LhgP7qd8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Freescale/linux-fslc/commit/d6bb8a57699c60069606540858677858f7df394d
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout d6bb8a57699c60069606540858677858f7df394d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/ drivers/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261610.LhgP7qd8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_xcvr_sysfs.c:106:52: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   const struct attribute_group *fsl_xcvr_get_attr_grp()
                                                      ^
                                                       void
   1 error generated.


vim +106 sound/soc/fsl/fsl_xcvr_sysfs.c

   105	
 > 106	const struct attribute_group *fsl_xcvr_get_attr_grp()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
