Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67314CB36
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718566899; cv=none; b=n22rfsJ1VNuKW7EQ3YosAy505wdT1h8HWmTcFHNeFZDsy7TEeB0PscZMdwuXlXTHXKR3iM+Kqgi5gQbpItc2dqFQv476Gbzn8xKBQ8pS3+WMe5eLN6H/gNfR1Ey8pIyagvsArIgftjEaarCxCZlHwkyVk96NfgMMGxX8Bxw82Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718566899; c=relaxed/simple;
	bh=fBZsMsKoiysdvfxqXT0OojXQSUFqqfcRfZPKMS9gNes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgEzXReZQFgPCavHVpf6BZTYLB0WQTWHMLi7IjTJhTsipmtRJba0BHXghPiLnAes1wS9H2NVh3KhDT+njUUl8EwNfKbQo+fXDTU9GE86jCzFb+nlc8vnv2ALfLRh26XoifwvjwSmk2wWrOneX5+GCBCSJgN0na1rmam14BSHO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nq1juRd1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nq1juRd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718566897; x=1750102897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBZsMsKoiysdvfxqXT0OojXQSUFqqfcRfZPKMS9gNes=;
  b=Nq1juRd1gecU8TP3mIxUETBRhdyWl6/1C2ZAqI4I5oezLBIl3HrHSWWj
   RbsemqCnq17X+zT/IP/kp05nfNFQH2Hndjo24AeSNrtIn7thXxu6JF1T1
   CfrI+VsmmC0/c9rM/v1B+9WrUxtjEL6Fy5s3EuSZJhKPgJfowekVl+H33
   8L7cGHtBQEi0tFhUgBo199WIGxXKTBpnWsHSyn8WqcV/chfOgRLLHQjgs
   oWANPxDWfMwXN/SEW1nSH4SCccT4mKSdlGJ3TI+Jpek97jEVh4+TeTccy
   O5vbe41+3M21SvVCJTyIDHHYHXuterGT0umtxXRyUUTR8+KoSvnLZN79O
   w==;
X-CSE-ConnectionGUID: /hl/qdbOQ2G6XXYEeKJTbA==
X-CSE-MsgGUID: cbwIi680T9O6/oYBxC7WOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26075900"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="26075900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 12:41:35 -0700
X-CSE-ConnectionGUID: u2TTTI/zTemiyBYgtDkVEg==
X-CSE-MsgGUID: /bMcwrSkQ5ibjhf8h4w8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="72215649"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2024 12:41:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIvkq-0003DG-0r;
	Sun, 16 Jun 2024 19:41:32 +0000
Date: Mon, 17 Jun 2024 03:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>, Frank Li <Frank.Li@nxp.com>
Subject: [phy:next 33/33] drivers/phy/freescale/phy-fsl-imx8qm-hsio.c:459:15:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202406170340.7mk3WU3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   82c56b6dd24fcdf811f2b47b72e5585c8a79b685
commit: 82c56b6dd24fcdf811f2b47b72e5585c8a79b685 [33/33] phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY driver support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240617/202406170340.7mk3WU3Q-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170340.7mk3WU3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170340.7mk3WU3Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/freescale/phy-fsl-imx8qm-hsio.c: In function 'imx_hsio_set_mode':
>> drivers/phy/freescale/phy-fsl-imx8qm-hsio.c:459:15: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     459 |         val = FIELD_PREP(HSIO_MODE_MASK, val);
         |               ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +459 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c

   447	
   448	static int imx_hsio_set_mode(struct phy *phy, enum phy_mode mode,
   449				     int submode)
   450	{
   451		u32 val;
   452		struct imx_hsio_lane *lane = phy_get_drvdata(phy);
   453		struct imx_hsio_priv *priv = lane->priv;
   454	
   455		if (lane->phy_mode != mode)
   456			return -EINVAL;
   457	
   458		val = (mode == PHY_MODE_PCIE) ? HSIO_MODE_PCIE : HSIO_MODE_SATA;
 > 459		val = FIELD_PREP(HSIO_MODE_MASK, val);
   460		regmap_update_bits(priv->phy, lane->phy_off + HSIO_CTRL0,
   461				   HSIO_MODE_MASK, val);
   462	
   463		switch (submode) {
   464		case PHY_MODE_PCIE_RC:
   465			val = FIELD_PREP(HSIO_DEVICE_TYPE_MASK, PCI_EXP_TYPE_ROOT_PORT);
   466			break;
   467		case PHY_MODE_PCIE_EP:
   468			val = FIELD_PREP(HSIO_DEVICE_TYPE_MASK, PCI_EXP_TYPE_ENDPOINT);
   469			break;
   470		default: /* Support only PCIe EP and RC now. */
   471			return 0;
   472		}
   473		if (submode)
   474			regmap_update_bits(priv->ctrl, lane->ctrl_off + HSIO_CTRL0,
   475					   HSIO_DEVICE_TYPE_MASK, val);
   476	
   477		return 0;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
