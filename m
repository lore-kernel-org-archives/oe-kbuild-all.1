Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2FF7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 06:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675579212; x=1707115212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7RZLFmjCY3jtp2nhmtbJkPO1UZojsuLU9DOWzVX2cvY=;
  b=D2Y95bta0F77m2v9oQIxKZ9iygMNURWcLj9opK5tVO6qshAjEzu5ljJ9
   sFLqImlE3bvQCreiyEMsR4PQUIy+dt7SF5IWixwsfOSAs1gj5YD5M1Iml
   wd07vf6T4lzXlPDlV+O5tHYpmWN9wSKS6iM5tOHCvZfqFoZn2I3Uual1e
   dhbWAWoo3zrceLZ652r7RCL+I8CzvG33xzdBhidOcjJTLdJmDZeVbQf8A
   X0nz62NXwpWZXzGFhr1+64sZrO4Km104K7WmqGXq4ktWqyHNYfRjCXjpP
   qmRiIyAc7LycVAO1H0bLw5OJC+9HC+uoOOAfs7sCO+X8qeWypU8681nFu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308662194"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="308662194"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754920229"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="754920229"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 22:40:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYh8-0001nM-27;
	Sun, 05 Feb 2023 06:40:10 +0000
Date: Sun, 5 Feb 2023 14:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6233/20208]
 drivers/base/power/domain.c:255:6: warning: no previous prototype for
 'pm_genpd_disable_clks'
Message-ID: <202302051443.lxTytjqO-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: c85126180a10439a8c7db1800529b4857d91c609 [6233/20208] LF-4713-1 PM: domains: add pm domain clocks support
config: arc-randconfig-r043-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051443.lxTytjqO-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/c85126180a10439a8c7db1800529b4857d91c609
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout c85126180a10439a8c7db1800529b4857d91c609
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/base/power/ drivers/mailbox/ drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:255:6: warning: no previous prototype for 'pm_genpd_disable_clks' [-Wmissing-prototypes]
     255 | void pm_genpd_disable_clks(struct generic_pm_domain *genpd)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/base/power/domain.c:261:5: warning: no previous prototype for 'pm_genpd_enable_clks' [-Wmissing-prototypes]
     261 | int pm_genpd_enable_clks(struct generic_pm_domain *genpd)
         |     ^~~~~~~~~~~~~~~~~~~~


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
