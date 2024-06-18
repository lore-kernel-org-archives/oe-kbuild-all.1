Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0141891C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718745867; cv=none; b=IbrTdXIp6Vmo75LF6I9/NgaR4btikhUdh6io6r02ho9aquxiF1zIAYm5WquJvdEiiPV8pmlt0AMlIo+43FR9UtIOVR8C4DDsH2WMh8BmgEQOaScptC+zN7SG5N0oDfRQ3bPYlq7sZrqt26I0WLUM7aD4tvNX9ngql7u3tRcgY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718745867; c=relaxed/simple;
	bh=cbTKsEeYFCxTbtX+WOXRow8MP0o7Jf6IYE2qPQBDWgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XWDFHyY9DTDI45A6szA2p0Df0ucjlzNIrzBTCauZ158+ghtNTJxmSmm8y+FTABWdrXdVV3oEkorhZHL1oPS6qYp6PrTPMkLzTicr2fgzm1oYXjKxZH9sFvASywG1vzXtYpwgwFl9IhjuFY9jIQniMjLXRZ+4Z8jiu6/z1lO0vZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB6NWYdt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB6NWYdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718745865; x=1750281865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbTKsEeYFCxTbtX+WOXRow8MP0o7Jf6IYE2qPQBDWgA=;
  b=MB6NWYdtichiuZjN8YexWQ99zn9VMKXgLejPbbUMDDOEEo/mNN31tlvT
   JPcmTxvH7FKrOS7gmPsmGn+KtnpmH2bR1ZwV53nK79wWjl+/LKEfiYtm1
   ocQ66NAdKGEWFGbBSUzOw5Y0Ggo9IDGK8euHhDv85GP59BnPkk4Mq489j
   STqdEQVBdb2xoWCsS1HcQiStcEClYy1mj5SJk6tiECHAJvLHpnt6VmxJ+
   4avhZZe2Gio30EgFwbN/mA0TpwO37V/IW8VX4C8kq9eNWC59xp1XKQK4r
   /MRRcK4mfGzdPzGQsW0dx9qPo1gwMlly652Y6wuV2eU1sYFetHcFS1eTF
   A==;
X-CSE-ConnectionGUID: YZJJ5V6fR3SlbD5ScugC1w==
X-CSE-MsgGUID: psdzEoXtR1iT6rwKE6YYzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15626738"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15626738"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 14:24:23 -0700
X-CSE-ConnectionGUID: 6SmgW9JzTYmbRHwTebpkdw==
X-CSE-MsgGUID: xyQLvv/LQdGCRaZqIMNsMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41789693"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2024 14:24:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJgJQ-0005w8-1P;
	Tue, 18 Jun 2024 21:24:20 +0000
Date: Wed, 19 Jun 2024 05:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-bsp/v6.6.34-2024-06-17 39/132]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000:
 compatible:0: 'renesas,r8a779f0-pcie' was expected
Message-ID: <202406190530.Ev5UrbYF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.34-2024-06-17
head:   caf7f9c42b2dc056f352a35527e2efc1e4ffd4b6
commit: 7a8f1edf707b5ebf1c4721a09e449874bc7385eb [39/132] arm64: dts: renesas: r8a779g0: Add PCIe Host and Endpoint nodes
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240619/202406190530.Ev5UrbYF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190530.Ev5UrbYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190530.Ev5UrbYF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1299.12-1309.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1327.12-1337.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1355.12-1365.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1383.12-1393.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1411.12-1421.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1439.12-1449.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1467.12-1477.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1495.12-1505.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2175.12-2185.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: compatible:0: 'renesas,r8a779f0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: compatible: ['renesas,r8a779g0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg: [[0, 3864854528, 0, 12288], [0, 3864866816, 0, 8192], [0, 3864875008, 0, 4608], [0, 3864879616, 0, 3584], [0, 4261412864, 0, 4194304]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names:1: 'dbi2' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names:2: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names:3: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names:4: 'app' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: reg-names: ['dbi', 'atu', 'dma', 'app', 'config'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d0000: clocks: [[8, 1, 624]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: compatible:0: 'renesas,r8a779f0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: compatible: ['renesas,r8a779g0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg: [[0, 3864887296, 0, 12288], [0, 3864899584, 0, 8192], [0, 3864907776, 0, 4608], [0, 3864912384, 0, 3584], [0, 4002414592, 0, 4194304]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg-names:1: 'dbi2' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg-names:2: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg-names:3: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg-names:4: 'app' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: reg-names: ['dbi', 'atu', 'dma', 'app', 'config'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie@e65d8000: clocks: [[8, 1, 625]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: compatible:0: 'renesas,r8a779f0-pcie-ep' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: compatible:1: 'renesas,r8a779g0-pcie-ep' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: compatible: ['renesas,r8a779g0-pcie-ep', 'renesas,rcar-gen4-pcie-ep'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: reg: [[0, 3864854528, 0, 12288], [0, 3864866816, 0, 8192], [0, 3864875008, 0, 4608], [0, 3864879616, 0, 3584], [0, 4261412864, 0, 4194304]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: reg-names:1: 'dbi2' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: reg-names:2: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: reg-names:3: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: reg-names:4: 'app' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: reg-names: ['dbi', 'atu', 'dma', 'appl', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d0000: clocks: [[8, 1, 624]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: compatible:0: 'renesas,r8a779f0-pcie-ep' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: compatible:1: 'renesas,r8a779g0-pcie-ep' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: compatible: ['renesas,r8a779g0-pcie-ep', 'renesas,rcar-gen4-pcie-ep'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg: [[0, 3864887296, 0, 12288], [0, 3864899584, 0, 8192], [0, 3864907776, 0, 4608], [0, 3864912384, 0, 3584], [0, 4002414592, 0, 4194304]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names:1: 'dbi2' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names:2: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names:3: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names:4: 'app' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names: ['dbi', 'atu', 'dma', 'appl', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: clocks: [[8, 1, 625]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
