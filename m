Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E263110A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 02:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685586657; x=1717122657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yaCCIo3DuvJBPM/KJnEQ6yadM8zHmvOQ0DBnkVDLeEY=;
  b=jMQTZcNNpjFh9MM+6bJcpab7GqEfQUQo0LW3F3Btu4PWGyoPJfnMbmpH
   Yy/Qj/HgW1dlfx7DXb9ucMry6JbXRwADGMy/DSajhcD2/yyIpunOvJ21n
   rb4qDJye49s32gzp5JU3Y8s5HrCw6TlHs/9YyJvLMqaeLb+dEQuWM2WNR
   O+8XZwZnU7bMf5stjujfPsNe/tfz+0tkYUscj5wmZ7DQkIDrwSDH3TA1S
   btjHG3eOxXfCCV4u8qHBbIXTzjtN0k/DnAKWnjywFstaYrA0cWKZNP2oR
   /qsuIrO7+ehw2iFm1fQ88ggcXMfPUVgR0p/553KHh2sF1IcgGDOziMIi6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="340028410"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="340028410"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 19:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="819564739"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="819564739"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 May 2023 19:30:55 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Y5W-0001nj-2A;
	Thu, 01 Jun 2023 02:30:54 +0000
Date: Thu, 1 Jun 2023 10:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Apurva Nandan <a-nandan@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 68/88] ti-thermal-common.c:(.text+0x360):
 multiple definition of `ti_thermal_unregister_cpu_cooling';
 drivers/thermal/k3_j72xx_bandgap.o:k3_j72xx_bandgap.c:(.text+0x6c8): first
 defined here
Message-ID: <202306011054.NmDXw1sB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   8509e7bb5765732d005befcd277ade73a5df3760
commit: 38a145da1625c46c90e453d6e28537e6f97e2720 [68/88] thermal: k3_j72xx_bandgap: Add cooling device support
config: csky-randconfig-r016-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011054.NmDXw1sB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 38a145da1625c46c90e453d6e28537e6f97e2720
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011054.NmDXw1sB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/thermal/k3_j72xx_bandgap.c: In function 'k3_thermal_get_trend':
>> drivers/thermal/k3_j72xx_bandgap.c:288:13: warning: variable 'id' set but not used [-Wunused-but-set-variable]
     288 |         int id, tr, ret = 0;
         |             ^~
   drivers/thermal/k3_j72xx_bandgap.c: At top level:
>> drivers/thermal/k3_j72xx_bandgap.c:407:5: warning: no previous prototype for 'k3_thermal_register_cpu_cooling' [-Wmissing-prototypes]
     407 | int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thermal/k3_j72xx_bandgap.c:449:5: warning: no previous prototype for 'ti_thermal_unregister_cpu_cooling' [-Wmissing-prototypes]
     449 | int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   csky-linux-ld: drivers/thermal/ti-soc-thermal/ti-thermal-common.o: in function `ti_thermal_unregister_cpu_cooling':
>> ti-thermal-common.c:(.text+0x360): multiple definition of `ti_thermal_unregister_cpu_cooling'; drivers/thermal/k3_j72xx_bandgap.o:k3_j72xx_bandgap.c:(.text+0x6c8): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
