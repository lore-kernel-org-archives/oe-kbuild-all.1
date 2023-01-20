Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A949BD34
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674201292; x=1705737292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YaizkFrxmFfzNof2Wmp/E99R9D7HGxQ2+XrNX0Dpmdo=;
  b=NlLE4aJxVYCirJjan2hZheeKH/AfM/gQ1SRYY15WMFWprHnVBSFte0w7
   r0eU38Vh+lVAoUlDpv7KNBVhmreL5vhaOG6gCNITb9EqNPXNx2Hk1Mdcx
   0Qj2zfhlFZrxnnHLg5oB+8Uyo0Da3gm42VI7Xd3vB5o9HDTy/Hwg7Fcw4
   ahWsSxb8bWvJjkO3SDFiaPOE+rnAtKApXQusyHqaeqgZFbhBesP+mldHp
   CgrsKaG0Wolo6zt+WbHyZLfw/s8OkZBteD+7vLb6ZO7TQyXzokM6XgEPB
   lPyWWBtYx8miKScCefPYtS0HX8WcJm29l42M3db+2v7REYRELJij8Ep9A
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327621520"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="327621520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="989325600"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="989325600"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2023 23:54:48 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pImEZ-0002Lc-1t;
	Fri, 20 Jan 2023 07:54:47 +0000
Date: Fri, 20 Jan 2023 15:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [xilinx-xlnx:master 114/773]
 include/linux/firmware/xlnx-zynqmp.h:1224:12: warning:
 'zynqmp_pm_fpga_get_feature_list' defined but not used
Message-ID: <202301201527.JgM9f4se-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   155ae9648df275d38841cfe45231ba0471baa1cb
commit: d3cc9a85c901474dc436d62c01e1b0f8f3bdfec6 [114/773] iio: versal-sysmon: add driver for Versal Sysmon
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301201527.JgM9f4se-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/d3cc9a85c901474dc436d62c01e1b0f8f3bdfec6
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout d3cc9a85c901474dc436d62c01e1b0f8f3bdfec6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/versal-sysmon.c:15:
>> include/linux/firmware/xlnx-zynqmp.h:1224:12: warning: 'zynqmp_pm_fpga_get_feature_list' defined but not used [-Wunused-function]
    1224 | static int zynqmp_pm_fpga_get_feature_list(u32 *value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/firmware/xlnx-zynqmp.h:1219:12: warning: 'zynqmp_pm_fpga_get_version' defined but not used [-Wunused-function]
    1219 | static int zynqmp_pm_fpga_get_version(u32 *value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/zynqmp_pm_fpga_get_feature_list +1224 include/linux/firmware/xlnx-zynqmp.h

e9e49172adb714 Nava kishore Manne 2022-01-27  1218  
e9e49172adb714 Nava kishore Manne 2022-01-27 @1219  static int zynqmp_pm_fpga_get_version(u32 *value)
e9e49172adb714 Nava kishore Manne 2022-01-27  1220  {
e9e49172adb714 Nava kishore Manne 2022-01-27  1221  	return -ENODEV;
e9e49172adb714 Nava kishore Manne 2022-01-27  1222  }
e9e49172adb714 Nava kishore Manne 2022-01-27  1223  
e9e49172adb714 Nava kishore Manne 2022-01-27 @1224  static int zynqmp_pm_fpga_get_feature_list(u32 *value)
e9e49172adb714 Nava kishore Manne 2022-01-27  1225  {
e9e49172adb714 Nava kishore Manne 2022-01-27  1226  	return -ENODEV;
e9e49172adb714 Nava kishore Manne 2022-01-27  1227  }
76582671eb5d00 Rajan Vaja         2018-09-12  1228  #endif
76582671eb5d00 Rajan Vaja         2018-09-12  1229  

:::::: The code at line 1224 was first introduced by commit
:::::: e9e49172adb71403be142bd6019caedb31059e62 firmware: xilinx: Implemented pm API functions to get the xilfpga component info

:::::: TO: Nava kishore Manne <nava.manne@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
