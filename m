Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C0190484
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718614580; cv=none; b=dI8KxRIy/5i7LGHAxrTdhSGEPAB1Aaoc1/ul4z/YEVc9cpkCTFvG7uKfV+pzN1GFL7k4mUl1Pwu0ZWfc3a0AdhZEUK3gqc1fATzt8K75Xp4Tjjr1C2T4oWMPxsdj8g8DXWIkFkfYDcYVAqWacUZYwSABKrKioesEpy9A56KzXM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718614580; c=relaxed/simple;
	bh=iERXw9yHRm3MUsndaGXJDN2oB3Rv+8jZf9mPMmTagrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KETefu6fNG4lqXiMUI0lU3r7kjll56BEHaAkDMm9wFQCrp6miPr5I5K1t0nVnwesBEYjQQglSI5osENu9v/cC467MVcXIKvyq6RuzHjFSlCxhoKzV8Hvfw3Uks4mO32tBiRhiTRphFBoqpGiyCrPUenSznIOTUF6ykPevEAOMD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqJb9J5l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqJb9J5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718614578; x=1750150578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iERXw9yHRm3MUsndaGXJDN2oB3Rv+8jZf9mPMmTagrk=;
  b=YqJb9J5loe18TYIjFGBZw86DcTJUhd5QnGYcqAfjOVSq4bSn+2p0Hbjd
   hmy8d8FkwKV6RudttnC8cywmkKj/QBVroHAwIaw4NcYkYdIO5M0XULglX
   c39oMXgw1L7foWftQfajFJ5agyoOGTnT6S+brAiuVcb1IYMwaT52fZGTA
   vHA3RccXZ4deA8WWsJqOIJfu0ZIziGbbbzQozk1HPpHf5AhS84nIImHfq
   H+NtsEn5A8hrRKmxN1hrz8PEuGZCpyPDg3Wg6yEd8ZMb0FTgLUaHWf+c9
   mZKXw24F2mAKCDWRJprioNc+kEt/DrrMCb8OnlFR3w9ibueVlaRS9ouUY
   A==;
X-CSE-ConnectionGUID: gioUM1j+RayMfSAr3xSkoQ==
X-CSE-MsgGUID: rW7L2xRUT6Cw9VY21zAMgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26063045"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26063045"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 01:56:18 -0700
X-CSE-ConnectionGUID: v10BGFwCQrmku2jt6UceUA==
X-CSE-MsgGUID: 8/JJ/1LXRlCRC6oFiVpJdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46064906"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jun 2024 01:56:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ89r-00044O-2J;
	Mon, 17 Jun 2024 08:56:11 +0000
Date: Mon, 17 Jun 2024 16:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 4414/5501]
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb:
 interrupt-controller@32fc2000: power-domains: False schema does not allow
 [[121, 0]]
Message-ID: <202406171621.GZGy0npM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6906a84c482f098d31486df8dc98cead21cce2d0
commit: 285c645d842c5a15d3be2d653faaa5f68d81be1f [4414/5501] dt-bindings: interrupt-controller: fsl,irqsteer: Add imx8mp/imx8qxp support
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171621.GZGy0npM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171621.GZGy0npM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171621.GZGy0npM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: hdmi@3d: 'v3p3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /soc@0/bus@30800000/mmc@30b40000/wifi@1: failed to match any schema with compatible: ['marvell,sd8997']
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[121, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: sai@30c30000: Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[120, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[94, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[96, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[129, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: typec@3d: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/extcon/extcon-ptn5150.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[133, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[114, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[83, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[117, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: /extcon-usb0: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[90, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[101, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[104, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[106, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[107, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[126, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[98, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[104, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[106, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[112, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[100, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[135, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[135, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[134, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[133, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[140, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[140, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[139, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: interrupt-controller@32fc2000: power-domains: False schema does not allow [[138, 0]]
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
