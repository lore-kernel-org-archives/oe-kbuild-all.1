Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08737F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675502860; x=1707038860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jte5swivAvHqao3bEe8848g5Nfr7BfG6Kz02X0Z355Q=;
  b=AT6UgrvFgtdXPCl1sf4FM0oFCEGaGLw78P47NRgZEKMHlFp43AwgPBjz
   Z+MYjEG8NzciUcbpl1W5wUu0CM2BQiuGbBMaP2hmfi/+gzcukHs8jeWSC
   ebZk9oUr8il+cMLcKLILCroBbHnkrVTfIUoNqXg37aEjUQnenx8JtT4xs
   m+z3zcGaeo4W8TiP0rjm0CXwLCGZulrYdRoBsToyXMrr6dxwXxMzHCSUb
   bE9AcYxrErC8EJSjsy2EyMsGA3puU9tMaE8onleMwgHBzRY/GPpxu6YSk
   QfHWYUxxkkEMtcT0lCPtvtrVELWm9eQyPkxYhVh72PWyTrQMzjOr7n4/Q
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415145370"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415145370"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 01:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911426663"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="911426663"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Feb 2023 01:27:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOEpe-0001CK-1m;
	Sat, 04 Feb 2023 09:27:38 +0000
Date: Sat, 4 Feb 2023 17:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6094/20209]
 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:64:5: warning: "CONFIG_PM" is not
 defined, evaluates to 0
Message-ID: <202302041719.b3EhkanG-lkp@intel.com>
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
commit: ba7179b2e4a0549e119cc83c5dfe5eb013cef3c2 [6094/20209] Merge remote-tracking branch 'origin/display/dsim' into display/next
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041719.b3EhkanG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/ba7179b2e4a0549e119cc83c5dfe5eb013cef3c2
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout ba7179b2e4a0549e119cc83c5dfe5eb013cef3c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/accessibility/speakup/ drivers/firmware/imx/ drivers/gpu/drm/imx/ drivers/irqchip/ drivers/mfd/ drivers/soc/imx/ drivers/spi/ drivers/staging/media/imx/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:64:5: warning: "CONFIG_PM" is not defined, evaluates to 0 [-Wundef]
      64 | #if CONFIG_PM
         |     ^~~~~~~~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: In function 'sec_dsim_of_parse_resets':
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:291:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     291 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: At top level:
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:72:12: warning: 'imx_sec_dsim_runtime_resume' defined but not used [-Wunused-function]
      72 | static int imx_sec_dsim_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:68:12: warning: 'imx_sec_dsim_runtime_suspend' defined but not used [-Wunused-function]
      68 | static int imx_sec_dsim_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_PM +64 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c

25799de94b286c Fancy Fang 2018-06-06  63  
b5a7aa6c474c92 Fancy Fang 2018-07-02 @64  #if CONFIG_PM
b5a7aa6c474c92 Fancy Fang 2018-07-02  65  static int imx_sec_dsim_runtime_suspend(struct device *dev);
b5a7aa6c474c92 Fancy Fang 2018-07-02  66  static int imx_sec_dsim_runtime_resume(struct device *dev);
b5a7aa6c474c92 Fancy Fang 2018-07-02  67  #else
b5a7aa6c474c92 Fancy Fang 2018-07-02  68  static int imx_sec_dsim_runtime_suspend(struct device *dev)
b5a7aa6c474c92 Fancy Fang 2018-07-02  69  {
b5a7aa6c474c92 Fancy Fang 2018-07-02  70  	return 0;
b5a7aa6c474c92 Fancy Fang 2018-07-02  71  }
b5a7aa6c474c92 Fancy Fang 2018-07-02  72  static int imx_sec_dsim_runtime_resume(struct device *dev)
b5a7aa6c474c92 Fancy Fang 2018-07-02  73  {
b5a7aa6c474c92 Fancy Fang 2018-07-02  74  	return 0;
b5a7aa6c474c92 Fancy Fang 2018-07-02  75  }
b5a7aa6c474c92 Fancy Fang 2018-07-02  76  #endif
b5a7aa6c474c92 Fancy Fang 2018-07-02  77  

:::::: The code at line 64 was first introduced by commit
:::::: b5a7aa6c474c926d8d7d919ebdb84ac3dfb328bd MLK-19017-6 drm/imx: add system pm support for SEC DSIM

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
