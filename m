Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E53802
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 01:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675301108; x=1706837108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xzGe5dAPvkJH8Tk/4cGazaB01VOQg4Id/mw4W63Ot1c=;
  b=n3o31Q8DVe+LvqzA7u7teXtYYub0J1OkM9JpDK5BJC2kO6XMmdzYskEp
   bZNMmH8hjgU6VtnWcXdjT89ItJXSeD/Fd7oiA6KgsOtUAax81OH6xeoK8
   0yh15c1aT+rbY9KeH4/ugRHCkPLRa0qjuQI4XaMmoGo2d6Jp+3Pzhw9kz
   /xsq4rMJ+7KQaqz9JH79SwPt+rYF21lM1WElzQUjr1oQX//hme19gVzdn
   p8GW4sqn03fHqhs8d8GqVdPr/1eK3IkmCGrasxJ+fHQlolgJgMV66ASpj
   83Ln0BmY5Bes+ZjueLSqDyuo0NRXQm27pw6MrwsGALfOrdSw9qXb09Th2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414525123"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="414525123"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 17:25:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="838995665"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="838995665"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Feb 2023 17:25:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNOLU-0005ys-0r;
	Thu, 02 Feb 2023 01:25:00 +0000
Date: Thu, 2 Feb 2023 09:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 20180/21377]
 ti-thermal-common.c:(.text+0x440): multiple definition of
 `ti_thermal_unregister_cpu_cooling';
 drivers/thermal/k3_j72xx_bandgap.o:k3_j72xx_bandgap.c:(.text+0x860): first
 defined here
Message-ID: <202302020959.HaP8xcTD-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   0d9a274bd00dcd39d1fb4ad2f81a5dfc3a9d15fe
commit: 22d3f82184798e29c81c2a33b37d9e25d6869626 [20180/21377] thermal: k3_j72xx_bandgap: Add cooling device support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020959.HaP8xcTD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 22d3f82184798e29c81c2a33b37d9e25d6869626
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/thermal/ti-soc-thermal/ti-thermal-common.o: in function `ti_thermal_unregister_cpu_cooling':
>> ti-thermal-common.c:(.text+0x440): multiple definition of `ti_thermal_unregister_cpu_cooling'; drivers/thermal/k3_j72xx_bandgap.o:k3_j72xx_bandgap.c:(.text+0x860): first defined here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
