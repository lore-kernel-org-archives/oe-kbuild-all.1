Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA567F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676616124; x=1708152124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=019DszF35ODdkohc4mnxG96450Ty0vdyhNiUxnkxihQ=;
  b=EdzaboGSQp7uYm9Sq5ZD2H2KQJ32EjVP/4ij5OLQXDOVBpHd3giHcYvE
   rM4aOe0yd/7cAUnz/1rypkXXD4RIAI9UHEIqqFjxUbxbferiKAxmMmEsS
   kygEobZU71nL7ttG+OARl77qbLQm4uyygTlnTGHqusbi4q7lfNPinmCLY
   ART+/3dQ/nlxR4oHia8l30WTT9rsP5DfLxiMWiK5fOYjJ41Ol5Vig27tP
   Oq87wCQ2Jq4id0spRZZYuMEk3q3cpdHuJ1Xv61tZjGnClG870kshXiiPS
   tTcm9vPEDKHj0G5JmTNOmhjIHl72k8qVbsTPPhAHMU0tgKK07QVkB/+NJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311555879"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="311555879"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 22:42:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="700809526"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="700809526"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Feb 2023 22:42:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSuRV-000BBT-1W;
	Fri, 17 Feb 2023 06:42:01 +0000
Date: Fri, 17 Feb 2023 14:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Manu Gautam <mgautam@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Evan Green <evgreen@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14 7561/9354]
 drivers/phy/qualcomm/phy-qcom-qusb2.c:363:30: sparse: sparse: cast truncates
 bits from constant value (3fffffffff becomes ffffffff)
Message-ID: <202302171411.UAevxKrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 2b4bb749e774cffa7dd5fada6d181932a465b704 [7561/9354] FROMLIST: phy: qcom-qusb2: Add QUSB2 PHYs support for sdm845
config: sh-randconfig-s033-20230212 (https://download.01.org/0day-ci/archive/20230217/202302171411.UAevxKrB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/2b4bb749e774cffa7dd5fada6d181932a465b704
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout 2b4bb749e774cffa7dd5fada6d181932a465b704
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash drivers/gpu/drm/bridge/ drivers/phy/qualcomm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171411.UAevxKrB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/phy/qualcomm/phy-qcom-qusb2.c: note: in included file (through arch/sh/include/uapi/asm/byteorder.h, arch/sh/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/byteorder/little_endian.h:8:2: sparse: sparse: inconsistent configuration, CONFIG_CPU_BIG_ENDIAN is set
>> drivers/phy/qualcomm/phy-qcom-qusb2.c:363:30: sparse: sparse: cast truncates bits from constant value (3fffffffff becomes ffffffff)
>> drivers/phy/qualcomm/phy-qcom-qusb2.c:368:34: sparse: sparse: cast truncates bits from constant value (fffffffff0 becomes fffffff0)
>> drivers/phy/qualcomm/phy-qcom-qusb2.c:373:33: sparse: sparse: cast truncates bits from constant value (3ffffffff becomes ffffffff)

vim +363 drivers/phy/qualcomm/phy-qcom-qusb2.c

   351	
   352	/*
   353	 * Update board specific PHY tuning override values if specified from
   354	 * device tree.
   355	 */
   356	static void qusb2_phy_override_phy_params(struct qusb2_phy *qphy)
   357	{
   358		const struct qusb2_phy_cfg *cfg = qphy->cfg;
   359	
   360		if (qphy->override_imp_res_offset)
   361			qusb2_write_mask(qphy->base, QUSB2PHY_IMP_CTRL1,
   362				     qphy->imp_res_offset_value << IMP_RES_OFFSET_SHIFT,
 > 363				     IMP_RES_OFFSET_MASK);
   364	
   365		if (qphy->override_hstx_trim)
   366			qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
   367					 qphy->hstx_trim_value << HSTX_TRIM_SHIFT,
 > 368					 HSTX_TRIM_MASK);
   369	
   370		if (qphy->override_preemphasis)
   371			qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE1],
   372					qphy->preemphasis_level << PREEMPHASIS_EN_SHIFT,
 > 373					PREEMPHASIS_EN_MASK);
   374	
   375		if (qphy->override_preemphasis_width) {
   376			if (qphy->preemphasis_width ==
   377			    QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT)
   378				qusb2_setbits(qphy->base,
   379					      cfg->regs[QUSB2PHY_PORT_TUNE1],
   380					      PREEMPH_WIDTH_HALF_BIT);
   381			else
   382				qusb2_clrbits(qphy->base,
   383					      cfg->regs[QUSB2PHY_PORT_TUNE1],
   384					      PREEMPH_WIDTH_HALF_BIT);
   385		}
   386	}
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
