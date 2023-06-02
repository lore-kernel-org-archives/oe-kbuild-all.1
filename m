Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E122F33
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 20:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739146; x=1717275146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v8uuHdnqY+mtEfIKnd7O6BOHWSobdioNQ4SyN1jtIdA=;
  b=oGKyyKDAJsljvVabUExpXrMh+W5z3Rf1YQHNF3YmH6QYI99V5BAhrTsF
   0Tycuj730FJJFPbo/ecVjtw1S75OKZQ2vuORMnC0tKPd7YLdCy/ypzpOH
   dgtHeS4FGkJ0a+S6jmxuvRPGuNuxTVNG2DhX0yMIwqmo2IaAYaJ37z3Sn
   6j5bD5KQD6QqcVgJtQFhbJZ8ALQhyzqmSUXZVYH89apUMowcE5DugVbXP
   om/ijFM6UCKMpTg8FZN6owv1NjPytEUc3YBHayyN/kFZKj1FH5E8PL4DL
   CP7CFBM76+fAVJIUvpWS3r4dHz+xjEpr7K8qgBT+3FHLSj01/3KfQchE5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="353459284"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="353459284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 13:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658399291"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="658399291"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2023 13:52:01 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5Bke-0000wn-2P;
	Fri, 02 Jun 2023 20:52:00 +0000
Date: Sat, 3 Jun 2023 04:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Udit Kumar <u-kumar1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 109/110]
 drivers/mfd/tps6594-core.c:22:30: warning: unused variable
 'tps6594_regulator_resources'
Message-ID: <202306030401.jG3TmZWy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5c3e7acb9bacc9006a8ca3ed5d17a22d444f23dc
commit: 11303d0da06af1356f14ca9c8fea863667cf31b7 [109/110] HACK: mfd: tps6594: Remove tps6594 regulator cell
config: mips-randconfig-r011-20230601 (https://download.01.org/0day-ci/archive/20230603/202306030401.jG3TmZWy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 11303d0da06af1356f14ca9c8fea863667cf31b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030401.jG3TmZWy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/tps6594-core.c:22:30: warning: unused variable 'tps6594_regulator_resources' [-Wunused-const-variable]
   static const struct resource tps6594_regulator_resources[] = {
                                ^
   1 warning generated.


vim +/tps6594_regulator_resources +22 drivers/mfd/tps6594-core.c

107be4a1c6663b Julien Panis 2023-04-06  21  
107be4a1c6663b Julien Panis 2023-04-06 @22  static const struct resource tps6594_regulator_resources[] = {
107be4a1c6663b Julien Panis 2023-04-06  23  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK1_OV, TPS6594_IRQ_NAME_BUCK1_OV),
107be4a1c6663b Julien Panis 2023-04-06  24  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK1_UV, TPS6594_IRQ_NAME_BUCK1_UV),
107be4a1c6663b Julien Panis 2023-04-06  25  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK1_SC, TPS6594_IRQ_NAME_BUCK1_SC),
107be4a1c6663b Julien Panis 2023-04-06  26  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK1_ILIM, TPS6594_IRQ_NAME_BUCK1_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  27  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK2_OV, TPS6594_IRQ_NAME_BUCK2_OV),
107be4a1c6663b Julien Panis 2023-04-06  28  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK2_UV, TPS6594_IRQ_NAME_BUCK2_UV),
107be4a1c6663b Julien Panis 2023-04-06  29  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK2_SC, TPS6594_IRQ_NAME_BUCK2_SC),
107be4a1c6663b Julien Panis 2023-04-06  30  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK2_ILIM, TPS6594_IRQ_NAME_BUCK2_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  31  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK3_OV, TPS6594_IRQ_NAME_BUCK3_OV),
107be4a1c6663b Julien Panis 2023-04-06  32  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK3_UV, TPS6594_IRQ_NAME_BUCK3_UV),
107be4a1c6663b Julien Panis 2023-04-06  33  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK3_SC, TPS6594_IRQ_NAME_BUCK3_SC),
107be4a1c6663b Julien Panis 2023-04-06  34  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK3_ILIM, TPS6594_IRQ_NAME_BUCK3_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  35  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK4_OV, TPS6594_IRQ_NAME_BUCK4_OV),
107be4a1c6663b Julien Panis 2023-04-06  36  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK4_UV, TPS6594_IRQ_NAME_BUCK4_UV),
107be4a1c6663b Julien Panis 2023-04-06  37  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK4_SC, TPS6594_IRQ_NAME_BUCK4_SC),
107be4a1c6663b Julien Panis 2023-04-06  38  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK4_ILIM, TPS6594_IRQ_NAME_BUCK4_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  39  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK5_OV, TPS6594_IRQ_NAME_BUCK5_OV),
107be4a1c6663b Julien Panis 2023-04-06  40  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK5_UV, TPS6594_IRQ_NAME_BUCK5_UV),
107be4a1c6663b Julien Panis 2023-04-06  41  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK5_SC, TPS6594_IRQ_NAME_BUCK5_SC),
107be4a1c6663b Julien Panis 2023-04-06  42  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_BUCK5_ILIM, TPS6594_IRQ_NAME_BUCK5_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  43  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO1_OV, TPS6594_IRQ_NAME_LDO1_OV),
107be4a1c6663b Julien Panis 2023-04-06  44  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO1_UV, TPS6594_IRQ_NAME_LDO1_UV),
107be4a1c6663b Julien Panis 2023-04-06  45  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO1_SC, TPS6594_IRQ_NAME_LDO1_SC),
107be4a1c6663b Julien Panis 2023-04-06  46  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO1_ILIM, TPS6594_IRQ_NAME_LDO1_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  47  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO2_OV, TPS6594_IRQ_NAME_LDO2_OV),
107be4a1c6663b Julien Panis 2023-04-06  48  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO2_UV, TPS6594_IRQ_NAME_LDO2_UV),
107be4a1c6663b Julien Panis 2023-04-06  49  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO2_SC, TPS6594_IRQ_NAME_LDO2_SC),
107be4a1c6663b Julien Panis 2023-04-06  50  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO2_ILIM, TPS6594_IRQ_NAME_LDO2_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  51  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO3_OV, TPS6594_IRQ_NAME_LDO3_OV),
107be4a1c6663b Julien Panis 2023-04-06  52  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO3_UV, TPS6594_IRQ_NAME_LDO3_UV),
107be4a1c6663b Julien Panis 2023-04-06  53  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO3_SC, TPS6594_IRQ_NAME_LDO3_SC),
107be4a1c6663b Julien Panis 2023-04-06  54  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO3_ILIM, TPS6594_IRQ_NAME_LDO3_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  55  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO4_OV, TPS6594_IRQ_NAME_LDO4_OV),
107be4a1c6663b Julien Panis 2023-04-06  56  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO4_UV, TPS6594_IRQ_NAME_LDO4_UV),
107be4a1c6663b Julien Panis 2023-04-06  57  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO4_SC, TPS6594_IRQ_NAME_LDO4_SC),
107be4a1c6663b Julien Panis 2023-04-06  58  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_LDO4_ILIM, TPS6594_IRQ_NAME_LDO4_ILIM),
107be4a1c6663b Julien Panis 2023-04-06  59  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VCCA_OV, TPS6594_IRQ_NAME_VCCA_OV),
107be4a1c6663b Julien Panis 2023-04-06  60  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VCCA_UV, TPS6594_IRQ_NAME_VCCA_UV),
107be4a1c6663b Julien Panis 2023-04-06  61  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VMON1_OV, TPS6594_IRQ_NAME_VMON1_OV),
107be4a1c6663b Julien Panis 2023-04-06  62  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VMON1_UV, TPS6594_IRQ_NAME_VMON1_UV),
107be4a1c6663b Julien Panis 2023-04-06  63  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VMON1_RV, TPS6594_IRQ_NAME_VMON1_RV),
107be4a1c6663b Julien Panis 2023-04-06  64  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VMON2_OV, TPS6594_IRQ_NAME_VMON2_OV),
107be4a1c6663b Julien Panis 2023-04-06  65  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VMON2_UV, TPS6594_IRQ_NAME_VMON2_UV),
107be4a1c6663b Julien Panis 2023-04-06  66  	DEFINE_RES_IRQ_NAMED(TPS6594_IRQ_VMON2_RV, TPS6594_IRQ_NAME_VMON2_RV),
107be4a1c6663b Julien Panis 2023-04-06  67  };
107be4a1c6663b Julien Panis 2023-04-06  68  

:::::: The code at line 22 was first introduced by commit
:::::: 107be4a1c6663b1c672bde142c8f11968b7f968b mfd: tps6594: Add driver for TI TPS6594 PMIC

:::::: TO: Julien Panis <jpanis@baylibre.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
