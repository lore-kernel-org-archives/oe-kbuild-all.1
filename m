Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3A23D4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683917275; x=1715453275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KqeGov2yaVZzXXcvXyg5wscH9iPJGS8dWrrjlz15gi0=;
  b=A3fhwxNs2bguMF5OmVJMLV2Odo8Hb3Jx5hJgKgKT/5noFGJDjFqqAaWF
   FU9NaeLTXt/iZnGd5OzyDizklc0e0lRquv8FvHmc+oggdDySkC8WlL2vR
   rpki9EylZJIrfA5gBC7pfD46hE0wBuyaN+Znx0ouaHZwzqFJ0he+MpEks
   aYhdUm6C0ikbbPpIt3uQGJ+67I+1oQJfCt7ZlOkLoVI1CcUObMC1IFM/f
   kbGi+voBas6MrjoZgBVdaH5INzwx+4t9UGGuHpNv6an+GYrFcjnlTkmny
   GLUysUUJZVQsdU1MdNJU3DIgXLsE796DhZFY9x6zlDLVq5UX17kDCredv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335386206"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335386206"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 11:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="650735934"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650735934"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2023 11:47:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxXo1-00052u-0v;
	Fri, 12 May 2023 18:47:53 +0000
Date: Sat, 13 May 2023 02:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 163/453] drivers/hwtracing/coresight/coresight-etm4x-core.c:1049:48: error:
 'dev' undeclared; did you mean 'cdev'?
Message-ID: <202305130250.1rZZssjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   255ec801b7a09e914735a942f27f3c74f5e8e810
commit: 83bbb43e7e43d217860cdd2477968e235b08b0e3 [163/453] coresight: etm4x: Fix crash observed on Qcom ETM parts with 'Low power override'
config: arm64-randconfig-r036-20230509 (https://download.01.org/0day-ci/archive/20230513/202305130250.1rZZssjn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/83bbb43e7e43d217860cdd2477968e235b08b0e3
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 83bbb43e7e43d217860cdd2477968e235b08b0e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/hwtracing/coresight/ drivers/interconnect/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130250.1rZZssjn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from drivers/hwtracing/coresight/coresight-etm4x-core.c:6:
   drivers/hwtracing/coresight/coresight-etm4x-core.c: In function 'etm4_init_sysreg_access':
>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1049:48: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
    1049 |         if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
         |                                                ^~~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1049:9: note: in expansion of macro 'if'
    1049 |         if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
         |         ^~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1049:37: note: in expansion of macro 'dev_fwnode'
    1049 |         if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
         |                                     ^~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1049:48: note: each undeclared identifier is reported only once for each function it appears in
    1049 |         if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
         |                                                ^~~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1049:9: note: in expansion of macro 'if'
    1049 |         if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
         |         ^~
   drivers/hwtracing/coresight/coresight-etm4x-core.c:1049:37: note: in expansion of macro 'dev_fwnode'
    1049 |         if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
         |                                     ^~~~~~~~~~


vim +1049 drivers/hwtracing/coresight/coresight-etm4x-core.c

  1033	
  1034	static bool etm4_init_sysreg_access(struct etmv4_drvdata *drvdata,
  1035					    struct csdev_access *csa)
  1036	{
  1037		u32 devarch;
  1038	
  1039		if (!cpu_supports_sysreg_trace())
  1040			return false;
  1041	
  1042		/*
  1043		 * Some Qualcomm implementations require skipping powering up the trace unit,
  1044		 * as the ETMs are in the same power domain as their CPU cores.
  1045		 *
  1046		 * Since the 'skip_power_up' flag is used inside 'etm4_init_arch_data' function,
  1047		 * initialize it before the function is called.
  1048		 */
> 1049		if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
  1050			drvdata->skip_power_up = true;
  1051	
  1052		/*
  1053		 * ETMs implementing sysreg access must implement TRCDEVARCH.
  1054		 */
  1055		devarch = read_etm4x_sysreg_const_offset(TRCDEVARCH);
  1056		switch (devarch & ETM_DEVARCH_ID_MASK) {
  1057		case ETM_DEVARCH_ETMv4x_ARCH:
  1058			*csa = (struct csdev_access) {
  1059				.io_mem	= false,
  1060				.read	= etm4x_sysreg_read,
  1061				.write	= etm4x_sysreg_write,
  1062			};
  1063			break;
  1064		case ETM_DEVARCH_ETE_ARCH:
  1065			*csa = (struct csdev_access) {
  1066				.io_mem	= false,
  1067				.read	= ete_sysreg_read,
  1068				.write	= ete_sysreg_write,
  1069			};
  1070			break;
  1071		default:
  1072			return false;
  1073		}
  1074	
  1075		drvdata->arch = etm_devarch_to_arch(devarch);
  1076		return true;
  1077	}
  1078	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
