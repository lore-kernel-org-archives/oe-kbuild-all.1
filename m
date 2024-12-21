Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFB0191F88
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734761648; cv=none; b=Jn5j9W6ZyJ9dP7SQdSVZuNNbH2G4OprVsMO7QzEjgM5Am+ACY4Qil0GJiWCnbztw46F5G1jLfT9a6SkDk+hzCOvYgxmIAcLeWtP51wHo9YkDYEuimNIBFTbCCUh/ne/hxdB5Xx/dRleEh0qMdNnA+ynzX596JAf7q6H+LqHaVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734761648; c=relaxed/simple;
	bh=JjY37SxMSkdhtyrhtTKrP4oq+y277V+a81pZHzt3KNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgRlhJoz3DGuFrD9AByYfW5IV+VyEdKY/mmCgC2Jdtv9+moJo6gsUlCT9DIek5nRLKRp8z4s8t715Hqs4gPn7yoqFWyf3GeNBSsHQKNCSjPKhiukBwqgkyqOfwowlrI2MF//i8CIOp0Py590JU3S0GGgnY/5tm+AQhqXSI1jojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPi5FJIw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPi5FJIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734761646; x=1766297646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JjY37SxMSkdhtyrhtTKrP4oq+y277V+a81pZHzt3KNs=;
  b=mPi5FJIwJb/FTD/dxzxaqEmkfb0yEZwDDzEwNaxrVkL/mpHUdoqWrXXY
   QEt4TjgNNO25ORpo0R+OdsyZD7vIFJhXDISgu7nG+gVP/xJOfINQZZT5T
   lEd54tPCNBfUQ+3jGjY+1HBMUo4RzgjrR3wn39UJ0XgIvn5DlirVF1B2S
   tNlTYmLOo5fbs7uS8fJJxFqNeYy7XBOczWv8VlfxKbL7b0IK2lq7JVDMP
   6H5QgsMO55guzgNmmNQgIoK4BA3NBPvA70VWvYuOImZLzQfYEOFHtOqVn
   /qJEcFXGJgkmBCYDNQ1dFBkAW2TsCp0OIc8ZaCTktrKhB7nT7Wedkx+pa
   A==;
X-CSE-ConnectionGUID: CtatK9XmToeaCUd3e1jK4w==
X-CSE-MsgGUID: WjaAjHMyQ7+yPoYAgurWbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35202141"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="35202141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 22:14:05 -0800
X-CSE-ConnectionGUID: GBtUTgiERLmNzgFa33UeTQ==
X-CSE-MsgGUID: FFtxWLWrTGaxb2gCb7B1vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="129529030"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2024 22:13:59 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOskP-0001xb-1y;
	Sat, 21 Dec 2024 06:13:57 +0000
Date: Sat, 21 Dec 2024 14:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org, abel.vesa@linaro.org,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, andersson@kernel.org,
	konradybcio@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	quic_qianyu@quicinc.com, quic_krichai@quicinc.com,
	quic_vbadigan@quicinc.com, Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: Re: [PATCH v3 2/8] phy: qcom-qmp-pcie: add dual lane PHY support for
 QCS8300
Message-ID: <202412211301.bQO6vXpo-lkp@intel.com>
References: <20241220055239.2744024-3-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220055239.2744024-3-quic_ziyuzhan@quicinc.com>

Hi Ziyue,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4176cf5c5651c33769de83bb61b0287f4ec7719f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyue-Zhang/dt-bindings-phy-qcom-sc8280xp-qmp-pcie-phy-Document-the-QCS8300-QMP-PCIe-PHY-Gen4-x2/20241220-135722
base:   4176cf5c5651c33769de83bb61b0287f4ec7719f
patch link:    https://lore.kernel.org/r/20241220055239.2744024-3-quic_ziyuzhan%40quicinc.com
patch subject: [PATCH v3 2/8] phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300
config: arm64-randconfig-004-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211301.bQO6vXpo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211301.bQO6vXpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211301.bQO6vXpo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:3419:35: error: 'pciephy_v5_20_regs_layout' undeclared here (not in a function); did you mean 'pciephy_v5_regs_layout'?
    3419 |         .regs                   = pciephy_v5_20_regs_layout,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   pciephy_v5_regs_layout


vim +3419 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c

  3390	
  3391	static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
  3392		.lanes			= 2,
  3393		.offsets		= &qmp_pcie_offsets_v5_20,
  3394	
  3395		.tbls = {
  3396			.serdes		= sa8775p_qmp_gen4x2_pcie_serdes_alt_tbl,
  3397			.serdes_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_serdes_alt_tbl),
  3398			.tx		= sa8775p_qmp_gen4_pcie_tx_tbl,
  3399			.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
  3400			.rx		= qcs8300_qmp_gen4x2_pcie_rx_alt_tbl,
  3401			.rx_num		= ARRAY_SIZE(qcs8300_qmp_gen4x2_pcie_rx_alt_tbl),
  3402			.pcs		= sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl,
  3403			.pcs_num		= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_pcs_alt_tbl),
  3404			.pcs_misc		= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
  3405			.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
  3406		},
  3407	
  3408		.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
  3409			.serdes		= sa8775p_qmp_gen4x2_pcie_rc_serdes_alt_tbl,
  3410			.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_rc_serdes_alt_tbl),
  3411			.pcs_misc	= sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl,
  3412			.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
  3413		},
  3414	
  3415		.reset_list		= sdm845_pciephy_reset_l,
  3416		.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
  3417		.vreg_list		= qmp_phy_vreg_l,
  3418		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> 3419		.regs			= pciephy_v5_20_regs_layout,
  3420	
  3421		.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
  3422		.phy_status		= PHYSTATUS_4_20,
  3423	};
  3424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
