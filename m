Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B9BA39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718240544; cv=none; b=QSzrEj24HUaW/AKzRobUqgvXMTxIGbyHIrmZBUqSUd0oR+lSVIDJq+lsqBQ5TJ+fYMfx3ZtCXXJIObHhyA1kQg2zCmG6b7wVJFjogKFXYXGEJtodEjMz5dcbwj1xkxAlwUhPxl0Rdo4wRTshwoGAUPQ0Ttd2J557xBP3PWw4ZZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718240544; c=relaxed/simple;
	bh=q7aoJVGWJCTrZ72p8UL7bMUDyRu8BTnQW3PnMKde8t4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cula/15tcAhmvgKK4rI/MvjamrtG5n3ZmnvT5IkOxW8sNJMf2JBJBjhRjeiBe9JJVG8TLlJicPcaTNtY/2vm0qY1d7bfZyUasswXLXs8ghJlllY6usRPUcHrXHrJCe33lVP9GzRJZbQaTl93h/dA3nKj8xhWy3E6Det7+SiItf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LR5Xo0/r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LR5Xo0/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718240542; x=1749776542;
  h=date:from:cc:subject:message-id:mime-version;
  bh=q7aoJVGWJCTrZ72p8UL7bMUDyRu8BTnQW3PnMKde8t4=;
  b=LR5Xo0/rCYe9n9dF837u4gCVTug1JdhALoo69lyFZPR+YFM3f2iPNA1W
   Gg7irj7pcby8R+rANPtfwTeuY5ernbvTRqFsDrv3U4BZgtZzr3YzBgjGm
   /DoJ/PrYFm2t+3ESOvYEJkC5V+COLbfSbTvo1qFQlORqxHMyFNH2/+/sD
   qbXD7qd+Q98p1gSIokSNYo3lT60p39rHc5oNZNMuuMRNySXggBzX93kZE
   clsE/p2q7WyPbTzd5k4JNfxZknKkzsJJFNJ2y2udS8ekGIaHvtf4e0NI3
   nsI8GCNyU72QwhWNUqVPGjmEbnlItReQZoqOwuu4fE7jZ496IyyhNAj72
   A==;
X-CSE-ConnectionGUID: /LFnz9PBS2SoJxfToUNB/A==
X-CSE-MsgGUID: xdQIyI2rSYynhA72pyOoDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18817241"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18817241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 18:02:21 -0700
X-CSE-ConnectionGUID: rKQ5oUaPThijDM+6y4vB8w==
X-CSE-MsgGUID: 6v7M0L8DSpybg2ufVn6DPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40671545"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 18:02:20 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHYr3-00023M-31;
	Thu, 13 Jun 2024 01:02:17 +0000
Date: Thu, 13 Jun 2024 09:01:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 26/137]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: pinctrl@f4000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406130859.AyXQpleG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   c13561cfd241d3f2122a27a155f43bedd72b899a
commit: f28f187ba0d18eddf04f2a71515f09924ee1e67d [26/137] HACK: arm64: dts: ti: Configure am62 pinctrl-single for wake-up interrupts
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240613/202406130859.AyXQpleG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130859.AyXQpleG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130859.AyXQpleG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:338.10-348.6: Warning (graph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:651.22-661.5: Warning (graph_child_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:338.10-348.6: Warning (graph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:651.22-661.5: Warning (graph_child_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: pinctrl@f4000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
