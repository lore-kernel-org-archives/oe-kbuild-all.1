Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B034D926
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791237047; cv=none; b=BbReRBoEGAF6U3mPSgl8M5AXx4ggcdS1/sBHpWqa8AXInlvZBEvmoGNY+RdPYw26Sc7ayn7JaHMjwPuyRAHyf7bUN0ptPWr+/Loz8Claqg4PPmeJuBuXX02FXEiI5Ho1wJetJKtqtAp5MnnCqPodeO0a2seAzVPJBD6C0hBz9DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791237047; c=relaxed/simple;
	bh=2EC6+pPeii0740l7asrIh0KISEqQ/2JgqwT+mdztxjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=apHoNZU0GAe/uDz67P/6GcAV4/Vmyh7l/W4L6vM+DCPIxqUUONGmOQje5f7aMg/PnUzxsAs3LA47N5a3+KJ1vyMTgaf8kW5fRdhsocv+JrDrBsK3ujIZ1uHmihYqkfWIMezm+Nm/x5UqkFa2azAQiJkD1401E6RDGbPOMfVe5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhbkP7Iy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhbkP7Iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791237045; x=1822773045;
  h=date:from:to:cc:subject:message-id;
  bh=2EC6+pPeii0740l7asrIh0KISEqQ/2JgqwT+mdztxjI=;
  b=LhbkP7IyhXU9JFvFRp6kBgvph79uwlxFON8RdCbqLS9RAXkOURNIlREY
   WxnY4rk+msEsU3WVSXruPTOhYUX5uGfGapai5ge+G07NVfiYm7DRladsO
   4XjJ1wcQrRuh5RlUcVpftlRvqG+rNj3O2Or9+IekxicI8VoH+KqBqKb91
   9FgVNpIJ0QwRTdCVkw7J7dZnXf2r4SRAVTgSt1SZ9iPUNtzYSLzGaxuS6
   4aBi+n41N0SnxWU52L1VatV+r6IPDJctQtIcqNOAwG4D+WxO7JW/4eblf
   ZUwdShwcXTIsqeXs5EFBlGldFvVMrQZQmU5YKdBTTuuku/3rbIXOB9OTr
   Q==;
X-CSE-ConnectionGUID: pMCDVQxkR1y8hTRO65yVAQ==
X-CSE-MsgGUID: Km6tJgGSS4CR+ESuS91/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113704391"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="113704391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 14:50:45 -0700
X-CSE-ConnectionGUID: uRsXqrtoSQq8+aS1xiwZ9A==
X-CSE-MsgGUID: yll0GDgPRB6iWd5/GUVhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="306436744"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 05 Oct 2026 14:50:43 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDqa1-000000000KR-1Csq;
	Mon, 05 Oct 2026 21:50:41 +0000
Date: Mon, 05 Oct 2026 23:50:13 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 10820/14242]
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811):
 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202610052316.dkfB7EcZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
commit: f05cb3d259d3fb9f811cb9b14591ab08e9e7a182 [10820/14242] ARM: dts: imx: remove undocument properties of st,stmpe*
config: arm-randconfig-2403-20260930 (https://download.01.org/0day-ci/archive/20261005/202610052316.dkfB7EcZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052316.dkfB7EcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610052316.dkfB7EcZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dts:230.7-249.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/ethernet@2188000/mdio: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:936.28-944.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
