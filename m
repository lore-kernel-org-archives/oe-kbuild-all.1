Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A4BE54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683885052; x=1715421052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BtJHc6lUNnsv6xDdsKfhC4aF0kH3z/iA62/eZfjvS6A=;
  b=hIPcCEOfA7/CzzMeW4nc9kV3opma8NvgoGNY2IPUPWbLTlWebH0iogM9
   4gXUXaA/2Q6GQELNJJLD7/mIrNYF9kf6UsXVmdVEcjcNFw64IZmEC4+7T
   F+PkzhQ5V4fx//9QjL709pa6xnYRw9gI+c0j53EfpmHwJrbpiXAWCYOJy
   s/LcldTmLPFuiZEYJ1QvO/pep+rCnNo6L8AqpGEZdktl6EKHvMKi5gvph
   GDzh/jBrSaov/QiadT4zlqX9ai4Jp4SDvrZV5lvrCkxUH11eYA6N8Wt1d
   Y5woIpLE5wQpDWUEZB1tfTaps0fkIotPUj7W+aEkN4pftPMwAjbOJ+HGL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335270867"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335270867"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 02:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650581238"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650581238"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2023 02:50:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxPQC-0004ku-0r;
	Fri, 12 May 2023 09:50:44 +0000
Date: Fri, 12 May 2023 17:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Tian, Baofeng" <baofeng.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 4888/30000]
 drivers/watchdog/iTCO_wdt.c:72:10: fatal error: asm/nmi.h: No such file or
 directory
Message-ID: <202305121740.DpR5Rwtl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baofeng,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   180df1199944ebd8928f320a1bd16c8a87dba2ed
commit: be30656f5407ce04d8780052671bec3873277235 [4888/30000] kernel: watchdog: add NMI handler for iTCO watchdog
config: ia64-randconfig-r006-20230511 (https://download.01.org/0day-ci/archive/20230512/202305121740.DpR5Rwtl-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/be30656f5407ce04d8780052671bec3873277235
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout be30656f5407ce04d8780052671bec3873277235
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121740.DpR5Rwtl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/iTCO_wdt.c:72:10: fatal error: asm/nmi.h: No such file or directory
      72 | #include <asm/nmi.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +72 drivers/watchdog/iTCO_wdt.c

    70	
    71	#include <linux/nmi.h>
  > 72	#include <asm/nmi.h>
    73	#include "iTCO_vendor.h"
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
