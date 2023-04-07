Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1A33D8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680871848; x=1712407848;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GMNn5uPg4u9QlOn/f85BXo8pXBVfpcO8+n5e2G4Yd6w=;
  b=fofQbwlG685sZ1hw1R8DDa2dTVa579tXSvPx8LgFVNFaLyFDY2S512El
   E80blVjtJWZ9NGCkgXUl1+t45LgZ/4F7admVNY9CQ3aGMcM+vanQrwjF3
   I4WQDC83Gnkh0cFTsY89SFVurfMKs9fbsGE5SwH0KZJ3ks7BvPXcbAgAS
   A7l4rCH/o8Jql+P9gJxmczUndvo7MyFSh4fPr01MF12uXCsStt5bl8X2Y
   BbpH1SG8bDNFyxAaU4VGE0CDJ6BJH4LD838J1No4IBOZFx0/z97JooqrP
   by1nHx+hW98S0kmDfN6CB5dJd2IEg0BtNJS0XU5LMnVttv4ncLB8VOsdc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322621330"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="322621330"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 05:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="717833429"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="717833429"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 05:50:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pklYC-000SV4-37;
	Fri, 07 Apr 2023 12:50:44 +0000
Date: Fri, 7 Apr 2023 20:50:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 19524/22025]
 drivers/clocksource/timer-ti-dm.c:1039:34: warning: unused variable
 'omap_timer_match'
Message-ID: <202304072050.fuiBLoPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tony,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: c1311b05bbad3cc83e21622820a0eb132899b11a [19524/22025] clocksource/drivers/timer-ti-dm: Make timer selectable for ARCH_K3
config: hexagon-randconfig-r045-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072050.fuiBLoPo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout c1311b05bbad3cc83e21622820a0eb132899b11a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clocksource/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072050.fuiBLoPo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-ti-dm.c:1039:34: warning: unused variable 'omap_timer_match' [-Wunused-const-variable]
   static const struct of_device_id omap_timer_match[] = {
                                    ^
   1 warning generated.


vim +/omap_timer_match +1039 drivers/clocksource/timer-ti-dm.c

d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1038  
9725f4451a9ccd1 arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14 @1039  static const struct of_device_id omap_timer_match[] = {
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1040  	{
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1041  		.compatible = "ti,omap2420-timer",
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1042  	},
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1043  	{
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1044  		.compatible = "ti,omap3430-timer",
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1045  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1046  	},
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1047  	{
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1048  		.compatible = "ti,omap4430-timer",
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1049  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1050  	},
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1051  	{
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1052  		.compatible = "ti,omap5430-timer",
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1053  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1054  	},
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1055  	{
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1056  		.compatible = "ti,am335x-timer",
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1057  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1058  	},
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1059  	{
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1060  		.compatible = "ti,am335x-timer-1ms",
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1061  		.data = &omap3plus_pdata,
d1c6ccfe3dbdd2d arch/arm/plat-omap/dmtimer.c Jon Hunter     2013-03-19  1062  	},
8c0cabd7970c0d5 arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1063  	{
8c0cabd7970c0d5 arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1064  		.compatible = "ti,dm816-timer",
8c0cabd7970c0d5 arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1065  		.data = &omap3plus_pdata,
8c0cabd7970c0d5 arch/arm/plat-omap/dmtimer.c Neil Armstrong 2015-10-22  1066  	},
9725f4451a9ccd1 arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1067  	{},
9725f4451a9ccd1 arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1068  };
9725f4451a9ccd1 arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1069  MODULE_DEVICE_TABLE(of, omap_timer_match);
9725f4451a9ccd1 arch/arm/plat-omap/dmtimer.c Jon Hunter     2012-05-14  1070  

:::::: The code at line 1039 was first introduced by commit
:::::: 9725f4451a9ccd159b1d13f63e05896cd9bce07d ARM: OMAP: Add DT support for timer driver

:::::: TO: Jon Hunter <jon-hunter@ti.com>
:::::: CC: Jon Hunter <jon-hunter@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
