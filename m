Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F387F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 04:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676005103; x=1707541103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wRhz4n+u53TUi9mmMafVQ9bq+7foBQF3dkJrbsqnKk=;
  b=gmG1i02a9mP4ZxUi/ZDM7r8j7WM3hGmaHxPDwupsynbM5YD0fV5AX70r
   PYdkEc7i1XTbHy0H8xeHeUIhCn1ZrwWsEk7YnO2rZyZcIe2GSQlovupYL
   ch66aTJlyqQvCqcnAQTkGyZVvnln/ZD5H7QSI0S2ZZpTqvPU4UiqIbp+k
   MBBFvpwxYG0fm2viCur8xLX+WvvXkm6wSrAoZOxqIL9bONXlYZ1O7q0aq
   Ysjk2C29ovqQkPDlQJ61qyB73W36X8DqgTyXuCMO4CgiHtj5wdSha6JOR
   ffM5yu//0NP7gkrBRxYEKX/9YAf1mzlLMPQWyU35ka9SHUFhTHC83S/0C
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318354284"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="318354284"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 20:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="841912872"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="841912872"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Feb 2023 20:58:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQLUK-0005ZC-2e;
	Fri, 10 Feb 2023 04:58:20 +0000
Date: Fri, 10 Feb 2023 12:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 19558/20725]
 ti-thermal-common.c:(.text.ti_thermal_unregister_cpu_cooling+0x0): multiple
 definition of `ti_thermal_unregister_cpu_cooling';
 drivers/thermal/k3_j72xx_bandgap.o:k3_j72xx_bandgap.c:(.text.ti_thermal_unregister_cpu_cooling+0x0):
 first defined here
Message-ID: <202302101215.HIT4iqTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Keerthy,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   73f2f2bba715b5cada420f2fb34bb43d185248f2
commit: 22d3f82184798e29c81c2a33b37d9e25d6869626 [19558/20725] thermal: k3_j72xx_bandgap: Add cooling device support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230210/202302101215.HIT4iqTy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 22d3f82184798e29c81c2a33b37d9e25d6869626
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101215.HIT4iqTy-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/thermal/ti-soc-thermal/ti-thermal-common.o: in function `ti_thermal_unregister_cpu_cooling':
>> ti-thermal-common.c:(.text.ti_thermal_unregister_cpu_cooling+0x0): multiple definition of `ti_thermal_unregister_cpu_cooling'; drivers/thermal/k3_j72xx_bandgap.o:k3_j72xx_bandgap.c:(.text.ti_thermal_unregister_cpu_cooling+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
