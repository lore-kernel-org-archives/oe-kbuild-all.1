Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F3C17E45B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200496; cv=none; b=V2dvuAWKXIIKtOojt5JiwlFjFJX5HA1jXo3eBgjUwMOXwqYOiAiRmakn/Z/8/sNwqbhtEohxn6JS1l4IAa2K81G+AVwAn0j5A0UEaQyudmxZmjUdxGuVXTpJ3jivS7SbZkih4g7iePq69vdcFaoJLHy1cgbF/MqSRiIjGlktxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200496; c=relaxed/simple;
	bh=HcSRLoeOvmyyyNQ92dZ3G62fzygqHEqEHV6l+XjbLlA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHD+X2ktONAQOZn1Y2PWwSyAOsAsr0iZuHbluuyL9pT+LbNwNPP+U50HQ+SVFLi/cCAf2bE9UWJ//QVDbcELAXMXlb5SGU5akqBLD4jKlwM5utk3Jv8xIwdO+VveMxWFPYdLT2LlE95tcSqOcSHt/b+HDqnsPGOt1AMc7hL7MMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4LRvNxQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4LRvNxQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718200494; x=1749736494;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HcSRLoeOvmyyyNQ92dZ3G62fzygqHEqEHV6l+XjbLlA=;
  b=D4LRvNxQVNWrRFQxiQMTKjCUrDv+8Q4SXmy7WqP6A+Da4GNW+N9n43gl
   PBP6+xKwJw56MmBxqTgDrNltfBwEZqwXZVbqJqna6GwmW0F7sGKV2dF0N
   WsKtSbIQONWz9mUwNtSK0+W2MRdkkYJXV9AfV0MoGpaE/CcXkdSp7maan
   X77PGQU/scimjezFgM3AyxYrXDWpl6FiYCCt8DOe2xWrgis+mo7T4mmWf
   5/gTkrn/swpLpDKLffOCtHxfejWE9phA6HGcN8iSYJcL6CUERCbdNHyYG
   GY9WLMYAYEM3MIr4xGW42PxskFSTz6fKWMcUp4lEfFrX0OjJ7kUvWRwgJ
   Q==;
X-CSE-ConnectionGUID: 9NvTp23uRsefy+qMrLTLZQ==
X-CSE-MsgGUID: QAQUTdKCQ4C0phAg4hIPMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14924525"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="14924525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 06:54:54 -0700
X-CSE-ConnectionGUID: 3m8VPy/TQ+qZF9TjJvXBbQ==
X-CSE-MsgGUID: klDOElvDSVCyvUL/n6S4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44705363"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2024 06:54:52 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHOR7-0001a2-1b;
	Wed, 12 Jun 2024 13:54:49 +0000
Date: Wed, 12 Jun 2024 21:53:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 40/46]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb:
 /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any
 schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
Message-ID: <202406122145.0Ecp6Iwf-lkp@intel.com>
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
commit: f568e2ec0417b2e5bc498ea74937a5079a4d673f [40/46] arm64: dts: ti: k3-am62/a: use sub-node for USB_PHY_CTRL registers
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240612/202406122145.0Ecp6Iwf-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122145.0Ecp6Iwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122145.0Ecp6Iwf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:350.10-360.6: Warning (graph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:633.22-643.5: Warning (graph_child_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:350.10-360.6: Warning (graph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:633.22-643.5: Warning (graph_child_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
--
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008', 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
