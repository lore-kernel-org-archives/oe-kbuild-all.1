Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544621C13
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677824830; x=1709360830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xA6z5fh/+MfxpzqYn5zYIN2lg7iElEPLOGv84suj3t0=;
  b=bHBXtscdByIJFN37i8wM7s1yjwL51Nm9RKQKw3DbTWP19aWYQeTS9ciG
   opdXbyT6uhFsO0Z7G/13yL3oWkcGAA/XMBrxegPuPREo/8adNQOSNZFRW
   V69zDCUZ+JbsEE1vACjfXQ0J/DGRppMMu+vEycRHc+rztyPRabROPQrVH
   cwjv0eAVwQc6nwIppeQ21HI3o4eH/3bFRFETpgyPK1QnRDSeiHftn79eF
   JMUq1co7kNnb8gj+8PAcPCurkBYh/M9UlVK+HJVIKsAVzCtEJKka4M3ao
   pTaNXZIrkvYByKp9IG+G8kzwVjjcKZtaLEM/T0JQ/8L3ooGmczpQp6PQf
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337285863"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="337285863"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 22:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739385454"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="739385454"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 22:26:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXysV-0001Fm-0k;
	Fri, 03 Mar 2023 06:26:51 +0000
Date: Fri, 3 Mar 2023 14:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 35/633] drivers/hwtracing/coresight/coresight-etm4x-core.c:987:48: error:
 'dev' undeclared; did you mean 'cdev'?
Message-ID: <202303031417.W6jxl9nE-lkp@intel.com>
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

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   06abd4f3cf4c58289447483d11d566d20fd3f3db
commit: 08c5e3278b418c5a4f7f98e4357208deff68a8da [35/633] coresight: etm4x: Fix crash observed on Qcom ETM parts with 'Low power override'
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303031417.W6jxl9nE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/08c5e3278b418c5a4f7f98e4357208deff68a8da
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 08c5e3278b418c5a4f7f98e4357208deff68a8da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031417.W6jxl9nE-lkp@intel.com/

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
