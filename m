Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ADF16CD3D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718646887; cv=none; b=o+JqSvlyKdpnaeED/a6ly6WtV//gBDx1cXJiWxX4+gy+Yf2MNnEzBE5lkNe09Zh3yDUlCEiCzJuXUEit+5OuEMGOtxchB/2B57pCdAIq0LhPueQULo3kOqdTgdQsgoRebQsGYjOJK8cUWsSSFP+smVGZVOOs8OP8P/G9y1+nkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718646887; c=relaxed/simple;
	bh=/+hXhTaYK8l75qkfuZfjaf+pBMV8te1QCmZ7XAqYG1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o4YjcK3ilm2xN0Kn2NlSKus6zIfSvpHwy2dfY53vRWmxowV0OxDPMXiVLW2PiHJYRvp3FdvSfF5ZolaOa7+eG7AFdzXC5Wmx5qs3gNITfj0AJfHrMc3OBtb3qhE1dRp+GagGjudXFi2dY9M0pNXYtrTJIHz+c2mVHAOl3Q4b2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwMppXim; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwMppXim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718646885; x=1750182885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+hXhTaYK8l75qkfuZfjaf+pBMV8te1QCmZ7XAqYG1E=;
  b=IwMppXimRONBOs0k8BkgqjjWJ0HhLohLk6g+oV8epKWtS3XZY6GUJYPI
   0Dkj16/dsNu8jv2Ch4Dv8iKz/37cNmJ4KKzuYuaXY1zv7LbuRQGdIv38g
   J6y4YQNd9oUg6IiuBMj2Vbj3Kx9NU7iJx1EziAJlqf8wajxMZhDTRq+Cq
   FUftem7rEW8JhOB04SKfyFAuZfRXHDlHzvthMCQ1DgMhRva++oPjA1MDf
   jG9MNGLdrZ3spbpc5WUdmgs282w7iZ6yXoOLnDnSDfktW3aWxPpeF8tC4
   OXTj7vFijDdpy2IdJLJZ9RY+0ojmkVSceSC1dM1a3DtLI6uMrTKjSGBeS
   A==;
X-CSE-ConnectionGUID: YktGs7/8TfSU9lEZjvQ1qQ==
X-CSE-MsgGUID: iK7w3eSJSleQMtDA7motaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15327591"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15327591"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:54:37 -0700
X-CSE-ConnectionGUID: cbMVnW1VTSS9MOcWhUlfWQ==
X-CSE-MsgGUID: z584la3XSiKC8y1udNm+fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="45808739"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2024 10:54:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJGYr-0004kf-11;
	Mon, 17 Jun 2024 17:54:33 +0000
Date: Tue, 18 Jun 2024 01:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [shawnguo:imx/dt64 36/54]
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb:
 /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any
 schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
Message-ID: <202406180126.VmzD68JM-lkp@intel.com>
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
commit: a27f49644fb4dfd010f7c8707fa58172803684cb [36/54] arm64: dts: imx8mp: Add imx8mp-specific irqsteer compatible
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240618/202406180126.VmzD68JM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180126.VmzD68JM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180126.VmzD68JM-lkp@intel.com/

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
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: sai@30c30000: Unevaluated properties are not allowed ('#clock-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: typec@3d: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/extcon/extcon-ptn5150.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: /extcon-usb0: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw7905-2x.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'reg', 'rx-queues-config', 'snps,force_thresh_dma_mode', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,dwmac-imx.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: ethernet@30bf0000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: /soc@0/bus@32c00000/interrupt-controller@32fc2000: failed to match any schema with compatible: ['fsl,imx8mp-irqsteer', 'fsl,imx-irqsteer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
