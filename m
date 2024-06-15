Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C91DFC7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718469632; cv=none; b=GuRUQQ2rjUmECi8GCKRixa0FpRXHFXJIGBzz8nOieWgHWl/f1JtDy/H6K2x5DXTeH5hoUscs6CqlGalc96duShp358Q8dmO1rFHZhUogLwMvMBc+I/vK8eaJOH0jQMsM6vd3kpJoW7pg66sEWv2IaUJ4C2gKsoUvxl4acbE+qQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718469632; c=relaxed/simple;
	bh=Tj9E8cDyxbcDnefSkwOy78SxIgCXLU+4BfOrfb2trAA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TmhAip9IjSN42uHnU5DFWqNpAWRQgg8wNmh+GqQLeulOIcUefnj6jSOwzOLIz7h0hqezU/aYaLJQBumswudSOjl+lVciNwewu8I5uvbYWLAmMYjjMTUrZUZhKrMFixh1uiIPLxufY/5ibdecrX4et5WLpkbyBe+K5C9Qe6/HeZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCC9OXEL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCC9OXEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718469630; x=1750005630;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Tj9E8cDyxbcDnefSkwOy78SxIgCXLU+4BfOrfb2trAA=;
  b=PCC9OXELXU1mU/3cq1q5T6mMzzdDxxEaAFJCiQAqruw+7iVtz935cBFm
   QzlSPo75H0eYtGyWz+0F9m2bz6uJz+32IVm41MW5kQgfi5mhaWlja0NUC
   1CYBf2/1DrXv+kyBN5e8tKqO+N8IlArqIlpPwD0AqsS1Ia1xZgQRkgE2N
   5gZZzX0ddKLAJ2SK73y/sQhAUCkY9g+inHLUTGz0IqGP/8X6JcA4rDvgY
   FA4xuoLvCxvGZoGrovmSOBnyvJpbJoKWhrLFD4MwoZKfHvEhpwORoCAO9
   kEP7jU97il1TzdDz0iFlzAdcUzKHmwqSx3WlM+qfWTPqeqTi8zRh+XjxY
   A==;
X-CSE-ConnectionGUID: I/JAIImMTTqm+MxEGt097g==
X-CSE-MsgGUID: 8wKnkWRvSHi2mq5xmW6kBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15127779"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15127779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 09:40:29 -0700
X-CSE-ConnectionGUID: Q6WUOIDjQc67tmEnFSnJ2A==
X-CSE-MsgGUID: ZZdW0F6GSSCKYYCD/QQkrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41517125"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jun 2024 09:40:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIWS1-0000FS-2D;
	Sat, 15 Jun 2024 16:40:25 +0000
Date: Sun, 16 Jun 2024 00:40:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Andrew Davis <afd@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 40/46]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dtb:
 /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any
 schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
Message-ID: <202406160019.dXgFVwT9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   8086474caf5dc2570a947669acf226d319cd0651
commit: f568e2ec0417b2e5bc498ea74937a5079a4d673f [40/46] arm64: dts: ti: k3-am62/a: use sub-node for USB_PHY_CTRL registers
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240616/202406160019.dXgFVwT9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160019.dXgFVwT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160019.dXgFVwT9-lkp@intel.com/

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
