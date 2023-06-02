Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82069C2EA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 23:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685749869; x=1717285869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8I8+QvfvjhndPrHe1jF7LiqvWQjOBfk4G4HEGANcDKI=;
  b=cHSezUR2UiLnuLNbUPNYtreqBJ62FQ/J6l3l8n5YzT7FAV41ts5LzsLt
   Dxi8puYwP73Z6ooeM4tXhboQXmj81jWgoZW9E06LsTje26Lcy7589UA0N
   gwo9rC7ZKkTttL7VHLn1X0shizks7W5/r1bppXAPJbCreQNqBLlQ5Bjvu
   QK5Rt8nPzkY5/hSleNhQVk+wWJNgq9ExSk/B3D48Jrigha62+PBnwnYbY
   U6LRX2oRn4rCjhAL9i5nGKoMLHpsMAHmoVkI/E5pjHrAAXG5TBxj3Jbqs
   LMAKGnEFX2Bo6sNuuX7kTQof46jESqoHwpZQzeVVpSPoFZfgCB2y9fDld
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358434492"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="358434492"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 16:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="882235127"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="882235127"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Jun 2023 16:51:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5EXx-00014H-2Z;
	Fri, 02 Jun 2023 23:51:05 +0000
Date: Sat, 3 Jun 2023 07:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Udit Kumar <u-kumar1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 109/110]
 drivers/mfd/tps6594-core.c:22:30: warning: 'tps6594_regulator_resources'
 defined but not used
Message-ID: <202306030744.ATI0CuCc-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230603/202306030744.ATI0CuCc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 11303d0da06af1356f14ca9c8fea863667cf31b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030744.ATI0CuCc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/tps6594-core.c:22:30: warning: 'tps6594_regulator_resources' defined but not used [-Wunused-const-variable=]
      22 | static const struct resource tps6594_regulator_resources[] = {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~


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
