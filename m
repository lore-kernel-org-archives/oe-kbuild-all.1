Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBF07F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 05:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675574862; x=1707110862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rk6TTVmI/euoh3IRRQydAoZwrLAXPDP18IJI3KpVtcE=;
  b=G/Kr2UKObTEm3UPzdwGat+yYeBLxqgyh+mL5FrLvnVTfiBbP2b17BvYV
   63yNFTWsfZ0r5OHOhEVKi0n4BdOoqceBPXg7kzkNr7DrePHQhILrAGT20
   ugwUkATNXJyh5+Zq4gA9DiRV11Ad7sKhLEMevnpKJgP+PlcDe+QilMx6l
   avCU7doLcZK11g5vQtm74ytJELwJOWOpYomBvShWKJMjauRMPi5ydxDc6
   ucPw7EAtZLeWyuFAeDE4EQ+hOU8wU8pO/uFTg46/T6K6yJ/P30Tqyhhy5
   K8CBWxkZuyP9eIBEPzpyrpMiwLbAGiu6Hm9rH7HejaGECwJYZKjSG7nbg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="326711691"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="326711691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 21:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="643688739"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="643688739"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 21:27:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOXYS-0001lQ-32;
	Sun, 05 Feb 2023 05:27:08 +0000
Date: Sun, 5 Feb 2023 13:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6233/20209]
 drivers/base/power/domain.c:255:6: warning: no previous prototype for
 function 'pm_genpd_disable_clks'
Message-ID: <202302051333.HV7AfkSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: c85126180a10439a8c7db1800529b4857d91c609 [6233/20209] LF-4713-1 PM: domains: add pm domain clocks support
config: arm-randconfig-r034-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051333.HV7AfkSy-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Freescale/linux-fslc/commit/c85126180a10439a8c7db1800529b4857d91c609
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout c85126180a10439a8c7db1800529b4857d91c609
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/base/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:255:6: warning: no previous prototype for function 'pm_genpd_disable_clks' [-Wmissing-prototypes]
   void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
        ^
   drivers/base/power/domain.c:255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   ^
   static 
>> drivers/base/power/domain.c:261:5: warning: no previous prototype for function 'pm_genpd_enable_clks' [-Wmissing-prototypes]
   int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
       ^
   drivers/base/power/domain.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   ^
   static 
   2 warnings generated.


vim +/pm_genpd_disable_clks +255 drivers/base/power/domain.c

   254	
 > 255	void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
   256	{
   257		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0)
   258			clk_bulk_disable_unprepare(genpd->num_clks, genpd->clks);
   259	}
   260	
 > 261	int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
   262	{
   263		int ret;
   264	
   265		if (genpd->flags & GENPD_FLAG_PM_PD_CLK && genpd->num_clks > 0) {
   266			ret = clk_bulk_prepare_enable(genpd->num_clks, genpd->clks);
   267			if (ret) {
   268				dev_err(&genpd->dev, "failed to enable clocks\n");
   269				return ret;
   270			}
   271		}
   272	
   273		return 0;
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
