Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8BAA34
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676725142; x=1708261142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X7a5o/qLP/f9tpGYbB2rzIipiWMzcMq5MSXEKA+GRXM=;
  b=eW3mEd779pZUIrHKHpCfvL3iDA9hcrZv0LFcIlcNsu9QvRmoecHtPcur
   h5l5DlK3up/E1Qt2eUtyAtrwo0xFAzX3kbDWnRkM9KASBhy8+ZoJhPTSw
   NM5DC1zZS0e7OLbR8jHZZcOILhCLD53G1CPfKkWNKULSjBinGvAy/eE3J
   Rvn57SJPP9d6IMI0kVBkmQE404XiuJwdx7o5kA8NkIXj+8XcR23+MDcC0
   RpRtDZDPF1eJ1RURC2QQcIqEzu4udOwTHQ5MngdyDwKb68SBCnuhntwHv
   4XIRvNc7GdhkOd7QM1BMaOiYxpMHeqJsVDvwl9IXSVIjyxa0aW2y5uDnL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="418392952"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="418392952"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 04:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="664177406"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="664177406"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Feb 2023 04:59:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTMnr-000COL-2E;
	Sat, 18 Feb 2023 12:58:59 +0000
Date: Sat, 18 Feb 2023 20:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 37/615]
 drivers/hwtracing/coresight/coresight-etm4x-core.c:987:48: error: 'dev'
 undeclared; did you mean 'cdev'?
Message-ID: <202302182042.sfQXHg0P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bhupesh,

FYI, the error/warning still remains.

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   04e5048badb91c86b22993d0d9fd1bf8b79c0d91
commit: 08c5e3278b418c5a4f7f98e4357208deff68a8da [37/615] coresight: etm4x: Fix crash observed on Qcom ETM parts with 'Low power override'
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302182042.sfQXHg0P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/08c5e3278b418c5a4f7f98e4357208deff68a8da
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout 08c5e3278b418c5a4f7f98e4357208deff68a8da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302182042.sfQXHg0P-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/coresight/coresight-etm4x-core.c: In function 'etm4_init_sysreg_access':
>> drivers/hwtracing/coresight/coresight-etm4x-core.c:987:48: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     987 |         if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
         |                                                ^~~
         |                                                cdev
   drivers/hwtracing/coresight/coresight-etm4x-core.c:987:48: note: each undeclared identifier is reported only once for each function it appears in


vim +987 drivers/hwtracing/coresight/coresight-etm4x-core.c

   971	
   972	static bool etm4_init_sysreg_access(struct etmv4_drvdata *drvdata,
   973					    struct csdev_access *csa)
   974	{
   975		u32 devarch;
   976	
   977		if (!cpu_supports_sysreg_trace())
   978			return false;
   979	
   980		/*
   981		 * Some Qualcomm implementations require skipping powering up the trace unit,
   982		 * as the ETMs are in the same power domain as their CPU cores.
   983		 *
   984		 * Since the 'skip_power_up' flag is used inside 'etm4_init_arch_data' function,
   985		 * initialize it before the function is called.
   986		 */
 > 987		if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
   988			drvdata->skip_power_up = true;
   989	
   990		/*
   991		 * ETMs implementing sysreg access must implement TRCDEVARCH.
   992		 */
   993		devarch = read_etm4x_sysreg_const_offset(TRCDEVARCH);
   994		switch (devarch & ETM_DEVARCH_ID_MASK) {
   995		case ETM_DEVARCH_ETMv4x_ARCH:
   996			*csa = (struct csdev_access) {
   997				.io_mem	= false,
   998				.read	= etm4x_sysreg_read,
   999				.write	= etm4x_sysreg_write,
  1000			};
  1001			break;
  1002		case ETM_DEVARCH_ETE_ARCH:
  1003			*csa = (struct csdev_access) {
  1004				.io_mem	= false,
  1005				.read	= ete_sysreg_read,
  1006				.write	= ete_sysreg_write,
  1007			};
  1008			break;
  1009		default:
  1010			return false;
  1011		}
  1012	
  1013		drvdata->arch = etm_devarch_to_arch(devarch);
  1014		return true;
  1015	}
  1016	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
