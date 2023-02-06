Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2763B3D75
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675695066; x=1707231066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9R/OJByEPVNMDehDPDpjJpel5L1v+FgmnmIbddniK4M=;
  b=jjnEB27ga6mzTBaqF+HWO9FQxeTJgnpRUyF2XJQ5KguWWtbsaDmOD1/u
   bcbfUprRqWbF4hkmy9euouk8hCrooSLXXMHVDPAE1rDw5R1rRjmFeOIl5
   EM57Wv0r44U4f+QfC+gv3TMVv+JEd8PiDcBFU98m/Q+TI/t+SOOHdixf3
   Yb4TvD9W5nmLBVrZV83ERnPNhm+aZmlvzAIe0te8SaLexhjX3jBI+mUt+
   9K95Zzkp5MNzKcFDPW0rv8dC2ok/mEnol816ZipUwc9D4u6VZZkYX//hb
   jCgTmwAnELDivjGY6JZIoI3pRzU95EzZffDjeveHyDafauN3ncM9mitND
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309553328"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309553328"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 06:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="668428086"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="668428086"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 06:51:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP2ph-0002cL-08;
	Mon, 06 Feb 2023 14:51:01 +0000
Date: Mon, 6 Feb 2023 22:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4106/20209]
 drivers/mfd/max17135-core.c:35:10: fatal error: asm/mach-types.h: No such
 file or directory
Message-ID: <202302062208.ScXeIg6y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robby,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 83ebb2723d287b1c5b15d0c7601b48b16b8689f4 [4106/20209] MLK-11556-1 pmic: max17135: add hwmon, mfd and regulator drivers for this pmic
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230206/202302062208.ScXeIg6y-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/83ebb2723d287b1c5b15d0c7601b48b16b8689f4
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 83ebb2723d287b1c5b15d0c7601b48b16b8689f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mfd/max17135-core.c:35:10: fatal error: asm/mach-types.h: No such file or directory
      35 | #include <asm/mach-types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +35 drivers/mfd/max17135-core.c

  > 35	#include <asm/mach-types.h>
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
