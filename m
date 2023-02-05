Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0A723B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675590377; x=1707126377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLwKHuXR+NMiS1/csrghsfUhXhJPNunukiqvEhHsOWE=;
  b=kKhRbjgjG58pVzIC5KwcAnPrErZ55vceDiLm5kRGnPQ/6Tzcd2Jv887x
   m5Oj+OMNdBIeM/TD+hKgiYhGQG93dwrZ6KKDmszHsDPlpNwN2FmR9kdj9
   PL5dFqFpA1Cilqw5ECeEV0UdTj/fMhcEFBuqLQxp1k2w7Bv/Ky0M49HQA
   ObL92/xuCiQCJMlxiNBV+bMNO5hTXRU+HA8vaZn2uQ5a/1cqEqOYC0Yjp
   i7JdxJ1rYfcfLS/Jzstki0bUhaeb60ME2i1Kl1wPaHKvuEHBelEuYDxwz
   5jo4FHXhK8dsBIjriiACGvQqOQHqMxcoSgoBzVh4L1PDt/RnNCorehJ3q
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317036567"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="317036567"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 01:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="729725831"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="729725831"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2023 01:46:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pObbD-0001uv-1x;
	Sun, 05 Feb 2023 09:46:15 +0000
Date: Sun, 5 Feb 2023 17:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6157/20208]
 drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous prototype for
 'check_m4_enabled'
Message-ID: <202302051750.Stz3dbUr-lkp@intel.com>
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
commit: afbf4e009ee7f83d492eabf1144fed73e9112a42 [6157/20208] Merge branch 'clock/next' into next
config: ia64-buildonly-randconfig-r004-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051750.Stz3dbUr-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/afbf4e009ee7f83d492eabf1144fed73e9112a42
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout afbf4e009ee7f83d492eabf1144fed73e9112a42
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/dma/ drivers/irqchip/ drivers/mtd/nand/raw/gpmi-nand/ drivers/pci/controller/mobiveil/ drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous prototype for 'check_m4_enabled' [-Wmissing-prototypes]
     279 | int check_m4_enabled(void)
         |     ^~~~~~~~~~~~~~~~


vim +/check_m4_enabled +279 drivers/soc/imx/soc-imx8m.c

d1e806347e888e Dong Aisheng 2019-04-19  278  
d1e806347e888e Dong Aisheng 2019-04-19 @279  int check_m4_enabled(void)

:::::: The code at line 279 was first introduced by commit
:::::: d1e806347e888e13d6fdddb28275dbce7fd9f780 soc: imx: fix build error of missing imx_src_is_m4_enabled

:::::: TO: Dong Aisheng <aisheng.dong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
