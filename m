Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650C134B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 11:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688124446; x=1719660446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6nha2LR/5Sf6xFDzuKmtQsp1Y41mR4U7hRuxY6yhvI=;
  b=CEBEFZGkdrRMXrl3adhHjyyJA7p0cHiTy4jVL/8HSZeplJ5ZqqQ66qwu
   wG1eaxRT9TUSRTwXiRwgfWa31qPaL4Wi1Z3LClBg8XH3ZI4lVgYlSf8iv
   mQmDwlJVFH5KU6uU63pliawLV0eP8K/M7IwFqTgx1bJPE3LwCLWEJk/N7
   H+7NfP7EBAI5XPVsyLpO7qeACAe9TAsoa59Oz7skOdDQzrJOyaWpLRNIk
   kifPXJBx1KSEI/EAPMQs1G/HkAxFqJw8ektP180vSlW7tceJmM2hUGxrc
   jUq3ELSvyr08tqByYH3PhYDWMd0JGbyGv7diemXzuj73XWeWvHkR2zX1e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="347154749"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="347154749"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="783050884"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="783050884"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2023 04:27:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFCHb-000EvJ-0h;
	Fri, 30 Jun 2023 11:27:23 +0000
Date: Fri, 30 Jun 2023 19:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:5.10/preempt-rt 82/85]
 drivers/misc/habanalabs/gaudi/gaudi.c:2792:27: sparse: sparse: cast
 truncates bits from constant value (7ff0000000 becomes f0000000)
Message-ID: <202306301951.u00NDuoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   eb7d29e72c2206523d080d04bcaa8791ab8fb61e
commit: 3ac1bd25f960eb6f98d69d28d53e3fddd1e6f88a [82/85] Merge tag 'lts-v5.10.179-yocto-230612T054042Z' into lts2020/preempt-rt
config: i386-randconfig-i062-20230629 (https://download.01.org/0day-ci/archive/20230630/202306301951.u00NDuoZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301951.u00NDuoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301951.u00NDuoZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/habanalabs/gaudi/gaudi.c:2792:27: sparse: sparse: cast truncates bits from constant value (7ff0000000 becomes f0000000)

vim +2792 drivers/misc/habanalabs/gaudi/gaudi.c

ac0ae6a96aa58e Oded Gabbay 2020-05-11  2768  
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2769  static void gaudi_read_device_fw_version(struct hl_device *hdev,
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2770  					enum hl_fw_component fwc)
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2771  {
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2772  	const char *name;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2773  	u32 ver_off;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2774  	char *dest;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2775  
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2776  	switch (fwc) {
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2777  	case FW_COMP_UBOOT:
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2778  		ver_off = RREG32(mmUBOOT_VER_OFFSET);
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2779  		dest = hdev->asic_prop.uboot_ver;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2780  		name = "U-Boot";
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2781  		break;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2782  	case FW_COMP_PREBOOT:
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2783  		ver_off = RREG32(mmPREBOOT_VER_OFFSET);
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2784  		dest = hdev->asic_prop.preboot_ver;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2785  		name = "Preboot";
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2786  		break;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2787  	default:
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2788  		dev_warn(hdev->dev, "Undefined FW component: %d\n", fwc);
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2789  		return;
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2790  	}
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2791  
ac0ae6a96aa58e Oded Gabbay 2020-05-11 @2792  	ver_off &= ~((u32)SRAM_BASE_ADDR);
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2793  
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2794  	if (ver_off < SRAM_SIZE - VERSION_MAX_LEN) {
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2795  		memcpy_fromio(dest, hdev->pcie_bar[SRAM_BAR_ID] + ver_off,
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2796  							VERSION_MAX_LEN);
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2797  	} else {
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2798  		dev_err(hdev->dev, "%s version offset (0x%x) is above SRAM\n",
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2799  								name, ver_off);
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2800  		strcpy(dest, "unavailable");
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2801  	}
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2802  }
ac0ae6a96aa58e Oded Gabbay 2020-05-11  2803  

:::::: The code at line 2792 was first introduced by commit
:::::: ac0ae6a96aa58eeba4aed97b12ef1dea8c5bf399 habanalabs: add gaudi asic-dependent code

:::::: TO: Oded Gabbay <oded.gabbay@gmail.com>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
