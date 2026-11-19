Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099594;
	b=jQf1Qw2n8N+09RclIVNkyPANlbdZ3R16NP4LC0EtEe+uV0PTdrrsBjKfrDDy+MHO3R1t
	 ZyjgkYVt2rF15nyNEK4QLcMiyWAqQd9wNIBnDXtGsy3j9ueue8fJEw5zbc8fW7iDd0oYL
	 1Wmlpf32604GI6WeCTVtKBNPPPYXnS0oNWs1UWa3zNAduRbqK7fhTAiIsvg9wAbxI1rcT
	 pA3jRPmQSgr8MiaAmUjW/IiJRc/WvY2jwpTfc09/g+OY8Tm5n9tLbllLnWF0eRugmzKtC
	 NojzcushHLAJEdFuHfYY8tYe0kb3AO5LigXjtJ6HxPIxBWgT4XjbvvYHmn5X+LZSt6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099594;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=y6v+PFr6skZ5xdRBnnd/TjpKISVZx46uJih7Vz1eK9s=;
	b=HnfanY8oxw8jgZFtQ+A9XTcEBV7rpLWQVIEfV94v4LbPR83+a50Zv3FXOhaUIeKbleK0
	 K+yI1rxWsQNQR8PYxWY/mBJlY73Qm93Ho2Z0LA17hED3lDuKV7YXheJJHLBN4PuNl0sZ5
	 1ktcg76ld1X83V4pcbGAEXSw/Z1Bai2Fia+DpY2hHQlDy1wNn4vTf/4aykH9jdFixe0o6
	 tXoiaikXu1HeWO4evkKjaKp7pu5oiJsCW5oh+SluiQbcG5IW8nCdQd30ijSxTvZXbq//O
	 IKNEABwmluFozxkcgEHXGiHuNXOTA8gydARL7H/G+x0vu4OrP4duY5viLBzGcyud8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S9eRYg9Z;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76FF606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 14:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E76FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S9eRYg9Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795099594; x=1826635594;
  h=date:from:to:cc:subject:message-id;
  bh=QEGn9T7sKW5Dz5OE48gwqytnI6JgofnM/RnQSH0tfV0=;
  b=S9eRYg9ZepNapl8agvK374AYJYWwHvLIF/0w/uD3XbAU8AXmsauOH01s
   dIv/7sRk0AHobZCRH9dBkjaXqpnlD1Rhtycr4VBedUEcMC214aipFzmF4
   9Dw5basr9pXbK+eUBDPD9efVAjSiD1UXLpB170YNC+jtHhaDgdsoLpbU4
   zD/iBmAMtLTlJztCstWRX46VXg4lPdUdfCWA92RhRYXPefWgjsi7Iv64w
   /xzhz49DMMiy7zlJj2aW4Md7vgzIUMASVFKCpnsMeQiRi4e1PHeobpcnj
   mkM6Zcbb6EPzGFxNjo/xTToJNDYDl9UZZSOI/YezEE3+J2k6VRddcnmRz
   Q==;
X-CSE-ConnectionGUID: jmc9YXpvQDikHW0PylEtGA==
X-CSE-MsgGUID: SfLr5wFPTwe/jI6LtJLvew==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3839281"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3839281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:46:34 -0800
X-CSE-ConnectionGUID: teDQ1cONTSeVfIIaJRQlZg==
X-CSE-MsgGUID: XJCIikQMSXWt+Yy3jGtj3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10830574"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2026 06:46:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU3PB-000000003nd-2HCG;
	Thu, 19 Nov 2026 14:46:29 +0000
Date: Thu, 19 Nov 2026 15:45:47 +0100
From: kernel test robot <lkp@intel.com>
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8726/9180]
 arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc):
 clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro',
 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk',
 'ice_core_clk'] is too long
Message-ID: <20261119154129.ToDSkHo1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8017d29067fd1310a65c3494ce1a1b492adbac6
commit: 08fec21faae44fe002467976befd68e6e62969b5 [8726/9180] scsi: ufs: qcom: dt-bindings: Classify sm8150-ufshc as standalone ICE
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261119/20261119154129.ToDSkHo1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119154129.ToDSkHo1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119154129.ToDSkHo1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3983.27-4057.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4078.27-4133.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clocks: [[46, 157], [46, 3], [46, 156], [46, 169], [42, 0], [46, 168], [46, 166], [46, 167], [46, 160]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg: [[0, 30949376, 0, 9472], [0, 30998528, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sa8155p-adp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg-names: ['std', 'ice'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3983.27-4057.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4078.27-4133.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clocks: [[46, 157], [46, 3], [46, 156], [46, 169], [42, 0], [46, 168], [46, 166], [46, 167], [46, 160]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg: [[0, 30949376, 0, 9472], [0, 30998528, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg-names: ['std', 'ice'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3983.27-4057.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4078.27-4133.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clocks: [[46, 157], [46, 3], [46, 156], [46, 169], [42, 0], [46, 168], [46, 166], [46, 167], [46, 160]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg: [[0, 30949376, 0, 9472], [0, 30998528, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg-names: ['std', 'ice'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3983.27-4057.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4078.27-4133.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clocks: [[46, 157], [46, 3], [46, 156], [46, 169], [42, 0], [46, 168], [46, 166], [46, 167], [46, 160]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg: [[0, 30949376, 0, 9472], [0, 30998528, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-mtp.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg-names: ['std', 'ice'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3983.27-4057.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4078.27-4133.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clocks: [[2, 157], [2, 3], [2, 156], [2, 169], [43, 0], [2, 168], [2, 166], [2, 167], [2, 160]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg: [[0, 30949376, 0, 9472], [0, 30998528, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg-names: ['std', 'ice'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
--
   arch/arm64/boot/dts/qcom/sm8150.dtsi:3983.27-4057.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:4078.27-4133.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:163.9-178.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk', 'ice_core_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): clocks: [[2, 157], [2, 3], [2, 156], [2, 169], [43, 0], [2, 168], [2, 166], [2, 167], [2, 160]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg: [[0, 30949376, 0, 9472], [0, 30998528, 0, 32768]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml
>> arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb: ufshc@1d84000 (qcom,sm8150-ufshc): reg-names: ['std', 'ice'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,sc7180-ufshc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
