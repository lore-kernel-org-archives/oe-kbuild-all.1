Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A508F15E87
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695479894; x=1727015894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CkSjw4ADDS7WedgeKGj7xHuXJNDn3y0q84RAVQ3Q++0=;
  b=ev7aKVItzOXpWC3J+eDxIyqvXo8JSnXDOU3rbXw/tbKGNlUz8yXrMoc2
   uZC5UClUBFSssGP+GXcA7WhiHNeIJi8yTzTaIw/M4hcgzGRoqJl/AJEI/
   ao8OcPwwqthUJReM0kcFLjXPTixeU4NFTrc7fPhnkbGfDQpq1cqdCkGke
   NdndFBfFxmq/SgdT6tQnlEUoyhKsaZDaQV4+r/kFDAqmeMMd/rOUHiJSZ
   hFacQrU7Tae4Wnv5+rbFXolt1OSRrL6dNI/w3312ebTRV8iAAAytv4z/f
   6+aVdW4US76Ko3pr4vwqNrCdGaWLwvZKsMABJwbEMvwucEia78oz/mvT0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="360408660"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="360408660"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 07:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="697519662"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="697519662"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Sep 2023 07:38:13 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk3lp-0002U2-2L;
	Sat, 23 Sep 2023 14:38:09 +0000
Date: Sat, 23 Sep 2023 22:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] phy: qcom-qmp-combo: Square out 8550
 POWER_STATE_CONFIG1
Message-ID: <202309232206.bFdyguL7-lkp@intel.com>
References: <20230829-topic-8550_usbphy-v2-1-a72f43311d19@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829-topic-8550_usbphy-v2-1-a72f43311d19@linaro.org>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/phy-qcom-qmp-combo-initialize-PCS_USB-registers/20230912-072106
base:   linus/master
patch link:    https://lore.kernel.org/r/20230829-topic-8550_usbphy-v2-1-a72f43311d19%40linaro.org
patch subject: [PATCH v2 1/2] phy: qcom-qmp-combo: Square out 8550 POWER_STATE_CONFIG1
config: parisc-randconfig-002-20230923 (https://download.01.org/0day-ci/archive/20230923/202309232206.bFdyguL7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309232206.bFdyguL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232206.bFdyguL7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:865:26: error: 'QPHY_USB_Q6_PCS_USB3_POWER_STATE_CONFIG1' undeclared here (not in a function); did you mean 'QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1'?
     865 |         QMP_PHY_INIT_CFG(QPHY_USB_Q6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:87:27: note: in definition of macro 'QMP_PHY_INIT_CFG'
      87 |                 .offset = o,            \
         |                           ^


vim +865 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

   863	
   864	static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
 > 865		QMP_PHY_INIT_CFG(QPHY_USB_Q6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
   866		QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
   867		QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
   868		QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
   869		QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
   870	};
   871	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
