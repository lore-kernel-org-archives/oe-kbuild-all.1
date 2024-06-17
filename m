Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51659154C00
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 15:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638034; cv=none; b=o8OkH7Rv/8h63A/pKFV0iJcdpRH25RaKF6V3O9yExZ7UtC/luHXs62Ln/1wHhqJiTXqOn9EYk2BMzfvzx4T/6ItQcAp5iSDDhiC8+vz0p3cqZ1R7PwnpxNdyXMUvKbxNi/pN6Gkqf7K53YiBe8uYc3bhekXHg0Q2kZ/DG8aGDb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638034; c=relaxed/simple;
	bh=t5T1afTeUGGZr6aWMsHih32loJy6sN0Iafkw6jUzAoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FAm/Y6yz3mde6vo40h/DVz5PJj8R1ft7C0ev223ez78tPJJccBiOFsErNlNEoyRpONZWSKnVKMEV6uuR2Q9mY2W8s2OnTg6P4ubw97ru1ONzKOR/h08MDAPeaKejL4wMY1Snc8cap10V4ynZNYns88mjANjJyeAGZGZx4vKt+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcO6XhwC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcO6XhwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718638032; x=1750174032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5T1afTeUGGZr6aWMsHih32loJy6sN0Iafkw6jUzAoQ=;
  b=UcO6XhwC010W5QfQSkpLEU9CnAkG66VGMYWhFMZeopl0VVE+G3b5g0iP
   Z+GuSd5BRn8ljuAUdxYeyg2VX31lGi+UPSGOVtYYUaWEn92CY4Gy10Nxg
   N1y+iw0aecRysBBgcLyT/b2Sh+F7Bxxcx6US6pMKPcoH99BeALWGna+7P
   iTFjqoOzMgcKH5Xo60KesgHddYfk46PR/ijNETpdmKM2r8OtS2StJ5WsB
   3lZsxdeaOdnT+XEcimhSclqnCIp6226KZktmpW6OXPW24BQs+XRrf4R76
   AbQ73rToI2EyiE697JY7RlX+xvqk3MEs/ktSk4lr4QThfDj4c6QUYelAd
   A==;
X-CSE-ConnectionGUID: H5JPey5VT5+LZmdby/ryyA==
X-CSE-MsgGUID: k3uYfGccRBmAdPwTMkiyeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18386152"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="18386152"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:27:12 -0700
X-CSE-ConnectionGUID: CEzzdJjJRHmzivVegYhcGA==
X-CSE-MsgGUID: nts52lgsQzKm1xWwQpOU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41917734"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jun 2024 08:27:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJEGB-0004cX-1r;
	Mon, 17 Jun 2024 15:27:07 +0000
Date: Mon, 17 Jun 2024 23:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [shawnguo:imx/dt64 47/54]
 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb:
 hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was
 unexpected)
Message-ID: <202406172345.jqpgCtaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   0565d20cd8c22e44ca42937be08bfc0349e31521
commit: 62814204c6aebe0b5a71f3ee7360e08a8b60e275 [47/54] arm64: dts: freescale: imx8mp-verdin: add HDMI support
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406172345.jqpgCtaI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406172345.jqpgCtaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406172345.jqpgCtaI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
