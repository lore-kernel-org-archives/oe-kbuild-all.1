Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DA410E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676107205; x=1707643205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g3uz/Nsb15pxJ6ertYS9shDjPh4FCM5hRwopLD7Lk7M=;
  b=enHhZXUAPBF2EZtPbbUbnjwFaCkxv/h9S3bCCxwdXSEtSeI3hRs/91Lx
   /60M6BmLQWNDOB5A5wmpS2iPjjg2DoLE+PgLBeOkFBwKAx1BgSVIBIsXK
   J8aFz+O9OzaQSYWQELzWZyqlu8b0yJ1ub0vKh7m8hRAUYLgrzg3e4Ljum
   RiegYVzji8C9uOFOph2CQ6KXG03j7iKsidmeIa1euZGw63JARYvdp3845
   JGZnWi+/OqvthV/r4p0byaS88Z0TL09ApewTePUKN7FjhhEJC6jUl7OLc
   Bu7noI8HG92VDG9YgGh7Lekpk69e9e1LZ1vIu6kKh67sYjlwOiu1LnE69
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="393000120"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="393000120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 01:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="668305739"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="668305739"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Feb 2023 01:20:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQm39-0006Nu-09;
	Sat, 11 Feb 2023 09:20:03 +0000
Date: Sat, 11 Feb 2023 17:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>
Subject: [phy:next 87/91] drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:161:42:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202302111725.gNy0QXlG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   49742e9edab371024aefb828e094c5eba08bd084
commit: 80090810f5d332bc41f1e64382ceca41fb1e16e3 [87/91] phy: qcom: Add QCOM SNPS eUSB2 driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230211/202302111725.gNy0QXlG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?id=80090810f5d332bc41f1e64382ceca41fb1e16e3
        git remote add phy https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
        git fetch --no-tags phy next
        git checkout 80090810f5d332bc41f1e64382ceca41fb1e16e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/phy/qualcomm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111725.gNy0QXlG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-snps-eusb2.c: In function 'qcom_eusb2_default_parameters':
>> drivers/phy/qualcomm/phy-qcom-snps-eusb2.c:161:42: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     161 |                                          FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
         |                                          ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +161 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

   155	
   156	static void qcom_eusb2_default_parameters(struct qcom_snps_eusb2_hsphy *phy)
   157	{
   158		/* default parameters: tx pre-emphasis */
   159		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
   160						 PHY_CFG_TX_PREEMP_TUNE_MASK,
 > 161						 FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
   162	
   163		/* tx rise/fall time */
   164		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
   165						 PHY_CFG_TX_RISE_TUNE_MASK,
   166						 FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
   167	
   168		/* source impedance adjustment */
   169		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
   170						 PHY_CFG_TX_RES_TUNE_MASK,
   171						 FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
   172	
   173		/* dc voltage level adjustement */
   174		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
   175						 PHY_CFG_TX_HS_VREF_TUNE_MASK,
   176						 FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
   177	
   178		/* transmitter HS crossover adjustement */
   179		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
   180						 PHY_CFG_TX_HS_XV_TUNE_MASK,
   181						 FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
